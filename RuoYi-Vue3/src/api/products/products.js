import request from '@/utils/request'

// 查询产品，存储产品相关信息列表
export function listProducts(query) {
  return request({
    url: '/products/products/list',
    method: 'get',
    params: query
  })
}

// 查询产品，存储产品相关信息详细
export function getProducts(productId) {
  return request({
    url: '/products/products/' + productId,
    method: 'get'
  })
}

// 新增产品，存储产品相关信息
export function addProducts(data) {
  return request({
    url: '/products/products',
    method: 'post',
    data: data
  })
}

// 修改产品，存储产品相关信息
export function updateProducts(data) {
  return request({
    url: '/products/products',
    method: 'put',
    data: data
  })
}

// 删除产品，存储产品相关信息
export function delProducts(productId) {
  return request({
    url: '/products/products/' + productId,
    method: 'delete'
  })
}
