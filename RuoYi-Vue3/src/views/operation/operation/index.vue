<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="工序名称" prop="operationName">
        <el-input
          v-model="queryParams.operationName"
          placeholder="请输入工序名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工序描述" prop="description">
        <el-input
          v-model="queryParams.description"
          placeholder="请输入工序描述"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工序预计时长" prop="duration">
        <el-input
          v-model="queryParams.duration"
          placeholder="请输入工序预计时长"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['operation:operation:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['operation:operation:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['operation:operation:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['operation:operation:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="operationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="工序ID" align="center" prop="operationId" />
      <el-table-column label="工序名称" align="center" prop="operationName" />
      <el-table-column label="工序描述" align="center" prop="description" />
      <el-table-column label="工序预计时长" align="center" prop="duration" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['operation:operation:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['operation:operation:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改工序，存储工序及其相关信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="operationRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="工序名称" prop="operationName">
          <el-input v-model="form.operationName" placeholder="请输入工序名称" />
        </el-form-item>
        <el-form-item label="工序描述" prop="description">
          <el-input v-model="form.description" placeholder="请输入工序描述" />
        </el-form-item>
        <el-form-item label="工序预计时长" prop="duration">
          <el-input v-model="form.duration" placeholder="请输入工序预计时长" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Operation">
import { listOperation, getOperation, delOperation, addOperation, updateOperation } from "@/api/operation/operation";

const { proxy } = getCurrentInstance();

const operationList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    operationName: null,
    description: null,
    duration: null,
  },
  rules: {
    operationName: [
      { required: true, message: "工序名称不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询工序，存储工序及其相关信息列表 */
function getList() {
  loading.value = true;
  listOperation(queryParams.value).then(response => {
    operationList.value = response.rows;
    total.value = response.total;
    loading.value = false;
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
    operationId: null,
    operationName: null,
    description: null,
    duration: null,
    createdDate: null,
    modifiedDate: null
  };
  proxy.resetForm("operationRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.operationId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加工序，存储工序及其相关信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _operationId = row.operationId || ids.value
  getOperation(_operationId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改工序，存储工序及其相关信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["operationRef"].validate(valid => {
    if (valid) {
      if (form.value.operationId != null) {
        updateOperation(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addOperation(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _operationIds = row.operationId || ids.value;
  proxy.$modal.confirm('是否确认删除工序，存储工序及其相关信息编号为"' + _operationIds + '"的数据项？').then(function() {
    return delOperation(_operationIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('operation/operation/export', {
    ...queryParams.value
  }, `operation_${new Date().getTime()}.xlsx`)
}

getList();
</script>
