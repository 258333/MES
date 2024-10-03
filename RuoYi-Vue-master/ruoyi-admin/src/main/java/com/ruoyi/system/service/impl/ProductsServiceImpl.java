package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ProductsMapper;
import com.ruoyi.system.domain.Products;
import com.ruoyi.system.service.IProductsService;

/**
 * 产品，存储产品相关信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-10-02
 */
@Service
public class ProductsServiceImpl implements IProductsService 
{
    @Autowired
    private ProductsMapper productsMapper;

    /**
     * 查询产品，存储产品相关信息
     * 
     * @param productId 产品，存储产品相关信息主键
     * @return 产品，存储产品相关信息
     */
    @Override
    public Products selectProductsByProductId(Long productId)
    {
        return productsMapper.selectProductsByProductId(productId);
    }

    /**
     * 查询产品，存储产品相关信息列表
     * 
     * @param products 产品，存储产品相关信息
     * @return 产品，存储产品相关信息
     */
    @Override
    public List<Products> selectProductsList(Products products)
    {
        return productsMapper.selectProductsList(products);
    }

    /**
     * 新增产品，存储产品相关信息
     * 
     * @param products 产品，存储产品相关信息
     * @return 结果
     */
    @Override
    public int insertProducts(Products products)
    {
        return productsMapper.insertProducts(products);
    }

    /**
     * 修改产品，存储产品相关信息
     * 
     * @param products 产品，存储产品相关信息
     * @return 结果
     */
    @Override
    public int updateProducts(Products products)
    {
        return productsMapper.updateProducts(products);
    }

    /**
     * 批量删除产品，存储产品相关信息
     * 
     * @param productIds 需要删除的产品，存储产品相关信息主键
     * @return 结果
     */
    @Override
    public int deleteProductsByProductIds(Long[] productIds)
    {
        return productsMapper.deleteProductsByProductIds(productIds);
    }

    /**
     * 删除产品，存储产品相关信息信息
     * 
     * @param productId 产品，存储产品相关信息主键
     * @return 结果
     */
    @Override
    public int deleteProductsByProductId(Long productId)
    {
        return productsMapper.deleteProductsByProductId(productId);
    }
}
