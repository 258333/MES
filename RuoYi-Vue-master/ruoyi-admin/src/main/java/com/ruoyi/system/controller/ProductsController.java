package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.mapper.ProductsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Products;
import com.ruoyi.system.service.IProductsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品，存储产品相关信息Controller
 * 
 * @author HongWei
 * @date 2024-10-02
 */
@RestController
@RequestMapping("/products/products")
@RequiredArgsConstructor
public class ProductsController extends BaseController
{
    private final IProductsService productsService;

    private final ProductsMapper productsMapper;

    /**
     * 查询产品，存储产品相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('products:products:list')")
    @GetMapping("/list")
    public TableDataInfo list(Products products)
    {
        startPage();
        List<Products> list = productsService.selectProductsList(products);
        return getDataTable(list);
    }

    /**
     * 导出产品，存储产品相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('products:products:export')")
    @Log(title = "产品，存储产品相关信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Products products)
    {
        List<Products> list = productsService.selectProductsList(products);
        ExcelUtil<Products> util = new ExcelUtil<Products>(Products.class);
        util.exportExcel(response, list, "产品，存储产品相关信息数据");
    }

    /**
     * 获取产品，存储产品相关信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('products:products:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return success(productsService.selectProductsByProductId(productId));
    }

    /**
     * 新增产品，存储产品相关信息
     */
    @PreAuthorize("@ss.hasPermi('products:products:add')")
    @Log(title = "产品，存储产品相关信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Products products)
    {
        return toAjax(productsService.insertProducts(products));
    }

    /**
     * 修改产品，存储产品相关信息
     */
    @PreAuthorize("@ss.hasPermi('products:products:edit')")
    @Log(title = "产品，存储产品相关信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Products products)
    {
        return toAjax(productsService.updateProducts(products));
    }

    /**
     * 删除产品，存储产品相关信息
     */
    @PreAuthorize("@ss.hasPermi('products:products:remove')")
    @Log(title = "产品，存储产品相关信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(productsService.deleteProductsByProductIds(productIds));
    }
}
