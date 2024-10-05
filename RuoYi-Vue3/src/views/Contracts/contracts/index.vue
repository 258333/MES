<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="合同编号" prop="contractNumber">
        <el-input v-model="queryParams.contractNumber" placeholder="请输入合同编号" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="客户名称" prop="customerName">
        <el-input v-model="queryParams.customerName" placeholder="请输入客户名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="联系人" prop="contactPerson">
        <el-input v-model="queryParams.contactPerson" placeholder="请输入联系人" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="合同开始日期" prop="startDate">
        <el-date-picker clearable v-model="queryParams.startDate" type="date" value-format="YYYY-MM-DD"
          placeholder="请选择合同开始日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="合同状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择合同状态" clearable>
          <el-option v-for="dict in contract_status" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="合同名称" prop="contractName">
        <el-input v-model="queryParams.contractName" placeholder="请输入合同名称" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          v-hasPermi="['Contracts:contracts:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['Contracts:contracts:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['Contracts:contracts:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['Contracts:contracts:export']">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="contractsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="合同编号" align="center" prop="contractNumber" />
      <el-table-column label="合同名称" align="center" prop="contractName" />
      <el-table-column label="客户名称" align="center" prop="customerName" />
      <el-table-column label="联系人" align="center" prop="contactPerson" />
      <el-table-column label="联系电话" align="center" prop="contactNumber" />
      <el-table-column label="客户地址" align="center" prop="address" />
      <el-table-column label="合同状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="contract_status" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['Contracts:contracts:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['Contracts:contracts:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改合同，存储合同相关信息及其产品详情对话框 -->
    <el-dialog :title="title" v-model="open" width="1000px" append-to-body>
      <el-form ref="contractsRef" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="合同编号" prop="contractNumber">
              <el-input v-model="form.contractNumber" placeholder="请输入合同编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同名称" prop="contractName">
              <el-input v-model="form.contractName" placeholder="请输入合同名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="客户名称" prop="customerName">
              <el-input v-model="form.customerName" placeholder="请输入客户名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系人" prop="contactPerson">
              <el-input v-model="form.contactPerson" placeholder="请输入联系人" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="联系电话" prop="contactNumber">
              <el-input v-model="form.contactNumber" placeholder="请输入联系电话" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="客户地址" prop="address">
              <el-input v-model="form.address" placeholder="请输入客户地址" />
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="合同开始日期" prop="startDate">
              <el-date-picker clearable v-model="form.startDate" type="date" value-format="YYYY-MM-DD"
                placeholder="请选择合同开始日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同结束日期" prop="endDate">
              <el-date-picker clearable v-model="form.endDate" type="date" value-format="YYYY-MM-DD"
                placeholder="请选择合同结束日期">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="合同总金额" prop="totalValue">
              <el-input v-model="form.totalValue" placeholder="请输入合同总金额" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="合同状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择合同状态">
                <el-option v-for="dict in contract_status" :key="dict.value" :label="dict.label"
                  :value="dict.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-for="(product, index) in products" :key="index">
          <el-col :span="8">
            <el-form-item label="产品名称" :prop="'products.' + index + '.productName'">
              <el-select v-model="product.productName" placeholder="">
                <el-option v-for="(product, indexx) in productsList" :key="product.productId"
                  :label="product.productName" :value="product.productName"
                  @click="onProductChange(index, indexx)"></el-option>
              </el-select>
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="数量" :prop="'products.' + index + '.quantity'">
              <el-input-number v-model="product.quantity" :min="1" @change="updateallPrice(index)" />
            </el-form-item>
          </el-col>

          <el-col :span="6">
            <el-form-item label="总价" :prop="'products.' + index + '.allPrice'">
              <el-input-number v-model="product.allPrice" :min="0" />
            </el-form-item>
          </el-col>

          <el-col :span="4">
            <el-button type="danger" @click="removeProduct(index)">删除</el-button>
          </el-col>
        </el-row>

        <!-- 添加产品按钮 -->
        <el-form-item>
          <el-button type="primary" @click="addProduct">添加产品</el-button>
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
import { listProducts } from "@/api/products/products";

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
const productsList = ref([]);

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
    contractName: null,
    productDetails: null,
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

const products = reactive([])

/** 查询合同，存储合同相关信息及其产品详情列表 */
function getList() {
  loading.value = true;
  listContracts(queryParams.value).then(response => {
    contractsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}
/** 查询产品，存储产品相关信息列表 */
function getProductsList() {
  loading.value = true;
  listProducts(queryParams.value).then(response => {
    productsList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
  // console.log(productsList);
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
  products.splice(0, products.length);
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
  // console.log(row);
  reset();
  const _contractId = row.contractId || ids.value
  getContracts(_contractId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改合同，存储合同相关信息及其产品详情";
  });
  products.splice(0, products.length);
  products.push(...row.productDetails)

}

//判断合同中的产品列表中的产品名称是否为空
function checkProductName() {
  //遍历产品列表
  for (let i = 0; i < products.length; i++) {
    //判断产品名称是否为空
    if (products[i].productName == null || products[i].productName == "") {
      proxy.$modal.msgError("产品名称不能为空");
      return false;
    }
  }
  return true;
}

/** 提交按钮 */
function submitForm() {
  form.value.productDetails = products;
  proxy.$refs["contractsRef"].validate(valid => {
    if (valid) {
      if (form.value.contractId != null) {
        if (checkProductName()) {
          console.log(checkProductName());
          updateContracts(form.value).then(response => {
            proxy.$modal.msgSuccess("修改成功");
            open.value = false;
            getList();
          });
        }
      } else {
        if (checkProductName()) {
          addContracts(form.value).then(response => {
            proxy.$modal.msgSuccess("新增成功");
            open.value = false;
            getList();
          });
        }
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _contractIds = row.contractId || ids.value;
  proxy.$modal.confirm('是否确认删除合同，存储合同相关信息及其产品详情编号为"' + _contractIds + '"的数据项？').then(function () {
    return delContracts(_contractIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('Contracts/contracts/export', {
    ...queryParams.value
  }, `contracts_${new Date().getTime()}.xlsx`)
}

//在选择产品之后自动添加其他信息
const onProductChange = (index, indexx) => {
  products[index].unitPrice = productsList.value[indexx].price;
  products[index].productCode = productsList.value[indexx].productCode;
  products[index].allPrice = productsList.value[indexx].price * products[index].quantity;
  products[index].productId = productsList.value[indexx].productId;
}
//根据数量修改总价
const updateallPrice = (index) => {
  // 根据数量更新单价
  // 根据需要自定义单价计算方式，这里假设单价为固定值
  products[index].allPrice = products[index].quantity * products[index].unitPrice;
}

//添加产品信息
const addProduct = () => {
  products.push({
    productCode: "",
    productName: "",
    quantity: 1,
    unitPrice: 0,
    allPrice: 0,
  });
};

const removeProduct = (index) => {
  products.splice(index, 1);
};


getList();
getProductsList();
</script>
