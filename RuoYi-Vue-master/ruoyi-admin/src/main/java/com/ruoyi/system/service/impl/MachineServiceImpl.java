package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MachineMapper;
import com.ruoyi.system.domain.Machine;
import com.ruoyi.system.service.IMachineService;

/**
 * 机器，存储所有机器的相关信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-10-12
 */
@Service
public class MachineServiceImpl implements IMachineService 
{
    @Autowired
    private MachineMapper machineMapper;

    /**
     * 查询机器，存储所有机器的相关信息
     * 
     * @param machineId 机器，存储所有机器的相关信息主键
     * @return 机器，存储所有机器的相关信息
     */
    @Override
    public Machine selectMachineByMachineId(Long machineId)
    {
        return machineMapper.selectMachineByMachineId(machineId);
    }

    /**
     * 查询机器，存储所有机器的相关信息列表
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 机器，存储所有机器的相关信息
     */
    @Override
    public List<Machine> selectMachineList(Machine machine)
    {
        return machineMapper.selectMachineList(machine);
    }

    /**
     * 新增机器，存储所有机器的相关信息
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 结果
     */
    @Override
    public int insertMachine(Machine machine)
    {
        return machineMapper.insertMachine(machine);
    }

    /**
     * 修改机器，存储所有机器的相关信息
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 结果
     */
    @Override
    public int updateMachine(Machine machine)
    {
        return machineMapper.updateMachine(machine);
    }

    /**
     * 批量删除机器，存储所有机器的相关信息
     * 
     * @param machineIds 需要删除的机器，存储所有机器的相关信息主键
     * @return 结果
     */
    @Override
    public int deleteMachineByMachineIds(Long[] machineIds)
    {
        return machineMapper.deleteMachineByMachineIds(machineIds);
    }

    /**
     * 删除机器，存储所有机器的相关信息信息
     * 
     * @param machineId 机器，存储所有机器的相关信息主键
     * @return 结果
     */
    @Override
    public int deleteMachineByMachineId(Long machineId)
    {
        return machineMapper.deleteMachineByMachineId(machineId);
    }
}
