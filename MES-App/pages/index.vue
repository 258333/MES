<template>
	<view class="content">
		<!-- <image class="logo" src="@/static/xiongchumo.jpg"></image> -->

		<!-- 图片轮播区域 -->
		<view class="carousel">
			<swiper :indicator-dots="true" :autoplay="true" :circular="true">
				<swiper-item v-for="(image, index) in images" :key="index">
					<image :src="image" class="carousel-image" mode="aspectFill" />
				</swiper-item>
			</swiper>
		</view>

		<uni-section title="公告栏" type="line" style="width: 100%; font-size: 1.5em"></uni-section>
		<view style="background-color: #fff9e9; width: 100%; line-height: 1.8em; font-size: 1.5em">
			<p style="color: #fbb573">📢 2024-10-21系统维护</p>
			<p style="color: #fbb573">📢 2024-10-25系统维护</p>
		</view>
		<uni-section title="待办事项" type="line" style="margin-top: 10rpx; width: 100%"></uni-section>
		<view style="background-color: #fff9e9; width: 100%; line-height: 1.8em; font-size: 1.5em">
			<p style="color: #fbb573; margin-left: 10rpx"><text @click="claimTask">未完成的工单...</text></p>
		</view>

		<view>
			<scroll-view class="task-list">
				<!-- 遍历任务列表 -->
				<view v-for="(task, index) in tasks" :key="index" class="task-card">
					<view class="task-info">
						<view class="task-detail">
							<text class="label">工号:</text>
							<text class="value">{{ task.taskAssignment.takeId }}</text>
						</view>
						<view class="task-detail">
							<text class="label">工序:</text>
							<text class="value">{{ task.operationName }}</text>
						</view>

						<view class="task-detail">
							<text class="label">数量:</text>
							<text class="value">{{ task.quantity }}</text>
						</view>
						<view class="task-detail">
							<text class="label">机器:</text>
							<text class="value">{{ task.machineName }}</text>
						</view>
						<view class="task-detail">
							<text class="label">发布时间:</text>
							<uni-dateformat :date="task.taskAssignment.assignedDate" format="yyyy年MM月dd日"></uni-dateformat>
						</view>
					</view>

					<view class="task-footer">
						<button class="task-button" @click="startTask(task.taskAssignment.takeId, 1)" :disabled="task.taskAssignment.isStarted === 1">
							<text v-if="task.taskAssignment.isStarted === 0">开始任务</text>
							<text v-else>进行中</text>
						</button>
					</view>
				</view>
			</scroll-view>
		</view>

		<!-- <button @click="scanCode">扫码报工</button> -->

		<view v-if="showModal" @close="showModal = false" class="modal-overlay">
			<view class="modal">
				<text class="modal-title">报工单</text>
				<scroll-view scroll-y="true" style="max-height: 400px; overflow-y: auto; padding: 10px">
					<!-- 姓名 -->
					<view class="form-group">
						<text class="label">姓名:</text>
						<input style="height: 40px" v-model="form.username" readonly />
					</view>

					<!-- 班组名称 -->
					<view class="form-group">
						<text class="label">班组名称:</text>
						<input style="height: 40px" v-model="form.teamName" readonly />
					</view>

					<!-- 使用的机器ID -->
					<view class="form-group">
						<text class="label">机器ID:</text>
						<input style="height: 40px" v-model="form.machineId" readonly />
					</view>

					<!-- 工序ID -->
					<view class="form-group">
						<text class="label">工序ID:</text>
						<input style="height: 40px" v-model="form.operationId" readonly />
					</view>

					<!-- 工序名称 -->
					<view class="form-group">
						<text class="label">工序名称:</text>
						<input style="height: 40px" v-model="form.operationName" readonly />
					</view>

					<!-- 完成数量 -->
					<view class="form-group">
						<text class="label">完成数量:</text>
						<input style="height: 40px" v-model="form.quantity" />
					</view>

					<!-- 开始时间 -->
					<view class="form-group">
						<text class="label">开始时间:</text>
						<input style="height: 40px" v-model="form.startTime" readonly />
					</view>

					<!-- 结束时间 -->
					<view class="form-group">
						<text class="label">结束时间:</text>
						<input style="height: 40px" v-model="form.endTime" readonly />
					</view>

					<!-- 报工状态 -->
					<view class="form-group">
						<text class="label">状态:</text>
						<input style="height: 40px" v-model="form.reportStatus" readonly />
					</view>

					<!-- 备注信息 -->
					<view class="form-group">
						<text class="label">备注:</text>
						<input style="height: 40px" v-model="form.remarks" />
					</view>
				</scroll-view>
				<view class="btn1">
					<button @click="confirmTask">确认报工</button>
					<button @click="closeModal">取消</button>
				</view>
			</view>
		</view>

		<!-- 物料码 -->
		<view v-if="showWuliaoModal" @close="showWuliaoModal = false" class="modal-overlay">
			<view class="modal">
				<text class="modal-title">物料领取</text>

				<!-- 物料表格 -->
				<view class="material-list">
					<view v-for="(material, index) in materials" :key="index" class="material-row">
						<text class="material-name">{{ material.materialName }}</text>
						<!-- <input v-model="material.quantity" placeholder="请输入数量" class="material-quantity" /> -->
						<uni-easyinput v-model="material.quantity" :inputBorder="true" placeholder="请输入数量"></uni-easyinput>
						<text class="material-unit">{{ material.unit }}</text>
					</view>
				</view>

				<view class="btn1">
					<button @click="confirmWuliaoTask">确认领取</button>
					<button @click="closeWuliaoModal">取消</button>
				</view>
			</view>
		</view>
		<!-- 设备码 -->
		<view v-if="showMachineModal" @close="showMachineModal = false" class="modal-overlay">
			<view class="modal">
				<h1 class="modal-title">设备信息</h1>

				<view class="form-group">
					<view>
						<text class="label">设备号:{{ machineCode }}</text>
					</view>
					<view>
						<text class="label">设备名称:{{ machineInfo.machineName }}</text>
					</view>
					<view>
						<text class="label">设备状态:{{ machineInfo.status }}</text>
					</view>
				</view>

				<view class="btn1">
					<button @click="confirmMachineTask">开启设备并计时</button>
					<button @click="closeMachineModal">取消</button>
				</view>
			</view>
		</view>
		<!-- 报工码 -->
		<!-- 保修码 -->
	</view>

	<view class="bottom-icon" style="position: fixed; bottom: 2%; right: 10%">
		<view class="circle" @click="scanQRCode()">
			<img src="https://pic.imgdb.cn/item/67234d1bd29ded1a8c31866a.png" alt="" class="icon" style="width: 70rpx" />
		</view>
	</view>

	<!-- </view> -->
