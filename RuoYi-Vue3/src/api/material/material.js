import request from '@/utils/request'

// 查询物料，存储生产所需的物料信息列表
export function listMaterial(query) {
  return request({
    url: '/material/material/list',
    method: 'get',
    params: query
  })
}

// 查询物料，存储生产所需的物料信息详细
export function getMaterial(materialId) {
  return request({
    url: '/material/material/' + materialId,
    method: 'get'
  })
}

// 新增物料，存储生产所需的物料信息
export function addMaterial(data) {
  return request({
    url: '/material/material',
    method: 'post',
    data: data
  })
}

// 修改物料，存储生产所需的物料信息
export function updateMaterial(data) {
  return request({
    url: '/material/material',
    method: 'put',
    data: data
  })
}

// 删除物料，存储生产所需的物料信息
export function delMaterial(materialId) {
  return request({
    url: '/material/material/' + materialId,
    method: 'delete'
  })
}