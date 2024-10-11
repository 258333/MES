package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TaskAssignment;

/**
 * 任务分配，存储每个子制令的任务分配情况Mapper接口
 * 
 * @author HongWei
 * @date 2024-10-10
 */
public interface TaskAssignmentMapper 
{
    /**
     * 查询任务分配，存储每个子制令的任务分配情况
     * 
     * @param id 任务分配，存储每个子制令的任务分配情况主键
     * @return 任务分配，存储每个子制令的任务分配情况
     */
    public TaskAssignment selectTaskAssignmentById(Long id);

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
     * 删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param id 任务分配，存储每个子制令的任务分配情况主键
     * @return 结果
     */
    public int deleteTaskAssignmentById(Long id);

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskAssignmentByIds(Long[] ids);
}
