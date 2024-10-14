import request from '@/utils/request'

//获取当前员工的所有任务信息
export function getTaskList(userId) {
	return request({
		url: '/other/taskAssignment',
		method: 'get',
		params: {
			'userId': userId
		}
	})
}

//开始任务
export function startTask(takeId) {
	return request({
		url: '/other/startTask',
		method: 'get',
		params: {
			'takeId': takeId
		}
	})
}

//报工
export function finishTask(takeId, quantity) {
	return request({
		url: '/other/finishTask',
		method: 'get',
		params: {
			'takeId': takeId,
			'quantity': quantity
		}
	})
}