package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务与机器的关联，用于记录任务在特定机器上的使用情况对象 tb_task_machine
 *
 * @author HongWei
 * @date 2024-11-27
 */
public class TaskMachine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务分配ID，关联tb_task表 */
    private Long taskId;

    /** 机器ID，关联tb_machine表 */
    private Long machineId;

    /** 任务开始使用机器的时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "任务开始使用机器的时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 任务结束使用机器的时间，可为空表示任务未完成 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "任务结束使用机器的时间，可为空表示任务未完成", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;


    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }
    public void setMachineId(Long machineId)
    {
        this.machineId = machineId;
    }

    public Long getMachineId()
    {
        return machineId;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("taskId", getTaskId())
                .append("machineId", getMachineId())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .toString();
    }
}
