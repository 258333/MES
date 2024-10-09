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
import com.ruoyi.system.domain.Contracts;
import com.ruoyi.system.service.IContractsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 合同，存储合同相关信息及其产品详情Controller
 * 
 * @author HongWei
 * @date 2024-10-02
 */
@RestController
@RequestMapping("/Contracts/contracts")
public class ContractsController extends BaseController
{
    @Autowired
    private IContractsService contractsService;

    /**
     * 查询合同，存储合同相关信息及其产品详情列表
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:list')")
    @GetMapping("/list")
    public TableDataInfo list(Contracts contracts)
    {
        startPage();
        List<Contracts> list = contractsService.selectContractsList(contracts);

        return getDataTable(list);
    }

    /**
     * 导出合同，存储合同相关信息及其产品详情列表
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:export')")
    @Log(title = "合同，存储合同相关信息及其产品详情", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Contracts contracts)
    {
        List<Contracts> list = contractsService.selectContractsList(contracts);
        ExcelUtil<Contracts> util = new ExcelUtil<Contracts>(Contracts.class);
        util.exportExcel(response, list, "合同，存储合同相关信息及其产品详情数据");
    }

    /**
     * 获取合同，存储合同相关信息及其产品详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:query')")
    @GetMapping(value = "/{contractId}")
    public AjaxResult getInfo(@PathVariable("contractId") Long contractId)
    {
        return success(contractsService.selectContractsByContractId(contractId));
    }

    /**
     * 新增合同，存储合同相关信息及其产品详情
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:add')")
    @Log(title = "合同，存储合同相关信息及其产品详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Contracts contracts)
    {
        return toAjax(contractsService.insertContracts(contracts));
    }

    /**
     * 修改合同，存储合同相关信息及其产品详情
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:edit')")
    @Log(title = "合同，存储合同相关信息及其产品详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Contracts contracts)
    {
        return toAjax(contractsService.updateContracts(contracts));
    }

    /**
     * 删除合同，存储合同相关信息及其产品详情
     */
    @PreAuthorize("@ss.hasPermi('Contracts:contracts:remove')")
    @Log(title = "合同，存储合同相关信息及其产品详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{contractIds}")
    public AjaxResult remove(@PathVariable Long[] contractIds)
    {
        return toAjax(contractsService.deleteContractsByContractIds(contractIds));
    }

}
