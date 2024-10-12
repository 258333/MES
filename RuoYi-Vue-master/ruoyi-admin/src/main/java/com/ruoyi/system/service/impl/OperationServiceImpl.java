package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.OperationMapper;
import com.ruoyi.system.domain.Operation;
import com.ruoyi.system.service.IOperationService;

/**
 * 工序，存储工序及其相关信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-10-12
 */
@Service
public class OperationServiceImpl implements IOperationService 
{
    @Autowired
    private OperationMapper operationMapper;

    /**
     * 查询工序，存储工序及其相关信息
     * 
     * @param operationId 工序，存储工序及其相关信息主键
     * @return 工序，存储工序及其相关信息
     */
    @Override
    public Operation selectOperationByOperationId(Long operationId)
    {
        return operationMapper.selectOperationByOperationId(operationId);
    }

    /**
     * 查询工序，存储工序及其相关信息列表
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 工序，存储工序及其相关信息
     */
    @Override
    public List<Operation> selectOperationList(Operation operation)
    {
        return operationMapper.selectOperationList(operation);
    }

    /**
     * 新增工序，存储工序及其相关信息
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 结果
     */
    @Override
    public int insertOperation(Operation operation)
    {
        return operationMapper.insertOperation(operation);
    }

    /**
     * 修改工序，存储工序及其相关信息
     * 
     * @param operation 工序，存储工序及其相关信息
     * @return 结果
     */
    @Override
    public int updateOperation(Operation operation)
    {
        return operationMapper.updateOperation(operation);
    }

    /**
     * 批量删除工序，存储工序及其相关信息
     * 
     * @param operationIds 需要删除的工序，存储工序及其相关信息主键
     * @return 结果
     */
    @Override
    public int deleteOperationByOperationIds(Long[] operationIds)
    {
        return operationMapper.deleteOperationByOperationIds(operationIds);
    }

    /**
     * 删除工序，存储工序及其相关信息信息
     * 
     * @param operationId 工序，存储工序及其相关信息主键
     * @return 结果
     */
    @Override
    public int deleteOperationByOperationId(Long operationId)
    {
        return operationMapper.deleteOperationByOperationId(operationId);
    }
}
