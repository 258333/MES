package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务分配，存储每个子制令的任务分配情况对象 tb_task_assignments
 * 
 * @author HongWei
 * @date 2024-10-10
 */
public class TaskAssignment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务分配ID */
    private Long id;

    /** 子制令ID */
    @Excel(name = "子制令ID")
    private Long orderId;

    /** 员工ID */
    @Excel(name = "员工ID")
    private Long userId;

    /** 任务分配时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务分配时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date assignedDate;

    /** 任务状态（待执行、进行中、已完成） */
    @Excel(name = "任务状态", readConverterExp = "待=执行、进行中、已完成")
    private String status;

    /** 任务完成时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "任务完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date completedDate;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setAssignedDate(Date assignedDate) 
    {
        this.assignedDate = assignedDate;
    }

    public Date getAssignedDate() 
    {
        return assignedDate;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setCompletedDate(Date completedDate) 
    {
        this.completedDate = completedDate;
    }

    public Date getCompletedDate() 
    {
        return completedDate;
    }
    public void setRemarks(String remarks) 
    {
        this.remarks = remarks;
    }

    public String getRemarks() 
    {
        return remarks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("userId", getUserId())
            .append("assignedDate", getAssignedDate())
            .append("status", getStatus())
            .append("completedDate", getCompletedDate())
            .append("remarks", getRemarks())
            .toString();
    }
}
