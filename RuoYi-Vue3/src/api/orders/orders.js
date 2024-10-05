import request from '@/utils/request'

// 查询制令，存储总制令、分制令和子制令的信息列表
export function listOrders(query) {
  return request({
    url: '/orders/orders/list',
    method: 'get',
    params: query
  })
}

// 查询制令，存储总制令、分制令和子制令的信息详细
export function getOrders(id) {
  return request({
    url: '/orders/orders/' + id,
    method: 'get'
  })
}

// 新增制令，存储总制令、分制令和子制令的信息
export function addOrders(data) {
  return request({
    url: '/orders/orders',
    method: 'post',
    data: data
  })
}

// 修改制令，存储总制令、分制令和子制令的信息
export function updateOrders(data) {
  return request({
    url: '/orders/orders',
    method: 'put',
    data: data
  })
}

// 删除制令，存储总制令、分制令和子制令的信息
export function delOrders(id) {
  return request({
    url: '/orders/orders/' + id,
    method: 'delete'
  })
}
