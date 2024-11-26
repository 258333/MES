package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.system.domain.Task;
import com.ruoyi.system.mapper.TaskMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WorkReportMapper;
import com.ruoyi.system.domain.WorkReport;
import com.ruoyi.system.service.IWorkReportService;

/**
 * 报工，用于记录员工的报工信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-11-03
 */
@Service
@RequiredArgsConstructor
public class WorkReportServiceImpl implements IWorkReportService 
{
    private final WorkReportMapper workReportMapper;
    private final TaskMapper taskAssignmentMapper;



    /**
     * 查询报工，用于记录员工的报工信息
     * 
     * @param workReportId 报工，用于记录员工的报工信息主键
     * @return 报工，用于记录员工的报工信息
     */
    @Override
    public WorkReport selectWorkReportByWorkReportId(Long workReportId)
    {
        return workReportMapper.selectWorkReportByWorkReportId(workReportId);
    }

    /**
     * 查询报工，用于记录员工的报工信息列表
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 报工，用于记录员工的报工信息
     */
    @Override
    public List<WorkReport> selectWorkReportList(WorkReport workReport)
    {
        return workReportMapper.selectWorkReportList(workReport);
    }

    /**
     * 新增报工，用于记录员工的报工信息
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 结果
     */
    @Override
    public int insertWorkReport(WorkReport workReport,Long taskId)
    {
        Task taskAssignment = taskAssignmentMapper.selectTaskByTaskId(taskId);
        taskAssignment.setIsCompleted(1);
        taskAssignmentMapper.updateTask(taskAssignment);
        return workReportMapper.insertWorkReport(workReport);
    }

    /**
     * 修改报工，用于记录员工的报工信息
     * 
     * @param workReport 报工，用于记录员工的报工信息
     * @return 结果
     */
    @Override
    public int updateWorkReport(WorkReport workReport)
    {
        return workReportMapper.updateWorkReport(workReport);
    }

    /**
     * 批量删除报工，用于记录员工的报工信息
     * 
     * @param workReportIds 需要删除的报工，用于记录员工的报工信息主键
     * @return 结果
     */
    @Override
    public int deleteWorkReportByWorkReportIds(Long[] workReportIds)
    {
        return workReportMapper.deleteWorkReportByWorkReportIds(workReportIds);
    }

    /**
     * 删除报工，用于记录员工的报工信息信息
     * 
     * @param workReportId 报工，用于记录员工的报工信息主键
     * @return 结果
     */
    @Override
    public int deleteWorkReportByWorkReportId(Long workReportId)
    {
        return workReportMapper.deleteWorkReportByWorkReportId(workReportId);
    }
}
