package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 制令，存储总制令、分制令和子制令的信息对象 tb_orders
 * 
 * @author HongWei
 * @date 2024-10-05
 */
public class Orders extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识 */
    private Long id;

    /** 制令编号 */
    @Excel(name = "制令编号")
    private String orderNumber;

    /** 制令类型（如：总制令、分制令、子制令） */
    @Excel(name = "制令类型", readConverterExp = "如=：总制令、分制令、子制令")
    private String type;

    /** 关联的合同 ID */
    @Excel(name = "关联的合同 ID")
    private Long contractId;

    /** 关联的产品 ID */
    @Excel(name = "关联的产品 ID")
    private Long productId;

    /** 生产数量 */
    @Excel(name = "生产数量")
    private Long quantity;

    /** 批次号 */
    @Excel(name = "批次号")
    private String batchNumber;

    /** 制令状态（如：待生产、生产中、已完成、已发货、已关闭、暂停、异常） */
    @Excel(name = "制令状态", readConverterExp = "如=：待生产、生产中、已完成、已发货、已关闭、暂停、异常")
    private String status;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderNumber(String orderNumber) 
    {
        this.orderNumber = orderNumber;
    }

    public String getOrderNumber() 
    {
        return orderNumber;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setContractId(Long contractId) 
    {
        this.contractId = contractId;
    }

    public Long getContractId() 
    {
        return contractId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setBatchNumber(String batchNumber) 
    {
        this.batchNumber = batchNumber;
    }

    public String getBatchNumber() 
    {
        return batchNumber;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("id", getId())
            .append("orderNumber", getOrderNumber())
            .append("parentId", getParentId())
            .append("type", getType())
            .append("contractId", getContractId())
            .append("productId", getProductId())
            .append("quantity", getQuantity())
            .append("batchNumber", getBatchNumber())
            .append("status", getStatus())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .toString();
    }
}