</template>

<script setup>
import { ref, reactive, onMounted, watch } from 'vue';
import { getTaskList, startTaskApi, finishTask, getMaterialByOperationIdApi, PutByOperationIdApi, getMachineInfo, addReportApi } from '@/api/other';
import { useStore } from 'vuex'; // 导入 useStore
const store = useStore(); // 获取 Vuex store 实例

// 创建响应式变量
const username = ref(store.state.user.name); // 直接访问 state
const userId = ref(store.state.user.userId);
const tasks = ref([]);
const showModal = ref(false);
const showWuliaoModal = ref(false);
const showBaoGongModal = ref(false);
const showMachineModal = ref(false);
const machineCode = ref(0);
const startMachineTime = ref();
const endMachineTime = ref();
const machineInfo = ref();
const images = ref([
	'https://pic.imgdb.cn/item/67066517d29ded1a8ca0aabb.png',
	'https://pic.imgdb.cn/item/67066517d29ded1a8ca0aabb.png',
	'https://pic.imgdb.cn/item/67066517d29ded1a8ca0aabb.png'
]);

const form = ref({
	workReportId: 12345,
	userId: 101,
	username: username,
	teamName: '射蜡班组',
	machineId: machineCode.value,
	operationId: 0,
	operationName: 'SHELA',
	quantity: 0,
	startTime: startMachineTime.value,
	endTime: endMachineTime.value,
	reportStatus: '已完成',
	remarks: ''
});
watch(tasks, () => {
	form.value.operationId = tasks.value[0].operationId;
	form.value.operationName = tasks.value[0].operationName;
});

