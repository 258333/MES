import request from '@/utils/request'

// 查询合同，存储合同相关信息及其产品详情列表
export function listContracts(query) {
  return request({
    url: '/Contracts/contracts/list',
    method: 'get',
    params: query
  })
}

// 查询合同，存储合同相关信息及其产品详情详细
export function getContracts(contractId) {
  return request({
    url: '/Contracts/contracts/' + contractId,
    method: 'get'
  })
}

// 新增合同，存储合同相关信息及其产品详情
export function addContracts(data) {
  return request({
    url: '/Contracts/contracts',
    method: 'post',
    data: data
  })
}

// 修改合同，存储合同相关信息及其产品详情
export function updateContracts(data) {
  return request({
    url: '/Contracts/contracts',
    method: 'put',
    data: data
  })
}

// 删除合同，存储合同相关信息及其产品详情
export function delContracts(contractId) {
  return request({
    url: '/Contracts/contracts/' + contractId,
    method: 'delete'
  })
}
