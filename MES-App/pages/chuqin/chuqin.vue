<template>
	<view class="attendance">
		<uni-section title="出勤管理" type="line" style="width: 100%; font-size: 1.5em"></uni-section>
		<view style="padding: 20rpx">
			<text style="font-size: 1.2em">当前时间: {{ currentTime }}</text>
			<br />
			<text style="font-size: 1.2em; margin-top: 20rpx">已出勤时长: {{ elapsedTime }}秒</text>
			<view style="margin-top: 40rpx">
				<button @click="checkIn" v-if="!isCheckedIn">扫码打卡</button>
				<button @click="checkOut" v-if="isCheckedIn">退勤</button>
			</view>
		</view>

		<!-- 弹窗 -->
		<view v-if="dialogVisible" class="dialog">
			<view class="dialog-content">
				<view>消息：{{ data.msg }}</view>
				<view>材料：{{ data.materials }}</view>
				<view>机器：{{ data.machine }}</view>
				<view>设备总价：{{ data.machinePrice }}</view>
				<view>材料价格：{{ data.materialPrice }}</view>
				<view>总工资：{{ totalPrice }}</view>
			</view>
			<button @click="dialogVisible = false">关闭</button>
		</view>
	</view>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue';
import { useStore } from 'vuex'; // 导入 useStore
import { getSalaryApi } from '../../api/other';

const store = useStore(); // 获取 Vuex store 实例
// 创建响应式变量
const username = ref(store.state.user.name); // 直接访问 state
const userId = ref(store.state.user.userId);
const isCheckedIn = ref(false);
const elapsedTime = ref(0);
const timer = ref(null);

const currentTime = ref('');

const updateCurrentTime = () => {
	const now = new Date();
	currentTime.value = now.toLocaleTimeString();
};

const totalPrice = computed(() => {
	return data.value.operationPrice - data.value.machinePrice - data.value.materialPrice;
});

// 模拟从API获取的数据
const apiData = {
	msg: '操作成功',
	code: 200,
	data: {
		operationPrice: 200,
		materials: '162蜡,168蜡,水溶蜡',
		machine: '激光切割机-1',
		startTime: '2024-11-03T20:04:26.000+08:00',
		operationName: '射尿素芯',
		endTime: '2024-11-03T20:04:26.000+08:00',
		machinePrice: 12,
		materialPrice: 21
	}
};

// 弹窗的可见性
const dialogVisible = ref(false);

// 响应式数据
const data = ref(apiData.data);

// 显示弹窗的方法
const showDialog = () => {
	dialogVisible.value = true;
};

const startTimer = () => {
	timer.value = setInterval(() => {
		elapsedTime.value++;
	}, 1000);
};

const checkIn = () => {
	uni.scanCode({
		// onlyFromCamera: true,  // 仅允许从相机扫码
		success: (res) => {
			const scanResult = res.result;
			if (scanResult.includes('chuqin')) {
				isCheckedIn.value = true;
				elapsedTime.value = 0; // 重置计时
				startTimer(); // 开始计时
				// 弹出提示框
				uni.showToast({
					title: '打卡成功',
					icon: 'success',
					duration: 2000 // 持续时间
				});
			} else {
				console.log("不包含 'chuqin'");
			}
		},
		fail: () => {
			attendanceStatus.value = '扫码失败，请重试';
		}
	});
};

function getSalary() {
	// console.log(1211);
	getSalaryApi(101).then((res) => {
		console.log('salary :', res.data);
		data.value = res.data.data;
	});
}

const checkOut = () => {
	uni.scanCode({
		// onlyFromCamera: true,  // 仅允许从相机扫码
		success: (res) => {
			const scanResult = res.result;
			if (scanResult.includes('tuiqin')) {
				isCheckedIn.value = false;
				clearInterval(timer.value); // 停止计时

				// 弹出提示框
				uni.showToast({
					title: '已退勤',
					icon: 'success',
					duration: 2000 // 持续时间
				});
				showDialog();
			} else {
				console.log("不包含 'tuiqin'");
			}
		},
		fail: () => {
			attendanceStatus.value = '扫码失败，请重试';
		}
	});
};

onMounted(() => {
	updateCurrentTime();
	setInterval(updateCurrentTime, 1000); // 每秒更新当前时间
});

onUnmounted(() => {
	clearInterval(timer.value); // 清理定时器
});
</script>

<style scoped>
.attendance {
	padding: 20rpx;
	background-color: #fff;
}
button {
	padding: 10rpx 20rpx;
	margin-right: 10rpx;
	background-color: #007aff;
	color: #fff;
	border: none;
	border-radius: 5rpx;
}

.dialog {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

.dialog-content {
	text-align: center;
}

button {
	margin-top: 10px;
}
</style>
