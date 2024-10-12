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
import com.ruoyi.system.domain.Operation;
import com.ruoyi.system.service.IOperationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工序，存储工序及其相关信息Controller
 * 
 * @author HongWei
 * @date 2024-10-12
 */
@RestController
@RequestMapping("/operation/operation")
public class OperationController extends BaseController
{
    @Autowired
    private IOperationService operationService;

    /**
     * 查询工序，存储工序及其相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:list')")
    @GetMapping("/list")
    public TableDataInfo list(Operation operation)
    {
        startPage();
        List<Operation> list = operationService.selectOperationList(operation);
        return getDataTable(list);
    }

    /**
     * 导出工序，存储工序及其相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:export')")
    @Log(title = "工序，存储工序及其相关信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Operation operation)
    {
        List<Operation> list = operationService.selectOperationList(operation);
        ExcelUtil<Operation> util = new ExcelUtil<Operation>(Operation.class);
        util.exportExcel(response, list, "工序，存储工序及其相关信息数据");
    }

    /**
     * 获取工序，存储工序及其相关信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:query')")
    @GetMapping(value = "/{operationId}")
    public AjaxResult getInfo(@PathVariable("operationId") Long operationId)
    {
        return success(operationService.selectOperationByOperationId(operationId));
    }

    /**
     * 新增工序，存储工序及其相关信息
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:add')")
    @Log(title = "工序，存储工序及其相关信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Operation operation)
    {
        return toAjax(operationService.insertOperation(operation));
    }

    /**
     * 修改工序，存储工序及其相关信息
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:edit')")
    @Log(title = "工序，存储工序及其相关信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Operation operation)
    {
        return toAjax(operationService.updateOperation(operation));
    }

    /**
     * 删除工序，存储工序及其相关信息
     */
    @PreAuthorize("@ss.hasPermi('operation:operation:remove')")
    @Log(title = "工序，存储工序及其相关信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{operationIds}")
    public AjaxResult remove(@PathVariable Long[] operationIds)
    {
        return toAjax(operationService.deleteOperationByOperationIds(operationIds));
    }
}
