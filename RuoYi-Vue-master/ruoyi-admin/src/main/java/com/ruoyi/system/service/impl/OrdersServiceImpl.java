package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.dto.ProductOperation;
import com.ruoyi.system.mapper.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
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

    private final SysUserRoleMapper sysUserRoleMapper;

    private final ProductsMapper productMapper;

    private final ContractsMapper contractsMapper;

    private final OperationMapper operationMapper;

    private final OtherMapper otherMapper;

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
    public List<Map<String,Object>> selectOrdersAndDetailList(Orders orders) {
        return ordersMapper.selectOrdersList(orders).stream().map(order->{
            // 创建一个 Map 来存储每个 Orders 对象的字段和值
            Map<String,Object> map =new HashMap<>();
            map.put("id",order.getId());
            map.put("orderNumber",order.getOrderNumber());
            map.put("type",order.getType());
            map.put("status",order.getStatus());
            map.put("parentId",order.getParentId());
            map.put("quantity",order.getQuantity());
            map.put("operation",order.getOperation());
            map.put("operationId",order.getOperationId());
            map.put("operationSequence",order.getOperationSequence());
            if(order.getContractId() != null ){
                // 根据合同id查询合同信息
                Contracts contract = contractsMapper.selectContractsByContractId(order.getContractId());
                map.put("contractName",contract.getContractName());
            }
            map.put("contractId",order.getContractId());
            if (order.getProductId() != null){
                // 根据产品id查询产品信息
                Products product = productMapper.selectProductsByProductId(order.getProductId());
                map.put("productName",product.getProductName());
            }
            map.put("productId",order.getProductId());
            return map;
        }).collect(Collectors.toList());
    }

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
        // 获取当前日期
        String currentDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String number = "";
        //查询刚刚插入的合同
        contract = contractsMapper.selectContractsList(contract).get(0);
        // 1.根据合同生成唯一的总制令
        Orders orders = new Orders();
        orders.setContractId(contract.getContractId());
        orders.setType("总制令");
        //编号
        number = contract.getContractId() + "-" + currentDate + "-1";
        orders.setOrderNumber(number);
        orders.setStatus("未完成");
        // 3. 插入数据库
        ordersMapper.insertOrders(orders);
        // 4. 查询生成的总制令
        orders = ordersMapper.selectOrdersList(orders).get(0);
        // 5. orderNumber + 1

        // 2. 根据产品生成不同的分制令

        int i = 1;
        int k = 1;
        for (ProductDetails product : contract.getProductDetails()) {
            Orders orders1 = new Orders();
            orders1.setType("分制令");
            orders1.setStatus("未完成");
            orders1.setParentId(orders.getId());
            number = contract.getContractId() + "-" + currentDate + "-2-" + i++;
            orders1.setOrderNumber(number);
            orders1.setProductId((long) product.getProductId());
            orders1.setQuantity(product.getQuantity());
            ordersMapper.insertOrders(orders1);

            orders1 = ordersMapper.selectOrdersList(orders1).get(0);

            List<ProductOperation> productOperations = otherMapper.selectOperationByProductId(product.getProductId());
            System.out.println("***********");
            System.out.println(productOperations);
            System.out.println("***********");
//            工序数量 n
            int n = productOperations.size();
            for (int j = 0; j < n; j++) {
                Orders orders2 = new Orders();
                orders2.setType("子制令");
                orders2.setStatus("待分配");
                orders2.setParentId(orders1.getId());
                orders2.setQuantity(product.getQuantity());
                number = contract.getContractId() + "-" + currentDate + "-3-" + k++;
                orders2.setOrderNumber(number);
                Operation operation = operationMapper.selectOperationByOperationId((long) productOperations.get(j).getOperationId());
                orders2.setOperationId(operation.getOperationId());
                orders2.setOperationSequence((long) productOperations.get(j).getSequenceNumber());
                orders2.setOperation(operation.getOperationName());
                ordersMapper.insertOrders(orders2);
            }

        }

    }


}
