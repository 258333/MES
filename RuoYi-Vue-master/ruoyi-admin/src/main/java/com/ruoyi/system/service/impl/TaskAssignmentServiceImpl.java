package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TaskAssignmentMapper;
import com.ruoyi.system.domain.TaskAssignment;
import com.ruoyi.system.service.ITaskAssignmentService;

/**
 * 任务分配，存储每个子制令的任务分配情况Service业务层处理
 * 
 * @author HongWei
 * @date 2024-10-10
 */
@Service
public class TaskAssignmentServiceImpl implements ITaskAssignmentService 
{
    @Autowired
    private TaskAssignmentMapper taskAssignmentMapper;

    /**
     * 查询任务分配，存储每个子制令的任务分配情况
     * 
     * @param id 任务分配，存储每个子制令的任务分配情况主键
     * @return 任务分配，存储每个子制令的任务分配情况
     */
    @Override
    public TaskAssignment selectTaskAssignmentById(Long id)
    {
        return taskAssignmentMapper.selectTaskAssignmentById(id);
    }

    /**
     * 查询任务分配，存储每个子制令的任务分配情况列表
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 任务分配，存储每个子制令的任务分配情况
     */
    @Override
    public List<TaskAssignment> selectTaskAssignmentList(TaskAssignment taskAssignment)
    {
        return taskAssignmentMapper.selectTaskAssignmentList(taskAssignment);
    }

    /**
     * 新增任务分配，存储每个子制令的任务分配情况
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 结果
     */
    @Override
    public int insertTaskAssignment(TaskAssignment taskAssignment)
    {
        return taskAssignmentMapper.insertTaskAssignment(taskAssignment);
    }

    /**
     * 修改任务分配，存储每个子制令的任务分配情况
     * 
     * @param taskAssignment 任务分配，存储每个子制令的任务分配情况
     * @return 结果
     */
    @Override
    public int updateTaskAssignment(TaskAssignment taskAssignment)
    {
        return taskAssignmentMapper.updateTaskAssignment(taskAssignment);
    }

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param ids 需要删除的任务分配，存储每个子制令的任务分配情况主键
     * @return 结果
     */
    @Override
    public int deleteTaskAssignmentByIds(Long[] ids)
    {
        return taskAssignmentMapper.deleteTaskAssignmentByIds(ids);
    }

    /**
     * 删除任务分配，存储每个子制令的任务分配情况信息
     * 
     * @param id 任务分配，存储每个子制令的任务分配情况主键
     * @return 结果
     */
    @Override
    public int deleteTaskAssignmentById(Long id)
    {
        return taskAssignmentMapper.deleteTaskAssignmentById(id);
    }
}
