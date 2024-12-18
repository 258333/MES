package com.ruoyi.system.service;


import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Machine;
import com.ruoyi.system.domain.Task;

import java.util.List;
import java.util.Map;

public interface IOtherService {
    //查询用户信息
    List<SysUser> selectUserInfo();

    List<Machine> selectMachineInfo(Long operationId);

    void updateDatabase(Task taskAssignment);

    //查询某个员工的所有任务
    List<Map<String,Object>> selectTaskByUserId(Long userId);

    void finishTask(Long taskId, Long quantity);

    List<Map<String,Object>> selectMaterialsByOperationId(Long operationId);

    Map<String, Object> getSalary(Long userId);
}
