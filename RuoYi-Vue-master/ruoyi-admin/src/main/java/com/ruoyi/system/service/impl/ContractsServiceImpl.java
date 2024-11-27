package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.system.domain.Orders;
import com.ruoyi.system.mapper.OperationMapper;
import com.ruoyi.system.mapper.OrdersMapper;
import com.ruoyi.system.mapper.ProductsMapper;
import com.ruoyi.system.service.IOrdersService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ContractsMapper;
import com.ruoyi.system.domain.Contracts;
import com.ruoyi.system.service.IContractsService;

/**
 * 合同，存储合同相关信息及其产品详情Service业务层处理
 *
 * @author HongWei
 * @date 2024-10-02
 */
@Service
@RequiredArgsConstructor
public class ContractsServiceImpl extends ServiceImpl<ContractsMapper,Contracts> implements IContractsService {
    private final ContractsMapper contractsMapper;

    private final IOrdersService ordersService;
    private  final OrdersMapper ordersMapper;
    private final OperationMapper operationMapper;
    private final ProductsMapper productsMapper;

    /**
     * 查询合同，存储合同相关信息及其产品详情
     *
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 合同，存储合同相关信息及其产品详情
     */
    @Override
    public Contracts selectContractsByContractId(Long contractId) {
        return contractsMapper.selectContractsByContractId(contractId);
    }

    /**
     * 查询合同，存储合同相关信息及其产品详情列表
     *
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 合同，存储合同相关信息及其产品详情
     */
    @Override
    public List<Contracts> selectContractsList(Contracts contracts) {
        return contractsMapper.selectContractsList(contracts);
    }

    /**
     * 新增合同，存储合同相关信息及其产品详情
     *
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    @Override
    public int insertContracts(Contracts contracts) {
        int n = contractsMapper.insertContracts(contracts);
        ordersService.insertOrdersByContract(contracts);
        return n;
    }

    /**
     * 修改合同，存储合同相关信息及其产品详情
     *
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    @Override
    public int updateContracts(Contracts contracts) {
        return contractsMapper.updateContracts(contracts);
    }

    /**
     * 批量删除合同，存储合同相关信息及其产品详情
     *
     * @param contractIds 需要删除的合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    @Override
    public int deleteContractsByContractIds(Long[] contractIds) {
        return contractsMapper.deleteContractsByContractIds(contractIds);
    }

    /**
     * 删除合同，存储合同相关信息及其产品详情信息
     *
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    @Override
    public int deleteContractsByContractId(Long contractId) {
        return contractsMapper.deleteContractsByContractId(contractId);
    }

    /**
     * 获取合同的完成进度
     *
     * @param: [contractId]
     * @return: Map<String, Object>
     **/

    @Override
    public List<Map<String, Object>> getProgress(Long contractId) {
        List<Map<String,Object>> maps = new ArrayList<>();
        //根据合同Id查询对应的总制令
        Orders order1 = new Orders();
        order1.setContractId(contractId);
        order1 = ordersMapper.selectOrdersList(order1).get(0);
        //根据总制令查询对应的分制令
        List<Orders> orders2 = new ArrayList<>();
        Orders order2 = new Orders();
        order2.setParentId(order1.getId());
        orders2 = ordersMapper.selectOrdersList(order2);
        //对分制令遍历进行统计
        for (Orders orders : orders2) {
            Map<String, Object> map = new HashMap<>();
            List<Orders> orders3 = new ArrayList<>();
            Orders order3 = new Orders();
            order3.setParentId(orders.getId());
            orders3 = ordersMapper.selectOrdersList(order3);
            int count = 0;
            for (Orders value : orders3) {
                if (value.getStatus().equals("已完成")) {
                    count++;
                }
            }
            //根据分制令的产品Id查出产品名称
            String productName = productsMapper.selectProductsByProductId(orders.getProductId()).getProductName();
            map.put("name", productName);
            map.put("quantity", orders.getQuantity());
            map.put("total", orders3.size());
            map.put("completed", count);
            maps.add(map);
        }
        return maps;
    }
}
