<template>
	<view>
		
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
					<button class="task-button" @click="startTask(task.taskAssignment.takeId,1)" :disabled="task.taskAssignment.isStarted === 1">
						<text v-if="task.taskAssignment.isStarted === 0">开始任务</text>
						<text v-else>进行中</text>
					</button>
				</view>
			</view>
		</view>
	</view>
</template>

<script setup>
	import { ref, reactive, onMounted } from 'vue';
	import { getTaskList, startTaskApi, finishTask } from '@/api/other';
	import { useStore } from 'vuex'; // 导入 useStore

	const store = useStore(); // 获取 Vuex store 实例
	
	// 创建响应式变量
	const username = ref(store.state.user.name); // 直接访问 state
	const userId = ref(store.state.user.userId);
	const tasks = ref([]);
	const showModal = ref(false);

	
	const form = reactive({
		takeId: '',
		quantity: '',
		material: ''
	});
	
	onMounted(() => {
		getTasks();
	});
	
	function getTasks() {
		getTaskList(userId.value).then((res) => {
			tasks.value = res.data;
		});
	}
	
	function startTask(taskId,operationId) {
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
	}
	function closeModal() {
		showModal.value = false;
	}
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
	  	border: 1px solid #ccc;
	  	border-radius: 5px;
	  	padding: 10px;
	  	width: 100%;
	  	box-sizing: border-box;
	  }     
</style>
