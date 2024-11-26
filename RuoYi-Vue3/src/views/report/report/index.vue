<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <!-- <el-form-item label="标识报工员工的唯一ID" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入标识报工员工的唯一ID" clearable @keyup.enter="handleQuery" />
      </el-form-item> -->
      <!-- <el-form-item label="报工员工的姓名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入报工员工的姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="班组" prop="teamName">
        <el-input v-model="queryParams.teamName" placeholder="请输入员工所在班组的名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="标识使用的机器" prop="machineId">
        <el-input
          v-model="queryParams.machineId"
          placeholder="请输入标识使用的机器"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标识对应工序的唯一ID" prop="operationId">
        <el-input
          v-model="queryParams.operationId"
          placeholder="请输入标识对应工序的唯一ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="工序" prop="operationName">
        <el-input v-model="queryParams.operationName" placeholder="请输入报工涉及的工序名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="报工的产品数量" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入报工的产品数量"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报工的开始时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择报工的开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="报工的结束时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择报工的结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="记录额外的报工信息" prop="remarks">
        <el-input
          v-model="queryParams.remarks"
          placeholder="请输入记录额外的报工信息"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item> -->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['report:report:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['report:report:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['report:report:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['report:report:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="reportList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="唯一标识每条报工记录" align="center" prop="workReportId" />
      <el-table-column label="标识报工员工的唯一ID" align="center" prop="userId" />
      <el-table-column label="报工员工的姓名" align="center" prop="username" />
      <el-table-column label="员工所在班组的名称" align="center" prop="teamName" />
      <el-table-column label="标识使用的机器" align="center" prop="machineId" />
      <el-table-column label="标识对应工序的唯一ID" align="center" prop="operationId" />
      <el-table-column label="报工涉及的工序名称" align="center" prop="operationName" />
      <el-table-column label="报工的产品数量" align="center" prop="quantity" />
      <el-table-column label="报工的开始时间" align="center" prop="startTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="报工的结束时间" align="center" prop="endTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="报工单的当前状态" align="center" prop="reportStatus" />
      <el-table-column label="记录额外的报工信息" align="center" prop="remarks" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['report:report:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['report:report:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改报工，用于记录员工的报工信息对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="reportRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标识报工员工的唯一ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入标识报工员工的唯一ID" />
        </el-form-item>
        <el-form-item label="报工员工的姓名" prop="username">
          <el-input v-model="form.username" placeholder="请输入报工员工的姓名" />
        </el-form-item>
        <el-form-item label="员工所在班组的名称" prop="teamName">
          <el-input v-model="form.teamName" placeholder="请输入员工所在班组的名称" />
        </el-form-item>
        <el-form-item label="标识使用的机器" prop="machineId">
          <el-input v-model="form.machineId" placeholder="请输入标识使用的机器" />
        </el-form-item>
        <el-form-item label="标识对应工序的唯一ID" prop="operationId">
          <el-input v-model="form.operationId" placeholder="请输入标识对应工序的唯一ID" />
        </el-form-item>
        <el-form-item label="报工涉及的工序名称" prop="operationName">
          <el-input v-model="form.operationName" placeholder="请输入报工涉及的工序名称" />
        </el-form-item>
        <el-form-item label="报工的产品数量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入报工的产品数量" />
        </el-form-item>
        <el-form-item label="报工的开始时间" prop="startTime">
          <el-date-picker clearable v-model="form.startTime" type="date" value-format="YYYY-MM-DD"
            placeholder="请选择报工的开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="报工的结束时间" prop="endTime">
          <el-date-picker clearable v-model="form.endTime" type="date" value-format="YYYY-MM-DD"
            placeholder="请选择报工的结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="记录额外的报工信息" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入记录额外的报工信息" />
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

<script setup name="Report">
import { listReport, getReport, delReport, addReport, updateReport } from "@/api/report/report";

const { proxy } = getCurrentInstance();

const reportList = ref([]);
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
    userId: null,
    username: null,
    teamName: null,
    machineId: null,
    operationId: null,
    operationName: null,
    quantity: null,
    startTime: null,
    endTime: null,
    reportStatus: null,
    remarks: null
  },
  rules: {
    userId: [
      { required: true, message: "标识报工员工的唯一ID不能为空", trigger: "blur" }
    ],
    username: [
      { required: true, message: "报工员工的姓名不能为空", trigger: "blur" }
    ],
    machineId: [
      { required: true, message: "标识使用的机器不能为空", trigger: "blur" }
    ],
    operationId: [
      { required: true, message: "标识对应工序的唯一ID不能为空", trigger: "blur" }
    ],
    quantity: [
      { required: true, message: "报工的产品数量不能为空", trigger: "blur" }
    ],
    startTime: [
      { required: true, message: "报工的开始时间不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询报工，用于记录员工的报工信息列表 */
function getList() {
  loading.value = true;
  listReport(queryParams.value).then(response => {
    reportList.value = response.rows;
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
    workReportId: null,
    userId: null,
    username: null,
    teamName: null,
    machineId: null,
    operationId: null,
    operationName: null,
    quantity: null,
    startTime: null,
    endTime: null,
    reportStatus: null,
    remarks: null
  };
  proxy.resetForm("reportRef");
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
  ids.value = selection.map(item => item.workReportId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加报工，用于记录员工的报工信息";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _workReportId = row.workReportId || ids.value
  getReport(_workReportId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改报工，用于记录员工的报工信息";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["reportRef"].validate(valid => {
    if (valid) {
      if (form.value.workReportId != null) {
        updateReport(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addReport(form.value).then(response => {
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
  const _workReportIds = row.workReportId || ids.value;
  proxy.$modal.confirm('是否确认删除报工，用于记录员工的报工信息编号为"' + _workReportIds + '"的数据项？').then(function () {
    return delReport(_workReportIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('report/report/export', {
    ...queryParams.value
  }, `report_${new Date().getTime()}.xlsx`)
}

getList();
</script>
