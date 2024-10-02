<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="合同编号" prop="contractNumber">
        <el-input
          v-model="queryParams.contractNumber"
          placeholder="请输入合同编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户名称" prop="customerName">
        <el-input
          v-model="queryParams.customerName"
          placeholder="请输入客户名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系人" prop="contactPerson">
        <el-input
          v-model="queryParams.contactPerson"
          placeholder="请输入联系人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合同开始日期" prop="startDate">
        <el-date-picker clearable
          v-model="queryParams.startDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择合同开始日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="合同状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择合同状态" clearable>
          <el-option
            v-for="dict in contract_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="合同名称" prop="contractName">
        <el-input
          v-model="queryParams.contractName"
          placeholder="请输入合同名称"
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
          v-hasPermi="['Contracts:contracts:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['Contracts:contracts:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['Contracts:contracts:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['Contracts:contracts:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="contractsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="合同唯一标识" align="center" prop="contractId" />
      <el-table-column label="合同编号" align="center" prop="contractNumber" />
      <el-table-column label="客户名称" align="center" prop="customerName" />
      <el-table-column label="联系人" align="center" prop="contactPerson" />
      <el-table-column label="联系电话" align="center" prop="contactNumber" />
      <el-table-column label="客户地址" align="center" prop="address" />
      <el-table-column label="合同开始日期" align="center" prop="startDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="合同结束日期" align="center" prop="endDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="合同总金额" align="center" prop="totalValue" />
      <el-table-column label="合同状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="contract_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建日期" align="center" prop="createdDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="产品编号及数量信息 (JSON格式)" align="center" prop="productDetails" />
      <el-table-column label="合同名称" align="center" prop="contractName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['Contracts:contracts:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['Contracts:contracts:remove']">删除</el-button>
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

    <!-- 添加或修改合同，存储合同相关信息及其产品详情对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="contractsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="合同编号" prop="contractNumber">
          <el-input v-model="form.contractNumber" placeholder="请输入合同编号" />
        </el-form-item>
        <el-form-item label="客户名称" prop="customerName">
          <el-input v-model="form.customerName" placeholder="请输入客户名称" />
        </el-form-item>
        <el-form-item label="联系人" prop="contactPerson">
          <el-input v-model="form.contactPerson" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系电话" prop="contactNumber">
          <el-input v-model="form.contactNumber" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="客户地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入客户地址" />
        </el-form-item>
        <el-form-item label="合同开始日期" prop="startDate">
          <el-date-picker clearable
            v-model="form.startDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择合同开始日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="合同结束日期" prop="endDate">
          <el-date-picker clearable
            v-model="form.endDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择合同结束日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="合同总金额" prop="totalValue">
          <el-input v-model="form.totalValue" placeholder="请输入合同总金额" />
        </el-form-item>
        <el-form-item label="合同状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择合同状态">
            <el-option
              v-for="dict in contract_status"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="合同名称" prop="contractName">
          <el-input v-model="form.contractName" placeholder="请输入合同名称" />
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

<script setup name="Contracts">
import { listContracts, getContracts, delContracts, addContracts, updateContracts } from "@/api/Contracts/contracts";

const { proxy } = getCurrentInstance();
const { contract_status } = proxy.useDict('contract_status');

const contractsList = ref([]);
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
    contractNumber: null,
    customerName: null,
    contactPerson: null,
    startDate: null,
    status: null,
    contractName: null
  },
  rules: {
    contractNumber: [
      { required: true, message: "合同编号不能为空", trigger: "blur" }
    ],
    customerName: [
      { required: true, message: "客户名称不能为空", trigger: "blur" }
    ],
    contractName: [
      { required: true, message: "合同名称不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询合同，存储合同相关信息及其产品详情列表 */
function getList() {
  loading.value = true;
  listContracts(queryParams.value).then(response => {
    contractsList.value = response.rows;
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
    contractId: null,
    contractNumber: null,
    customerName: null,
    contactPerson: null,
    contactNumber: null,
    address: null,
    startDate: null,
    endDate: null,
    totalValue: null,
    status: null,
    createdDate: null,
    modifiedDate: null,
    productDetails: null,
    contractName: null
  };
  proxy.resetForm("contractsRef");
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
  ids.value = selection.map(item => item.contractId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加合同，存储合同相关信息及其产品详情";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _contractId = row.contractId || ids.value
  getContracts(_contractId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改合同，存储合同相关信息及其产品详情";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["contractsRef"].validate(valid => {
    if (valid) {
      if (form.value.contractId != null) {
        updateContracts(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addContracts(form.value).then(response => {
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
  const _contractIds = row.contractId || ids.value;
  proxy.$modal.confirm('是否确认删除合同，存储合同相关信息及其产品详情编号为"' + _contractIds + '"的数据项？').then(function() {
    return delContracts(_contractIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('Contracts/contracts/export', {
    ...queryParams.value
  }, `contracts_${new Date().getTime()}.xlsx`)
}

getList();
</script>
