package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.WorkReport;
import com.ruoyi.system.service.IWorkReportService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报工，用于记录员工的报工信息Controller
 * 
 * @author HongWei
 * @date 2024-11-03
 */
@RestController
@RequestMapping("/report/report")
public class WorkReportController extends BaseController
{
    @Autowired
    private IWorkReportService workReportService;

    /**
     * 查询报工，用于记录员工的报工信息列表
     */
//    @PreAuthorize("@ss.hasPermi('report:report:list')")
    @GetMapping("/list")
    public TableDataInfo list(WorkReport workReport)
    {
        startPage();
        List<WorkReport> list = workReportService.selectWorkReportList(workReport);
        return getDataTable(list);
    }

    /**
     * 导出报工，用于记录员工的报工信息列表
     */
//    @PreAuthorize("@ss.hasPermi('report:report:export')")
    @Log(title = "报工，用于记录员工的报工信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WorkReport workReport)
    {
        List<WorkReport> list = workReportService.selectWorkReportList(workReport);
        ExcelUtil<WorkReport> util = new ExcelUtil<WorkReport>(WorkReport.class);
        util.exportExcel(response, list, "报工，用于记录员工的报工信息数据");
    }

    /**
     * 获取报工，用于记录员工的报工信息详细信息
     */
//    @PreAuthorize("@ss.hasPermi('report:report:query')")
    @GetMapping(value = "/{workReportId}")
    public AjaxResult getInfo(@PathVariable("workReportId") Long workReportId)
    {
        return success(workReportService.selectWorkReportByWorkReportId(workReportId));
    }

    /**
     * 新增报工，用于记录员工的报工信息
     */
//    @PreAuthorize("@ss.hasPermi('report:report:add')")
    @Log(title = "报工，用于记录员工的报工信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WorkReport workReport , @RequestParam("taskId") Long taskId)
    {
        return toAjax(workReportService.insertWorkReport(workReport,taskId));
    }

    /**
     * 修改报工，用于记录员工的报工信息
     */
//    @PreAuthorize("@ss.hasPermi('report:report:edit')")
    @Log(title = "报工，用于记录员工的报工信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WorkReport workReport)
    {
        return toAjax(workReportService.updateWorkReport(workReport));
    }

    /**
     * 删除报工，用于记录员工的报工信息
     */
//    @PreAuthorize("@ss.hasPermi('report:report:remove')")
    @Log(title = "报工，用于记录员工的报工信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{workReportIds}")
    public AjaxResult remove(@PathVariable Long[] workReportIds)
    {
        return toAjax(workReportService.deleteWorkReportByWorkReportIds(workReportIds));
    }
}
