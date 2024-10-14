import config from '@/config'
import storage from '@/utils/storage'
import constant from '@/utils/constant'
import {
	login,
	logout,
	getInfo
} from '@/api/login'
import {
	getToken,
	setToken,
	removeToken
} from '@/utils/auth'

const baseUrl = config.baseUrl

const user = {
	state: {
		token: getToken(),
		name: storage.get(constant.name),
		avatar: storage.get(constant.avatar),
		roles: storage.get(constant.roles),
		permissions: storage.get(constant.permissions),
		userId: storage.get(constant.userId)
	},

	mutations: {
		SET_TOKEN: (state, token) => {
			state.token = token
		},
		SET_USERID: (state, userId) => {
			state.userId = userId
			storage.set(constant.userId, userId)
		},
		SET_NAME: (state, name) => {
			state.name = name
			storage.set(constant.name, name)
		},
		SET_AVATAR: (state, avatar) => {
			state.avatar = avatar
			storage.set(constant.avatar, avatar)
		},
		SET_ROLES: (state, roles) => {
			state.roles = roles
			storage.set(constant.roles, roles)
		},
		SET_PERMISSIONS: (state, permissions) => {
			state.permissions = permissions
			storage.set(constant.permissions, permissions)
		}
	},

	actions: {
		// 登录
		Login({
			commit
		}, userInfo) {
			const username = userInfo.username.trim()
			const password = userInfo.password
			const code = userInfo.code
			const uuid = userInfo.uuid
			return new Promise((resolve, reject) => {
				login(username, password, code, uuid).then(res => {
					setToken(res.token)
					commit('SET_TOKEN', res.token)
					resolve()
				}).catch(error => {
					reject(error)
				})
			})
		},

		// 获取用户信息
		GetInfo({
			commit,
			state
		}) {
			return new Promise((resolve, reject) => {
				getInfo().then(res => {
					// console.log("res: " + JSON.stringify(res));
					const user = res.user
					// console.log("user :", user.userId)
					const avatar = (user == null || user.avatar == "" || user.avatar == null) ?
						require("@/static/images/profile.jpg") : baseUrl + user.avatar
					const username = (user == null || user.userName == "" || user.userName ==
						null) ? "" : user.userName
					const userId = (user == null || user.userId == "" || user.userId == null) ? "" :
						user.userId
					commit('SET_USERID', userId)
					// 当用户登录或初始化时，将 userId 存储到 localStorage
					// localStorage.setItem('userId', userId);
					// SessionStorage.setItem('userId', userId);
					// setCookie('userId', userId);
					if (res.roles && res.roles.length > 0) {
						// commit('SET_ROLES', res.roles)
						commit('SET_ROLES', userId)
						commit('SET_PERMISSIONS', res.permissions)
					} else {
						commit('SET_ROLES', ['ROLE_DEFAULT'])
					}
					commit('SET_NAME', username)
					commit('SET_AVATAR', avatar)
					resolve(res)
				}).catch(error => {
					reject(error)
				})
			})
		},

		// 退出系统
		LogOut({
			commit,
			state
		}) {
			return new Promise((resolve, reject) => {
				logout(state.token).then(() => {
					commit('SET_TOKEN', '')
					commit('SET_ROLES', [])
					commit('SET_PERMISSIONS', [])
					removeToken()
					storage.clean()
					resolve()
				}).catch(error => {
					reject(error)
				})
			})
		}
	}
}

export default user