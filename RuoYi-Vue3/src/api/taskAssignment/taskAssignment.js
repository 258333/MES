import request from '@/utils/request'

// 查询任务分配，存储每个子制令的任务分配情况列表
export function listTaskAssignment(query) {
  return request({
    url: '/taskAssignment/taskAssignment/list',
    method: 'get',
    params: query
  })
}

// 查询任务分配，存储每个子制令的任务分配情况详细
export function getTaskAssignment(takeId) {
  return request({
    url: '/taskAssignment/taskAssignment/' + takeId,
    method: 'get'
  })
}

// 新增任务分配，存储每个子制令的任务分配情况
export function addTaskAssignment(data) {
  return request({
    url: '/taskAssignment/taskAssignment',
    method: 'post',
    data: data
  })
}

// 修改任务分配，存储每个子制令的任务分配情况
export function updateTaskAssignment(data) {
  return request({
    url: '/taskAssignment/taskAssignment',
    method: 'put',
    data: data
  })
}

// 删除任务分配，存储每个子制令的任务分配情况
export function delTaskAssignment(takeId) {
  return request({
    url: '/taskAssignment/taskAssignment/' + takeId,
    method: 'delete'
  })
}
