package com.ruoyi.system.mapper;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.Orders;

/**
 * 制令，存储总制令、分制令和子制令的信息Mapper接口
 * 
 * @author HongWei
 * @date 2024-10-05
 */
public interface OrdersMapper extends BaseMapper<Orders>
{
    /**
     * 查询制令，存储总制令、分制令和子制令的信息
     * 
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 制令，存储总制令、分制令和子制令的信息
     */
    public Orders selectOrdersById(Long id);

    /**
     * 查询制令，存储总制令、分制令和子制令的信息列表
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 制令，存储总制令、分制令和子制令的信息集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增制令，存储总制令、分制令和子制令的信息
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改制令，存储总制令、分制令和子制令的信息
     * 
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 删除制令，存储总制令、分制令和子制令的信息
     * 
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    public int deleteOrdersById(Long id);

    /**
     * 批量删除制令，存储总制令、分制令和子制令的信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrdersByIds(Long[] ids);
}
