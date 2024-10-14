import request from '@/utils/request'

// 查询机器，存储所有机器的相关信息列表
export function listMachine(query) {
  return request({
    url: '/machine/machine/list',
    method: 'get',
    params: query
  })
}

// 查询机器，存储所有机器的相关信息详细
export function getMachine(machineId) {
  return request({
    url: '/machine/machine/' + machineId,
    method: 'get'
  })
}

// 新增机器，存储所有机器的相关信息
export function addMachine(data) {
  return request({
    url: '/machine/machine',
    method: 'post',
    data: data
  })
}

// 修改机器，存储所有机器的相关信息
export function updateMachine(data) {
  return request({
    url: '/machine/machine',
    method: 'put',
    data: data
  })
}

// 删除机器，存储所有机器的相关信息
export function delMachine(machineId) {
  return request({
    url: '/machine/machine/' + machineId,
    method: 'delete'
  })
}
