package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 物料，存储生产所需的物料信息对象 tb_material
 * 
 * @author HongWei
 * @date 2024-11-02
 */
public class Material extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 物料ID */
    private Long materialId;

    /** 物料名称 */
    @Excel(name = "物料名称")
    private String materialName;

    /** 单位（如吨、公斤、个） */
    @Excel(name = "单位", readConverterExp = "如=吨、公斤、个")
    private String unit;

    /** 库存数量 */
    @Excel(name = "库存数量")
    private BigDecimal quantity;

    /** 单价（当期出库加权价格） */
    @Excel(name = "单价", readConverterExp = "当=期出库加权价格")
    private BigDecimal price;

    /** 物料状态（可用、不可用） */
    @Excel(name = "物料状态", readConverterExp = "可=用、不可用")
    private String status;

    /** 物料描述 */
    @Excel(name = "物料描述")
    private String description;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setMaterialName(String materialName) 
    {
        this.materialName = materialName;
    }

    public String getMaterialName() 
    {
        return materialName;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setQuantity(BigDecimal quantity) 
    {
        this.quantity = quantity;
    }

    public BigDecimal getQuantity() 
    {
        return quantity;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
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
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("unit", getUnit())
            .append("quantity", getQuantity())
            .append("price", getPrice())
            .append("status", getStatus())
            .append("description", getDescription())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .toString();
    }
}
