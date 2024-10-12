package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工序，存储工序及其相关信息对象 tb_operation
 * 
 * @author HongWei
 * @date 2024-10-12
 */
public class Operation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工序ID */
    private Long operationId;

    /** 工序名称 */
    @Excel(name = "工序名称")
    private String operationName;

    /** 工序描述 */
    @Excel(name = "工序描述")
    private String description;

    /** 工序预计时长（小时） */
    @Excel(name = "工序预计时长", readConverterExp = "小=时")
    private BigDecimal duration;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

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
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setDuration(BigDecimal duration) 
    {
        this.duration = duration;
    }

    public BigDecimal getDuration() 
    {
        return duration;
    }
    public void setCreatedDate(Date createdDate) 
    {
        this.createdDate = createdDate;
    }

    public Date getCreatedDate() 
    {
        return createdDate;
    }
    public void setModifiedDate(Date modifiedDate) 
    {
        this.modifiedDate = modifiedDate;
    }

    public Date getModifiedDate() 
    {
        return modifiedDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("operationId", getOperationId())
            .append("operationName", getOperationName())
            .append("description", getDescription())
            .append("duration", getDuration())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .toString();
    }
}
