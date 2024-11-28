import request from '@/utils/request'

// 查询出勤，记录员工的出勤信息列表
export function listCheckin(query) {
  return request({
    url: '/checkin/checkin/list',
    method: 'get',
    params: query
  })
}

// 查询出勤，记录员工的出勤信息详细
export function getCheckin(id) {
  return request({
    url: '/checkin/checkin/' + id,
    method: 'get'
  })
}

// 新增出勤，记录员工的出勤信息
export function addCheckin(data) {
  return request({
    url: '/checkin/checkin',
    method: 'post',
    data: data
  })
}

// 修改出勤，记录员工的出勤信息
export function updateCheckin(data) {
  return request({
    url: '/checkin/checkin',
    method: 'put',
    data: data
  })
}

// 删除出勤，记录员工的出勤信息
export function delCheckin(id) {
  return request({
    url: '/checkin/checkin/' + id,
    method: 'delete'
  })
}
