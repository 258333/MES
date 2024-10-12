package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Machine;

/**
 * 机器，存储所有机器的相关信息Service接口
 * 
 * @author HongWei
 * @date 2024-10-12
 */
public interface IMachineService 
{
    /**
     * 查询机器，存储所有机器的相关信息
     * 
     * @param machineId 机器，存储所有机器的相关信息主键
     * @return 机器，存储所有机器的相关信息
     */
    public Machine selectMachineByMachineId(Long machineId);

    /**
     * 查询机器，存储所有机器的相关信息列表
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 机器，存储所有机器的相关信息集合
     */
    public List<Machine> selectMachineList(Machine machine);

    /**
     * 新增机器，存储所有机器的相关信息
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 结果
     */
    public int insertMachine(Machine machine);

    /**
     * 修改机器，存储所有机器的相关信息
     * 
     * @param machine 机器，存储所有机器的相关信息
     * @return 结果
     */
    public int updateMachine(Machine machine);

    /**
     * 批量删除机器，存储所有机器的相关信息
     * 
     * @param machineIds 需要删除的机器，存储所有机器的相关信息主键集合
     * @return 结果
     */
    public int deleteMachineByMachineIds(Long[] machineIds);

    /**
     * 删除机器，存储所有机器的相关信息信息
     * 
     * @param machineId 机器，存储所有机器的相关信息主键
     * @return 结果
     */
    public int deleteMachineByMachineId(Long machineId);
}
