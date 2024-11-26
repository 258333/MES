package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.WorkReport;

/**
 * 报工，用于记录员工的报工信息Service接口
 * 
 * @author HongWei
 * @date 2024-11-03
 */
public interface IWorkReportService 
{
    /**
     * 查询报工，用于记录员工的报工信息
     * 
     * @param workReportId 报工，用于记录员工的报工信息主键
     * @return 报工，用于记录员工的报工信息
     */
    public WorkReport selectWorkReportByWorkReportId(Long workReportId);

    /**
     * 查询报工，用于记录员工的报工信息列表
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 报工，用于记录员工的报工信息集合
     */
    public List<WorkReport> selectWorkReportList(WorkReport workReport);

    /**
     * 新增报工，用于记录员工的报工信息
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 结果
     */
    public int insertWorkReport(WorkReport workReport,Long taskId);

    /**
     * 修改报工，用于记录员工的报工信息
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 结果
     */
    public int updateWorkReport(WorkReport workReport);

    /**
     * 批量删除报工，用于记录员工的报工信息
     * 
     * @param workReportIds 需要删除的报工，用于记录员工的报工信息主键集合
     * @return 结果
     */
    public int deleteWorkReportByWorkReportIds(Long[] workReportIds);

    /**
     * 删除报工，用于记录员工的报工信息信息
     * 
     * @param workReportId 报工，用于记录员工的报工信息主键
     * @return 结果
     */
    public int deleteWorkReportByWorkReportId(Long workReportId);
}
