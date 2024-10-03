package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品，存储产品相关信息对象 tb_products
 * 
 * @author HongWei
 * @date 2024-10-02
 */
public class Products extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产品唯一标识 */
    private Long productId;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    /** 产品编号（或SKU） */
    @Excel(name = "产品编号", readConverterExp = "或=SKU")
    private String productCode;

    /** 产品分类 */
    @Excel(name = "产品分类")
    private String category;

    /** 产品单价 */
    @Excel(name = "产品单价")
    private BigDecimal price;

    /** 产品描述 */
    @Excel(name = "产品描述")
    private String description;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setProductCode(String productCode) 
    {
        this.productCode = productCode;
    }

    public String getProductCode() 
    {
        return productCode;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
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
            .append("productId", getProductId())
            .append("productName", getProductName())
            .append("productCode", getProductCode())
            .append("category", getCategory())
            .append("price", getPrice())
            .append("description", getDescription())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .toString();
    }
}
