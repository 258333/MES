package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Products;
import com.ruoyi.system.domain.dto.ProductOperation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 产品，存储产品相关信息Mapper接口
 * 
 * @author HongWei
 * @date 2024-10-02
 */

@Mapper
public interface ProductsMapper extends BaseMapper<Products>
{
    /**
     * 查询产品，存储产品相关信息
     * 
     * @param productId 产品，存储产品相关信息主键
     * @return 产品，存储产品相关信息
     */
    public Products selectProductsByProductId(Long productId);

    /**
     * 查询产品，存储产品相关信息列表
     * 
     * @param products 产品，存储产品相关信息
     * @return 产品，存储产品相关信息集合
     */
    public List<Products> selectProductsList(Products products);

    /**
     * 新增产品，存储产品相关信息
     * 
     * @param products 产品，存储产品相关信息
     * @return 结果
     */
    public int insertProducts(Products products);

    /**
     * 修改产品，存储产品相关信息
     * 
     * @param products 产品，存储产品相关信息
     * @return 结果
     */
    public int updateProducts(Products products);

    /**
     * 删除产品，存储产品相关信息
     * 
     * @param productId 产品，存储产品相关信息主键
     * @return 结果
     */
    public int deleteProductsByProductId(Long productId);

    /**
     * 批量删除产品，存储产品相关信息
     * 
     * @param productIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductsByProductIds(Long[] productIds);

//    /**
//     * 查询生产产品所需的工序
//     *
//     * @param productId 产品，存储产品相关信息主键
//     * @return 结果
//     */
//
//    @Select("select * from tb_product_operation where product_id = #{productId}")
//    public List<ProductOperation> selectOperationByProductId(Long productId);
}
