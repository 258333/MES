<template>
	<view class="normal-login-container">
		<view class="logo-content align-center justify-center flex">
			<image style="width: 100rpx; height: 100rpx" :src="globalConfig.appInfo.logo" mode="widthFix"></image>
			<text class="title">若依移动端注册</text>
		</view>
		<view class="login-form-content">
			<view class="input-item flex align-center">
				<view class="iconfont icon-user icon"></view>
				<input v-model="registerForm.username" class="input" type="text" placeholder="请输入账号" maxlength="30" />
			</view>
			<view class="input-item flex align-center">
				<view class="iconfont icon-password icon"></view>
				<input v-model="registerForm.password" type="password" class="input" placeholder="请输入密码" maxlength="20" />
			</view>
			<view class="input-item flex align-center">
				<view class="iconfont icon-password icon"></view>
				<input v-model="registerForm.confirmPassword" type="password" class="input" placeholder="请输入重复密码" maxlength="20" />
			</view>
			<view class="input-item flex align-center" style="width: 60%; margin: 0px" v-if="captchaEnabled">
				<view class="iconfont icon-code icon"></view>
				<input v-model="registerForm.code" type="number" class="input" placeholder="请输入验证码" maxlength="4" />
				<view class="login-code">
					<image :src="codeUrl" @click="getCode" class="login-code-img"></image>
				</view>
			</view>
			<view class="action-btn">
				<button @click="handleRegister" class="register-btn cu-btn block bg-blue lg round">注册</button>
			</view>
		</view>
		<view class="xieyi text-center">
			<text @click="handleUserLogin" class="text-blue">使用已有账号登录</text>
		</view>
	</view>
</template>

<script setup>
import { onMounted, reactive, ref } from 'vue';
import { getCodeImg, register } from '@/api/login';
import config from '../config';

// 定义 reactive 和 ref 变量
const codeUrl = ref('');
const captchaEnabled = ref(true);
const globalConfig = config;

const registerForm = reactive({
	username: '',
	password: '',
	confirmPassword: '',
	code: '',
	uuid: ''
});

// 方法定义
const handleUserLogin = () => {
	uni.navigateTo({
		url: '/pages/login'
	});
};

const getCode = async () => {
	try {
		const res = await getCodeImg();
		captchaEnabled.value = res.captchaEnabled === undefined ? true : res.captchaEnabled;
		if (captchaEnabled.value) {
			codeUrl.value = 'data:image/gif;base64,' + res.img;
			registerForm.uuid = res.uuid;
		}
	} catch (error) {
		console.error(error);
	}
};

const handleRegister = async () => {
	if (registerForm.username === '') {
		uni.showToast({ title: '请输入您的账号', icon: 'none' });
	} else if (registerForm.password === '') {
		uni.showToast({ title: '请输入您的密码', icon: 'none' });
	} else if (registerForm.confirmPassword === '') {
		uni.showToast({ title: '请再次输入您的密码', icon: 'none' });
	} else if (registerForm.password !== registerForm.confirmPassword) {
		uni.showToast({ title: '两次输入的密码不一致', icon: 'none' });
	} else if (registerForm.code === '' && captchaEnabled.value) {
		uni.showToast({ title: '请输入验证码', icon: 'none' });
	} else {
		uni.showLoading({ title: '注册中，请耐心等待...' });
		await registerUser();
	}
};

const registerUser = async () => {
	try {
		const res = await register(registerForm);
		uni.hideLoading();
		uni.showModal({
			title: '系统提示',
			content: `恭喜你，您的账号 ${registerForm.username} 注册成功！`,
			success: function (res) {
				if (res.confirm) {
					uni.redirectTo({ url: '/pages/login' });
				}
			}
		});
	} catch (error) {
		if (captchaEnabled.value) {
			getCode();
		}
	}
};

// 生命周期钩子
onMounted(() => {
	getCode();
});
</script>

<style lang="scss" scoped>
page {
	background-color: #ffffff;
}

.normal-login-container {
	width: 100%;

	.logo-content {
		width: 100%;
		font-size: 21px;
		text-align: center;
		padding-top: 15%;

		image {
			border-radius: 4px;
		}

		.title {
			margin-left: 10px;
		}
	}

	.login-form-content {
		text-align: center;
		margin: 20px auto;
		margin-top: 15%;
		width: 80%;

		.input-item {
			margin: 20px auto;
			background-color: #f5f6f7;
			height: 45px;
			border-radius: 20px;

			.icon {
				font-size: 38rpx;
				margin-left: 10px;
				color: #999;
			}

			.input {
				width: 100%;
				font-size: 14px;
				line-height: 20px;
				text-align: left;
				padding-left: 15px;
			}
		}

		.register-btn {
			margin-top: 40px;
			height: 45px;
		}

		.xieyi {
			color: #333;
			margin-top: 20px;
		}

		.login-code {
			height: 38px;
			float: right;

			.login-code-img {
				height: 38px;
				position: absolute;
				margin-left: 10px;
				width: 200rpx;
			}
		}
	}
}
</style>
