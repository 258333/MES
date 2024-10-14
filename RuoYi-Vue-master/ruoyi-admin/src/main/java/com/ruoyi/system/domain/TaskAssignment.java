package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务分配，存储每个子制令的任务分配情况对象 tb_task_assignment
 *
 * @author HongWei
 * @date 2024-10-13
 */
public class TaskAssignment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务分配ID */
    private Long takeId;

    /** 制令ID */
    @Excel(name = "制令ID")
    private Long orderId;

    /** 员工ID */
    @Excel(name = "员工ID")
    private Long userId;

    /** 机器ID */
    @Excel(name = "机器ID")
    private Long machineId;

    /** 任务分配时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务分配时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date assignedDate;

    /** 是否完成工序 */
    @Excel(name = "是否完成工序")
    private Integer isCompleted;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    /** 工序ID */
    @Excel(name = "工序ID")
    private Long operationId;

    /** 是否开始 */
    @Excel(name = "是否开始")
    private Integer isStarted;

    public void setTakeId(Long takeId)
    {
        this.takeId = takeId;
    }

    public Long getTakeId()
    {
        return takeId;
    }
    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setMachineId(Long machineId)
    {
        this.machineId = machineId;
    }

    public Long getMachineId()
    {
        return machineId;
    }
    public void setAssignedDate(Date assignedDate)
    {
        this.assignedDate = assignedDate;
    }

    public Date getAssignedDate()
    {
        return assignedDate;
    }
    public void setIsCompleted(Integer isCompleted)
    {
        this.isCompleted = isCompleted;
    }

    public Integer getIsCompleted()
    {
        return isCompleted;
    }
    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }
    public void setOperationId(Long operationId)
    {
        this.operationId = operationId;
    }

    public Long getOperationId()
    {
        return operationId;
    }
    public void setIsStarted(Integer isStarted)
    {
        this.isStarted = isStarted;
    }

    public Integer getIsStarted()
    {
        return isStarted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("takeId", getTakeId())
                .append("orderId", getOrderId())
                .append("userId", getUserId())
                .append("machineId", getMachineId())
                .append("assignedDate", getAssignedDate())
                .append("isCompleted", getIsCompleted())
                .append("remarks", getRemarks())
                .append("operationId", getOperationId())
                .append("isStarted", getIsStarted())
                .toString();
    }
}
