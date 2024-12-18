package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MaterialMapper;
import com.ruoyi.system.domain.Material;
import com.ruoyi.system.service.IMaterialService;

/**
 * 物料，存储生产所需的物料信息Service业务层处理
 * 
 * @author HongWei
 * @date 2024-11-02
 */
@Service
public class MaterialServiceImpl implements IMaterialService 
{
    @Autowired
    private MaterialMapper materialMapper;

    /**
     * 查询物料，存储生产所需的物料信息
     * 
     * @param materialId 物料，存储生产所需的物料信息主键
     * @return 物料，存储生产所需的物料信息
     */
    @Override
    public Material selectMaterialByMaterialId(Long materialId)
    {
        return materialMapper.selectMaterialByMaterialId(materialId);
    }

    /**
     * 查询物料，存储生产所需的物料信息列表
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 物料，存储生产所需的物料信息
     */
    @Override
    public List<Material> selectMaterialList(Material material)
    {
        return materialMapper.selectMaterialList(material);
    }

    /**
     * 新增物料，存储生产所需的物料信息
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 结果
     */
    @Override
    public int insertMaterial(Material material)
    {
        return materialMapper.insertMaterial(material);
    }

    /**
     * 修改物料，存储生产所需的物料信息
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 结果
     */
    @Override
    public int updateMaterial(Material material)
    {
        return materialMapper.updateMaterial(material);
    }

    /**
     * 批量删除物料，存储生产所需的物料信息
     * 
     * @param materialIds 需要删除的物料，存储生产所需的物料信息主键
     * @return 结果
     */
    @Override
    public int deleteMaterialByMaterialIds(Long[] materialIds)
    {
        return materialMapper.deleteMaterialByMaterialIds(materialIds);
    }

    /**
     * 删除物料，存储生产所需的物料信息信息
     * 
     * @param materialId 物料，存储生产所需的物料信息主键
     * @return 结果
     */
    @Override
    public int deleteMaterialByMaterialId(Long materialId)
    {
        return materialMapper.deleteMaterialByMaterialId(materialId);
    }
}
