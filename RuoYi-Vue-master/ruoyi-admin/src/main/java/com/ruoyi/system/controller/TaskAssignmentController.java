package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TaskAssignment;
import com.ruoyi.system.service.ITaskAssignmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务分配，存储每个子制令的任务分配情况Controller
 * 
 * @author HongWei
 * @date 2024-10-10
 */
@RestController
@RequestMapping("/taskAssignment/taskAssignment")
public class TaskAssignmentController extends BaseController
{
    @Autowired
    private ITaskAssignmentService taskAssignmentService;

    /**
     * 查询任务分配，存储每个子制令的任务分配情况列表
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:list')")
    @GetMapping("/list")
    public TableDataInfo list(TaskAssignment taskAssignment)
    {
        startPage();
        List<TaskAssignment> list = taskAssignmentService.selectTaskAssignmentList(taskAssignment);
        return getDataTable(list);
    }

    /**
     * 导出任务分配，存储每个子制令的任务分配情况列表
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:export')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskAssignment taskAssignment)
    {
        List<TaskAssignment> list = taskAssignmentService.selectTaskAssignmentList(taskAssignment);
        ExcelUtil<TaskAssignment> util = new ExcelUtil<TaskAssignment>(TaskAssignment.class);
        util.exportExcel(response, list, "任务分配，存储每个子制令的任务分配情况数据");
    }

    /**
     * 获取任务分配，存储每个子制令的任务分配情况详细信息
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(taskAssignmentService.selectTaskAssignmentById(id));
    }

    /**
     * 新增任务分配，存储每个子制令的任务分配情况
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:add')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskAssignment taskAssignment)
    {
        return toAjax(taskAssignmentService.insertTaskAssignment(taskAssignment));
    }

    /**
     * 修改任务分配，存储每个子制令的任务分配情况
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:edit')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskAssignment taskAssignment)
    {
        return toAjax(taskAssignmentService.updateTaskAssignment(taskAssignment));
    }

    /**
     * 删除任务分配，存储每个子制令的任务分配情况
     */
    @PreAuthorize("@ss.hasPermi('taskAssignment:taskAssignment:remove')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskAssignmentService.deleteTaskAssignmentByIds(ids));
    }
}
