package com.ruoyi.system.service.impl;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Machine;
import com.ruoyi.system.domain.Operation;
import com.ruoyi.system.domain.Orders;
import com.ruoyi.system.domain.TaskAssignment;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.IOtherService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class OtherServiceImpl implements IOtherService {

    private final OtherMapper otherMapper;
    private final SysUserMapper sysUserMapper;
    private final MachineMapper machineMapper;
    private final OrdersMapper ordersMapper;
    private final TaskAssignmentMapper taskAssignmentMapper;
    private final OperationMapper operationMapper;

    @Override
    public List<SysUser> selectUserInfo() {
        //查询所有角色为用功的用户id
        List<Long> userIds = otherMapper.selectUserIdByRoleId(100L);
        //根据用户id查询所有用户信息

        List<SysUser> sysUsers = new ArrayList<>();
        for (Long userId : userIds) {
            SysUser sysUser = sysUserMapper.selectUserById(userId);
            sysUsers.add(sysUser);
        }
        return sysUsers;
    }

    //查询可用的机器
    public List<Machine> selectMachineInfo(Long operationId) {
        //1. 根据工序id查询所有可以使用的机器id
        List<Long> machineIds = otherMapper.selectMachineIdByOperationId(operationId);

        //2. 再根据所有的机器id查询所有机器信息 并且是可用的机器
        List<Machine> machines = new ArrayList<>();

        for (Long machineId : machineIds) {
            Machine machine = new Machine();
            machine.setStatus("可用");
            machine.setMachineId(machineId);

            List<Machine> machineList = machineMapper.selectMachineList(machine);
            if (!machineList.isEmpty()) {
                machines.add(machineList.get(0));
            }
        }

        return machines;
    }

    //在任务分配之后修改所需的参数
    @Override
    public void updateDatabase(TaskAssignment taskAssignment) {
        //1. 修改机器状态
        Machine machine = machineMapper.selectMachineByMachineId(taskAssignment.getMachineId());
        machine.setStatus("占用");
        machineMapper.updateMachine(machine);
        //2.修改制令状态
        Orders orders = ordersMapper.selectOrdersById(taskAssignment.getOrderId());
        orders.setStatus("生产中");
        ordersMapper.updateOrders(orders);
    }

    //查询某个员工的所有任务
    @Override
    public List<Map<String, Object>> selectTaskAssignmentByUserId(Long userId) {
        TaskAssignment taskAssignment = new TaskAssignment();
        taskAssignment.setUserId(userId);
        taskAssignment.setIsCompleted(0);
        List<TaskAssignment> taskAssignments = taskAssignmentMapper.selectTaskAssignmentList(taskAssignment);
        //查询机器信息工序信息
        List<Map<String, Object>> maps = new ArrayList<>();
        for (TaskAssignment assignment : taskAssignments) {
            Machine machine = machineMapper.selectMachineByMachineId(assignment.getMachineId());
            Operation operation = operationMapper.selectOperationByOperationId(assignment.getOperationId());
            Orders orders = ordersMapper.selectOrdersById(assignment.getOrderId());
            //将这些信息整合到集合中
            Map<String, Object> map = new HashMap<>();
            map.put("machineName", machine.getMachineName());
            map.put("operationName", operation.getOperationName());
            map.put("quantity", orders.getQuantity());
            //将所有任务信息添加到集合中
            map.put("taskAssignment", assignment);
            maps.add(map);
        }
        return maps;
    }

    //报工
    @Override
    public void finishTask(Long takeId, int quantity) {
        //查询任务信息
        TaskAssignment taskAssignment = taskAssignmentMapper.selectTaskAssignmentByTakeId(takeId);
        //查询制令信息
        Orders orders = ordersMapper.selectOrdersById(taskAssignment.getOrderId());
        //判断是否已经完成任务 完成是否有剩余
        if (orders.getQuantity() < quantity) {
            //任务完成
            //修改制令状态
            orders.setStatus("已完成");
            orders.setQuantity(0L);
            //修改任务完成状态
            taskAssignment.setIsCompleted(1);
            //更新数据库
            ordersMapper.updateOrders(orders);
            taskAssignmentMapper.updateTaskAssignment(taskAssignment);
            // TODO 将剩余产品加入库存中
            return;
        }else if (orders.getQuantity() == quantity){
            //正好完成任务
            orders.setStatus("已完成");
            orders.setQuantity(0L);
            taskAssignment.setIsCompleted(1);
            ordersMapper.updateOrders(orders);
            taskAssignmentMapper.updateTaskAssignment(taskAssignment);
            return;
        }else{
            //任务未完成
            orders.setQuantity(orders.getQuantity() - quantity);
            ordersMapper.updateOrders(orders);
        }
    }
}
