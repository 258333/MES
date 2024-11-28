<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="唯一标识" prop="id">
        <el-input v-model="queryParams.id" placeholder="请输入唯一标识" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="员工ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入员工ID" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="出勤时间" prop="checkInTime">
        <el-date-picker clearable v-model="queryParams.checkInTime" type="date" value-format="YYYY-MM-DD"
          placeholder="请选择出勤时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="退勤时间" prop="checkOutTime">
        <el-date-picker clearable v-model="queryParams.checkOutTime" type="date" value-format="YYYY-MM-DD"
          placeholder="请选择退勤时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          v-hasPermi="['checkin:checkin:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['checkin:checkin:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['checkin:checkin:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['checkin:checkin:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="checkinList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="唯一标识" align="center" prop="id" />
      <el-table-column label="员工ID" align="center" prop="userId" />
      <el-table-column label="出勤时间" align="center" prop="checkInTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.checkInTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退勤时间" align="center" prop="checkOutTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.checkOutTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['checkin:checkin:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['checkin:checkin:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改出勤，记录员工的出勤信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="checkinRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="员工ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入员工ID" />
        </el-form-item>
        <el-form-item label="出勤时间" prop="checkInTime">
          <el-date-picker clearable v-model="form.checkInTime" type="date" value-format="YYYY-MM-DD"
            placeholder="请选择出勤时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="退勤时间" prop="checkOutTime">
          <el-date-picker clearable v-model="form.checkOutTime" type="date" value-format="YYYY-MM-DD"
            placeholder="请选择退勤时间">
          </el-date-picker>
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

<script setup name="Checkin">
import { listCheckin, getCheckin, delCheckin, addCheckin, updateCheckin } from "@/api/checkin/checkin";

const { proxy } = getCurrentInstance();

const checkinList = ref([]);
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
    id: null,
    userId: null,
    checkInTime: null,
    checkOutTime: null
  },
  rules: {
    userId: [
      { required: true, message: "员工ID不能为空", trigger: "blur" }
    ],
    checkInTime: [
      { required: true, message: "出勤时间不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询出勤，记录员工的出勤信息列表 */
function getList() {
  loading.value = true;
  listCheckin(queryParams.value).then(response => {
    checkinList.value = response.rows;
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
    id: null,
    userId: null,
    checkInTime: null,
    checkOutTime: null
  };
  proxy.resetForm("checkinRef");
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
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加出勤，记录员工的出勤信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getCheckin(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改出勤，记录员工的出勤信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["checkinRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateCheckin(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCheckin(form.value).then(response => {
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
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除出勤，记录员工的出勤信息编号为"' + _ids + '"的数据项？').then(function () {
    return delCheckin(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('checkin/checkin/export', {
    ...queryParams.value
  }, `checkin_${new Date().getTime()}.xlsx`)
}

getList();
</script>
