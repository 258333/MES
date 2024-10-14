import request from '@/utils/request'

// 查询工序，存储工序及其相关信息列表
export function listOperation(query) {
  return request({
    url: '/operation/operation/list',
    method: 'get',
    params: query
  })
}

// 查询工序，存储工序及其相关信息详细
export function getOperation(operationId) {
  return request({
    url: '/operation/operation/' + operationId,
    method: 'get'
  })
}

// 新增工序，存储工序及其相关信息
export function addOperation(data) {
  return request({
    url: '/operation/operation',
    method: 'post',
    data: data
  })
}

// 修改工序，存储工序及其相关信息
export function updateOperation(data) {
  return request({
    url: '/operation/operation',
    method: 'put',
    data: data
  })
}

// 删除工序，存储工序及其相关信息
export function delOperation(operationId) {
  return request({
    url: '/operation/operation/' + operationId,
    method: 'delete'
  })
}
