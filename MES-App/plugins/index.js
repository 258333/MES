import tab from './tab'
import auth from './auth'
import modal from './modal'

export default {
	install(app) { // 在 Vue 3 中使用 app 参数
		// 页签操作
		app.config.globalProperties.$tab = tab
		// 认证对象
		app.config.globalProperties.$auth = auth
		// 模态框对象
		app.config.globalProperties.$modal = modal
	}
}