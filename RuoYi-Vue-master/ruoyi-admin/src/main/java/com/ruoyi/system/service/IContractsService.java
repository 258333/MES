package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.Contracts;

/**
 * 合同，存储合同相关信息及其产品详情Service接口
 * 
 * @author HongWei
 * @date 2024-10-02
 */
public interface IContractsService extends IService<Contracts>
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
     * 批量删除合同，存储合同相关信息及其产品详情
     * 
     * @param contractIds 需要删除的合同，存储合同相关信息及其产品详情主键集合
     * @return 结果
     */
    public int deleteContractsByContractIds(Long[] contractIds);

    /**
     * 删除合同，存储合同相关信息及其产品详情信息
     * 
     * @param contractId 合同，存储合同相关信息及其产品详情主键
     * @return 结果
     */
    public int deleteContractsByContractId(Long contractId);

    /**
     * @param: [contractId]
     * @return: Map<String, Object>
     * @description: 获取合同的完成进度
     **/
    List<Map<String,Object>> getProgress(Long contractId);
}
