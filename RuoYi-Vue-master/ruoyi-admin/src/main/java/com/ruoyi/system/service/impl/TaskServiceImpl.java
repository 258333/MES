package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.dto.TaskMaterial;
import com.ruoyi.system.mapper.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.service.ITaskService;

/**
 * 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息Service业务层处理
 *
 * @author HongWei
 * @date 2024-11-26
 */
@Service
@RequiredArgsConstructor
public class TaskServiceImpl implements ITaskService {
    private final TaskMapper taskMapper;
    private final MachineMapper machineMapper;
    private final MaterialMapper materialMapper;
    private final OperationMapper operationMapper;
    private final OrdersMapper ordersMapper;

    /**
     * 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskId 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    @Override
    public Task selectTaskByTaskId(Long taskId) {
        return taskMapper.selectTaskByTaskId(taskId);
    }

    /**
     * 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息列表
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    @Override
    public List<Task> selectTaskList(Task task) {
        return taskMapper.selectTaskList(task);
    }

    /**
     * 新增任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 结果
     */
    @Override
    public int insertTask(Task task) {
        return taskMapper.insertTask(task);
    }

    /**
     * 修改任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 结果
     */
    @Override
    public int updateTask(Task task) {
        return taskMapper.updateTask(task);
    }

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskIds 需要删除的任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 结果
     */
    @Override
    public int deleteTaskByTaskIds(Long[] taskIds) {
        return taskMapper.deleteTaskByTaskIds(taskIds);
    }

    /**
     * 删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息信息
     *
     * @param taskId 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 结果
     */
    @Override
    public int deleteTaskByTaskId(Long taskId) {
        return taskMapper.deleteTaskByTaskId(taskId);
    }

    /**
     * 存储任务对应的物料信息
     *
     * @param: [taskMaterial]
     * @return: int
     **/
    @Override
    public int insertTaskMaterials(List<TaskMaterial> taskMaterials) {
        for (TaskMaterial taskMaterial : taskMaterials) {
            taskMapper.insertTaskMaterials(taskMaterial);
        }
        return 1;
    }

    /**
     * 存储任务对应的机器信息
     *
     * @param: [taskId, machineId]
     * @return: com.ruoyi.common.core.domain.AjaxResult
     **/
    @Override
    public int insertTaskMachine(Long taskId, Long machineId) {
        //根据MachineId修改机器状态为占用
        Machine machine = new Machine();
        machine.setMachineId(machineId);
        machine.setStatus("占用");
        machineMapper.updateMachine(machine);
        return taskMapper.insertTaskMachine(taskId, machineId);
    }

    /**
     * 根据任务Id获取对应的物料和机器信息
     *
     * @param: taskId
     * @return: Map<String, Object>
     **/
    @Override
    public Map<String, Object> selectTaskMaterialsAndMachineAndOrder(Long taskId) {
        Map<String, Object> map = new HashMap<>();
        //根据任务Id查询对应的机器Id
        TaskMachine taskMachine = taskMapper.selectTaskMachineByTaskId(taskId);
        //根据机器Id查询对应的机器名称
        Machine machine = machineMapper.selectMachineByMachineId(taskMachine.getMachineId());
        map.put("machineName", machine.getMachineName());
        map.put("taskMachine", taskMachine);
        //根据任务id查询对应的任务物料对应关系
        List<TaskMaterial> taskMaterials = taskMapper.selectTaskMaterialsByTaskId(taskId);
        List<Map<String, Object>> maps = new ArrayList<>();
        //根据任务物料对应关系查询对应的物料名称
        for (TaskMaterial taskMaterial : taskMaterials) {
            Map<String, Object> map1 = new HashMap<>();
           Material material = materialMapper.selectMaterialByMaterialId(taskMaterial.getMaterialId());
            map1.put("materialName", material.getMaterialName());
            map1.put("unit",material.getUnit());
            map1.put("taskMaterial", taskMaterial);
            maps.add(map1);
        }
        map.put("taskMaterials", maps);
//        //根据任务id获取任务信息
//        Task task = taskMapper.selectTaskByTaskId(taskId);
//        //根据制令id查询制令信息
//        Orders order = ordersMapper.selectOrdersById(task.getOrderId());
//        map.put("order", order);
        System.out.println("map : " + map);
        return map;
    }
}
