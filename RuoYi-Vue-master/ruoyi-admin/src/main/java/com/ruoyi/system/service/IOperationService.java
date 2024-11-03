package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.Operation;

/**
 * 工序，存储工序及其相关信息Service接口
 * 
 * @author HongWei
 * @date 2024-10-12
 */
public interface IOperationService 
{
    /**
     * 查询工序，存储工序及其相关信息
     * 
     * @param operationId 工序，存储工序及其相关信息主键
     * @return 工序，存储工序及其相关信息
     */
    public Operation selectOperationByOperationId(Long operationId);

    /**
     * 查询工序，存储工序及其相关信息列表
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 工序，存储工序及其相关信息集合
     */
    public List<Operation> selectOperationList(Operation operation);

    /**
     * 新增工序，存储工序及其相关信息
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 结果
     */
    public int insertOperation(Operation operation);

    /**
     * 修改工序，存储工序及其相关信息
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 结果
     */
    public int updateOperation(Operation operation);

    /**
     * 批量删除工序，存储工序及其相关信息
     * 
     * @param operationIds 需要删除的工序，存储工序及其相关信息主键集合
     * @return 结果
     */
    public int deleteOperationByOperationIds(Long[] operationIds);

    /**
     * 删除工序，存储工序及其相关信息信息
     * 
     * @param operationId 工序，存储工序及其相关信息主键
     * @return 结果
     */
    public int deleteOperationByOperationId(Long operationId);



}
