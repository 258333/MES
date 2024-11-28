package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.Checkin;

/**
 * 出勤，记录员工的出勤信息Service接口
 * 
 * @author HongWei
 * @date 2024-11-28
 */
public interface ICheckinService 
{
    /**
     * 查询出勤，记录员工的出勤信息
     * 
     * @param id 出勤，记录员工的出勤信息主键
     * @return 出勤，记录员工的出勤信息
     */
    public Checkin selectCheckinById(Long id);

    /**
     * 查询出勤，记录员工的出勤信息列表
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 出勤，记录员工的出勤信息集合
     */
    public List<Checkin> selectCheckinList(Checkin checkin);

    /**
     * 新增出勤，记录员工的出勤信息
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 结果
     */
    public int insertCheckin(Checkin checkin);

    /**
     * 修改出勤，记录员工的出勤信息
     * 
     * @param checkin 出勤，记录员工的出勤信息
     * @return 结果
     */
    public int updateCheckin(Checkin checkin);

    /**
     * 批量删除出勤，记录员工的出勤信息
     * 
     * @param ids 需要删除的出勤，记录员工的出勤信息主键集合
     * @return 结果
     */
    public int deleteCheckinByIds(Long[] ids);

    /**
     * 删除出勤，记录员工的出勤信息信息
     * 
     * @param id 出勤，记录员工的出勤信息主键
     * @return 结果
     */
    public int deleteCheckinById(Long id);

    /**
     * 重载查询出勤，根据id查询当前的打卡信息
     *
     * @param userId 出勤，记录员工的出勤信息
     * @return 出勤，记录员工的出勤信
     */
    public Checkin selectCheckinList(Long userId);

    /**
     * 扫码啊退勤
     *
     * @param: [userId]
     * @return: java.lang.String
     **/
    List<Map<String,Object>> checkout(Long userId);
}
