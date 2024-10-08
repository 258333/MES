package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Products;

/**
 * 产品，存储产品相关信息Service接口
 * 
 * @author HongWei
 * @date 2024-10-02
 */
public interface IProductsService 
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
     * 批量删除产品，存储产品相关信息
     * 
     * @param productIds 需要删除的产品，存储产品相关信息主键集合
     * @return 结果
     */
    public int deleteProductsByProductIds(Long[] productIds);

    /**
     * 删除产品，存储产品相关信息信息
     * 
     * @param productId 产品，存储产品相关信息主键
     * @return 结果
     */
    public int deleteProductsByProductId(Long productId);
}
