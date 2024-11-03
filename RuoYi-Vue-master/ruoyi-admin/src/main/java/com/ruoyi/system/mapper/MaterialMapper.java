package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Material;

/**
 * 物料，存储生产所需的物料信息Mapper接口
 * 
 * @author HongWei
 * @date 2024-11-02
 */
public interface MaterialMapper 
{
    /**
     * 查询物料，存储生产所需的物料信息
     * 
     * @param materialId 物料，存储生产所需的物料信息主键
     * @return 物料，存储生产所需的物料信息
     */
    public Material selectMaterialByMaterialId(Long materialId);

    /**
     * 查询物料，存储生产所需的物料信息列表
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 物料，存储生产所需的物料信息集合
     */
    public List<Material> selectMaterialList(Material material);

    /**
     * 新增物料，存储生产所需的物料信息
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 结果
     */
    public int insertMaterial(Material material);

    /**
     * 修改物料，存储生产所需的物料信息
     * 
     * @param material 物料，存储生产所需的物料信息
     * @return 结果
     */
    public int updateMaterial(Material material);

    /**
     * 删除物料，存储生产所需的物料信息
     * 
     * @param materialId 物料，存储生产所需的物料信息主键
     * @return 结果
     */
    public int deleteMaterialByMaterialId(Long materialId);

    /**
     * 批量删除物料，存储生产所需的物料信息
     * 
     * @param materialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialByMaterialIds(Long[] materialIds);
}
