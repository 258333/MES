package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.OrdersMapper;
import com.ruoyi.system.domain.Orders;
import com.ruoyi.system.service.IOrdersService;

/**
 * 制令，存储总制令、分制令和子制令的信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-10-05
 */
@Service
public class OrdersServiceImpl implements IOrdersService 
{
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询制令，存储总制令、分制令和子制令的信息
     * 
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 制令，存储总制令、分制令和子制令的信息
     */
    @Override
    public Orders selectOrdersById(Long id)
    {
        return ordersMapper.selectOrdersById(id);
    }

    /**
     * 查询制令，存储总制令、分制令和子制令的信息列表
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 制令，存储总制令、分制令和子制令的信息
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders)
    {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增制令，存储总制令、分制令和子制令的信息
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders)
    {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改制令，存储总制令、分制令和子制令的信息
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders)
    {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除制令，存储总制令、分制令和子制令的信息
     * 
     * @param ids 需要删除的制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByIds(Long[] ids)
    {
        return ordersMapper.deleteOrdersByIds(ids);
    }

    /**
     * 删除制令，存储总制令、分制令和子制令的信息信息
     * 
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    @Override
    public int deleteOrdersById(Long id)
    {
        return ordersMapper.deleteOrdersById(id);
    }
}
