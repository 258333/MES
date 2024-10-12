package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.dto.ProductOperation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OtherMapper {

    /**
     * 查询生产产品所需的工序
     *
     * @param productId 产品，存储产品相关信息主键
     * @return 结果
     */
    @Select("select product_id,operation_id,sequence_number from tb_product_operation where product_id = #{productId}")
    public List<ProductOperation> selectOperationByProductId(int productId);

    /**
     * 通过角色id 查询所有员工角色的用户
     * @param roleId = 100
     * @return 结果
     */
    @Select("select user_id from sys_user_role where role_id = #{roleId}")
    public List<Long> selectUserIdByRoleId(Long roleId);

    /**
     * 通过用户id 查询用户角色
     */
}
