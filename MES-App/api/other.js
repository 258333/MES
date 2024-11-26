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
export function startTaskApi(takeId) {
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


//扫码领取物料
export function getMaterialByOperationIdApi(operationId) {
	return request({
		url: '/other/material/' + operationId,
		method: 'get',
	})
}


export function PutByOperationIdApi(materials) {
	return request({
		url: '/taskAssignment/taskAssignment/insertTaskMaterials',
		method: 'post',
		data: materials,
	})
}



// 查询机器，存储所有机器的相关信息详细
export function getMachineInfo(machineId) {
	return request({
		url: '/machine/machine/' + machineId,
		method: 'get'
	})
}

// 新增报工，用于记录员工的报工信息
export function addReportApi(data, id) {
	return request({
		url: '/report/report',
		method: 'post',
		params: {
			'taskId': id
		},
		data: data
	})
}


// 新增报工，用于记录员工的报工信息
export function getSalaryApi(userId) {
	// console.log(123);
	return request({
		url: '/other/salary',
		method: 'get',
		params: {
			'userId': userId
		}
	})
}