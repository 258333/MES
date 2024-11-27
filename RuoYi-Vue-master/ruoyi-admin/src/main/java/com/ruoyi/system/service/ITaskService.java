package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.dto.TaskMaterial;

/**
 * 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息Service接口
 *
 * @author HongWei
 * @date 2024-11-26
 */
public interface ITaskService
{
    /**
     * 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskId 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    public Task selectTaskByTaskId(Long taskId);

    /**
     * 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息列表
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息集合
     */
    public List<Task> selectTaskList(Task task);

    /**
     * 新增任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 结果
     */
    public int insertTask(Task task);

    /**
     * 修改任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param task 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     * @return 结果
     */
    public int updateTask(Task task);

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskIds 需要删除的任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键集合
     * @return 结果
     */
    public int deleteTaskByTaskIds(Long[] taskIds);

    /**
     * 删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息信息
     *
     * @param taskId 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 结果
     */
    public int deleteTaskByTaskId(Long taskId);

    /**
     * @param: [taskMaterial]
     * @return: int
     * 存储任务对应的物料信息
     **/
    int insertTaskMaterials(List<TaskMaterial> taskMaterial);
}
