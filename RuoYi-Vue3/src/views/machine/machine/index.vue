<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="机器名称" prop="machineName">
        <el-input v-model="queryParams.machineName" placeholder="请输入机器名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="机器类型" prop="machineType">
        <el-input v-model="queryParams.machineType" placeholder="请输入机器类型" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="机器状态" prop="status">
        <el-input v-model="queryParams.status" placeholder="请输入机器状态" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="机器描述" prop="description">
        <el-input v-model="queryParams.description" placeholder="请输入机器描述" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          v-hasPermi="['machine:machine:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['machine:machine:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['machine:machine:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['machine:machine:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="machineList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="机器ID" align="center" prop="machineId" />
      <el-table-column label="机器名称" align="center" prop="machineName" />
      <el-table-column label="机器类型" align="center" prop="machineType" />
      <el-table-column label="机器状态" align="center" prop="status" />
      <el-table-column label="机器描述" align="center" prop="description" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['machine:machine:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['machine:machine:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改机器，存储所有机器的相关信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="machineRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="机器名称" prop="machineName">
          <el-input v-model="form.machineName" placeholder="请输入机器名称" />
        </el-form-item>
        <el-form-item label="机器类型" prop="machineType">
          <el-input v-model="form.machineType" placeholder="请输入机器类型" />
        </el-form-item>
        <el-form-item label="机器状态" prop="status">
          <el-input v-model="form.status" placeholder="请输入机器状态" />
        </el-form-item>
        <el-form-item label="机器描述" prop="description">
          <el-input v-model="form.description" placeholder="请输入机器描述" />
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

<script setup name="Machine">
import { listMachine, getMachine, delMachine, addMachine, updateMachine } from "@/api/machine/machine";

const { proxy } = getCurrentInstance();

const machineList = ref([]);
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
    machineName: null,
    machineType: null,
    status: null,
    description: null,
  },
  rules: {
    machineName: [
      { required: true, message: "机器名称不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询机器，存储所有机器的相关信息列表 */
function getList() {
  loading.value = true;
  listMachine(queryParams.value).then(response => {
    machineList.value = response.rows;
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
    machineId: null,
    machineName: null,
    machineType: null,
    status: null,
    description: null,
    createdDate: null,
    modifiedDate: null
  };
  proxy.resetForm("machineRef");
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
  ids.value = selection.map(item => item.machineId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加机器，存储所有机器的相关信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _machineId = row.machineId || ids.value
  getMachine(_machineId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改机器，存储所有机器的相关信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["machineRef"].validate(valid => {
    if (valid) {
      if (form.value.machineId != null) {
        updateMachine(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addMachine(form.value).then(response => {
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
  const _machineIds = row.machineId || ids.value;
  proxy.$modal.confirm('是否确认删除机器，存储所有机器的相关信息编号为"' + _machineIds + '"的数据项？').then(function () {
    return delMachine(_machineIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('machine/machine/export', {
    ...queryParams.value
  }, `machine_${new Date().getTime()}.xlsx`)
}

getList();
</script>