const materials = ref([
	{
		taskId: '',
		materialName: '物料A',
		unit: '个',
		quantity: ''
	}
]);

onMounted(() => {
	getTasks();
	// getMaterialsByOperationId(tasks.value[0].operationId);
});

function toTask() {
	uni.navigateTo({
		url: '/pages/task/task'
	});
}

function getTasks() {
	getTaskList(userId.value).then((res) => {
		tasks.value = res.data;
		console.log(tasks);
		getMaterialsByOperationId(tasks.value[0].operationId);
	});
}

function getMaterialsByOperationId(operationId) {
	// 根据operationId获取物料信息的逻辑
	// console.log(operationId);
	getMaterialByOperationIdApi(operationId).then((res) => {
		materials.value = res.data;
		for (let i = 0; i < materials.value.length; i++) {
			materials.value[i].quantity = 0;
		}
		// console.log('materials :', materials.value);
	});
}
function showConfirmationDialog(taskId) {
	uni.showModal({
		title: '提示',
		content: '请检查上一道工序无误后接受',
		success: function (res) {
			if (res.confirm) {
				// 用户点击了确定

				startTaskApi(taskId)
					.then(() => {
						uni.showToast({
							title: '任务开始成功',
							icon: 'success'
						});
						getTasks(); // 更新任务列表
						uni.reLaunch({
							url: '/pages/index'
						});
					})
					.catch((error) => {
						uni.showToast({
							title: '任务开始失败',
							icon: 'none'
						});
						console.error(error);
					});
			} else if (res.cancel) {
				// 用户点击了取消
				uni.showToast({
					title: '取消交接',
					icon: 'none'
				});
			}
		}
	});
}

function startTask(taskId) {
	showConfirmationDialog(taskId);
}

function scanQRCode() {
	uni.scanCode({
		success: (res) => {
			if (res.result.includes('wuliao')) {
				showWuliaoModal.value = true;
			} else if (res.result.includes('machine')) {
				// form.value.startTime = Date.now();
				const now = new Date();
				form.value.startTime =
					now.getFullYear() +
					'-' +
					('0' + (now.getMonth() + 1)).slice(-2) +
					'-' +
					('0' + now.getDate()).slice(-2) +
					' ' +
					('0' + now.getHours()).slice(-2) +
					':' +
					('0' + now.getMinutes()).slice(-2) +
					':' +
					('0' + now.getSeconds()).slice(-2);
				machineCode.value = res.result.substring(7);
				form.value.machineId = machineCode.value;
				getMachineInfo(machineCode.value).then((res) => {
					console.log(123);
					console.log(machineCode.value);
					machineInfo.value = res.data;
					console.log(res.data);
				});
				showMachineModal.value = true;
			} else if (res.result.includes('task')) {
				// form.value.endTime = Date.now();
				const now = new Date();
				form.value.endTime =
					now.getFullYear() +
					'-' +
					('0' + (now.getMonth() + 1)).slice(-2) +
					'-' +
					('0' + now.getDate()).slice(-2) +
					' ' +
					('0' + now.getHours()).slice(-2) +
					':' +
					('0' + now.getMinutes()).slice(-2) +
					':' +
					('0' + now.getSeconds()).slice(-2);
				showModal.value = true;
			}
		},
		fail: (err) => {
			console.error('扫码失败:', err);
			uni.showToast({
				title: '扫码失败，请重试',
				icon: 'none'
			});
		}
	});
}

function confirmTask() {
	// finishTask(form.takeId, form.quantity).then(() => {
	// 	uni.showToast({
	// 		title: '报工成功',
	// 		icon: 'success'
	// 	});

	addReportApi(form.value, tasks.value[0].taskAssignment.takeId).then((res) => {
		console.log('addReport :', res.msg);
	});
	getTasks(); // 更新任务列表
	showModal.value = false; // 关闭模态框
	uni.showToast({
		title: '领取成功',
		icon: 'success'
	});
}

function confirmWuliaoTask() {
	// console.log(123);
	// 更新 materials 数组中的每个对象的 taskId
	// console.log(tasks.value[0]);
	for (let i = 0; i < materials.value.length; i++) {
		materials.value[i].taskId = tasks.value[0].taskAssignment.takeId; // 确保 taskId 正确
	}
	// console.log(456);
	// console.log(materials.value);
	PutByOperationIdApi(materials.value).then(() => {
		// console.log(materials.value);
		uni.showToast({
			title: '领取成功',
			icon: 'success'
		});
	});
	showWuliaoModal.value = false; // 关闭模态框
}

