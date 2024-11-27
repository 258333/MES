import request from '@/utils/request'

// 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息列表
export function listTask(query) {
  return request({
    url: '/task/task/list',
    method: 'get',
    params: query
  })
}

// 查询任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息详细
export function getTask(taskId) {
  return request({
    url: '/task/task/' + taskId,
    method: 'get'
  })
}

// 新增任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
export function addTask(data) {
  return request({
    url: '/task/task',
    method: 'post',
    data: data
  })
}

// 修改任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
export function updateTask(data) {
  return request({
    url: '/task/task',
    method: 'put',
    data: data
  })
}

// 删除任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息
export function delTask(taskId) {
  return request({
    url: '/task/task/' + taskId,
    method: 'delete'
  })
}
