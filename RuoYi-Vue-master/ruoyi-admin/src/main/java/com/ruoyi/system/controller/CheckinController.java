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
import com.ruoyi.system.domain.Checkin;
import com.ruoyi.system.service.ICheckinService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出勤，记录员工的出勤信息Controller
 * 
 * @author HongWei
 * @date 2024-11-28
 */
@RestController
@RequestMapping("/checkin/checkin")
public class CheckinController extends BaseController
{
    @Autowired
    private ICheckinService checkinService;

    /**
     * 查询出勤，记录员工的出勤信息列表
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:list')")
    @GetMapping("/list")
    public TableDataInfo list(Checkin checkin)
    {
        startPage();
        List<Checkin> list = checkinService.selectCheckinList(checkin);
        return getDataTable(list);
    }

    /**
     * 导出出勤，记录员工的出勤信息列表
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:export')")
    @Log(title = "出勤，记录员工的出勤信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Checkin checkin)
    {
        List<Checkin> list = checkinService.selectCheckinList(checkin);
        ExcelUtil<Checkin> util = new ExcelUtil<Checkin>(Checkin.class);
        util.exportExcel(response, list, "出勤，记录员工的出勤信息数据");
    }

    /**
     * 获取出勤，记录员工的出勤信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(checkinService.selectCheckinById(id));
    }

    /**
     * 新增出勤，记录员工的出勤信息
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:add')")
    @Log(title = "出勤，记录员工的出勤信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Checkin checkin)
    {
        return toAjax(checkinService.insertCheckin(checkin));
    }

    /**
     * 修改出勤，记录员工的出勤信息
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:edit')")
    @Log(title = "出勤，记录员工的出勤信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Checkin checkin)
    {
        return toAjax(checkinService.updateCheckin(checkin));
    }

    /**
     * 删除出勤，记录员工的出勤信息
     */
    @PreAuthorize("@ss.hasPermi('checkin:checkin:remove')")
    @Log(title = "出勤，记录员工的出勤信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(checkinService.deleteCheckinByIds(ids));
    }

    //获取打卡记录
    @GetMapping("/getCheckin")
    public AjaxResult getCheckin(@RequestParam Long userId){
        return success(checkinService.selectCheckinList(userId));
    }

    //扫码退勤打卡
    @PostMapping("/checkout")
    public AjaxResult checkout(@RequestParam Long userId){
        System.err.println("controller"+userId);
        return success(checkinService.checkout(userId));
    }
}