function confirmMachineTask() {
	uni.showModal({
		title: '提示',
		content: '设备已经开始计时',
		showCancel: false,
		confirmText: '确定'
	});
	function getMachine(machineId) {
		//根据机器ID查询机器信息
		getMachineApi(machineId).then((res) => {
			console.log('machine :', res.data);
		});
	}
	showMachineModal.value = false; // 关闭模态框
}

function closeWuliaoModal() {
	showWuliaoModal.value = false;
}

function closeMachineModal() {
	showMachineModal.value = false;
}

function closeModal() {
	showModal.value = false;
}
</script>

<style>
.carousel {
	width: 100%;
	height: 200px;
	/* 根据需要调整高度 */
}

.carousel-image {
	width: 100%;
	height: 100%;
}

.content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.logo {
	height: 200rpx;
	width: 400rpx;
	margin-top: 100rpx;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50rpx;
}

.text-area {
	display: flex;
	justify-content: center;
}

.title {
	font-size: 36rpx;
	color: #8f8f94;
}

.container {
	margin-top: 10rpx;
	padding: 20rpx;
}

.modal-content {
	padding: 20px;
}

.modal-buttons {
	display: flex;
	justify-content: space-between;
}

/* 容器样式 */
.task-list-container {
	padding: 20px;
	background-color: #f0f0f5;
	min-height: 100vh;
}

/* 页头样式 */
.header {
	display: flex;
	justify-content: center;
	padding: 20px 0;
}

.title {
	font-size: 32px;
	font-weight: bold;
	color: #333;
}

/* 任务列表样式 */
.task-list {
	margin-top: 20px;
}

/* 任务卡片样式 */
.task-card {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 15px;
	width: 600rpx;
}

/* 任务头部，包含图标和名称 */
.task-header {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.task-icon {
	width: 50px;
	height: 50px;
	margin-right: 15px;
}

.task-name {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}
.modal-title {
	font-size: 30rpx;
}
.circle {
	width: 60px;
	/* 根据需要调整圆的大小 */
	height: 60px;
	/* 根据需要调整圆的大小 */
	background-color: white;
	/* 白色背景 */
	border-radius: 50%;
	/* 圆形 */
	display: flex;
	/* 使用 flex 布局 */
	justify-content: center;
	/* 居中对齐 */
	align-items: center;
	/* 居中对齐 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	/* 可选：添加阴影效果 */
}

.icon {
	width: 50%;
	/* 根据需要调整图片大小 */
	height: auto;
	/* 保持图片比例 */
}

/* 任务详细信息 */
.task-info {
	margin-bottom: 10px;
}

.task-detail {
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
}

.label {
	font-size: 18px;
	color: #666;
}

.value {
	font-size: 18px;
	color: #333;
}

.pending {
	color: #f39c12;
}

.assigned {
	color: #27ae60;
}

.in-progress {
	color: #3498db;
}

.completed {
	color: #2ecc71;
	/* 添加已完成的颜色 */
}

/* 任务卡片底部 */
.task-footer {
	display: flex;
	justify-content: flex-end;
}

/* 任务按钮 */
.task-button {
	background-color: #007aff;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
}

.task-button:hover {
	background-color: #005bb5;
}

.lineShow {
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-size: 42rpx;
}

.item {
	margin-left: 50rpx;
	margin-right: 50rpx;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.btn1 {
	display: inline;
	width: 12px;
	background-color: #007bff;
	/* 按钮背景色 */
	color: white;
	/* 字体颜色 */
	border: none;
	/* 无边框 */
	border-radius: 5px;
	/* 圆角 */
	align-items: center;
	margin-left: 20rpx;
	font-size: 12px;
	/* 字体大小 */
}

.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal {
	background: white;
	padding: 20px;
	border-radius: 10px;
	width: 90%;
	max-width: 800px;
}

.form-group {
	height: 50px;
	margin-bottom: 15px;
}

input {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
}
</style>
