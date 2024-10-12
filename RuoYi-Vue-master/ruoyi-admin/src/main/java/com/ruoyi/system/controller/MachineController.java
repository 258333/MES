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
import com.ruoyi.system.domain.Machine;
import com.ruoyi.system.service.IMachineService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 机器，存储所有机器的相关信息Controller
 * 
 * @author HongWei
 * @date 2024-10-12
 */
@RestController
@RequestMapping("/machine/machine")
public class MachineController extends BaseController
{
    @Autowired
    private IMachineService machineService;

    /**
     * 查询机器，存储所有机器的相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:list')")
    @GetMapping("/list")
    public TableDataInfo list(Machine machine)
    {
        startPage();
        List<Machine> list = machineService.selectMachineList(machine);
        return getDataTable(list);
    }

    /**
     * 导出机器，存储所有机器的相关信息列表
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:export')")
    @Log(title = "机器，存储所有机器的相关信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Machine machine)
    {
        List<Machine> list = machineService.selectMachineList(machine);
        ExcelUtil<Machine> util = new ExcelUtil<Machine>(Machine.class);
        util.exportExcel(response, list, "机器，存储所有机器的相关信息数据");
    }

    /**
     * 获取机器，存储所有机器的相关信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:query')")
    @GetMapping(value = "/{machineId}")
    public AjaxResult getInfo(@PathVariable("machineId") Long machineId)
    {
        return success(machineService.selectMachineByMachineId(machineId));
    }

    /**
     * 新增机器，存储所有机器的相关信息
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:add')")
    @Log(title = "机器，存储所有机器的相关信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Machine machine)
    {
        return toAjax(machineService.insertMachine(machine));
    }

    /**
     * 修改机器，存储所有机器的相关信息
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:edit')")
    @Log(title = "机器，存储所有机器的相关信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Machine machine)
    {
        return toAjax(machineService.updateMachine(machine));
    }

    /**
     * 删除机器，存储所有机器的相关信息
     */
    @PreAuthorize("@ss.hasPermi('machine:machine:remove')")
    @Log(title = "机器，存储所有机器的相关信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{machineIds}")
    public AjaxResult remove(@PathVariable Long[] machineIds)
    {
        return toAjax(machineService.deleteMachineByMachineIds(machineIds));
    }
}
