package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Contracts;

/**
 * 合同，存储合同相关信息及其产品详情Mapper接口
 * 
 * @author HongWei
 * @date 2024-10-02
 */
public interface ContractsMapper 
{
    /**
     * 查询合同，存储合同相关信息及其产品详情
     * 
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 合同，存储合同相关信息及其产品详情
     */
    public Contracts selectContractsByContractId(Long contractId);

    /**
     * 查询合同，存储合同相关信息及其产品详情列表
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 合同，存储合同相关信息及其产品详情集合
     */
    public List<Contracts> selectContractsList(Contracts contracts);

    /**
     * 新增合同，存储合同相关信息及其产品详情
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    public int insertContracts(Contracts contracts);

    /**
     * 修改合同，存储合同相关信息及其产品详情
     * 
     * @param contracts 合同，存储合同相关信息及其产品详情
     * @return 结果
     */
    public int updateContracts(Contracts contracts);

    /**
     * 删除合同，存储合同相关信息及其产品详情
     * 
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    public int deleteContractsByContractId(Long contractId);

    /**
     * 批量删除合同，存储合同相关信息及其产品详情
     * 
     * @param contractIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteContractsByContractIds(Long[] contractIds);
}
