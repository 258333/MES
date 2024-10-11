package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.Orders;
import com.ruoyi.system.service.IOrdersService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 制令，存储总制令、分制令和子制令的信息Controller
 * 
 * @author HongWei
 * @date 2024-10-05
 */
@RestController
@RequestMapping("/orders/orders")
public class OrdersController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;

    /**
     * 查询制令，存储总制令、分制令和子制令的信息列表
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:list')")
    @GetMapping("/list")
    public AjaxResult list(Orders orders)
    {
        List<Map<String,Object>> list = ordersService.selectOrdersAndDetailList(orders);
        return success(list);
    }

    /**
     * 导出制令，存储总制令、分制令和子制令的信息列表
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:export')")
    @Log(title = "制令，存储总制令、分制令和子制令的信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "制令，存储总制令、分制令和子制令的信息数据");
    }

    /**
     * 获取制令，存储总制令、分制令和子制令的信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ordersService.selectOrdersById(id));
    }

    /**
     * 新增制令，存储总制令、分制令和子制令的信息
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:add')")
    @Log(title = "制令，存储总制令、分制令和子制令的信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orders orders)
    {
        return toAjax(ordersService.insertOrders(orders));
    }

    /**
     * 修改制令，存储总制令、分制令和子制令的信息
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:edit')")
    @Log(title = "制令，存储总制令、分制令和子制令的信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orders orders)
    {
        return toAjax(ordersService.updateOrders(orders));
    }

    /**
     * 删除制令，存储总制令、分制令和子制令的信息
     */
    @PreAuthorize("@ss.hasPermi('orders:orders:remove')")
    @Log(title = "制令，存储总制令、分制令和子制令的信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ordersService.deleteOrdersByIds(ids));
    }
}
