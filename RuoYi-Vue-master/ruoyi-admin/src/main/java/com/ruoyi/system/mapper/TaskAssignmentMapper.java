package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TaskAssignment;
import com.ruoyi.system.domain.dto.TaskMaterial;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * 任务分配，存储每个子制令的任务分配情况Mapper接口
 * 
 * @author HongWei
 * @date 2024-10-12
 */
@Mapper
public interface TaskAssignmentMapper 
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
     * 删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param takeId 任务分配，存储每个子制令的任务分配情况主键
     * @return 结果
     */
    public int deleteTaskAssignmentByTakeId(Long takeId);

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况
     * 
     * @param takeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskAssignmentByTakeIds(Long[] takeIds);

    @Insert("insert into tb_task_material(material_id,task_id,quantity) values(#{materialId},#{taskId},#{quantity})")
    void insertTaskMaterials(TaskMaterial material);
}
