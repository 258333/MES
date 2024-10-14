import request from '@/utils/request'

//获取所有角色为员工的用户信息
export function userInfoListApi() {
  return request({
    url: '/other/users',
    method: 'get',
  })
}

//获取所有可用的机器列表
export function machineListApi(operationId) {
  return request({
    url: '/other/machines',
    method: 'get',
    params: {"operationId":operationId},
  })
}

//进行任务分配
export function taskAssignmentApi(data) {
  console.log("data :",data);
  return request({
    url: '/other/taskAssignment',
    method: 'post',
    data: data,
  })
}