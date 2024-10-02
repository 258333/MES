package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 合同，存储合同相关信息及其产品详情对象 tb_contracts
 *
 * @author HongWei
 * @date 2024-10-02
 */
public class Contracts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 合同唯一标识 */
    private Long contractId;

    /** 合同编号 */
    @Excel(name = "合同编号")
    private String contractNumber;

    /** 客户名称 */
    @Excel(name = "客户名称")
    private String customerName;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactPerson;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactNumber;

    /** 客户地址 */
    @Excel(name = "客户地址")
    private String address;

    /** 合同开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "合同开始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 合同结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "合同结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 合同总金额 */
    @Excel(name = "合同总金额")
    private BigDecimal totalValue;

    /** 合同状态（如：有效、无效） */
    @Excel(name = "合同状态", readConverterExp = "如=：有效、无效")
    private String status;

    /** 创建日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;

    /** 产品编号及数量信息 (JSON格式) */
    @Excel(name = "产品编号及数量信息 (JSON格式)")
    private String productDetails;

    /** 合同名称 */
    @Excel(name = "合同名称")
    private String contractName;

    public void setContractId(Long contractId)
    {
        this.contractId = contractId;
    }

    public Long getContractId()
    {
        return contractId;
    }
    public void setContractNumber(String contractNumber)
    {
        this.contractNumber = contractNumber;
    }

    public String getContractNumber()
    {
        return contractNumber;
    }
    public void setCustomerName(String customerName)
    {
        this.customerName = customerName;
    }

    public String getCustomerName()
    {
        return customerName;
    }
    public void setContactPerson(String contactPerson)
    {
        this.contactPerson = contactPerson;
    }

    public String getContactPerson()
    {
        return contactPerson;
    }
    public void setContactNumber(String contactNumber)
    {
        this.contactNumber = contactNumber;
    }

    public String getContactNumber()
    {
        return contactNumber;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setStartDate(Date startDate)
    {
        this.startDate = startDate;
    }

    public Date getStartDate()
    {
        return startDate;
    }
    public void setEndDate(Date endDate)
    {
        this.endDate = endDate;
    }

    public Date getEndDate()
    {
        return endDate;
    }
    public void setTotalValue(BigDecimal totalValue)
    {
        this.totalValue = totalValue;
    }

    public BigDecimal getTotalValue()
    {
        return totalValue;
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
    public void setProductDetails(String productDetails)
    {
        this.productDetails = productDetails;
    }

    public String getProductDetails()
    {
        return productDetails;
    }
    public void setContractName(String contractName)
    {
        this.contractName = contractName;
    }

    public String getContractName()
    {
        return contractName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contractId", getContractId())
            .append("contractNumber", getContractNumber())
            .append("customerName", getCustomerName())
            .append("contactPerson", getContactPerson())
            .append("contactNumber", getContactNumber())
            .append("address", getAddress())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("totalValue", getTotalValue())
            .append("status", getStatus())
            .append("createdDate", getCreatedDate())
            .append("modifiedDate", getModifiedDate())
            .append("productDetails", getProductDetails())
            .append("contractName", getContractName())
            .toString();
    }
}
