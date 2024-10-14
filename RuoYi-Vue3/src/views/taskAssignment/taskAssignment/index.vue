<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="制令ID" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入制令ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="员工ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入员工ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机器ID" prop="machineId">
        <el-input
          v-model="queryParams.machineId"
          placeholder="请输入机器ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务分配时间" prop="assignedDate">
        <el-date-picker clearable
          v-model="queryParams.assignedDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择任务分配时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否完成工序" prop="isCompleted">
        <el-input
          v-model="queryParams.isCompleted"
          placeholder="请输入是否完成工序"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备注" prop="remarks">
        <el-input
          v-model="queryParams.remarks"
          placeholder="请输入备注"
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
          v-hasPermi="['taskAssignment:taskAssignment:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['taskAssignment:taskAssignment:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['taskAssignment:taskAssignment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['taskAssignment:taskAssignment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taskAssignmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="任务分配ID" align="center" prop="takeId" />
      <el-table-column label="制令ID" align="center" prop="orderId" />
      <el-table-column label="员工ID" align="center" prop="userId" />
      <el-table-column label="机器ID" align="center" prop="machineId" />
      <el-table-column label="任务分配时间" align="center" prop="assignedDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.assignedDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否完成工序" align="center" prop="isCompleted" />
      <el-table-column label="备注" align="center" prop="remarks" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['taskAssignment:taskAssignment:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['taskAssignment:taskAssignment:remove']">删除</el-button>
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

    <!-- 添加或修改任务分配，存储每个子制令的任务分配情况对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="taskAssignmentRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="制令ID" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入制令ID" />
        </el-form-item>
        <el-form-item label="员工ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入员工ID" />
        </el-form-item>
        <el-form-item label="机器ID" prop="machineId">
          <el-input v-model="form.machineId" placeholder="请输入机器ID" />
        </el-form-item>
        <el-form-item label="任务分配时间" prop="assignedDate">
          <el-date-picker clearable
            v-model="form.assignedDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择任务分配时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="是否完成工序" prop="isCompleted">
          <el-input v-model="form.isCompleted" placeholder="请输入是否完成工序" />
        </el-form-item>
        <el-form-item label="备注" prop="remarks">
          <el-input v-model="form.remarks" placeholder="请输入备注" />
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

<script setup name="TaskAssignment">
import { listTaskAssignment, getTaskAssignment, delTaskAssignment, addTaskAssignment, updateTaskAssignment } from "@/api/taskAssignment/taskAssignment";

const { proxy } = getCurrentInstance();

const taskAssignmentList = ref([]);
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
    orderId: null,
    userId: null,
    machineId: null,
    assignedDate: null,
    isCompleted: null,
    remarks: null
  },
  rules: {
    orderId: [
      { required: true, message: "制令ID不能为空", trigger: "blur" }
    ],
    userId: [
      { required: true, message: "员工ID不能为空", trigger: "blur" }
    ],
    machineId: [
      { required: true, message: "机器ID不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询任务分配，存储每个子制令的任务分配情况列表 */
function getList() {
  loading.value = true;
  listTaskAssignment(queryParams.value).then(response => {
    taskAssignmentList.value = response.rows;
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
    takeId: null,
    orderId: null,
    userId: null,
    machineId: null,
    assignedDate: null,
    isCompleted: null,
    remarks: null
  };
  proxy.resetForm("taskAssignmentRef");
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
  ids.value = selection.map(item => item.takeId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加任务分配，存储每个子制令的任务分配情况";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _takeId = row.takeId || ids.value
  getTaskAssignment(_takeId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改任务分配，存储每个子制令的任务分配情况";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["taskAssignmentRef"].validate(valid => {
    if (valid) {
      if (form.value.takeId != null) {
        updateTaskAssignment(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTaskAssignment(form.value).then(response => {
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
  const _takeIds = row.takeId || ids.value;
  proxy.$modal.confirm('是否确认删除任务分配，存储每个子制令的任务分配情况编号为"' + _takeIds + '"的数据项？').then(function() {
    return delTaskAssignment(_takeIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('taskAssignment/taskAssignment/export', {
    ...queryParams.value
  }, `taskAssignment_${new Date().getTime()}.xlsx`)
}

getList();
</script>
