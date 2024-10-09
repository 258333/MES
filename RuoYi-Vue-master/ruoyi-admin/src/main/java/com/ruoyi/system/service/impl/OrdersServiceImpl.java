package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.ContractsMapper;
import com.ruoyi.system.mapper.ProductsMapper;
import com.ruoyi.system.mapper.SysUserRoleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.OrdersMapper;
import com.ruoyi.system.service.IOrdersService;

/**
 * 制令，存储总制令、分制令和子制令的信息Service业务层处理
 *
 * @author HongWei
 * @date 2024-10-05
 */
@Service
@RequiredArgsConstructor
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {

    private final OrdersMapper ordersMapper;

    private long orderNumber = 100001;

    private final SysUserRoleMapper sysUserRoleMapper;

    private final ProductsMapper productMapper;

    private final ContractsMapper contractsMapper;

    /**
     * 查询制令，存储总制令、分制令和子制令的信息
     *
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 制令，存储总制令、分制令和子制令的信息
     */
    @Override
    public Orders selectOrdersById(Long id) {
        return ordersMapper.selectOrdersById(id);
    }

    /**
     * 查询制令，存储总制令、分制令和子制令的信息列表
     *
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 制令，存储总制令、分制令和子制令的信息
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders) {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增制令，存储总制令、分制令和子制令的信息
     *
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders) {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改制令，存储总制令、分制令和子制令的信息
     *
     * @param orders 制令，存储总制令、分制令和子制令的信息
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders) {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除制令，存储总制令、分制令和子制令的信息
     *
     * @param ids 需要删除的制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByIds(Long[] ids) {
        return ordersMapper.deleteOrdersByIds(ids);
    }

    /**
     * 删除制令，存储总制令、分制令和子制令的信息信息
     *
     * @param id 制令，存储总制令、分制令和子制令的信息主键
     * @return 结果
     */
    @Override
    public int deleteOrdersById(Long id) {
        return ordersMapper.deleteOrdersById(id);
    }

    /**
     * 根据新增的合同自动生成三级制令
     *
     * @param contract 前端上传的合同内容
     */
    @Override
    public void insertOrdersByContract(Contracts contract) {
        //查询刚刚插入的合同

        contract =  contractsMapper.selectContractsList(contract).get(0);
        // 1.根据合同生成唯一的总制令
        Orders orders = new Orders();
        orders.setContractId(contract.getContractId());
        orders.setType("总制令");
        orders.setOrderNumber(Long.toString(orderNumber));
        // 1. 获取当前日期
        String currentDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        // 2. 生成生产批次号 (合同编号 + 当前日期 + (制令类型))
        orders.setBatchNumber(contract.getContractId() + "-" + currentDate + "-1");
        orders.setStatus("待生产");
        // 3. 插入数据库
        ordersMapper.insertOrders(orders);
        // 4. 查询生成的总制令
        orders = ordersMapper.selectOrdersList(orders).get(0);
        // 5. orderNumber + 1
        orderNumber++;

        // 2. 根据产品生成不同的分制令

        int i = 1;
        for (ProductDetails product : contract.getProductDetails()) {
            Orders orders1 = new Orders();
            orders1.setType("分制令");
            orders1.setStatus("待生产");
            orders1.setParentId(orders.getId());
            orders1.setOrderNumber(orderNumber + "");
            orders1.setProductId(product.getProductId());
            orders1.setQuantity(product.getQuantity());
            orders1.setBatchNumber(contract.getContractId() + "-" + currentDate + "-2-" + i++);
            ordersMapper.insertOrders(orders1);

            orders1 = ordersMapper.selectOrdersList(orders1).get(0);
            orderNumber++;

//            //根据员工数量 将产品平均分给各个员工
//            //查询角色为员工的id编号
//            //此处100为角色为员工的id号
//            int userNumber = sysUserRoleMapper.countUserRoleByRoleId(100L);
//            //将产品平均分给各个员工
//            AtomicInteger count = new AtomicInteger(0);

            //根据不同的产品 判断需要几道工序 来生成子制令
            //根据产品id查询产品种类
            Products products = productMapper.selectProductsByProductId(product.getProductId());
            //工序数量 n
            int n = Integer.parseInt(products.getCategory()) + 3;
            for (int j = 0; j < n; j++) {
                Orders orders2 = new Orders();
                orders2.setType("子制令");
                orders2.setStatus("待生产");
                orders2.setParentId(orders1.getId());
                orders2.setOrderNumber(orderNumber++ + "");
                orders2.setBatchNumber(contract.getContractId() + "-" + currentDate + "-3-" + i++);
                ordersMapper.insertOrders(orders2);
            }

        }

    }


}
