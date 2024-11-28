package com.ruoyi.system.service.impl;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.*;
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
    private final TaskMapper taskMapper;
    private final OperationMapper operationMapper;
    private final MaterialMapper materialMapper;
    private final WorkReportMapper workReportMapper;

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
    public void updateDatabase(Task task) {
        //2.修改制令状态
        Orders orders = ordersMapper.selectOrdersById(task.getOrderId());
        orders.setStatus("已分配");
        ordersMapper.updateOrders(orders);
    }

    //查询某个员工的所有任务
    @Override
    public List<Map<String, Object>> selectTaskByUserId(Long userId) {
        Task task = new Task();
        task.setUserId(userId);
        task.setIsCompleted(0);
        List<Task> tasks = taskMapper.selectTaskList(task);
        //查询机器信息工序信息
        List<Map<String, Object>> maps = new ArrayList<>();
        for (Task assignment : tasks) {
            //将这些信息整合到集合中
            Map<String, Object> map = new HashMap<>();
            Orders orders = ordersMapper.selectOrdersById(assignment.getOrderId());
            Operation operation = operationMapper.selectOperationByOperationId(assignment.getOperationId());
            if(orders.getOperationSequence() == 1){
                map.put("isHandover",0);        //非交接任务
            }else {
                Orders  previousOrder = ordersMapper.selectOrdersById(orders.getId() - 1);
                if(previousOrder.getStatus() != "已完成"){
                    map.put("isHandover",1);    //是交接任务，并且上一个任务未完成
                }else {
                    map.put("isHandover",2);    //是交接任务，并且上一个任务已完成
                }
            }
            map.put("order",orders);
            map.put("operation", operation);
            map.put("task", assignment);
            maps.add(map);
        }
        return maps;
    }

    //报工
    @Override
    public void finishTask(Long taskId,Long quantity) {
        //查询任务信息
        Task task = taskMapper.selectTaskByTaskId(taskId);
        task.setIsCompleted(1);
        taskMapper.updateTask(task);
        //查询制令信息
        Orders orders = ordersMapper.selectOrdersById(task.getOrderId());
        //判断是否已经完成任务 完成是否有剩余
        if (orders.getQuantity() < quantity) {
            //任务完成
            //修改制令状态
            orders.setStatus("已完成");
            orders.setQuantity(0L);
            //修改任务完成状态
            task.setIsCompleted(1);
            //更新数据库
            ordersMapper.updateOrders(orders);
            taskMapper.updateTask(task);
            // TODO 将剩余产品加入库存中
            return;
        } else if (orders.getQuantity() == quantity) {
            //正好完成任务
            orders.setStatus("已完成");
            orders.setQuantity(0L);
            task.setIsCompleted(1);
            ordersMapper.updateOrders(orders);
            taskMapper.updateTask(task);
            return;
        } else {
            //任务未完成
            orders.setQuantity(orders.getQuantity() - quantity);
            ordersMapper.updateOrders(orders);
        }
    }


    // 根据operationId查询物料信息
    @Override
    public List<Map<String, Object>> selectMaterialsByOperationId(Long operationId) {
//        System.out.println("operationId : " + operationId);
        //在工序物料表中查询物料Id
        List<Long> materialIds = operationMapper.selectMaterialIdsByOperationId(operationId);
//        System.out.println("materialIds : " + materialIds);
        List<Map<String, Object>> maps = new ArrayList<>();
        if (!materialIds.isEmpty()) {
            //根据物料id查询物料信息
            for (Long materialId : materialIds) {
                Material material = materialMapper.selectMaterialByMaterialId(materialId);
                Map<String, Object> map = new HashMap<>();
                map.put("materialId", material.getMaterialId());
                map.put("materialName", material.getMaterialName());
                map.put("unit", material.getUnit());
                maps.add(map);
            }
        }
        System.out.println("maps : " + maps);
        return maps;
    }

    @Override
    public Map<String, Object> getSalary(Long userId) {
        Map<String, Object> map = new HashMap<>();
        WorkReport workReport = new WorkReport();
        workReport.setUserId(userId);
        workReport = workReportMapper.selectWorkReportList(workReport).get(0);
        Machine machine = machineMapper.selectMachineByMachineId(workReport.getMachineId());

        Task task = new Task();
        task.setOperationId(workReport.getOperationId());
        task = taskMapper.selectTaskList(task).get(0);

        System.out.println("task : " + task);
//        List<TaskMaterial> taskMaterials = otherMapper.selectMaterialsByTaskId(task.getTakeId());
        String material = "162蜡,168蜡,水溶蜡";
//        float materialPrice = 0;
//        System.out.println(taskMaterials);
//        for (TaskMaterial taskMaterial : taskMaterials) {
//            material += materialMapper.selectMaterialByMaterialId(taskMaterial.getMaterialId()).getMaterialName();
////            materialPrice += (float) (taskMaterial.getQuantity() * 0.5);
//        }
        map.put("materials", material);
        map.put("materialPrice", 21.0);
        map.put("machine", machine.getMachineName());
        map.put("machinePrice", 12.0);
        map.put("startTime", workReport.getStartTime());
        map.put("endTime", workReport.getEndTime());
        map.put("operationName", operationMapper.selectOperationByOperationId(workReport.getOperationId()).getOperationName());
        map.put("operationPrice",200);
        return map;
    }


}
