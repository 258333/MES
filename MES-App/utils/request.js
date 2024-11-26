import store from '@/store';
import config from '@/config';
import {
	getToken
} from '@/utils/auth';
import errorCode from '@/utils/errorCode';
import {
	toast,
	showConfirm,
	tansParams
} from '@/utils/common';

const timeout = 10000;
const baseUrl = config.baseUrl;

const request = (config) => {
	// 是否需要设置 token
	const isToken = (config.headers || {}).isToken === false;
	config.headers = config.headers || {}; // 注意这里使用 headers 而非 header
	if (getToken() && !isToken) {
		config.headers['Authorization'] = 'Bearer ' + getToken();
	}

	// get请求映射params参数
	if (config.params) {
		let url = config.url + '?' + tansParams(config.params);
		url = url.slice(0, -1);
		config.url = url;
	}

	return new Promise((resolve, reject) => {
		uni.request({
				method: config.method || 'GET',
				timeout: config.timeout || timeout,
				url: config.baseUrl || baseUrl + config.url,
				data: config.data,
				header: config.headers, // 更新为 headers
				dataType: 'json',
			}).then((response) => {

				const {
					statusCode,
					errMsg,
					data: res
				} = response; // 解构需要的部分

				// 检查请求状态
				if (statusCode !== 200) {
					toast('后端接口连接异常: ' + errMsg);
					reject('后端接口连接异常');
					return;
				}

				// 检查 res 是否存在
				if (!res) {
					toast('响应数据不存在');
					reject('响应数据不存在');
					return;
				}

				const code = res.code || 200; // 确保 res 有 code 属性
				const msg = errorCode[code] || res.msg || errorCode['default'];

				if (code === 401) {
					showConfirm('登录状态已过期，您可以继续留在该页面，或者重新登录?').then((res) => {
						if (res.confirm) {
							store.dispatch('LogOut').then(() => {
								uni.reLaunch({
									url: '/pages/login',
								});
							});
						}
					});
					reject('无效的会话，或者会话已过期，请重新登录。');
				} else if (code === 500) {
					toast(msg);
					reject('500');
				} else if (code !== 200) {
					toast(msg);
					reject(code);
				}
				// console.log(res)
				resolve(res);
			})
			.catch((error) => {
				let {
					message
				} = error;
				if (message === 'Network Error') {
					message = '后端接口连接异常';
				} else if (message.includes('timeout')) {
					message = '系统接口请求超时';
				} else if (message.includes('Request failed with status code')) {
					message = '系统接口' + message.substr(message.length - 3) + '异常';
				}
				toast(message);
				reject(error);
			});
	});
};

export default request;