package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
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

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
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

    /** 工序ID */
    @Excel(name = "工序ID")
    private Long operationId;

    /** 生产数量 */
    @Excel(name = "生产数量")
    private Long quantity;

    /** 批次号 */
    @Excel(name = "批次号")
    private String batchNumber;

    /** 制令状态（如：待生产、生产中、已完成、已发货、已关闭、暂停、异常） */
    @Excel(name = "制令状态", readConverterExp = "如=：待生产、生产中、已完成、已发货、已关闭、暂停、异常")
    private String status;

    @Excel(name="工序")
    private String operation;

    /** 创建日期 */
    private Date createdDate;

    /** 修改日期 */
    private Date modifiedDate;


}
