import request from '@/utils/request'

// 查询报工，用于记录员工的报工信息列表
export function listReport(query) {
  return request({
    url: '/report/report/list',
    method: 'get',
    params: query
  })
}

// 查询报工，用于记录员工的报工信息详细
export function getReport(workReportId) {
  return request({
    url: '/report/report/' + workReportId,
    method: 'get'
  })
}

// 新增报工，用于记录员工的报工信息
export function addReport(data) {
  return request({
    url: '/report/report',
    method: 'post',
    data: data
  })
}

// 修改报工，用于记录员工的报工信息
export function updateReport(data) {
  return request({
    url: '/report/report',
    method: 'put',
    data: data
  })
}

// 删除报工，用于记录员工的报工信息
export function delReport(workReportId) {
  return request({
    url: '/report/report/' + workReportId,
    method: 'delete'
  })
}
