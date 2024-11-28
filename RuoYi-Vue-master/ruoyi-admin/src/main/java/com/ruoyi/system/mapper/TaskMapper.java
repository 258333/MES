package com.ruoyi.system.mapper;

import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.domain.TaskMachine;
import com.ruoyi.system.domain.dto.TaskMaterial;
import org.apache.ibatis.annotations.*;

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

    /**
     * 存储任务对应的机器信息
     *
     * @param: [taskId, machineId]
     * @return: com.ruoyi.common.core.domain.AjaxResult
     **/
    @Insert("INSERT INTO tb_task_machine (task_id, machine_id, start_time) VALUES (#{taskId},#{machineId},NOW())")
    int insertTaskMachine(@Param("taskId") Long taskId, @Param("machineId") Long machineId);


    /**
     * 根据任务id查询任务和机器的对应关系
     *
     * @param: [taskId]
     * @return: com.ruoyi.system.domain.TaskMachine
     **/
    @Select("SELECT * FROM tb_task_machine WHERE task_id = #{taskId}")
    TaskMachine selectTaskMachineByTaskId( Long taskId);

    /**
     * 根据任务id查询任务和物料的对应关系
     *
     * @param: [taskId]
     * @return: java.util.List<com.ruoyi.system.domain.dto.TaskMaterial>
     **/
    @Select("SELECT task_id, material_id, quantity FROM tb_task_material WHERE task_id = #{taskId}")
    List<TaskMaterial> selectTaskMaterialsByTaskId( Long taskId);

    /**
     * 设置机器的结束使用时间
     *
     * @param: [taskMachine]
     * @return: void
     **/
    @Update("UPDATE tb_task_machine SET end_time = NOW() WHERE task_id = #{taskId} AND machine_id = #{machineId}")
    void updateTaskMachine(TaskMachine taskMachine);

    /**
     * 查找在某个时间范围内的任务机器信息
     *
     * @param: [checkInTime, checkOutTime]
     * @return: java.util.List<com.ruoyi.system.domain.TaskMachine>
     **/
    @Select("SELECT task_id, machine_id, start_time, end_time FROM tb_task_machine " +
            "WHERE start_time >= #{checkInTime} AND end_time IS NOT NULL AND end_time <= #{checkOutTime}")
    List<TaskMachine> selectTaskByStartAndEndTime(@Param("checkInTime") Date checkInTime, @Param("checkOutTime") Date checkOutTime);
}
