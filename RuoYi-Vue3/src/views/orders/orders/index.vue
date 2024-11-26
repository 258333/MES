<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="制令编号" prop="orderNumber">
        <el-input v-model="queryParams.orderNumber" placeholder="请输入制令编号" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="制令类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择制令类型" clearable>
          <el-option v-for="dict in order_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="批次号" prop="batchNumber">
        <el-input v-model="queryParams.batchNumber" placeholder="请输入批次号" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="制令状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择制令状态" clearable>
          <el-option v-for="dict in order_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!-- <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['orders:orders:add']">新增</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button type="info" plain icon="Sort" @click="toggleExpandAll">展开/折叠</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-if="refreshTable" v-loading="loading" :data="ordersList" row-key="id" :default-expand-all="isExpandAll"
      :tree-props="{ children: 'children', hasChildren: 'hasChildren' }">

      <el-table-column label="制令编号" prop="orderNumber" width="200" /> <!-- 增加宽度 -->

      <el-table-column label="制令类型" align="center" prop="type" width="80">
        <!-- <template #default="scope">
      <dict-tag :options="order_type" :value="scope.row.type" />
    </template> -->
      </el-table-column>

      <el-table-column label="合同" align="center" prop="contractName" width="80" /> <!-- 减少宽度 -->

      <el-table-column label="产品" align="center" prop="productName" width="80" /> <!-- 减少宽度 -->

      <el-table-column label="工序" align="center" prop="operation" width="80" />

      <el-table-column label="数量" align="center" prop="quantity" width="80" />

      <el-table-column label="批次号" align="center" prop="batchNumber" width="150" />

      <el-table-column label="制令状态" align="center" prop="status" width="80">
        <!-- <template #default="scope">
      <dict-tag :options="order_status" :value="scope.row.status" />
    </template> -->
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button v-if="scope.row.type === '子制令' && scope.row.status == '待生产'" link type="primary" icon="Edit"
            @click="handleAssign(scope.row)">分配</el-button>
          <!-- <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['orders:orders:edit']">修改</el-button> -->
          <!-- <el-button link type="primary" icon="Plus" @click="handleAdd(scope.row)"
        v-hasPermi="['orders:orders:add']">新增</el-button> -->
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['orders:orders:remove']">删除</el-button>
        </template>
      </el-table-column>

    </el-table>


    <!-- 分配任务的信息对话框 -->
    <el-dialog :title="title" v-model="open" width="300px" append-to-body>
      <el-form ref="ordersRef" :model="formSecond" :rules="rules" label-width="80px">
        <el-select v-model="formSecond.userId" placeholder="选择员工" size="large" style="width: 240px">
          <el-option v-for="item in userInfoList" :key="item.userId" :label="item.userName" :value="item.userId" />
        </el-select>
        <!-- <el-select v-model="formSecond.machineId" placeholder="选择机器" size="large" style="width: 240px">
          <el-option v-for="item in machineList" :key="item.machineId" :label="item.machineName"
            :value="item.machineId" />
        </el-select> -->
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitFormSecond">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Orders">
import { listOrders, getOrders, delOrders, addOrders, updateOrders } from "@/api/orders/orders";
import { userInfoListApi, machineListApi, taskAssignmentApi } from "@/api/other";

const { proxy } = getCurrentInstance();
const { order_status, order_type } = proxy.useDict('order_status', 'order_type');

const ordersList = ref([]);
const ordersOptions = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const title = ref("");
const isExpandAll = ref(true);
const refreshTable = ref(true);
const userInfoList = ref([])
const machineList = ref([])
const formSecond = ref({})

const data = reactive({
  form: {},
  queryParams: {
    orderNumber: null,
    type: null,
    batchNumber: null,
    status: null,
  },
  rules: {
    orderNumber: [
      { required: true, message: "制令编号不能为空", trigger: "blur" }
    ],
    type: [
      { required: true, message: "制令类型不能为空", trigger: "change" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

//获取用户信息
function getUserInfoList() {
  // console.log(1)
  userInfoListApi().then(response => {
    userInfoList.value = response.data;
  });
  // console.log("userInfoList :", userInfoList);
}

//获取可以使用的机器列表
function getMachineList(operationId) {
  // console.log("operationId :", operationId)
  machineListApi(operationId).then(response => {
    machineList.value = response.data;
  })
  // console.log("machine", machineList);
}


/** 查询制令，存储总制令、分制令和子制令的信息列表 */
function getList() {
  loading.value = true;
  listOrders(queryParams.value).then(response => {
    ordersList.value = proxy.handleTree(response.data, "id", "parentId");
    loading.value = false;
  });
  // console.log("orderList :", ordersList)
}

/** 查询制令，存储总制令、分制令和子制令的信息下拉树结构 */
function getTreeselect() {
  listOrders().then(response => {
    ordersOptions.value = [];
    const data = { id: 0, orderNumber: '顶级节点', children: [] };
    data.children = proxy.handleTree(response.data, "id", "parentId");
    ordersOptions.value.push(data);
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    orderNumber: null,
    parentId: null,
    type: null,
    contractId: null,
    productId: null,
    quantity: null,
    batchNumber: null,
    status: null,
    createdDate: null,
    modifiedDate: null
  };
  proxy.resetForm("ordersRef");
}

// 表单重置
function resetSecond() {
  formSecond.value = {};
  proxy.resetForm("ordersRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// /** 新增按钮操作 */
// function handleAdd(row) {
//   reset();
//   getTreeselect();
//   if (row != null && row.id) {
//     form.value.parentId = row.id;
//   } else {
//     form.value.parentId = 0;
//   }
//   open.value = true;
//   title.value = "添加制令，存储总制令、分制令和子制令的信息";
// }

/** 展开/折叠操作 */
function toggleExpandAll() {
  refreshTable.value = false;
  isExpandAll.value = !isExpandAll.value;
  nextTick(() => {
    refreshTable.value = true;
  });
}

// /** 修改按钮操作 */
// async function handleUpdate(row) {
//   reset();
//   await getTreeselect();
//   if (row != null) {
//     form.value.parentId = row.parentId;
//   }
//   getOrders(row.id).then(response => {
//     form.value = response.data;
//     open.value = true;
//     title.value = "修改制令，存储总制令、分制令和子制令的信息";
//   });
// }

/** 提交按钮 */
function submitFormSecond() {
  proxy.$refs["ordersRef"].validate(valid => {
    // console.log("formSecond :", formSecond);
    if (valid) {
      taskAssignmentApi(formSecond.value).then(response => {
        proxy.$modal.msgSuccess("分配成功");
        getList();
        open.value = false;
      });
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除制令，存储总制令、分制令和子制令的信息编号为"' + row.id + '"的数据项？').then(function () {
    return delOrders(row.id);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}


//处理任务分配 
function handleAssign(row) {
  reset();
  open.value = true;
  title.value = "任务分配";
  // console.log("row :", row);
  formSecond.value.orderId = row.id
  formSecond.value.operationId = row.operationId
  getUserInfoList();
  getMachineList(row.operationId)
}
getList();

</script>
