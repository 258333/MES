<template>
	<view class="content">
		<image class="logo" src="@/static/xiongchumo.jpg"></image>
		<view class="text-area">
			<text class="title">Hello {{ username }}</text>
		</view>

		<view class="task-list-container">
			<view class="header">
				<text class="title">任务列表</text>
			</view>

			<view class="task-list">
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
						<button class="task-button" @click="startTask(task.taskAssignment.takeId)" :disabled="task.taskAssignment.isStarted === 1">
							<text v-if="task.taskAssignment.isStarted === 0">开始任务</text>
							<text v-else>进行中</text>
						</button>
					</view>
				</view>
			</view>

			<button @click="scanCode">扫码报工</button>
			<modal v-if="showModal" @close="showModal = false" class="modal-overlay">
				<view class="modal">
					<text class="modal-title">报工单</text>
					<view class="form-group">
						<text class="label">工号:</text>
						<input style="height: 40px" v-model="form.takeId" readonly />
					</view>
					<view class="form-group">
						<text class="label">完成数量:</text>
						<input style="height: 40px" v-model="form.quantity" readonly />
					</view>
					<view class="form-group">
						<text class="label">物料使用情况:</text>
						<input style="height: 40px" v-model="form.material" readonly />
					</view>

					<view class="btn1">
						<button @click="confirmTask">确认报工</button>
						<button @click="closeModal">取消</button>
					</view>
				</view>
			</modal>
		</view>
	</view>
</template>

<script>
import { getTaskList, startTask, finishTask } from '@/api/other';
export default {
	data() {
		return {
			username: this.$store.state.user.name,
			userId: this.$store.state.user.roles,
			tasks: [],
			showStartTask: true,
			showModal: false,
			form: {},
			result: '扫码结果'
		};
	},
	created() {
		this.getTasks();
	},
	onLoad: function (options) {
		setTimeout(function () {
			console.log('start pulldown');
		}, 1000);
		uni.startPullDownRefresh();
	},
	onPullDownRefresh() {
		console.log('refresh');
		setTimeout(function () {
			uni.stopPullDownRefresh();
		}, 1000);
	},
	methods: {
		//任务列表
		getTasks() {
			// console.log('userId :', this.userId);
			// 获取任务列表
			getTaskList(this.userId).then((res) => {
				this.tasks = res.data;
				// console.log('task :', this.tasks);
			});
		},
		//开始任务
		startTask(taskId) {
			startTask(taskId).then((res) => {
				uni.showToast({
					title: '任务开始成功',
					icon: 'success'
				});
			});
			this.getTasks();
			this.$tab.reLaunch('/pages/index');
		},
		// 扫码后的处理函数
		scanCode() {
			uni.scanCode({
				success: (res) => {
					this.showModal = true;
				},
				fail: (err) => {
					console.error('扫码失败:', err);
					uni.showToast({
						title: '扫码失败，请重试',
						icon: 'none'
					});
				}
			});
		},
		// 确认领取任务的处理函数
		confirmTask() {
			finishTask(this.form.takeId, this.form.quantity).then((res) => {
				uni.showToast({
					title: '报工成功',
					icon: 'success'
				});
				this.getTasks();
			});
			// 关闭模态框
			this.showModal = false;
		},
		// 关闭模态框的处理函数
		closeModal() {
			this.showModal = false;
		}
	}
};
</script>

<style>
.content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.logo {
	height: 200rpx;
	width: 400rpx;
	margin-top: 200rpx;
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
	color: #2ecc71; /* 添加已完成的颜色 */
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
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}
</style>
