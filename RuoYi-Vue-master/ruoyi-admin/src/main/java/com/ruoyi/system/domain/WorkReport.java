package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报工，用于记录员工的报工信息对象 tb_work_report
 * 
 * @author HongWei
 * @date 2024-11-03
 */
public class WorkReport extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识每条报工记录 */
    private Long workReportId;

    /** 标识报工员工的唯一ID */
    @Excel(name = "标识报工员工的唯一ID")
    private Long userId;

    /** 报工员工的姓名 */
    @Excel(name = "报工员工的姓名")
    private String username;

    /** 员工所在班组的名称 */
    @Excel(name = "员工所在班组的名称")
    private String teamName;

    /** 标识使用的机器 */
    @Excel(name = "标识使用的机器")
    private Long machineId;

    /** 标识对应工序的唯一ID */
    @Excel(name = "标识对应工序的唯一ID")
    private Long operationId;

    /** 报工涉及的工序名称 */
    @Excel(name = "报工涉及的工序名称")
    private String operationName;

    /** 报工的产品数量 */
    @Excel(name = "报工的产品数量")
    private Long quantity;

    /** 报工的开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报工的开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 报工的结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报工的结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 报工单的当前状态（如已完成、进行中） */
    @Excel(name = "报工单的当前状态", readConverterExp = "如=已完成、进行中")
    private String reportStatus;

    /** 记录额外的报工信息 */
    @Excel(name = "记录额外的报工信息")
    private String remarks;

    public void setWorkReportId(Long workReportId) 
    {
        this.workReportId = workReportId;
    }

    public Long getWorkReportId() 
    {
        return workReportId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setTeamName(String teamName) 
    {
        this.teamName = teamName;
    }

    public String getTeamName() 
    {
        return teamName;
    }
    public void setMachineId(Long machineId) 
    {
        this.machineId = machineId;
    }

    public Long getMachineId() 
    {
        return machineId;
    }
    public void setOperationId(Long operationId) 
    {
        this.operationId = operationId;
    }

    public Long getOperationId() 
    {
        return operationId;
    }
    public void setOperationName(String operationName) 
    {
        this.operationName = operationName;
    }

    public String getOperationName() 
    {
        return operationName;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
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
    public void setReportStatus(String reportStatus) 
    {
        this.reportStatus = reportStatus;
    }

    public String getReportStatus() 
    {
        return reportStatus;
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
            .append("workReportId", getWorkReportId())
            .append("userId", getUserId())
            .append("username", getUsername())
            .append("teamName", getTeamName())
            .append("machineId", getMachineId())
            .append("operationId", getOperationId())
            .append("operationName", getOperationName())
            .append("quantity", getQuantity())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("reportStatus", getReportStatus())
            .append("remarks", getRemarks())
            .toString();
    }
}
