package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.Contracts;
import com.ruoyi.system.domain.Orders;

/**
 * 制令，存储总制令、分制令和子制令的信息Service接口
 * 
 * @author HongWei
 * @date 2024-10-05
 */
public interface IOrdersService extends IService<Orders>
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
    public List<Map<String,Object>> selectOrdersAndDetailList(Orders orders);

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
     * 批量删除制令，存储总制令、分制令和子制令的信息
     * 
     * @param ids 需要删除的制令，存储总制令、分制令和子制令的信息主键集合
     * @return 结果
     */
    public int deleteOrdersByIds(Long[] ids);

    /**
     * 删除制令，存储总制令、分制令和子制令的信息信息
     * 
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    public int deleteOrdersById(Long id);

    /**
     * 根据新增的合同自动生成三级制令
     *
     * @param contract 前端上传的合同内容
     */
    void insertOrdersByContract(Contracts contract);
}
