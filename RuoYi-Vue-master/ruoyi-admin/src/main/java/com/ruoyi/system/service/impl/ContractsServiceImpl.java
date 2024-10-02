package com.ruoyi.system.service.impl;

import java.util.List;
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
public class ContractsServiceImpl implements IContractsService 
{
    @Autowired
    private ContractsMapper contractsMapper;

    /**
     * 查询合同，存储合同相关信息及其产品详情
     * 
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 合同，存储合同相关信息及其产品详情
     */
    @Override
    public Contracts selectContractsByContractId(Long contractId)
    {
        return contractsMapper.selectContractsByContractId(contractId);
    }

    /**
     * 查询合同，存储合同相关信息及其产品详情列表
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 合同，存储合同相关信息及其产品详情
     */
    @Override
    public List<Contracts> selectContractsList(Contracts contracts)
    {
        return contractsMapper.selectContractsList(contracts);
    }

    /**
     * 新增合同，存储合同相关信息及其产品详情
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    @Override
    public int insertContracts(Contracts contracts)
    {
        return contractsMapper.insertContracts(contracts);
    }

    /**
     * 修改合同，存储合同相关信息及其产品详情
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    @Override
    public int updateContracts(Contracts contracts)
    {
        return contractsMapper.updateContracts(contracts);
    }

    /**
     * 批量删除合同，存储合同相关信息及其产品详情
     * 
     * @param contractIds 需要删除的合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    @Override
    public int deleteContractsByContractIds(Long[] contractIds)
    {
        return contractsMapper.deleteContractsByContractIds(contractIds);
    }

    /**
     * 删除合同，存储合同相关信息及其产品详情信息
     * 
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    @Override
    public int deleteContractsByContractId(Long contractId)
    {
        return contractsMapper.deleteContractsByContractId(contractId);
    }
}
