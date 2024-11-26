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
import com.ruoyi.system.domain.Task;
import com.ruoyi.system.service.ITaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息Controller
 *
 * @author HongWei
 * @date 2024-11-26
 */
@RestController
@RequestMapping("/task/task")
public class TaskController extends BaseController
{
    @Autowired
    private ITaskService taskService;

    /**
     * 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息列表
     */
    @PreAuthorize("@ss.hasPermi('task:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(Task task)
    {
        startPage();
        List<Task> list = taskService.selectTaskList(task);
        return getDataTable(list);
    }

    /**
     * 导出任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息列表
     */
    @PreAuthorize("@ss.hasPermi('task:task:export')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Task task)
    {
        List<Task> list = taskService.selectTaskList(task);
        ExcelUtil<Task> util = new ExcelUtil<Task>(Task.class);
        util.exportExcel(response, list, "任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息数据");
    }

    /**
     * 获取任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('task:task:query')")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") Long taskId)
    {
        return success(taskService.selectTaskByTaskId(taskId));
    }

    /**
     * 新增任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    @PreAuthorize("@ss.hasPermi('task:task:add')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Task task)
    {
        return toAjax(taskService.insertTask(task));
    }

    /**
     * 修改任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    @PreAuthorize("@ss.hasPermi('task:task:edit')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Task task)
    {
        return toAjax(taskService.updateTask(task));
    }

    /**
     * 删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
     */
    @PreAuthorize("@ss.hasPermi('task:task:remove')")
    @Log(title = "任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable Long[] taskIds)
    {
        return toAjax(taskService.deleteTaskByTaskIds(taskIds));
    }
}
