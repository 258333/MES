package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
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

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Products extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 产品唯一标识
     */
    private Long productId;

    /**
     * 产品名称
     */
    @Excel(name = "产品名称")
    private String productName;

    /**
     * 产品编号（或SKU）
     */
    @Excel(name = "产品编号", readConverterExp = "或=SKU")
    private String productCode;

    /**
     * 产品分类
     */
    @Excel(name = "产品分类")
    private String category;

    /**
     * 产品单价
     */
    @Excel(name = "产品单价")
    private BigDecimal price;

    /**
     * 产品描述
     */
    @Excel(name = "产品描述")
    private String description;

    /**
     * 创建日期
     */
    private Date createdDate;

    /**
     * 修改日期
     */
    private Date modifiedDate;

}
