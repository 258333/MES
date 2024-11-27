package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.dto.TaskMaterial;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息Mapper接口
 *
 * @author HongWei
 * @date 2024-11-26
 */
@Mapper
public interface TaskMapper
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
     * 删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskId 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息主键
     * @return 结果
     */
    public int deleteTaskByTaskId(Long taskId);

    /**
     * 批量删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     *
     * @param taskIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskByTaskIds(Long[] taskIds);

    /**
     * 增加任务对应的物料信息
     *
     * @param: [taskMaterial]
     * @return: int
     **/
    @Insert("INSERT INTO tb_task_material (task_id, material_id, quantity) VALUES (#{taskId}, #{materialId}, #{quantity})")
    int insertTaskMaterials(TaskMaterial taskMaterial);
}
