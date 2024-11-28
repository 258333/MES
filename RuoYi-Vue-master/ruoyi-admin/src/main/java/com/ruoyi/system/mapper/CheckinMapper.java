package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.Checkin;
import org.apache.ibatis.annotations.Select;

/**
 * 出勤，记录员工的出勤信息Mapper接口
 *
 * @author HongWei
 * @date 2024-11-28
 */
public interface CheckinMapper {
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
     * 删除出勤，记录员工的出勤信息
     *
     * @param id 出勤，记录员工的出勤信息主键
     * @return 结果
     */
    public int deleteCheckinById(Long id);

    /**
     * 批量删除出勤，记录员工的出勤信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCheckinByIds(Long[] ids);

    /**
     * 根据用户Id和未退勤记录查询用户当前的出勤记录
     *
     * @param userId 用户ID
     * @return 当前的出勤记录
     */
    @Select("SELECT id, user_id, check_in_time, check_out_time " +
            "FROM tb_checkin " +
            "WHERE user_id = #{userId} AND check_out_time IS NULL")
    Checkin selectCheckinByUserId(Long userId);

}
