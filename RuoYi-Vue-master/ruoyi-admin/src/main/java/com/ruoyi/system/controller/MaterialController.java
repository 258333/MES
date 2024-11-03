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
import com.ruoyi.system.domain.Material;
import com.ruoyi.system.service.IMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 物料，存储生产所需的物料信息Controller
 * 
 * @author HongWei
 * @date 2024-11-02
 */
@RestController
@RequestMapping("/material/material")
public class MaterialController extends BaseController
{
    @Autowired
    private IMaterialService materialService;

    /**
     * 查询物料，存储生产所需的物料信息列表
     */
    @PreAuthorize("@ss.hasPermi('material:material:list')")
    @GetMapping("/list")
    public TableDataInfo list(Material material)
    {
        startPage();
        List<Material> list = materialService.selectMaterialList(material);
        return getDataTable(list);
    }

    /**
     * 导出物料，存储生产所需的物料信息列表
     */
    @PreAuthorize("@ss.hasPermi('material:material:export')")
    @Log(title = "物料，存储生产所需的物料信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Material material)
    {
        List<Material> list = materialService.selectMaterialList(material);
        ExcelUtil<Material> util = new ExcelUtil<Material>(Material.class);
        util.exportExcel(response, list, "物料，存储生产所需的物料信息数据");
    }

    /**
     * 获取物料，存储生产所需的物料信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('material:material:query')")
    @GetMapping(value = "/{materialId}")
    public AjaxResult getInfo(@PathVariable("materialId") Long materialId)
    {
        return success(materialService.selectMaterialByMaterialId(materialId));
    }

    /**
     * 新增物料，存储生产所需的物料信息
     */
    @PreAuthorize("@ss.hasPermi('material:material:add')")
    @Log(title = "物料，存储生产所需的物料信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Material material)
    {
        return toAjax(materialService.insertMaterial(material));
    }

    /**
     * 修改物料，存储生产所需的物料信息
     */
    @PreAuthorize("@ss.hasPermi('material:material:edit')")
    @Log(title = "物料，存储生产所需的物料信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Material material)
    {
        return toAjax(materialService.updateMaterial(material));
    }

    /**
     * 删除物料，存储生产所需的物料信息
     */
    @PreAuthorize("@ss.hasPermi('material:material:remove')")
    @Log(title = "物料，存储生产所需的物料信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public AjaxResult remove(@PathVariable Long[] materialIds)
    {
        return toAjax(materialService.deleteMaterialByMaterialIds(materialIds));
    }
}
