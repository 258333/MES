package com.ruoyi.system.service.impl;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Machine;
import com.ruoyi.system.mapper.MachineMapper;
import com.ruoyi.system.mapper.OtherMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.system.service.IOtherService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OtherServiceImpl implements IOtherService {

    private final OtherMapper otherMapper;

    private final SysUserMapper sysUserMapper;

    private final MachineMapper machineMapper;

    @Override
    public List<SysUser> selectUserInfo() {
        //查询所有角色为用功的用户id
        List<Long> userIds = otherMapper.selectUserIdByRoleId(100L);
        //根据用户id查询所有用户信息

        List<SysUser> sysUsers = new ArrayList<>();
        for (Long userId : userIds) {
            SysUser sysUser = sysUserMapper.selectUserById(userId);
            sysUsers.add(sysUser);
        }
        return sysUsers;
    }

    //查询可用的机器
    public List<Machine> selectMachineInfo() {
        return machineMapper.selectMachineList(new Machine());
    }
}
