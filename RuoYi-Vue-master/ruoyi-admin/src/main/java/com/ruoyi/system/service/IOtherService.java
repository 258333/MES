package com.ruoyi.system.service;


import com.ruoyi.common.core.domain.entity.SysUser;

import java.util.List;

public interface IOtherService {
    //查询用户信息
    List<SysUser> selectUserInfo();
}
