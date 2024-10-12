package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 机器，存储所有机器的相关信息对象 tb_machine
 * 
 * @author HongWei
 * @date 2024-10-12
 */
public class Machine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 机器ID */
    private Long machineId;

    /** 机器名称 */
    @Excel(name = "机器名称")
    private String machineName;

    /** 机器类型 */
    @Excel(name = "机器类型")
    private String machineType;

    /** 机器状态（可用、占用、维护中） */
    @Excel(name = "机器状态", readConverterExp = "可=用、占用、维护中")
    private String status;

    /** 机器描述 */
    @Excel(name = "机器描述")
    private String description;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

    public void setMachineId(Long machineId) 
    {
        this.machineId = machineId;
    }

    public Long getMachineId() 
    {
        return machineId;
    }
    public void setMachineName(String machineName) 
    {
        this.machineName = machineName;
    }

    public String getMachineName() 
    {
        return machineName;
    }
    public void setMachineType(String machineType) 
    {
        this.machineType = machineType;
    }

    public String getMachineType() 
    {
        return machineType;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
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
            .append("machineId", getMachineId())
            .append("machineName", getMachineName())
            .append("machineType", getMachineType())
            .append("status", getStatus())
            .append("description", getDescription())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .toString();
    }
}
