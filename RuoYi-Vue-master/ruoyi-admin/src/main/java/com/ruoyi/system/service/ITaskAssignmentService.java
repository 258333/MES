package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.TaskAssignment;

/**
 * 任务分配，存储每个子制令的任务分配情况Service接口
 * 
 * @author HongWei
 * @date 2024-10-12
 */
public interface ITaskAssignmentService 
{
    /**
     * 查询任务分配，存储每个子制令的任务分配情况
     * 
     * @param takeId 任务分配，存储每个子制令的任务分配情况主键
     * @return 任务分配，存储每个子制令的任务分配情况
     */
    public TaskAssignment selectTaskAssignmentByTakeId(Long takeId);

    /**
     * 查询任务分配，存储每个子制令的任务分配情况列表
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 任务分配，存储每个子制令的任务分配情况集合
     */
    public List<TaskAssignment> selectTaskAssignmentList(TaskAssignment taskAssignment);

    /**
     * 新增任务分配，存储每个子制令的任务分配情况
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 结果
     */
    public int insertTaskAssignment(TaskAssignment taskAssignment);

    /**
     * 修改任务分配，存储每个子制令的任务分配情况
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 结果
     */
    public int updateTaskAssignment(TaskAssignment taskAssignment);

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param takeIds 需要删除的任务分配，存储每个子制令的任务分配情况主键集合
     * @return 结果
     */
    public int deleteTaskAssignmentByTakeIds(Long[] takeIds);

    /**
     * 删除任务分配，存储每个子制令的任务分配情况信息
     * 
     * @param takeId 任务分配，存储每个子制令的任务分配情况主键
     * @return 结果
     */
    public int deleteTaskAssignmentByTakeId(Long takeId);
}
