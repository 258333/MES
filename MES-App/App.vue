<script setup>
import { reactive, onMounted } from 'vue'; // 使用 reactive 和 onMounted
import config from './config'; // 导入配置
import { useStore } from 'vuex'; // 引入 Vuex
import { getToken } from '@/utils/auth'; // 引入获取 token 的工具函数

// 使用 Vuex store
const store = useStore();
// 使用 reactive 定义全局数据
const globalData = reactive({ config: {} });

// 初始化应用
const initApp = () => {
	initConfig();
	checkLogin();
};

// 初始化应用配置
const initConfig = () => {
	globalData.config = config; // 设置全局配置
};

// 检查用户登录状态
const checkLogin = () => {
	if (!getToken()) {
		uni.reLaunch({ url: '/pages/login' }); // 使用 uni API 进行页面跳转
	}
};

// 使用 onMounted 生命周期钩子
onMounted(() => {
	initApp(); // 在组件挂载时调用 initApp
});
</script>

<style lang="scss">
@import '@/static/scss/index.scss'; // 引入样式
</style>
