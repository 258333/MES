package com.ruoyi.system.service.impl;

import java.math.BigDecimal;
import java.util.*;

import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.dto.TaskMaterial;
import com.ruoyi.system.mapper.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.service.ICheckinService;

/**
 * 出勤，记录员工的出勤信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-11-28
 */
@Service
@RequiredArgsConstructor
public class CheckinServiceImpl implements ICheckinService 
{
    private final CheckinMapper checkinMapper;
    private final TaskMapper taskMapper;
    private final MaterialMapper materialMapper;
    private final MachineMapper machineMapper;
    private final OrdersMapper ordersMapper;

    /**
     * 查询出勤，记录员工的出勤信息
     * 
     * @param id 出勤，记录员工的出勤信息主键
     * @return 出勤，记录员工的出勤信息
     */
    @Override
    public Checkin selectCheckinById(Long id)
    {
        return checkinMapper.selectCheckinById(id);
    }

    /**
     * 查询出勤，记录员工的出勤信息列表
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 出勤，记录员工的出勤信息
     */
    @Override
    public List<Checkin> selectCheckinList(Checkin checkin)
    {
        return checkinMapper.selectCheckinList(checkin);
    }

    /**
     * 新增出勤，记录员工的出勤信息
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 结果
     */
    @Override
    public int insertCheckin(Checkin checkin)
    {
        checkin.setCheckInTime(new Date());
        return checkinMapper.insertCheckin(checkin);
    }

    /**
     * 修改出勤，记录员工的出勤信息
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 结果
     */
    @Override
    public int updateCheckin(Checkin checkin)
    {
        return checkinMapper.updateCheckin(checkin);
    }

    /**
     * 批量删除出勤，记录员工的出勤信息
     * 
     * @param ids 需要删除的出勤，记录员工的出勤信息主键
     * @return 结果
     */
    @Override
    public int deleteCheckinByIds(Long[] ids)
    {
        return checkinMapper.deleteCheckinByIds(ids);
    }

    /**
     * 删除出勤，记录员工的出勤信息信息
     * 
     * @param id 出勤，记录员工的出勤信息主键
     * @return 结果
     */
    @Override
    public int deleteCheckinById(Long id)
    {
        return checkinMapper.deleteCheckinById(id);
    }

    /**
     * 重载查询出勤，根据id查询当前的打卡信息
     *
     * @param userId 出勤，记录员工的出勤信息
     * @return 出勤，记录员工的出勤信
     */
    @Override
    public Checkin selectCheckinList(Long userId) {
        //根据用户id查询当前的出勤记录
        Checkin checkin = checkinMapper.selectCheckinByUserId(userId);
        //如果查询记录为空,代表今日还未打卡,返回null
        if(checkin == null){
            return null;
        }else {
            return checkin;
        }
    }

    /**
     * 扫码退勤
     *
     * @param: [userId]
     * @return: java.lang.String
     **/
    @Override
    public List<Map<String,Object>> checkout(Long userId) {
        List<Map<String,Object>> maps = new ArrayList<>();
        System.err.println(userId);
        //1.修改打卡的结束时间为当前时间
        //获取当前的打卡信息
        Checkin checkin = checkinMapper.selectCheckinByUserId(userId);
        System.err.println(checkin);
        checkin.setCheckOutTime(new Date());
        checkinMapper.updateCheckin(checkin);
        //2.计算工资
        //根据用户id查询打卡时间之内所完成的全部任务
        //根据打卡的开始时间和结束时间查找在这个时间范围内的所有使用过的机器
        List<TaskMachine> taskMachines =taskMapper.selectTaskByStartAndEndTime(checkin.getCheckInTime(),checkin.getCheckOutTime());
        //根据任务id查询所有的任务信息，过滤其中与userId不对应的信息
        //TODO 展示设置机器的每分钟价格为0.1元
        double pricePerMinute = 0.1;
        for (TaskMachine taskMachine : taskMachines) {
            Task task = taskMapper.selectTaskByTaskId(taskMachine.getTaskId());
            if (task.getUserId().equals(userId)) {
                Map<String,Object> map = new HashMap<>();
                //根据制令id查询制令信息
                Orders order = ordersMapper.selectOrdersById(task.getOrderId());
                //存储工序名称和数量
                map.put("operation",order.getOperation());
                map.put("quantity",order.getQuantity());
                //查询这个任务使用的物料信息，计算物料价格
                List<TaskMaterial> taskMaterials = taskMapper.selectTaskMaterialsByTaskId(task.getTaskId());
                List<Map<String,Object>> materialMaps = new ArrayList<>();
                Double allMaterialPrice = 0.0;
                for (TaskMaterial taskMaterial : taskMaterials) {
                    Map<String,Object>materialMap = new HashMap<>();
                    //查询所有的物料信息
                    Material material = materialMapper.selectMaterialByMaterialId(taskMaterial.getMaterialId());
                    materialMap.put("materialQuantity",taskMaterial.getQuantity());
                    materialMap.put("materialName",material.getMaterialName());
                    materialMap.put("materialPrice",material.getPrice());
                    materialMap.put("materialUnit",material.getUnit());
                    //计算物料价格
                    Double materialPrice = material.getPrice().multiply(new BigDecimal(taskMaterial.getQuantity())).doubleValue();
                    materialMap.put("price",materialPrice);
                    materialMaps.add(materialMap);
                    allMaterialPrice += materialPrice;
                }
                map.put("allMaterialPrice",allMaterialPrice);
                map.put("materials",materialMaps);
                //查询这个任务使用的机器信息，计算机器价格
                Machine machine = machineMapper.selectMachineByMachineId(taskMachine.getMachineId());
                //根据机器的开始使用时间和结束使用时间计算价格并计算使用的时长，设置为每分钟0.1元
                // 计算机器使用的时长（分钟）
                long durationInMinutes = (taskMachine.getEndTime().getTime() - taskMachine.getStartTime().getTime()) / 60000;
                // 计算总价格
                Double machinePrice = BigDecimal.valueOf(durationInMinutes)
                        .multiply(BigDecimal.valueOf(pricePerMinute))
                        .doubleValue();
                map.put("machineUseTime",durationInMinutes);
                map.put("machinePrice",machinePrice);
                maps.add(map);
            }
        }
        return maps;
    }
}
