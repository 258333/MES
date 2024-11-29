/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : ry_vue

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 29/11/2024 16:09:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'tb_contracts', '合同表，存储合同相关信息及其产品详情', NULL, NULL, 'Contracts', 'crud', 'element-plus', 'com.ruoyi.system', 'Contracts', 'contracts', '合同，存储合同相关信息及其产品详情', 'HongWei', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35', NULL);
INSERT INTO `gen_table` VALUES (3, 'tb_products', '产品表，存储产品相关信息', NULL, NULL, 'Products', 'crud', 'element-plus', 'com.ruoyi.system', 'products', 'products', '产品，存储产品相关信息', 'HongWei', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-10-02 17:24:19', '', '2024-10-11 22:10:38', NULL);
INSERT INTO `gen_table` VALUES (4, 'tb_orders', '制令表，存储总制令、分制令和子制令的信息', '', '', 'Orders', 'tree', 'element-plus', 'com.ruoyi.system', 'orders', 'orders', '制令，存储总制令、分制令和子制令的信息', 'HongWei', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"order_number\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":0}', 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32', NULL);
INSERT INTO `gen_table` VALUES (6, 'tb_machine', '机器表，存储所有机器的相关信息', NULL, NULL, 'Machine', 'crud', 'element-plus', 'com.ruoyi.system', 'machine', 'machine', '机器，存储所有机器的相关信息', 'HongWei', '0', '/', '{\"parentMenuId\":0}', 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48', NULL);
INSERT INTO `gen_table` VALUES (7, 'tb_operation', '工序表，存储工序及其相关信息', NULL, NULL, 'Operation', 'crud', 'element-plus', 'com.ruoyi.system', 'operation', 'operation', '工序，存储工序及其相关信息', 'HongWei', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55', NULL);
INSERT INTO `gen_table` VALUES (8, 'tb_material', '物料表，存储生产所需的物料信息', NULL, NULL, 'Material', 'crud', 'element-plus', 'com.ruoyi.system', 'material', 'material', '物料，存储生产所需的物料信息', 'HongWei', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57', NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_work_report', '报工表，用于记录员工的报工信息', NULL, NULL, 'WorkReport', 'crud', 'element-plus', 'com.ruoyi.system', 'report', 'report', '报工，用于记录员工的报工信息', 'HongWei', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33', NULL);
INSERT INTO `gen_table` VALUES (10, 'tb_task', '任务分配表，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息', NULL, NULL, 'Task', 'crud', 'element-plus', 'com.ruoyi.system', 'task', 'task', '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息', 'HongWei', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40', NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_task_machine', '任务与机器的关联表，用于记录任务在特定机器上的使用情况', NULL, NULL, 'TaskMachine', 'crud', '', 'com.ruoyi.system', 'system', 'machine', '任务与机器的关联，用于记录任务在特定机器上的使用情况', 'HongWei', '0', '/', NULL, 'admin', '2024-11-27 18:09:28', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'tb_checkin', '出勤', NULL, NULL, 'Checkin', 'crud', 'element-plus', 'com.ruoyi.system', 'checkin', 'checkin', '出勤，记录员工的出勤信息', 'HongWei', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2024-11-28 09:43:31', '', '2024-11-28 09:44:44', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (14, 2, 'contract_id', '合同唯一标识', 'int', 'Long', 'contractId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (15, 2, 'contract_number', '合同编号', 'varchar(50)', 'String', 'contractNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (16, 2, 'customer_name', '客户名称', 'varchar(100)', 'String', 'customerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (17, 2, 'contact_person', '联系人', 'varchar(100)', 'String', 'contactPerson', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (18, 2, 'contact_number', '联系电话', 'varchar(20)', 'String', 'contactNumber', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (19, 2, 'address', '客户地址', 'varchar(255)', 'String', 'address', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (20, 2, 'start_date', '合同开始日期', 'date', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (21, 2, 'end_date', '合同结束日期', 'date', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 8, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (22, 2, 'total_value', '合同总金额', 'decimal(10,2)', 'BigDecimal', 'totalValue', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (23, 2, 'status', '合同状态（如：有效、无效）', 'varchar(20)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'contract_status', 10, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (24, 2, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '0', '0', '1', '0', 'EQ', 'datetime', '', 11, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (25, 2, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 12, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (26, 2, 'product_details', '产品编号及数量信息 (JSON格式)', 'json', 'String', 'productDetails', '0', '0', '0', '1', '1', '1', '0', 'EQ', NULL, '', 13, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (27, 2, 'contract_name', '合同名称', 'varchar(100)', 'String', 'contractName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 14, 'admin', '2024-10-02 14:20:30', '', '2024-10-02 14:35:35');
INSERT INTO `gen_table_column` VALUES (28, 3, 'product_id', '产品唯一标识', 'int', 'Long', 'productId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (29, 3, 'product_name', '产品名称', 'varchar(100)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (30, 3, 'product_code', '产品编号（或SKU）', 'varchar(50)', 'String', 'productCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (31, 3, 'category', '产品分类', 'varchar(50)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'product_category', 4, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (32, 3, 'price', '产品单价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (33, 3, 'description', '产品描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'textarea', '', 6, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (34, 3, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (35, 3, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-10-02 17:24:19', '', '2024-10-12 12:51:25');
INSERT INTO `gen_table_column` VALUES (36, 4, 'id', '唯一标识', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (37, 4, 'order_number', '制令编号', 'varchar(50)', 'String', 'orderNumber', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (38, 4, 'parent_id', '父制令 ID', 'int', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (39, 4, 'type', '制令类型（如：总制令、分制令、子制令）', 'varchar(20)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'order_type', 4, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (40, 4, 'contract_id', '关联的合同 ID', 'int', 'Long', 'contractId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (41, 4, 'product_id', '关联的产品 ID', 'int', 'Long', 'productId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (42, 4, 'quantity', '生产数量', 'int', 'Long', 'quantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (44, 4, 'status', '制令状态（如：待生产、生产中、已完成、已发货、已关闭、暂停、异常）', 'varchar(20)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'order_status', 9, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (45, 4, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (46, 4, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2024-10-05 13:46:19', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (47, 4, 'operation', '工序', 'varchar(100)', 'String', 'operation', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2024-10-10 00:29:29', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (56, 6, 'machine_id', '机器ID', 'int', 'Long', 'machineId', '1', '1', '0', '0', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (57, 6, 'machine_name', '机器名称', 'varchar(100)', 'String', 'machineName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (58, 6, 'machine_type', '机器类型', 'varchar(50)', 'String', 'machineType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (59, 6, 'status', '机器状态（可用、占用、维护中）', 'varchar(20)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (60, 6, 'description', '机器描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (61, 6, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 6, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (62, 6, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 7, 'admin', '2024-10-12 13:07:22', '', '2024-10-13 10:18:48');
INSERT INTO `gen_table_column` VALUES (63, 7, 'operation_id', '工序ID', 'int', 'Long', 'operationId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (64, 7, 'operation_name', '工序名称', 'varchar(100)', 'String', 'operationName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (65, 7, 'description', '工序描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (66, 7, 'duration', '工序预计时长（小时）', 'decimal(10,2)', 'BigDecimal', 'duration', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (67, 7, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 5, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (68, 7, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 6, 'admin', '2024-10-12 13:07:22', '', '2024-10-12 13:08:55');
INSERT INTO `gen_table_column` VALUES (72, 4, 'operation_id', '工序ID', 'int', 'Long', 'operationId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2024-10-13 09:38:52', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (75, 8, 'material_id', '物料ID', 'int', 'Long', 'materialId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (76, 8, 'material_name', '物料名称', 'varchar(100)', 'String', 'materialName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (77, 8, 'unit', '单位（如吨、公斤、个）', 'varchar(20)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (78, 8, 'quantity', '库存数量', 'decimal(10,2)', 'BigDecimal', 'quantity', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (79, 8, 'price', '单价（当期出库加权价格）', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (80, 8, 'status', '物料状态（可用、不可用）', 'varchar(20)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (81, 8, 'description', '物料描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (82, 8, 'created_date', '创建日期', 'datetime', 'Date', 'createdDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 8, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (83, 8, 'modified_date', '修改日期', 'datetime', 'Date', 'modifiedDate', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, 'admin', '2024-11-02 17:37:07', '', '2024-11-02 17:37:57');
INSERT INTO `gen_table_column` VALUES (84, 9, 'work_report_id', '唯一标识每条报工记录', 'int', 'Long', 'workReportId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (85, 9, 'user_id', '标识报工员工的唯一ID', 'int', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (86, 9, 'username', '报工员工的姓名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (87, 9, 'team_name', '员工所在班组的名称', 'varchar(50)', 'String', 'teamName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (88, 9, 'machine_id', '标识使用的机器', 'int', 'Long', 'machineId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (89, 9, 'operation_id', '标识对应工序的唯一ID', 'int', 'Long', 'operationId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (90, 9, 'operation_name', '报工涉及的工序名称', 'varchar(50)', 'String', 'operationName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (91, 9, 'quantity', '报工的产品数量', 'int', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (92, 9, 'start_time', '报工的开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (93, 9, 'end_time', '报工的结束时间', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (94, 9, 'report_status', '报工单的当前状态（如已完成、进行中）', 'varchar(20)', 'String', 'reportStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (95, 9, 'remarks', '记录额外的报工信息', 'varchar(200)', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-11-03 19:42:48', '', '2024-11-03 19:44:33');
INSERT INTO `gen_table_column` VALUES (96, 4, 'operation_sequence', NULL, 'int', 'Long', 'operationSequence', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-11-26 21:46:58', '', '2024-11-26 21:47:32');
INSERT INTO `gen_table_column` VALUES (97, 10, 'task_id', '任务分配ID', 'int', 'Long', 'taskId', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (98, 10, 'order_id', '制令ID', 'int', 'Long', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (99, 10, 'user_id', '员工ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (100, 10, 'assigned_date', '任务分配时间', 'datetime', 'Date', 'assignedDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (101, 10, 'is_completed', '是否完成工序', 'tinyint(1)', 'Integer', 'isCompleted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (102, 10, 'remarks', '备注', 'varchar(255)', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-11-26 22:21:34', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (103, 10, 'operation_id', '工序ID', 'int', 'Long', 'operationId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-11-26 22:21:35', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (104, 10, 'is_started', '是否开始', 'tinyint(1)', 'Integer', 'isStarted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-11-26 22:21:35', '', '2024-11-26 22:22:40');
INSERT INTO `gen_table_column` VALUES (105, 11, 'task_id', '任务分配ID，关联tb_task表', 'int', 'Long', 'taskId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-11-27 18:09:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, 11, 'machine_id', '机器ID，关联tb_machine表', 'int', 'Long', 'machineId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2024-11-27 18:09:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, 11, 'start_time', '任务开始使用机器的时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-11-27 18:09:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, 11, 'end_time', '任务结束使用机器的时间，可为空表示任务未完成', 'datetime', 'Date', 'endTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-11-27 18:09:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, 12, 'id', '唯一标识', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2024-11-28 09:43:31', '', '2024-11-28 09:44:44');
INSERT INTO `gen_table_column` VALUES (110, 12, 'employee_id', '员工ID', 'bigint', 'Long', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-11-28 09:43:31', '', '2024-11-28 09:44:44');
INSERT INTO `gen_table_column` VALUES (111, 12, 'check_in_time', '出勤时间', 'datetime', 'Date', 'checkInTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-11-28 09:43:31', '', '2024-11-28 09:44:44');
INSERT INTO `gen_table_column` VALUES (112, 12, 'check_out_time', '退勤时间', 'datetime', 'Date', 'checkOutTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-11-28 09:43:31', '', '2024-11-28 09:44:44');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-10-01 11:04:22', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-10-01 11:04:22', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-10-01 11:04:22', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-10-01 11:04:22', 'admin', '2024-10-02 13:38:54', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-10-01 11:04:22', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-10-01 11:04:22', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '有效', '1', 'contract_status', NULL, 'default', 'N', '0', 'admin', '2024-10-02 14:33:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '无效', '0', 'contract_status', NULL, 'default', 'N', '0', 'admin', '2024-10-02 14:34:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '分类1', '1', 'product_category', NULL, 'default', 'N', '0', 'admin', '2024-10-02 17:18:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '分类2', '2', 'product_category', NULL, 'default', 'N', '0', 'admin', '2024-10-02 17:19:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '分类3', '3', 'product_category', NULL, 'default', 'N', '0', 'admin', '2024-10-02 17:19:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '总制令', '1', 'order_type', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:50:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 2, '分制令', '2', 'order_type', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:50:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 3, '子制令', '3', 'order_type', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:50:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, '待生产', '1', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, '生产中', '2', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 3, '已完成', '3', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 4, '已发货', '4', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 5, '已关闭', '5', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 6, '暂停', '6', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:53:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 7, '异常', '7', 'order_status', NULL, 'default', 'N', '0', 'admin', '2024-10-05 13:54:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '待执行', '待执行', 'task_assignment_status', NULL, 'default', 'N', '0', 'admin', '2024-10-10 10:41:05', 'admin', '2024-10-10 10:41:34', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '进行中', '进行中', 'task_assignment_status', NULL, 'default', 'N', '0', 'admin', '2024-10-10 10:41:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '已完成', '已完成', 'task_assignment_status', NULL, 'default', 'N', '0', 'admin', '2024-10-10 10:41:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 4, '蜡模车间', '4', 'product_category', NULL, 'default', 'N', '0', 'admin', '2024-10-31 16:00:09', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-10-01 11:04:22', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '合同状态', 'contract_status', '0', 'admin', '2024-10-02 14:33:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '产品分类', 'product_category', '0', 'admin', '2024-10-02 17:18:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '制令分类', 'order_type', '0', 'admin', '2024-10-05 13:50:04', 'admin', '2024-10-05 13:50:12', NULL);
INSERT INTO `sys_dict_type` VALUES (103, '制令状态', 'order_status', '0', 'admin', '2024-10-05 13:52:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '分配任务执行状态', 'task_assignment_status', '0', 'admin', '2024-10-10 10:40:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-10-01 11:04:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-10-01 11:04:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-10-01 11:04:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 446 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 11:06:06');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 13:38:02');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 15:56:10');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 16:56:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 09:04:45');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:10:19');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:51:17');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 19:46:11');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 20:44:55');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 11:03:29');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:33:43');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 13:14:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 13:20:23');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 14:33:18');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 22:10:18');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 20:17:29');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-07 16:41:36');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-07 17:46:44');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 17:19:35');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 21:35:25');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:19:31');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-09 15:51:10');
INSERT INTO `sys_logininfor` VALUES (122, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:51:20');
INSERT INTO `sys_logininfor` VALUES (123, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 16:36:22');
INSERT INTO `sys_logininfor` VALUES (124, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-09 16:37:36');
INSERT INTO `sys_logininfor` VALUES (125, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 16:37:40');
INSERT INTO `sys_logininfor` VALUES (126, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-09 16:38:25');
INSERT INTO `sys_logininfor` VALUES (127, '258333', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 16:38:31');
INSERT INTO `sys_logininfor` VALUES (128, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-09 17:02:15');
INSERT INTO `sys_logininfor` VALUES (129, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-09 17:09:18');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-09 17:11:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-09 17:36:41');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-09 17:36:46');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-09 17:36:51');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-09 17:41:37');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-09 18:01:21');
INSERT INTO `sys_logininfor` VALUES (136, '258333', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-09 18:01:33');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-09 18:15:41');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 18:18:30');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-09 18:20:30');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-09 18:20:33');
INSERT INTO `sys_logininfor` VALUES (141, '258333', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-09 18:27:28');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:25:27');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 00:08:30');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 10:36:12');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 21:55:11');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 12:42:52');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 13:55:56');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 16:01:34');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 17:03:20');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 19:53:58');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 22:11:37');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-13 09:30:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-13 12:29:57');
INSERT INTO `sys_logininfor` VALUES (154, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:15:52');
INSERT INTO `sys_logininfor` VALUES (155, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:23:04');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:23:05');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:23:10');
INSERT INTO `sys_logininfor` VALUES (158, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:23:18');
INSERT INTO `sys_logininfor` VALUES (159, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:24:06');
INSERT INTO `sys_logininfor` VALUES (160, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:24:16');
INSERT INTO `sys_logininfor` VALUES (161, '258333', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:26:32');
INSERT INTO `sys_logininfor` VALUES (162, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:26:33');
INSERT INTO `sys_logininfor` VALUES (163, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:27:07');
INSERT INTO `sys_logininfor` VALUES (164, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:27:08');
INSERT INTO `sys_logininfor` VALUES (165, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:27:52');
INSERT INTO `sys_logininfor` VALUES (166, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:27:53');
INSERT INTO `sys_logininfor` VALUES (167, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:28:10');
INSERT INTO `sys_logininfor` VALUES (168, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:28:10');
INSERT INTO `sys_logininfor` VALUES (169, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:28:26');
INSERT INTO `sys_logininfor` VALUES (170, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:28:27');
INSERT INTO `sys_logininfor` VALUES (171, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:29:00');
INSERT INTO `sys_logininfor` VALUES (172, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:29:07');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-13 13:29:39');
INSERT INTO `sys_logininfor` VALUES (174, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:30:07');
INSERT INTO `sys_logininfor` VALUES (175, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:30:08');
INSERT INTO `sys_logininfor` VALUES (176, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 13:45:33');
INSERT INTO `sys_logininfor` VALUES (177, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 13:45:34');
INSERT INTO `sys_logininfor` VALUES (178, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:08:08');
INSERT INTO `sys_logininfor` VALUES (179, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:08:09');
INSERT INTO `sys_logininfor` VALUES (180, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:08:39');
INSERT INTO `sys_logininfor` VALUES (181, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:08:47');
INSERT INTO `sys_logininfor` VALUES (182, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:08:57');
INSERT INTO `sys_logininfor` VALUES (183, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:09:57');
INSERT INTO `sys_logininfor` VALUES (184, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:09:58');
INSERT INTO `sys_logininfor` VALUES (185, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:13:43');
INSERT INTO `sys_logininfor` VALUES (186, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:13:45');
INSERT INTO `sys_logininfor` VALUES (187, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:16:11');
INSERT INTO `sys_logininfor` VALUES (188, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:16:12');
INSERT INTO `sys_logininfor` VALUES (189, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:17:13');
INSERT INTO `sys_logininfor` VALUES (190, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:17:15');
INSERT INTO `sys_logininfor` VALUES (191, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:19:33');
INSERT INTO `sys_logininfor` VALUES (192, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:19:34');
INSERT INTO `sys_logininfor` VALUES (193, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 14:27:58');
INSERT INTO `sys_logininfor` VALUES (194, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 14:27:59');
INSERT INTO `sys_logininfor` VALUES (195, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 15:51:01');
INSERT INTO `sys_logininfor` VALUES (196, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:35');
INSERT INTO `sys_logininfor` VALUES (197, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:38');
INSERT INTO `sys_logininfor` VALUES (198, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:39');
INSERT INTO `sys_logininfor` VALUES (199, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:40');
INSERT INTO `sys_logininfor` VALUES (200, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:50');
INSERT INTO `sys_logininfor` VALUES (201, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:51');
INSERT INTO `sys_logininfor` VALUES (202, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:51');
INSERT INTO `sys_logininfor` VALUES (203, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:16:51');
INSERT INTO `sys_logininfor` VALUES (204, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:17:01');
INSERT INTO `sys_logininfor` VALUES (205, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:17:41');
INSERT INTO `sys_logininfor` VALUES (206, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:17:49');
INSERT INTO `sys_logininfor` VALUES (207, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:18:56');
INSERT INTO `sys_logininfor` VALUES (208, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:18:58');
INSERT INTO `sys_logininfor` VALUES (209, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:18:58');
INSERT INTO `sys_logininfor` VALUES (210, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:18:58');
INSERT INTO `sys_logininfor` VALUES (211, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:18:58');
INSERT INTO `sys_logininfor` VALUES (212, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:07');
INSERT INTO `sys_logininfor` VALUES (213, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:19:18');
INSERT INTO `sys_logininfor` VALUES (214, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:19:19');
INSERT INTO `sys_logininfor` VALUES (215, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:24');
INSERT INTO `sys_logininfor` VALUES (216, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:25');
INSERT INTO `sys_logininfor` VALUES (217, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:25');
INSERT INTO `sys_logininfor` VALUES (218, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:25');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:19:53');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:20:00');
INSERT INTO `sys_logininfor` VALUES (221, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:20:48');
INSERT INTO `sys_logininfor` VALUES (222, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:21:15');
INSERT INTO `sys_logininfor` VALUES (223, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:21:32');
INSERT INTO `sys_logininfor` VALUES (224, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:21:35');
INSERT INTO `sys_logininfor` VALUES (225, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:21:45');
INSERT INTO `sys_logininfor` VALUES (226, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:21:49');
INSERT INTO `sys_logininfor` VALUES (227, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:22:07');
INSERT INTO `sys_logininfor` VALUES (228, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:23:57');
INSERT INTO `sys_logininfor` VALUES (229, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:24:02');
INSERT INTO `sys_logininfor` VALUES (230, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:24:28');
INSERT INTO `sys_logininfor` VALUES (231, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:24:40');
INSERT INTO `sys_logininfor` VALUES (232, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:24:43');
INSERT INTO `sys_logininfor` VALUES (233, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:24:48');
INSERT INTO `sys_logininfor` VALUES (234, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:25:56');
INSERT INTO `sys_logininfor` VALUES (235, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:26:01');
INSERT INTO `sys_logininfor` VALUES (236, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:26:09');
INSERT INTO `sys_logininfor` VALUES (237, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:26:11');
INSERT INTO `sys_logininfor` VALUES (238, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:26:51');
INSERT INTO `sys_logininfor` VALUES (239, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:27:14');
INSERT INTO `sys_logininfor` VALUES (240, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:27:30');
INSERT INTO `sys_logininfor` VALUES (241, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:27:46');
INSERT INTO `sys_logininfor` VALUES (242, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:27:48');
INSERT INTO `sys_logininfor` VALUES (243, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:28:00');
INSERT INTO `sys_logininfor` VALUES (244, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:28:15');
INSERT INTO `sys_logininfor` VALUES (245, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:28:50');
INSERT INTO `sys_logininfor` VALUES (246, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:28:51');
INSERT INTO `sys_logininfor` VALUES (247, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:31:30');
INSERT INTO `sys_logininfor` VALUES (248, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:31:31');
INSERT INTO `sys_logininfor` VALUES (249, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:32:45');
INSERT INTO `sys_logininfor` VALUES (250, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:34:37');
INSERT INTO `sys_logininfor` VALUES (251, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:34:38');
INSERT INTO `sys_logininfor` VALUES (252, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:36:00');
INSERT INTO `sys_logininfor` VALUES (253, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:36:03');
INSERT INTO `sys_logininfor` VALUES (254, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:36:05');
INSERT INTO `sys_logininfor` VALUES (255, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:37:38');
INSERT INTO `sys_logininfor` VALUES (256, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:37:39');
INSERT INTO `sys_logininfor` VALUES (257, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:37:40');
INSERT INTO `sys_logininfor` VALUES (258, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:37:46');
INSERT INTO `sys_logininfor` VALUES (259, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:37:47');
INSERT INTO `sys_logininfor` VALUES (260, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:38:08');
INSERT INTO `sys_logininfor` VALUES (261, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:38:09');
INSERT INTO `sys_logininfor` VALUES (262, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:38:10');
INSERT INTO `sys_logininfor` VALUES (263, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:38:10');
INSERT INTO `sys_logininfor` VALUES (264, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:38:11');
INSERT INTO `sys_logininfor` VALUES (265, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:39:53');
INSERT INTO `sys_logininfor` VALUES (266, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:40:04');
INSERT INTO `sys_logininfor` VALUES (267, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:40:05');
INSERT INTO `sys_logininfor` VALUES (268, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:40:17');
INSERT INTO `sys_logininfor` VALUES (269, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:40:18');
INSERT INTO `sys_logininfor` VALUES (270, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:40:42');
INSERT INTO `sys_logininfor` VALUES (271, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:40:43');
INSERT INTO `sys_logininfor` VALUES (272, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:43:24');
INSERT INTO `sys_logininfor` VALUES (273, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:43:25');
INSERT INTO `sys_logininfor` VALUES (274, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:43:47');
INSERT INTO `sys_logininfor` VALUES (275, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:43:48');
INSERT INTO `sys_logininfor` VALUES (276, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:45:07');
INSERT INTO `sys_logininfor` VALUES (277, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:45:09');
INSERT INTO `sys_logininfor` VALUES (278, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:46:07');
INSERT INTO `sys_logininfor` VALUES (279, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:46:08');
INSERT INTO `sys_logininfor` VALUES (280, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:46:24');
INSERT INTO `sys_logininfor` VALUES (281, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:46:26');
INSERT INTO `sys_logininfor` VALUES (282, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:49:55');
INSERT INTO `sys_logininfor` VALUES (283, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:50:04');
INSERT INTO `sys_logininfor` VALUES (284, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:50:51');
INSERT INTO `sys_logininfor` VALUES (285, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:50:52');
INSERT INTO `sys_logininfor` VALUES (286, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:52:54');
INSERT INTO `sys_logininfor` VALUES (287, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:55:07');
INSERT INTO `sys_logininfor` VALUES (288, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:55:08');
INSERT INTO `sys_logininfor` VALUES (289, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-13 16:55:48');
INSERT INTO `sys_logininfor` VALUES (290, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 16:55:50');
INSERT INTO `sys_logininfor` VALUES (291, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:56:16');
INSERT INTO `sys_logininfor` VALUES (292, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:56:17');
INSERT INTO `sys_logininfor` VALUES (293, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-13 16:57:22');
INSERT INTO `sys_logininfor` VALUES (294, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-13 16:57:22');
INSERT INTO `sys_logininfor` VALUES (295, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 17:02:31');
INSERT INTO `sys_logininfor` VALUES (296, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 17:49:38');
INSERT INTO `sys_logininfor` VALUES (297, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 17:51:13');
INSERT INTO `sys_logininfor` VALUES (298, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 17:54:13');
INSERT INTO `sys_logininfor` VALUES (299, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-13 17:55:10');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-13 18:15:35');
INSERT INTO `sys_logininfor` VALUES (301, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 18:56:11');
INSERT INTO `sys_logininfor` VALUES (302, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 18:58:18');
INSERT INTO `sys_logininfor` VALUES (303, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 18:59:16');
INSERT INTO `sys_logininfor` VALUES (304, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 18:59:26');
INSERT INTO `sys_logininfor` VALUES (305, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 18:59:51');
INSERT INTO `sys_logininfor` VALUES (306, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:03:15');
INSERT INTO `sys_logininfor` VALUES (307, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:03:17');
INSERT INTO `sys_logininfor` VALUES (308, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:03:18');
INSERT INTO `sys_logininfor` VALUES (309, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:03:18');
INSERT INTO `sys_logininfor` VALUES (310, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:05:22');
INSERT INTO `sys_logininfor` VALUES (311, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:08:02');
INSERT INTO `sys_logininfor` VALUES (312, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:39:15');
INSERT INTO `sys_logininfor` VALUES (313, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:39:55');
INSERT INTO `sys_logininfor` VALUES (314, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 19:55:04');
INSERT INTO `sys_logininfor` VALUES (315, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:02:25');
INSERT INTO `sys_logininfor` VALUES (316, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:03:02');
INSERT INTO `sys_logininfor` VALUES (317, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:08:05');
INSERT INTO `sys_logininfor` VALUES (318, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:09:28');
INSERT INTO `sys_logininfor` VALUES (319, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:13:39');
INSERT INTO `sys_logininfor` VALUES (320, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 20:37:49');
INSERT INTO `sys_logininfor` VALUES (321, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 20:42:30');
INSERT INTO `sys_logininfor` VALUES (322, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 20:56:58');
INSERT INTO `sys_logininfor` VALUES (323, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 20:57:09');
INSERT INTO `sys_logininfor` VALUES (324, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 20:57:10');
INSERT INTO `sys_logininfor` VALUES (325, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 20:57:57');
INSERT INTO `sys_logininfor` VALUES (326, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 20:57:59');
INSERT INTO `sys_logininfor` VALUES (327, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:06:19');
INSERT INTO `sys_logininfor` VALUES (328, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:06:20');
INSERT INTO `sys_logininfor` VALUES (329, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 21:06:56');
INSERT INTO `sys_logininfor` VALUES (330, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:12:43');
INSERT INTO `sys_logininfor` VALUES (331, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:12:44');
INSERT INTO `sys_logininfor` VALUES (332, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:14:56');
INSERT INTO `sys_logininfor` VALUES (333, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:14:57');
INSERT INTO `sys_logininfor` VALUES (334, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:16:35');
INSERT INTO `sys_logininfor` VALUES (335, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:16:36');
INSERT INTO `sys_logininfor` VALUES (336, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:20:49');
INSERT INTO `sys_logininfor` VALUES (337, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:20:50');
INSERT INTO `sys_logininfor` VALUES (338, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:25:43');
INSERT INTO `sys_logininfor` VALUES (339, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:30:58');
INSERT INTO `sys_logininfor` VALUES (340, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:31:28');
INSERT INTO `sys_logininfor` VALUES (341, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:34:09');
INSERT INTO `sys_logininfor` VALUES (342, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 21:38:18');
INSERT INTO `sys_logininfor` VALUES (343, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-10-16 21:38:24');
INSERT INTO `sys_logininfor` VALUES (344, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-16 21:38:25');
INSERT INTO `sys_logininfor` VALUES (345, '258111', '192.168.43.190', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-16 21:41:00');
INSERT INTO `sys_logininfor` VALUES (346, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-18 11:43:39');
INSERT INTO `sys_logininfor` VALUES (347, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-10-18 11:57:42');
INSERT INTO `sys_logininfor` VALUES (348, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-18 11:57:43');
INSERT INTO `sys_logininfor` VALUES (349, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-18 13:12:13');
INSERT INTO `sys_logininfor` VALUES (350, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-10-18 13:13:21');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-20 15:47:21');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-21 09:46:56');
INSERT INTO `sys_logininfor` VALUES (353, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-31 15:47:31');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 15:49:14');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 17:24:08');
INSERT INTO `sys_logininfor` VALUES (356, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-10-31 17:30:06');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-02 15:21:59');
INSERT INTO `sys_logininfor` VALUES (358, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-02 15:24:50');
INSERT INTO `sys_logininfor` VALUES (359, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-11-02 16:02:14');
INSERT INTO `sys_logininfor` VALUES (360, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-02 16:02:16');
INSERT INTO `sys_logininfor` VALUES (361, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-02 16:11:24');
INSERT INTO `sys_logininfor` VALUES (362, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-02 16:14:20');
INSERT INTO `sys_logininfor` VALUES (363, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-02 16:21:01');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-02 16:29:02');
INSERT INTO `sys_logininfor` VALUES (365, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-02 16:29:58');
INSERT INTO `sys_logininfor` VALUES (366, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-02 17:25:38');
INSERT INTO `sys_logininfor` VALUES (367, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-11-02 18:10:57');
INSERT INTO `sys_logininfor` VALUES (368, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-02 18:11:04');
INSERT INTO `sys_logininfor` VALUES (369, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2024-11-02 18:11:32');
INSERT INTO `sys_logininfor` VALUES (370, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-02 18:11:33');
INSERT INTO `sys_logininfor` VALUES (371, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-02 18:12:44');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-02 18:19:29');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-02 19:25:27');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-03 19:42:33');
INSERT INTO `sys_logininfor` VALUES (375, '258111', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-03 20:00:26');
INSERT INTO `sys_logininfor` VALUES (376, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 20:17:38');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-03 20:40:27');
INSERT INTO `sys_logininfor` VALUES (378, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 20:46:41');
INSERT INTO `sys_logininfor` VALUES (379, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 21:18:38');
INSERT INTO `sys_logininfor` VALUES (380, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 21:45:35');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-03 22:07:05');
INSERT INTO `sys_logininfor` VALUES (382, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-11-03 22:24:27');
INSERT INTO `sys_logininfor` VALUES (383, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 22:24:29');
INSERT INTO `sys_logininfor` VALUES (384, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-03 22:49:31');
INSERT INTO `sys_logininfor` VALUES (385, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-03 23:33:26');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-03 23:42:20');
INSERT INTO `sys_logininfor` VALUES (387, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 00:17:20');
INSERT INTO `sys_logininfor` VALUES (388, '258111', '172.20.10.6', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-04 00:22:41');
INSERT INTO `sys_logininfor` VALUES (389, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 00:22:49');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 09:50:17');
INSERT INTO `sys_logininfor` VALUES (391, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 09:51:18');
INSERT INTO `sys_logininfor` VALUES (392, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 09:53:05');
INSERT INTO `sys_logininfor` VALUES (393, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 10:13:10');
INSERT INTO `sys_logininfor` VALUES (394, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 10:14:08');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-04 10:19:29');
INSERT INTO `sys_logininfor` VALUES (396, '258111', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 10:19:37');
INSERT INTO `sys_logininfor` VALUES (397, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 11:09:25');
INSERT INTO `sys_logininfor` VALUES (398, '258111', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 11:17:54');
INSERT INTO `sys_logininfor` VALUES (399, '258111', '172.20.10.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-04 11:24:24');
INSERT INTO `sys_logininfor` VALUES (400, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-26 20:41:03');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:43:04');
INSERT INTO `sys_logininfor` VALUES (402, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-26 21:23:26');
INSERT INTO `sys_logininfor` VALUES (403, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-26 22:40:21');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 23:29:51');
INSERT INTO `sys_logininfor` VALUES (405, '258111', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-11-27 08:26:58');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 08:58:07');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:05:01');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 12:47:17');
INSERT INTO `sys_logininfor` VALUES (409, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 14:56:41');
INSERT INTO `sys_logininfor` VALUES (410, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 15:25:01');
INSERT INTO `sys_logininfor` VALUES (411, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 15:33:01');
INSERT INTO `sys_logininfor` VALUES (412, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 16:10:38');
INSERT INTO `sys_logininfor` VALUES (413, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 16:41:29');
INSERT INTO `sys_logininfor` VALUES (414, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 17:15:56');
INSERT INTO `sys_logininfor` VALUES (415, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 18:03:31');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 18:09:15');
INSERT INTO `sys_logininfor` VALUES (417, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-27 18:16:01');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 18:54:37');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-28 08:14:08');
INSERT INTO `sys_logininfor` VALUES (420, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 08:14:11');
INSERT INTO `sys_logininfor` VALUES (421, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 09:17:03');
INSERT INTO `sys_logininfor` VALUES (422, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 09:17:03');
INSERT INTO `sys_logininfor` VALUES (423, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 09:26:27');
INSERT INTO `sys_logininfor` VALUES (424, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 09:58:38');
INSERT INTO `sys_logininfor` VALUES (425, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 15:27:48');
INSERT INTO `sys_logininfor` VALUES (426, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 16:16:51');
INSERT INTO `sys_logininfor` VALUES (427, '258111', '10.84.181.135', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 17:22:13');
INSERT INTO `sys_logininfor` VALUES (428, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 17:23:03');
INSERT INTO `sys_logininfor` VALUES (429, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 17:23:35');
INSERT INTO `sys_logininfor` VALUES (430, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-28 17:24:00');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 14:42:57');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 15:17:00');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-29 15:50:43');
INSERT INTO `sys_logininfor` VALUES (434, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 15:51:22');
INSERT INTO `sys_logininfor` VALUES (435, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-11-29 15:52:26');
INSERT INTO `sys_logininfor` VALUES (436, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2024-11-29 15:52:31');
INSERT INTO `sys_logininfor` VALUES (437, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 15:52:38');
INSERT INTO `sys_logininfor` VALUES (438, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-11-29 15:56:53');
INSERT INTO `sys_logininfor` VALUES (439, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 15:56:54');
INSERT INTO `sys_logininfor` VALUES (440, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-11-29 15:57:11');
INSERT INTO `sys_logininfor` VALUES (441, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 15:57:18');
INSERT INTO `sys_logininfor` VALUES (442, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 16:02:32');
INSERT INTO `sys_logininfor` VALUES (443, '258222', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2024-11-29 16:05:33');
INSERT INTO `sys_logininfor` VALUES (444, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2024-11-29 16:05:35');
INSERT INTO `sys_logininfor` VALUES (445, '258111', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-11-29 16:05:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2060 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-10-01 11:04:21', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-10-01 11:04:21', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-10-01 11:04:21', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-10-01 11:04:21', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-10-01 11:04:21', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-10-01 11:04:21', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-10-01 11:04:21', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-10-01 11:04:21', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-10-01 11:04:21', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-10-01 11:04:21', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-10-01 11:04:21', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-10-01 11:04:21', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-10-01 11:04:21', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-10-01 11:04:21', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-10-01 11:04:21', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-10-01 11:04:21', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-10-01 11:04:21', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-10-01 11:04:21', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-10-01 11:04:21', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-10-01 11:04:21', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-10-01 11:04:21', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-10-01 11:04:21', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-10-01 11:04:21', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-10-01 11:04:21', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '合同', 0, 1, 'contracts', 'Contracts/contracts/index', NULL, '', 1, 0, 'C', '0', '0', 'Contracts:contracts:list', '#', 'admin', '2024-10-02 14:59:47', 'admin', '2024-10-02 15:15:07', '合同，存储合同相关信息及其产品详情菜单');
INSERT INTO `sys_menu` VALUES (2001, '合同，存储合同相关信息及其产品详情查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Contracts:contracts:query', '#', 'admin', '2024-10-02 14:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '合同，存储合同相关信息及其产品详情新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Contracts:contracts:add', '#', 'admin', '2024-10-02 14:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '合同，存储合同相关信息及其产品详情修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Contracts:contracts:edit', '#', 'admin', '2024-10-02 14:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '合同，存储合同相关信息及其产品详情删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Contracts:contracts:remove', '#', 'admin', '2024-10-02 14:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '合同，存储合同相关信息及其产品详情导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'Contracts:contracts:export', '#', 'admin', '2024-10-02 14:59:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '产品', 0, 1, 'products', 'products/products/index', NULL, '', 1, 0, 'C', '0', '0', 'products:products:list', '#', 'admin', '2024-10-02 17:32:02', 'admin', '2024-10-02 17:32:50', '产品，存储产品相关信息菜单');
INSERT INTO `sys_menu` VALUES (2007, '产品，存储产品相关信息查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'products:products:query', '#', 'admin', '2024-10-02 17:32:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '产品，存储产品相关信息新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'products:products:add', '#', 'admin', '2024-10-02 17:32:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '产品，存储产品相关信息修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'products:products:edit', '#', 'admin', '2024-10-02 17:32:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '产品，存储产品相关信息删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'products:products:remove', '#', 'admin', '2024-10-02 17:32:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '产品，存储产品相关信息导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'products:products:export', '#', 'admin', '2024-10-02 17:32:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '制令', 0, 1, 'orders', 'orders/orders/index', NULL, '', 1, 0, 'C', '0', '0', 'orders:orders:list', '#', 'admin', '2024-10-05 13:59:57', 'admin', '2024-10-05 14:00:24', '制令，存储总制令、分制令和子制令的信息菜单');
INSERT INTO `sys_menu` VALUES (2013, '制令，存储总制令、分制令和子制令的信息查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'orders:orders:query', '#', 'admin', '2024-10-05 13:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '制令，存储总制令、分制令和子制令的信息新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'orders:orders:add', '#', 'admin', '2024-10-05 13:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '制令，存储总制令、分制令和子制令的信息修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'orders:orders:edit', '#', 'admin', '2024-10-05 13:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '制令，存储总制令、分制令和子制令的信息删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'orders:orders:remove', '#', 'admin', '2024-10-05 13:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '制令，存储总制令、分制令和子制令的信息导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'orders:orders:export', '#', 'admin', '2024-10-05 13:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '机器', 0, 1, 'machine', 'machine/machine/index', NULL, '', 1, 0, 'C', '0', '0', 'machine:machine:list', '#', 'admin', '2024-10-12 13:12:23', 'admin', '2024-10-12 13:13:12', '机器，存储所有机器的相关信息菜单');
INSERT INTO `sys_menu` VALUES (2025, '机器，存储所有机器的相关信息查询', 2024, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'machine:machine:query', '#', 'admin', '2024-10-12 13:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '机器，存储所有机器的相关信息新增', 2024, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'machine:machine:add', '#', 'admin', '2024-10-12 13:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '机器，存储所有机器的相关信息修改', 2024, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'machine:machine:edit', '#', 'admin', '2024-10-12 13:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '机器，存储所有机器的相关信息删除', 2024, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'machine:machine:remove', '#', 'admin', '2024-10-12 13:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '机器，存储所有机器的相关信息导出', 2024, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'machine:machine:export', '#', 'admin', '2024-10-12 13:12:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '工序', 0, 1, 'operation', 'operation/operation/index', NULL, '', 1, 0, 'C', '0', '0', 'operation:operation:list', '#', 'admin', '2024-10-12 13:14:40', 'admin', '2024-10-12 13:15:07', '工序，存储工序及其相关信息菜单');
INSERT INTO `sys_menu` VALUES (2031, '工序，存储工序及其相关信息查询', 2030, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'operation:operation:query', '#', 'admin', '2024-10-12 13:14:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '工序，存储工序及其相关信息新增', 2030, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'operation:operation:add', '#', 'admin', '2024-10-12 13:14:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '工序，存储工序及其相关信息修改', 2030, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'operation:operation:edit', '#', 'admin', '2024-10-12 13:14:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '工序，存储工序及其相关信息删除', 2030, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'operation:operation:remove', '#', 'admin', '2024-10-12 13:14:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '工序，存储工序及其相关信息导出', 2030, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'operation:operation:export', '#', 'admin', '2024-10-12 13:14:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '物料', 0, 1, 'material', 'material/material/index', NULL, '', 1, 0, 'C', '0', '0', 'material:material:list', '#', 'admin', '2024-11-02 17:40:04', 'admin', '2024-11-02 17:40:52', '物料，存储生产所需的物料信息菜单');
INSERT INTO `sys_menu` VALUES (2037, '物料，存储生产所需的物料信息查询', 2036, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'material:material:query', '#', 'admin', '2024-11-02 17:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '物料，存储生产所需的物料信息新增', 2036, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'material:material:add', '#', 'admin', '2024-11-02 17:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '物料，存储生产所需的物料信息修改', 2036, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'material:material:edit', '#', 'admin', '2024-11-02 17:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '物料，存储生产所需的物料信息删除', 2036, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'material:material:remove', '#', 'admin', '2024-11-02 17:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '物料，存储生产所需的物料信息导出', 2036, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'material:material:export', '#', 'admin', '2024-11-02 17:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '报工', 0, 1, 'report', 'report/report/index', NULL, '', 1, 0, 'C', '0', '0', 'report:report:list', '#', 'admin', '2024-11-03 19:48:08', 'admin', '2024-11-03 19:48:48', '报工，用于记录员工的报工信息菜单');
INSERT INTO `sys_menu` VALUES (2043, '报工，用于记录员工的报工信息查询', 2042, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'report:report:query', '#', 'admin', '2024-11-03 19:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '报工，用于记录员工的报工信息新增', 2042, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'report:report:add', '#', 'admin', '2024-11-03 19:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '报工，用于记录员工的报工信息修改', 2042, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'report:report:edit', '#', 'admin', '2024-11-03 19:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '报工，用于记录员工的报工信息删除', 2042, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'report:report:remove', '#', 'admin', '2024-11-03 19:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '报工，用于记录员工的报工信息导出', 2042, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'report:report:export', '#', 'admin', '2024-11-03 19:48:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '任务', 0, 1, 'task', 'task/task/index', NULL, '', 1, 0, 'C', '0', '0', 'task:task:list', '#', 'admin', '2024-11-26 22:32:08', 'admin', '2024-11-26 22:33:22', '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息菜单');
INSERT INTO `sys_menu` VALUES (2049, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息查询', 2048, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'task:task:query', '#', 'admin', '2024-11-26 22:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息新增', 2048, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'task:task:add', '#', 'admin', '2024-11-26 22:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息修改', 2048, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'task:task:edit', '#', 'admin', '2024-11-26 22:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息删除', 2048, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'task:task:remove', '#', 'admin', '2024-11-26 22:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息导出', 2048, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'task:task:export', '#', 'admin', '2024-11-26 22:32:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '出勤', 0, 1, 'checkin', 'checkin/checkin/index', NULL, '', 1, 0, 'C', '0', '0', 'checkin:checkin:list', '#', 'admin', '2024-11-28 09:46:51', 'admin', '2024-11-28 09:48:01', '出勤，记录员工的出勤信息菜单');
INSERT INTO `sys_menu` VALUES (2055, '出勤，记录员工的出勤信息查询', 2054, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'checkin:checkin:query', '#', 'admin', '2024-11-28 09:46:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '出勤，记录员工的出勤信息新增', 2054, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'checkin:checkin:add', '#', 'admin', '2024-11-28 09:46:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '出勤，记录员工的出勤信息修改', 2054, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'checkin:checkin:edit', '#', 'admin', '2024-11-28 09:46:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '出勤，记录员工的出勤信息删除', 2054, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'checkin:checkin:remove', '#', 'admin', '2024-11-28 09:46:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '出勤，记录员工的出勤信息导出', 2054, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'checkin:checkin:export', '#', 'admin', '2024-11-28 09:46:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-10-01 11:04:22', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-10-01 11:04:22', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 385 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"fasle\",\"createBy\":\"admin\",\"createTime\":\"2024-10-01 11:04:22\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 13:38:54', 30);
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/02/258_1_20241002133916A001.jpg\",\"code\":200}', 0, NULL, '2024-10-02 13:39:16', 160);
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"Lhw258333@gmail.com\",\"nickName\":\"258\",\"params\":{},\"phonenumber\":\"18832122809\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 13:40:05', 5);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_contracts\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:06:23', 157);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:20:25', 1);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_contracts\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:20:30', 81);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contracts\",\"className\":\"Contracts\",\"columns\":[{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同唯一标识\",\"columnId\":14,\"columnName\":\"contract_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":15,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":16,\"columnName\":\"customer_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":17,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:20:45', 98);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contracts\",\"className\":\"Contracts\",\"columns\":[{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同唯一标识\",\"columnId\":14,\"columnName\":\"contract_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:20:45\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":15,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:20:45\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":16,\"columnName\":\"customer_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:20:45\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":17,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:25:25', 26);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contracts\",\"className\":\"Contracts\",\"columns\":[{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同唯一标识\",\"columnId\":14,\"columnName\":\"contract_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:25\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":15,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:25\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":16,\"columnName\":\"customer_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:25\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":17,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:25:34', 19);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contracts\",\"className\":\"Contracts\",\"columns\":[{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同唯一标识\",\"columnId\":14,\"columnName\":\"contract_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:34\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":15,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:34\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":16,\"columnName\":\"customer_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:25:34\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":17,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:27:59', 21);
INSERT INTO `sys_oper_log` VALUES (110, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"合同状态\",\"dictType\":\"contract_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:33:12', 8);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"有效\",\"dictSort\":0,\"dictType\":\"contract_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:33:59', 7);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无效\",\"dictSort\":1,\"dictType\":\"contract_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:34:14', 8);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"contracts\",\"className\":\"Contracts\",\"columns\":[{\"capJavaField\":\"ContractId\",\"columnComment\":\"合同唯一标识\",\"columnId\":14,\"columnName\":\"contract_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"contractId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:27:59\",\"usableColumn\":false},{\"capJavaField\":\"ContractNumber\",\"columnComment\":\"合同编号\",\"columnId\":15,\"columnName\":\"contract_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contractNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:27:59\",\"usableColumn\":false},{\"capJavaField\":\"CustomerName\",\"columnComment\":\"客户名称\",\"columnId\":16,\"columnName\":\"customer_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"customerName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 14:27:59\",\"usableColumn\":false},{\"capJavaField\":\"ContactPerson\",\"columnComment\":\"联系人\",\"columnId\":17,\"columnName\":\"contact_person\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 14:20:30\",\"dictType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 14:35:35', 17);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_contracts\"}', NULL, 0, NULL, '2024-10-02 14:35:41', 443);
INSERT INTO `sys_oper_log` VALUES (115, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"188888888\",\"contactPerson\":\"李宏威\",\"contractId\":1,\"contractName\":\"mes系统\",\"contractNumber\":\"10001\",\"customerName\":\"李宏威\",\"endDate\":\"2024-10-31\",\"params\":{},\"startDate\":\"2024-10-01\",\"status\":\"1\",\"totalValue\":1200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 15:02:49', 227);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"Contracts/contracts/index\",\"createTime\":\"2024-10-02 14:59:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"合同\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"contracts\",\"perms\":\"Contracts:contracts:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 15:15:07', 63);
INSERT INTO `sys_oper_log` VALUES (117, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"产品分类\",\"dictType\":\"product_category\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:18:42', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分类1\",\"dictSort\":1,\"dictType\":\"product_category\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:18:56', 9);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分类2\",\"dictSort\":2,\"dictType\":\"product_category\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:19:06', 10);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分类3\",\"dictSort\":3,\"dictType\":\"product_category\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:19:18', 8);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_products\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:24:19', 164);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"Products\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品唯一标识\",\"columnId\":28,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":29,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductCode\",\"columnComment\":\"产品编号（或SKU）\",\"columnId\":30,\"columnName\":\"product_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"productCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"产品分类\",\"columnId\":31,\"columnName\":\"category\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"product_category\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:26:55', 62);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"Products\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品唯一标识\",\"columnId\":28,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 17:26:54\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":29,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 17:26:54\",\"usableColumn\":false},{\"capJavaField\":\"ProductCode\",\"columnComment\":\"产品编号（或SKU）\",\"columnId\":30,\"columnName\":\"product_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"productCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-02 17:26:54\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"产品分类\",\"columnId\":31,\"columnName\":\"category\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"product_category\",\"e', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:28:07', 38);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_products\"}', NULL, 0, NULL, '2024-10-02 17:28:17', 466);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"products/products/index\",\"createTime\":\"2024-10-02 17:32:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"产品\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"products\",\"perms\":\"products:products:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:32:50', 47);
INSERT INTO `sys_oper_log` VALUES (126, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"1\",\"description\":\"产品1\",\"params\":{},\"price\":100001,\"productCode\":\"100001\",\"productId\":1,\"productName\":\"产品1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:33:20', 17);
INSERT INTO `sys_oper_log` VALUES (127, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"2\",\"description\":\"产品2\",\"params\":{},\"price\":100,\"productCode\":\"100002\",\"productId\":2,\"productName\":\"产品2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:33:48', 0);
INSERT INTO `sys_oper_log` VALUES (128, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"1\",\"createdDate\":\"2024-10-02 17:33:20\",\"description\":\"产品1\",\"modifiedDate\":\"2024-10-02 17:33:20\",\"params\":{},\"price\":100,\"productCode\":\"100001\",\"productId\":1,\"productName\":\"产品1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:33:55', 7);
INSERT INTO `sys_oper_log` VALUES (129, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"3\",\"description\":\"产品3\",\"params\":{},\"price\":100,\"productCode\":\"100003\",\"productId\":3,\"productName\":\"产品3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:14', 7);
INSERT INTO `sys_oper_log` VALUES (130, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"1\",\"description\":\"产品4\",\"params\":{},\"price\":100,\"productCode\":\"100004\",\"productId\":4,\"productName\":\"产品4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:33', 15);
INSERT INTO `sys_oper_log` VALUES (131, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"1\",\"createdDate\":\"2024-10-02 17:33:20\",\"description\":\"产品1\",\"modifiedDate\":\"2024-10-02 17:33:20\",\"params\":{},\"price\":100,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:41', 0);
INSERT INTO `sys_oper_log` VALUES (132, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"2\",\"createdDate\":\"2024-10-02 17:33:48\",\"description\":\"产品2\",\"modifiedDate\":\"2024-10-02 17:33:48\",\"params\":{},\"price\":100,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:45', 16);
INSERT INTO `sys_oper_log` VALUES (133, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"3\",\"createdDate\":\"2024-10-02 17:34:14\",\"description\":\"产品3\",\"modifiedDate\":\"2024-10-02 17:34:14\",\"params\":{},\"price\":100,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:48', 0);
INSERT INTO `sys_oper_log` VALUES (134, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"1\",\"createdDate\":\"2024-10-02 17:34:33\",\"description\":\"产品4\",\"modifiedDate\":\"2024-10-02 17:34:33\",\"params\":{},\"price\":100,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-02 17:34:52', 18);
INSERT INTO `sys_oper_log` VALUES (135, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"1\",\"contactNumber\":\"1\",\"contactPerson\":\"1\",\"contractId\":2,\"contractName\":\"11\",\"contractNumber\":\"111\",\"customerName\":\"1\",\"endDate\":\"2024-10-04\",\"params\":{},\"productDetails\":\"[{\\\"productName\\\":\\\"产品1\\\",\\\"quantity\\\":1,\\\"allPrice\\\":10,\\\"unitPrice\\\":10,\\\"productCode\\\":\\\"1001\\\"},{\\\"productCode\\\":\\\"1004\\\",\\\"productName\\\":\\\"产品4\\\",\\\"quantity\\\":1,\\\"unitPrice\\\":40,\\\"allPrice\\\":40}]\",\"startDate\":\"2024-10-03\",\"status\":\"0\",\"totalValue\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-03 16:59:00', 78);
INSERT INTO `sys_oper_log` VALUES (136, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"1555555555\",\"contactPerson\":\"lhw\",\"contractName\":\"lhw\",\"contractNumber\":\"10002\",\"customerName\":\"lhw\",\"endDate\":\"2024-10-31\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0},{\"allPrice\":40.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":2,\"unitPrice\":20.0}],\"startDate\":\"2024-10-04\",\"status\":\"1\",\"totalValue\":10000}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'productDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Contracts\\ContractsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ContractsMapper.insertContracts\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'productDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.', '2024-10-04 16:38:57', 10);
INSERT INTO `sys_oper_log` VALUES (137, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"155555555\",\"contactPerson\":\"lhw\",\"contractName\":\"lhw\",\"contractNumber\":\"10002\",\"customerName\":\"lhw\",\"endDate\":\"2024-10-31\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0},{\"allPrice\":30.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":1,\"unitPrice\":30.0}],\"startDate\":\"2024-10-04\",\"status\":\"1\",\"totalValue\":10000}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'productDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Contracts\\ContractsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ContractsMapper.insertContracts\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'productDetails\'. It was either not specified and/or could not be found for the javaType (java.util.List) : jdbcType (null) combination.', '2024-10-04 16:42:16', 17);
INSERT INTO `sys_oper_log` VALUES (138, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":3,\"contractName\":\"1111\",\"contractNumber\":\"111\",\"customerName\":\"111\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":30.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":1,\"unitPrice\":30.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:44:17', 50);
INSERT INTO `sys_oper_log` VALUES (139, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":3,\"contractName\":\"1111\",\"contractNumber\":\"111\",\"createdDate\":\"2024-10-04\",\"customerName\":\"111\",\"modifiedDate\":\"2024-10-04 16:44:17\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":40.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":1,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:45:37', 16);
INSERT INTO `sys_oper_log` VALUES (140, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":3,\"contractName\":\"1111\",\"contractNumber\":\"111\",\"createdDate\":\"2024-10-04\",\"customerName\":\"111\",\"modifiedDate\":\"2024-10-04 16:44:17\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":1,\"unitPrice\":20.0},{\"allPrice\":40.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":1,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:46:06', 6);
INSERT INTO `sys_oper_log` VALUES (141, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:46:21', 15);
INSERT INTO `sys_oper_log` VALUES (142, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:46:24', 5);
INSERT INTO `sys_oper_log` VALUES (143, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":4,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:46:52', 7);
INSERT INTO `sys_oper_log` VALUES (144, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:47:34', 7);
INSERT INTO `sys_oper_log` VALUES (145, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":5,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:48:56', 5);
INSERT INTO `sys_oper_log` VALUES (146, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":6,\"contractName\":\"2\",\"contractNumber\":\"2\",\"customerName\":\"2\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0},{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:49:48', 6);
INSERT INTO `sys_oper_log` VALUES (147, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":7,\"contractName\":\"3\",\"contractNumber\":\"3\",\"customerName\":\"3\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:52:26', 7);
INSERT INTO `sys_oper_log` VALUES (148, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 16:52:32', 7);
INSERT INTO `sys_oper_log` VALUES (149, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":8,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:02:12', 7);
INSERT INTO `sys_oper_log` VALUES (150, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":9,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:02:25', 5);
INSERT INTO `sys_oper_log` VALUES (151, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":10,\"contractName\":\"5\",\"contractNumber\":\"5\",\"customerName\":\"5\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:03:14', 7);
INSERT INTO `sys_oper_log` VALUES (152, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":10,\"contractName\":\"5\",\"contractNumber\":\"5\",\"createdDate\":\"2024-10-04\",\"customerName\":\"5\",\"modifiedDate\":\"2024-10-04 17:03:14\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:05:25', 7);
INSERT INTO `sys_oper_log` VALUES (153, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":10,\"contractName\":\"5\",\"contractNumber\":\"5\",\"createdDate\":\"2024-10-04\",\"customerName\":\"5\",\"modifiedDate\":\"2024-10-04 17:03:14\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:05:39', 3);
INSERT INTO `sys_oper_log` VALUES (154, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":10,\"contractName\":\"5\",\"contractNumber\":\"5\",\"createdDate\":\"2024-10-04\",\"customerName\":\"5\",\"modifiedDate\":\"2024-10-04 17:03:14\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:08:26', 2);
INSERT INTO `sys_oper_log` VALUES (155, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":10,\"contractName\":\"5\",\"contractNumber\":\"5\",\"createdDate\":\"2024-10-04\",\"customerName\":\"5\",\"modifiedDate\":\"2024-10-04 17:03:14\",\"params\":{},\"productDetails\":[{\"allPrice\":0.0,\"productCode\":\"\",\"productName\":\"\",\"quantity\":1,\"unitPrice\":0.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:09:28', 2);
INSERT INTO `sys_oper_log` VALUES (156, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:10:04', 7);
INSERT INTO `sys_oper_log` VALUES (157, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:10:06', 6);
INSERT INTO `sys_oper_log` VALUES (158, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:10:07', 6);
INSERT INTO `sys_oper_log` VALUES (159, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:10:09', 5);
INSERT INTO `sys_oper_log` VALUES (160, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:10:11', 7);
INSERT INTO `sys_oper_log` VALUES (161, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"1555555555555\",\"contactPerson\":\"lhw\",\"contractId\":11,\"contractName\":\"lhw\",\"contractNumber\":\"10002\",\"customerName\":\"lhw\",\"endDate\":\"2024-10-31\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":200.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":10,\"unitPrice\":20.0},{\"allPrice\":800.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":20,\"unitPrice\":40.0},{\"allPrice\":3000.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":100,\"unitPrice\":30.0}],\"startDate\":\"2024-10-04\",\"status\":\"0\",\"totalValue\":10000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:11:09', 10);
INSERT INTO `sys_oper_log` VALUES (162, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"15555555555\",\"contactPerson\":\"lhw\",\"contractId\":11,\"contractName\":\"lhw\",\"contractNumber\":\"10002\",\"createdDate\":\"2024-10-04\",\"customerName\":\"lhw\",\"endDate\":\"2024-10-31\",\"modifiedDate\":\"2024-10-04 17:11:09\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":200.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":10,\"unitPrice\":20.0},{\"allPrice\":800.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":20,\"unitPrice\":40.0},{\"allPrice\":3000.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":100,\"unitPrice\":30.0}],\"startDate\":\"2024-10-04\",\"status\":\"0\",\"totalValue\":10000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:11:21', 7);
INSERT INTO `sys_oper_log` VALUES (163, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"188888888888\",\"contactPerson\":\"李宏威\",\"contractId\":1,\"contractName\":\"mes系统\",\"contractNumber\":\"10001\",\"createdDate\":\"2024-10-02\",\"customerName\":\"李宏威\",\"endDate\":\"2024-10-31\",\"modifiedDate\":\"2024-10-04 16:15:00\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":40.0,\"productCode\":\"1004\",\"productName\":\"产品4\",\"quantity\":1,\"unitPrice\":40.0}],\"startDate\":\"2024-10-01\",\"status\":\"1\",\"totalValue\":1200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:11:27', 9);
INSERT INTO `sys_oper_log` VALUES (164, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"18888888888\",\"contactPerson\":\"李宏威\",\"contractId\":1,\"contractName\":\"mes系统\",\"contractNumber\":\"10001\",\"createdDate\":\"2024-10-02\",\"customerName\":\"李宏威\",\"endDate\":\"2024-10-31\",\"modifiedDate\":\"2024-10-04 16:15:00\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":40.0,\"productCode\":\"1004\",\"productName\":\"产品4\",\"quantity\":1,\"unitPrice\":40.0}],\"startDate\":\"2024-10-01\",\"status\":\"1\",\"totalValue\":1200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-04 17:11:31', 7);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_orders\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:46:19', 182);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识\",\"columnId\":36,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderNumber\",\"columnComment\":\"制令编号\",\"columnId\":37,\"columnName\":\"order_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父制令 ID\",\"columnId\":38,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"Type\",\"columnComment\":\"制令类型（如：总制令、分制令、子制令）\",\"columnId\":39,\"columnName\":\"type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:48:03', 94);
INSERT INTO `sys_oper_log` VALUES (167, '合同，存储合同相关信息及其产品详情', 5, 'com.ruoyi.system.controller.ContractsController.export()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-05 13:48:47', 1376);
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"制令分类\",\"dictType\":\"orders_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:50:04', 18);
INSERT INTO `sys_oper_log` VALUES (169, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:50:04\",\"dictId\":102,\"dictName\":\"制令分类\",\"dictType\":\"order_type\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:50:12', 17);
INSERT INTO `sys_oper_log` VALUES (170, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总制令\",\"dictSort\":1,\"dictType\":\"order_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:50:35', 11);
INSERT INTO `sys_oper_log` VALUES (171, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分制令\",\"dictSort\":2,\"dictType\":\"order_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:50:46', 15);
INSERT INTO `sys_oper_log` VALUES (172, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"子制令\",\"dictSort\":3,\"dictType\":\"order_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:50:58', 1);
INSERT INTO `sys_oper_log` VALUES (173, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"制令状态\",\"dictType\":\"order_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:52:37', 16);
INSERT INTO `sys_oper_log` VALUES (174, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待生产\",\"dictSort\":1,\"dictType\":\"order_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:08', 23);
INSERT INTO `sys_oper_log` VALUES (175, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"生产中\",\"dictSort\":2,\"dictType\":\"order_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:16', 16);
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":3,\"dictType\":\"order_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:27', 15);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已发货\",\"dictSort\":4,\"dictType\":\"order_status\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:38', 16);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已关闭\",\"dictSort\":5,\"dictType\":\"order_status\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:47', 18);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"暂停\",\"dictSort\":6,\"dictType\":\"order_status\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:53:56', 13);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"异常\",\"dictSort\":7,\"dictType\":\"order_status\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:54:05', 1);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识\",\"columnId\":36,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-10-05 13:48:03\",\"usableColumn\":false},{\"capJavaField\":\"OrderNumber\",\"columnComment\":\"制令编号\",\"columnId\":37,\"columnName\":\"order_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-10-05 13:48:03\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父制令 ID\",\"columnId\":38,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-10-05 13:48:03\",\"usableColumn\":true},{\"capJavaField\":\"Type\",\"columnComment\":\"制令类型（如：总制令、分制令、子制令）\",\"columnId\":39,\"columnName\":\"type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"order_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 13:57:25', 21);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_orders\"}', NULL, 0, NULL, '2024-10-05 13:57:28', 221);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"orders/orders/index\",\"createTime\":\"2024-10-05 13:59:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"制令\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"orders\",\"perms\":\"orders:orders:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-05 14:00:24', 34);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"员工1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"员工1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-06 20:18:46', 191);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:43:06', 16);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"258111\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"258111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:43:43', 70);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"258222\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"258222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:44:39', 66);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"258333\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"258333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:44:51', 71);
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"worker\",\"roleName\":\"员工\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:47:55', 14);
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-07 16:47:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017],\"params\":{},\"roleId\":100,\"roleKey\":\"worker\",\"roleName\":\"员工\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:48:22', 13);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-10-07 16:43:43\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"258111\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"258111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:48:35', 12);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-10-07 16:44:39\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"258222\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"258222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:48:39', 8);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-10-07 16:44:51\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"258333\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"258333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-07 16:48:43', 10);
INSERT INTO `sys_oper_log` VALUES (194, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"test1\",\"contractNumber\":\"100003\",\"customerName\":\"test1\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 17:20:07', 63);
INSERT INTO `sys_oper_log` VALUES (195, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,                          type,                                                    batch_number,             status )           values ( ?,                          ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\n; Duplicate entry \'100001\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'', '2024-10-08 21:35:39', 45);
INSERT INTO `sys_oper_log` VALUES (196, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,                          type,                                                    batch_number,             status )           values ( ?,                          ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\n; Duplicate entry \'100001\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'', '2024-10-08 21:36:46', 107);
INSERT INTO `sys_oper_log` VALUES (197, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 21:38:04', 12);
INSERT INTO `sys_oper_log` VALUES (198, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 21:46:25', 74);
INSERT INTO `sys_oper_log` VALUES (199, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 21:48:31', 75);
INSERT INTO `sys_oper_log` VALUES (200, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 21:49:47', 40731);
INSERT INTO `sys_oper_log` VALUES (201, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-08 21:52:36', 86555);
INSERT INTO `sys_oper_log` VALUES (202, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":12,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.OrdersMapper.selectList', '2024-10-09 15:28:28', 217172);
INSERT INTO `sys_oper_log` VALUES (203, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":13,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.ProductsMapper.selectById', '2024-10-09 15:29:59', 105);
INSERT INTO `sys_oper_log` VALUES (204, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":14,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-09 15:32:22', 151);
INSERT INTO `sys_oper_log` VALUES (205, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":15,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":80.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":2,\"unitPrice\":40.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,                          type,             contract_id,                                       batch_number,             status )           values ( ?,                          ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'\n; Duplicate entry \'100001\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'100001\' for key \'tb_orders.order_number\'', '2024-10-10 00:19:39', 365);
INSERT INTO `sys_oper_log` VALUES (206, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":16,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":80.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":2,\"unitPrice\":40.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'15-20241010-3-1\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,             parent_id,             type,                                                    batch_number,             status )           values ( ?,             ?,             ?,                                                    ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'15-20241010-3-1\' for key \'tb_orders.order_number\'\n; Duplicate entry \'15-20241010-3-1\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'15-20241010-3-1\' for key \'tb_orders.order_number\'', '2024-10-10 00:24:24', 164);
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_orders', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 00:29:29', 143);
INSERT INTO `sys_oper_log` VALUES (208, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":17,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":80.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":2,\"unitPrice\":40.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'17-20241010-3-1\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,             parent_id,             type,                                                    batch_number,             status,                                       operation )           values ( ?,             ?,             ?,                                                    ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'17-20241010-3-1\' for key \'tb_orders.order_number\'\n; Duplicate entry \'17-20241010-3-1\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'17-20241010-3-1\' for key \'tb_orders.order_number\'', '2024-10-10 00:30:53', 414);
INSERT INTO `sys_oper_log` VALUES (209, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":18,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":80.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":2,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 00:33:45', 158);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task_assignments\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:36:43', 43);
INSERT INTO `sys_oper_log` VALUES (211, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"分配任务执行状态\",\"dictType\":\"task_assignment_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:40:36', 8);
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"执行中\",\"dictSort\":1,\"dictType\":\"task_assignment_status\",\"dictValue\":\"执行中\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:41:05', 19);
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":2,\"dictType\":\"task_assignment_status\",\"dictValue\":\"进行中\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:41:23', 9);
INSERT INTO `sys_oper_log` VALUES (214, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:41:05\",\"default\":false,\"dictCode\":115,\"dictLabel\":\"待执行\",\"dictSort\":1,\"dictType\":\"task_assignment_status\",\"dictValue\":\"待执行\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:41:34', 8);
INSERT INTO `sys_oper_log` VALUES (215, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":3,\"dictType\":\"task_assignment_status\",\"dictValue\":\"已完成\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:41:48', 9);
INSERT INTO `sys_oper_log` VALUES (216, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/10/258_1_20241010104221A001.jpg\",\"code\":200}', 0, NULL, '2024-10-10 10:42:21', 51);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"assignments\",\"className\":\"TaskAssignments\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务分配ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"子制令ID\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignedDate\",\"columnComment\":\"任务分配时间\",\"columnId\":51,\"columnName\":\"assigned_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:44:01', 22);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task_assignments\"}', NULL, 0, NULL, '2024-10-10 10:44:06', 215);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"taskAssignment\",\"className\":\"TaskAssignment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务分配ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:44:01\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"子制令ID\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:44:01\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:44:01\",\"usableColumn\":false},{\"capJavaField\":\"AssignedDate\",\"columnComment\":\"任务分配时间\",\"columnId\":51,\"columnName\":\"assigned_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEd', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:46:27', 14);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task_assignments\"}', NULL, 0, NULL, '2024-10-10 10:46:30', 22);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"taskAssignment/taskAssignment/index\",\"createTime\":\"2024-10-10 10:47:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"任务分配\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"taskAssignment\",\"perms\":\"taskAssignment:taskAssignment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-10 10:48:52', 35);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:10:13', 210);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"products\",\"className\":\"Products\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品唯一标识\",\"columnId\":28,\"columnName\":\"product_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-11 22:10:13\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":29,\"columnName\":\"product_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-11 22:10:13\",\"usableColumn\":false},{\"capJavaField\":\"ProductCode\",\"columnComment\":\"产品编号（或SKU）\",\"columnId\":30,\"columnName\":\"product_code\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productCode\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-10-11 22:10:13\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"产品分类\",\"columnId\":31,\"columnName\":\"category\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-02 17:24:19\",\"dictType\":\"product_category\",\"edi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:10:38', 87);
INSERT INTO `sys_oper_log` VALUES (224, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":19,\"contractName\":\"10005\",\"contractNumber\":\"10005\",\"customerName\":\"10005\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":80.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":2,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:17:41', 124);
INSERT INTO `sys_oper_log` VALUES (225, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/45', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))', '2024-10-11 22:18:12', 33);
INSERT INTO `sys_oper_log` VALUES (226, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/54', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:23', 8);
INSERT INTO `sys_oper_log` VALUES (227, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/55', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:31', 8);
INSERT INTO `sys_oper_log` VALUES (228, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/56', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:34', 6);
INSERT INTO `sys_oper_log` VALUES (229, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/57', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:36', 5);
INSERT INTO `sys_oper_log` VALUES (230, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/53', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:38', 6);
INSERT INTO `sys_oper_log` VALUES (231, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/52', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:41', 5);
INSERT INTO `sys_oper_log` VALUES (232, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/51', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:43', 6);
INSERT INTO `sys_oper_log` VALUES (233, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/50', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:45', 6);
INSERT INTO `sys_oper_log` VALUES (234, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/49', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:46', 5);
INSERT INTO `sys_oper_log` VALUES (235, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/48', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:50', 4);
INSERT INTO `sys_oper_log` VALUES (236, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/47', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:52', 6);
INSERT INTO `sys_oper_log` VALUES (237, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/46', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:57', 5);
INSERT INTO `sys_oper_log` VALUES (238, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/45', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:18:59', 7);
INSERT INTO `sys_oper_log` VALUES (239, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/14,18', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Contracts\\ContractsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ContractsMapper.deleteContractsByContractIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_contracts where contract_id in           (               ?          ,              ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))', '2024-10-11 22:19:07', 6);
INSERT INTO `sys_oper_log` VALUES (240, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:19:14', 7);
INSERT INTO `sys_oper_log` VALUES (241, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/14', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Contracts\\ContractsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ContractsMapper.deleteContractsByContractIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_contracts where contract_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))', '2024-10-11 22:19:16', 6);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignments', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2024-10-11 22:39:25', 35);
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"taskAssignment\",\"className\":\"TaskAssignment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务分配ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:46:27\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"子制令ID\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:46:27\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-10 10:46:27\",\"usableColumn\":false},{\"capJavaField\":\"AssignedDate\",\"columnComment\":\"任务分配时间\",\"columnId\":51,\"columnName\":\"assigned_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEd', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:39:40', 25);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignment', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-11 22:39:43', 18);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_products', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 12:51:25', 132);
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_operation,tb_machine\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:07:22', 151);
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"machine\",\"className\":\"Machine\",\"columns\":[{\"capJavaField\":\"MachineId\",\"columnComment\":\"机器ID\",\"columnId\":56,\"columnName\":\"machine_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MachineName\",\"columnComment\":\"机器名称\",\"columnId\":57,\"columnName\":\"machine_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"machineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MachineType\",\"columnComment\":\"机器类型\",\"columnId\":58,\"columnName\":\"machine_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"机器状态（可用、占用、维护中）\",\"columnId\":59,\"columnName\":\"status\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:08:16', 32);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"operation\",\"className\":\"Operation\",\"columns\":[{\"capJavaField\":\"OperationId\",\"columnComment\":\"工序ID\",\"columnId\":63,\"columnName\":\"operation_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"operationId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OperationName\",\"columnComment\":\"工序名称\",\"columnId\":64,\"columnName\":\"operation_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"operationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"工序描述\",\"columnId\":65,\"columnName\":\"description\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Duration\",\"columnComment\":\"工序预计时长（小时）\",\"columnId\":66,\"columnName\":\"duration\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:08:55', 33);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_machine\"}', NULL, 0, NULL, '2024-10-12 13:09:02', 94);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"machine/machine/index\",\"createTime\":\"2024-10-12 13:12:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"机器\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"machine\",\"perms\":\"machine:machine:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:13:12', 27);
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_operation\"}', NULL, 0, NULL, '2024-10-12 13:13:26', 359);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"operation/operation/index\",\"createTime\":\"2024-10-12 13:14:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"工序\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"operation\",\"perms\":\"operation:operation:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:15:07', 34);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"taskAssignment/taskAssignment/index\",\"createTime\":\"2024-10-10 10:47:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"taskAssignment\",\"perms\":\"taskAssignment:taskAssignment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:15:22', 18);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"machine\",\"className\":\"Machine\",\"columns\":[{\"capJavaField\":\"MachineId\",\"columnComment\":\"机器ID\",\"columnId\":56,\"columnName\":\"machine_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:08:16\",\"usableColumn\":false},{\"capJavaField\":\"MachineName\",\"columnComment\":\"机器名称\",\"columnId\":57,\"columnName\":\"machine_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"machineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:08:16\",\"usableColumn\":false},{\"capJavaField\":\"MachineType\",\"columnComment\":\"机器类型\",\"columnId\":58,\"columnName\":\"machine_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:08:16\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"机器状态（可用、占用、维护中）\",\"columnId\":59,\"columnName\":\"status\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:16:49', 67);
INSERT INTO `sys_oper_log` VALUES (255, '机器，存储所有机器的相关信息', 2, 'com.ruoyi.system.controller.MachineController.edit()', 'PUT', 1, 'admin', '研发部门', '/machine/machine', '127.0.0.1', '内网IP', '{\"createdDate\":\"2024-10-12 13:03:46\",\"description\":\"用于金属焊接的设备\",\"machineId\":6,\"machineName\":\"焊接机-3\",\"machineType\":\"焊接机\",\"modifiedDate\":\"2024-10-12 13:03:46\",\"params\":{},\"status\":\"可用\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 13:17:41', 17);
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignment', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 16:12:04', 131);
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"taskAssignment\",\"className\":\"TaskAssignment\",\"columns\":[{\"capJavaField\":\"TakeId\",\"columnComment\":\"任务分配ID\",\"columnId\":69,\"columnName\":\"take_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-10-12 16:12:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"takeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"制令ID\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 16:12:04\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 16:12:04\",\"usableColumn\":false},{\"capJavaField\":\"MachineId\",\"columnComment\":\"机器ID\",\"columnId\":70,\"columnName\":\"machine_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-10-12 16:12:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 16:12:52', 33);
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task_assignment\"}', NULL, 0, NULL, '2024-10-12 16:16:19', 31);
INSERT INTO `sys_oper_log` VALUES (259, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":20,\"contractName\":\"10003\",\"contractNumber\":\"10003\",\"customerName\":\"10003\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:03:43', 40);
INSERT INTO `sys_oper_log` VALUES (260, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":21,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:06:23', 347);
INSERT INTO `sys_oper_log` VALUES (261, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":22,\"contractName\":\"10005\",\"contractNumber\":\"10005\",\"customerName\":\"10005\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:08:02', 330);
INSERT INTO `sys_oper_log` VALUES (262, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":23,\"contractName\":\"10005\",\"contractNumber\":\"10005\",\"customerName\":\"10005\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:12:34', 105);
INSERT INTO `sys_oper_log` VALUES (263, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":24,\"contractName\":\"10005\",\"contractNumber\":\"10005\",\"customerName\":\"10005\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23-20241012-1\' for key \'tb_orders.order_number\'\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( order_number,                          type,             contract_id,                                       batch_number,             status )           values ( ?,                          ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23-20241012-1\' for key \'tb_orders.order_number\'\n; Duplicate entry \'23-20241012-1\' for key \'tb_orders.order_number\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'23-20241012-1\' for key \'tb_orders.order_number\'', '2024-10-12 17:14:09', 124);
INSERT INTO `sys_oper_log` VALUES (264, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":25,\"contractName\":\"10005\",\"contractNumber\":\"10005\",\"customerName\":\"10005\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:15:12', 24);
INSERT INTO `sys_oper_log` VALUES (265, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":26,\"contractName\":\"10003\",\"contractNumber\":\"10003\",\"customerName\":\"10003\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:16:08', 329);
INSERT INTO `sys_oper_log` VALUES (266, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":27,\"contractName\":\"10004\",\"contractNumber\":\"10004\",\"customerName\":\"10004\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:21:33', 114);
INSERT INTO `sys_oper_log` VALUES (267, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":28,\"contractName\":\"10006\",\"contractNumber\":\"10006\",\"customerName\":\"10006\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.dto.ProductOperation.getOperationId()\" because the return value of \"java.util.List.get(int)\" is null', '2024-10-12 17:27:48', 114);
INSERT INTO `sys_oper_log` VALUES (268, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":29,\"contractName\":\"10007\",\"contractNumber\":\"10007\",\"customerName\":\"10007\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 17:28:51', 439);
INSERT INTO `sys_oper_log` VALUES (269, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":29,\"contractName\":\"10007\",\"contractNumber\":\"10007\",\"createdDate\":\"2024-10-12\",\"customerName\":\"10007\",\"modifiedDate\":\"2024-10-12 17:28:51\",\"params\":{},\"productDetails\":[{\"allPrice\":30.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":3,\"unitPrice\":10.0},{\"allPrice\":60.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":3,\"unitPrice\":20.0}],\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-12 19:54:35', 9);
INSERT INTO `sys_oper_log` VALUES (270, '制令，存储总制令、分制令和子制令的信息', 1, 'com.ruoyi.system.controller.OrdersController.add()', 'POST', 1, 'admin', '研发部门', '/orders/orders', '127.0.0.1', '内网IP', '{\"children\":[],\"params\":{},\"parentId\":86}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'order_number\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders          ( parent_id )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'order_number\' doesn\'t have a default value\n; Field \'order_number\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'order_number\' doesn\'t have a default value', '2024-10-12 20:49:25', 32);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_orders', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 09:38:52', 191);
INSERT INTO `sys_oper_log` VALUES (272, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":30,\"contractName\":\"10008\",\"contractNumber\":\"10008\",\"customerName\":\"10008\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 09:42:06', 158);
INSERT INTO `sys_oper_log` VALUES (273, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":31,\"contractName\":\"10008\",\"contractNumber\":\"10008\",\"customerName\":\"10008\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 09:43:13', 115);
INSERT INTO `sys_oper_log` VALUES (274, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":32,\"contractName\":\"10008\",\"contractNumber\":\"10008\",\"customerName\":\"10008\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 09:45:03', 602);
INSERT INTO `sys_oper_log` VALUES (275, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/32', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-10-13 09:46:39', 34);
INSERT INTO `sys_oper_log` VALUES (276, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":33,\"contractName\":\"10008\",\"contractNumber\":\"10008\",\"customerName\":\"10008\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 09:46:58', 194);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"machine\",\"className\":\"Machine\",\"columns\":[{\"capJavaField\":\"MachineId\",\"columnComment\":\"机器ID\",\"columnId\":56,\"columnName\":\"machine_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:16:49\",\"usableColumn\":false},{\"capJavaField\":\"MachineName\",\"columnComment\":\"机器名称\",\"columnId\":57,\"columnName\":\"machine_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"machineName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:16:49\",\"usableColumn\":false},{\"capJavaField\":\"MachineType\",\"columnComment\":\"机器类型\",\"columnId\":58,\"columnName\":\"machine_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"machineType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-10-12 13:16:49\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"机器状态（可用、占用、维护中）\",\"columnId\":59,\"columnName\":\"status\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-12 13:07:22\",\"dictType\":\"\",\"edit\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 10:18:48', 35);
INSERT INTO `sys_oper_log` VALUES (278, '制令，存储总制令、分制令和子制令的信息', 1, 'com.ruoyi.system.controller.OrdersController.add()', 'POST', 1, 'admin', '研发部门', '/orders/orders', '127.0.0.1', '内网IP', '{\"children\":[],\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.insertOrders-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_orders\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-10-13 10:20:35', 122);
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignment', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 10:37:56', 130);
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"taskAssignment\",\"className\":\"TaskAssignment\",\"columns\":[{\"capJavaField\":\"TakeId\",\"columnComment\":\"任务分配ID\",\"columnId\":69,\"columnName\":\"take_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-10-12 16:12:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"takeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-13 10:37:56\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"制令ID\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-13 10:37:56\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":50,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-10 10:36:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-10-13 10:37:56\",\"usableColumn\":false},{\"capJavaField\":\"MachineId\",\"columnComment\":\"机器ID\",\"columnId\":70,\"columnName\":\"machine_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-10-12 16:12:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 10:39:50', 62);
INSERT INTO `sys_oper_log` VALUES (281, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":33,\"contractName\":\"10008\",\"contractNumber\":\"10008\",\"createdDate\":\"2024-10-13\",\"customerName\":\"10008\",\"modifiedDate\":\"2024-10-13 09:46:58\",\"params\":{},\"productDetails\":[{\"allPrice\":90.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":3,\"unitPrice\":30.0},{\"allPrice\":120.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":3,\"unitPrice\":40.0}],\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 12:31:13', 17);
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignment', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-13 14:02:23', 40);
INSERT INTO `sys_oper_log` VALUES (283, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, '258111', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/10/18/1729223916958_20241018115837A001.png\",\"code\":200}', 0, NULL, '2024-10-18 11:58:37', 52);
INSERT INTO `sys_oper_log` VALUES (284, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"蜡模车间\",\"dictSort\":4,\"dictType\":\"product_category\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 16:00:09', 10);
INSERT INTO `sys_oper_log` VALUES (285, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"4\",\"description\":\"射蜡班组\",\"params\":{},\"price\":200,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡班组\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 16:01:03', 9);
INSERT INTO `sys_oper_log` VALUES (286, '产品，存储产品相关信息', 2, 'com.ruoyi.system.controller.ProductsController.edit()', 'PUT', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"4\",\"createdDate\":\"2024-10-31 16:01:03\",\"description\":\"射蜡件\",\"modifiedDate\":\"2024-10-31 16:01:03\",\"params\":{},\"price\":200,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 16:31:52', 9);
INSERT INTO `sys_oper_log` VALUES (287, '工序，存储工序及其相关信息', 3, 'com.ruoyi.system.controller.OperationController.remove()', 'DELETE', 1, 'admin', '研发部门', '/operation/operation/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 16:34:38', 8);
INSERT INTO `sys_oper_log` VALUES (288, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/29', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\Contracts\\ContractsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ContractsMapper.deleteContractsByContractIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_contracts where contract_id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`))', '2024-10-31 17:24:29', 171);
INSERT INTO `sys_oper_log` VALUES (289, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":34,\"contractName\":\"测试射蜡件1\",\"contractNumber\":\"10009\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 17:25:40', 166);
INSERT INTO `sys_oper_log` VALUES (290, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":34,\"contractName\":\"测试射蜡件1\",\"contractNumber\":\"10009\",\"createdDate\":\"2024-10-31\",\"customerName\":\"1\",\"modifiedDate\":\"2024-10-31 17:25:40\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-31 17:26:26', 12);
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_material\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-02 17:37:07', 311);
INSERT INTO `sys_oper_log` VALUES (292, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"material\",\"className\":\"Material\",\"columns\":[{\"capJavaField\":\"MaterialId\",\"columnComment\":\"物料ID\",\"columnId\":75,\"columnName\":\"material_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-11-02 17:37:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"materialId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MaterialName\",\"columnComment\":\"物料名称\",\"columnId\":76,\"columnName\":\"material_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-02 17:37:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"materialName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Unit\",\"columnComment\":\"单位（如吨、公斤、个）\",\"columnId\":77,\"columnName\":\"unit\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-02 17:37:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"unit\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Quantity\",\"columnComment\":\"库存数量\",\"columnId\":78,\"columnName\":\"quantity\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-02 17:37:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQue', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-02 17:37:57', 25);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_material\"}', NULL, 0, NULL, '2024-11-02 17:38:01', 315);
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"material/material/index\",\"createTime\":\"2024-11-02 17:40:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"物料\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"material\",\"perms\":\"material:material:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-02 17:40:52', 46);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_work_report\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 19:42:48', 149);
INSERT INTO `sys_oper_log` VALUES (296, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"report\",\"className\":\"WorkReport\",\"columns\":[{\"capJavaField\":\"WorkReportId\",\"columnComment\":\"唯一标识每条报工记录\",\"columnId\":84,\"columnName\":\"work_report_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-11-03 19:42:48\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"workReportId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"标识报工员工的唯一ID\",\"columnId\":85,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-11-03 19:42:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"报工员工的姓名\",\"columnId\":86,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-03 19:42:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeamName\",\"columnComment\":\"员工所在班组的名称\",\"columnId\":87,\"columnName\":\"team_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-11-03 19:42:48\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 19:44:33', 26);
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_work_report\"}', NULL, 0, NULL, '2024-11-03 19:45:08', 26);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"report/report/index\",\"createTime\":\"2024-11-03 19:48:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"报工\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"report\",\"perms\":\"report:report:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 19:48:48', 33);
INSERT INTO `sys_oper_log` VALUES (299, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '127.0.0.1', '内网IP', '{\"endTime\":\"2024-11-03\",\"machineId\":1,\"operationId\":10,\"operationName\":\"10\",\"params\":{},\"quantity\":150,\"remarks\":\"生产进展顺利\",\"reportStatus\":\"已完成\",\"startTime\":\"2024-11-03\",\"teamName\":\"射蜡班组\",\"userId\":101,\"username\":\"123\",\"workReportId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 20:04:26', 206);
INSERT INTO `sys_oper_log` VALUES (300, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '192.168.43.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\report\\WorkReportMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WorkReportMapper.insertWorkReport-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_work_report\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-11-03 21:50:42', 31);
INSERT INTO `sys_oper_log` VALUES (301, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '192.168.43.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\report\\WorkReportMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WorkReportMapper.insertWorkReport-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_work_report\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-11-03 21:53:05', 0);
INSERT INTO `sys_oper_log` VALUES (302, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '192.168.43.1', '内网IP', '{\"endTime\":\"2024-11-03\",\"machineId\":30,\"operationId\":9,\"operationName\":\"射水溶芯\",\"params\":{},\"quantity\":3,\"remarks\":\"无\",\"reportStatus\":\"已完成\",\"startTime\":\"2024-11-03\",\"teamName\":\"射蜡班组\",\"userId\":101,\"username\":\"258111\",\"workReportId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 21:57:00', 0);
INSERT INTO `sys_oper_log` VALUES (303, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '192.168.43.1', '内网IP', '{\"taskId\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-03 22:12:43', 13);
INSERT INTO `sys_oper_log` VALUES (304, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-07 16:47:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047],\"params\":{},\"roleId\":100,\"roleKey\":\"worker\",\"roleName\":\"员工\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-04 10:19:26', 71);
INSERT INTO `sys_oper_log` VALUES (305, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, '258111', NULL, '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"1234567890\",\"contactPerson\":\"李宏威\",\"contractId\":1,\"contractName\":\"mes系统\",\"contractNumber\":\"10001\",\"createdDate\":\"2024-10-02\",\"customerName\":\"李宏威\",\"endDate\":\"2024-10-31\",\"modifiedDate\":\"2024-10-04 16:15:00\",\"params\":{},\"productDetails\":[{\"allPrice\":10.0,\"productCode\":\"1001\",\"productId\":0,\"productName\":\"产品1\",\"quantity\":1,\"unitPrice\":10.0},{\"allPrice\":40.0,\"productCode\":\"1004\",\"productId\":0,\"productName\":\"产品4\",\"quantity\":1,\"unitPrice\":40.0}],\"startDate\":\"2024-10-01\",\"status\":\"1\",\"totalValue\":1200000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-04 10:20:26', 48);
INSERT INTO `sys_oper_log` VALUES (306, '合同，存储合同相关信息及其产品详情', 2, 'com.ruoyi.system.controller.ContractsController.edit()', 'PUT', 1, '258111', NULL, '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"address\":\"石家庄铁道大学\",\"contactNumber\":\"1233332131\",\"contactPerson\":\"lhw\",\"contractId\":11,\"contractName\":\"lhw\",\"contractNumber\":\"10002\",\"createdDate\":\"2024-10-04\",\"customerName\":\"lhw\",\"endDate\":\"2024-10-31\",\"modifiedDate\":\"2024-10-04 17:11:09\",\"params\":{},\"productDetails\":[{\"allPrice\":20.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":2,\"unitPrice\":10.0},{\"allPrice\":200.0,\"productCode\":\"1002\",\"productId\":2,\"productName\":\"产品2\",\"quantity\":10,\"unitPrice\":20.0},{\"allPrice\":800.0,\"productCode\":\"1004\",\"productId\":4,\"productName\":\"产品4\",\"quantity\":20,\"unitPrice\":40.0},{\"allPrice\":3000.0,\"productCode\":\"1003\",\"productId\":3,\"productName\":\"产品3\",\"quantity\":100,\"unitPrice\":30.0}],\"startDate\":\"2024-10-04\",\"status\":\"0\",\"totalValue\":10000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-04 10:20:32', 16);
INSERT INTO `sys_oper_log` VALUES (307, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '172.20.10.5', '内网IP', '{\"taskId\":\"8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-04 11:43:38', 45);
INSERT INTO `sys_oper_log` VALUES (308, '报工，用于记录员工的报工信息', 1, 'com.ruoyi.system.controller.WorkReportController.add()', 'POST', 1, '258111', NULL, '/report/report', '172.20.10.5', '内网IP', '{\"taskId\":\"8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-04 11:45:53', 29);
INSERT INTO `sys_oper_log` VALUES (309, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/84', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:00:47', 63);
INSERT INTO `sys_oper_log` VALUES (310, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/115', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:05:35', 7);
INSERT INTO `sys_oper_log` VALUES (311, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/113', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:05:42', 8);
INSERT INTO `sys_oper_log` VALUES (312, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/85', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:05:45', 6);
INSERT INTO `sys_oper_log` VALUES (313, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/86', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:05:51', 3);
INSERT INTO `sys_oper_log` VALUES (314, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/86', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:05:56', 5);
INSERT INTO `sys_oper_log` VALUES (315, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/88', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:06:12', 4);
INSERT INTO `sys_oper_log` VALUES (316, '任务分配，存储每个子制令的任务分配情况', 3, 'com.ruoyi.system.controller.TaskAssignmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/taskAssignment/taskAssignment/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:07:14', 11);
INSERT INTO `sys_oper_log` VALUES (317, '任务分配，存储每个子制令的任务分配情况', 3, 'com.ruoyi.system.controller.TaskAssignmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/taskAssignment/taskAssignment/8', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_material`, CONSTRAINT `tb_task_material_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task_assignment` (`take_id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\taskAssignment\\TaskAssignmentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TaskAssignmentMapper.deleteTaskAssignmentByTakeIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_task_assignment where take_id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_material`, CONSTRAINT `tb_task_material_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task_assignment` (`take_id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_material`, CONSTRAINT `tb_task_material_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task_assignment` (`take_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_material`, CONSTRAINT `tb_task_material_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task_assignment` (`take_id`))', '2024-11-26 21:07:16', 7);
INSERT INTO `sys_oper_log` VALUES (318, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":35,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":100.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":10,\"unitPrice\":10.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:10:42', 52);
INSERT INTO `sys_oper_log` VALUES (319, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/126', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_orders`, CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:10:52', 4);
INSERT INTO `sys_oper_log` VALUES (320, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/129', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:43', 12);
INSERT INTO `sys_oper_log` VALUES (321, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/128', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:44', 5);
INSERT INTO `sys_oper_log` VALUES (322, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/127', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\orders\\OrdersMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.OrdersMapper.deleteOrdersByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from tb_orders where id in          (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry_vue`.`tb_task_assignment`, CONSTRAINT `tb_task_assignment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`))', '2024-11-26 21:29:46', 6);
INSERT INTO `sys_oper_log` VALUES (323, '任务分配，存储每个子制令的任务分配情况', 3, 'com.ruoyi.system.controller.TaskAssignmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/taskAssignment/taskAssignment/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:52', 7);
INSERT INTO `sys_oper_log` VALUES (324, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/127', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:56', 6);
INSERT INTO `sys_oper_log` VALUES (325, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:57', 8);
INSERT INTO `sys_oper_log` VALUES (326, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/125', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:29:58', 5);
INSERT INTO `sys_oper_log` VALUES (327, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/35', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:30:08', 6);
INSERT INTO `sys_oper_log` VALUES (328, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":36,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:30:19', 107);
INSERT INTO `sys_oper_log` VALUES (329, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_orders', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:46:58', 83);
INSERT INTO `sys_oper_log` VALUES (330, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orders\",\"className\":\"Orders\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识\",\"columnId\":36,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 21:46:58\",\"usableColumn\":false},{\"capJavaField\":\"OrderNumber\",\"columnComment\":\"制令编号\",\"columnId\":37,\"columnName\":\"order_number\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 21:46:58\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父制令 ID\",\"columnId\":38,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-11-26 21:46:58\",\"usableColumn\":true},{\"capJavaField\":\"Type\",\"columnComment\":\"制令类型（如：总制令、分制令、子制令）\",\"columnId\":39,\"columnName\":\"type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-05 13:46:19\",\"dictType\":\"order_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 21:47:32', 28);
INSERT INTO `sys_oper_log` VALUES (331, '制令，存储总制令、分制令和子制令的信息', 3, 'com.ruoyi.system.controller.OrdersController.remove()', 'DELETE', 1, 'admin', '研发部门', '/orders/orders/138', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:02:55', 34);
INSERT INTO `sys_oper_log` VALUES (332, '合同，存储合同相关信息及其产品详情', 3, 'com.ruoyi.system.controller.ContractsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/Contracts/contracts/36', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:03:14', 5);
INSERT INTO `sys_oper_log` VALUES (333, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":37,\"contractName\":\"1\",\"contractNumber\":\"1\",\"customerName\":\"1\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:03:26', 172);
INSERT INTO `sys_oper_log` VALUES (334, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/tb_task_assignment', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2024-11-26 22:21:23', 61);
INSERT INTO `sys_oper_log` VALUES (335, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:21:27', 15);
INSERT INTO `sys_oper_log` VALUES (336, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:21:35', 130);
INSERT INTO `sys_oper_log` VALUES (337, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"task\",\"className\":\"Task\",\"columns\":[{\"capJavaField\":\"TaskId\",\"columnComment\":\"任务分配ID\",\"columnId\":97,\"columnName\":\"task_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-11-26 22:21:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"制令ID\",\"columnId\":98,\"columnName\":\"order_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-11-26 22:21:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"员工ID\",\"columnId\":99,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-26 22:21:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AssignedDate\",\"columnComment\":\"任务分配时间\",\"columnId\":100,\"columnName\":\"assigned_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-11-26 22:21:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"ja', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:22:40', 83);
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-11-26 22:30:22', 11);
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-11-26 22:30:29', 10);
INSERT INTO `sys_oper_log` VALUES (340, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-07 16:47:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047],\"params\":{},\"roleId\":100,\"roleKey\":\"worker\",\"roleName\":\"员工\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:30:42', 36);
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:30:50', 12);
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:30:53', 9);
INSERT INTO `sys_oper_log` VALUES (343, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:30:55', 12);
INSERT INTO `sys_oper_log` VALUES (344, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:30:57', 10);
INSERT INTO `sys_oper_log` VALUES (345, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:31:00', 10);
INSERT INTO `sys_oper_log` VALUES (346, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:31:02', 9);
INSERT INTO `sys_oper_log` VALUES (347, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task\"}', NULL, 0, NULL, '2024-11-26 22:31:14', 71);
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"task/task/index\",\"createTime\":\"2024-11-26 22:32:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2048,\"menuName\":\"任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"task\",\"perms\":\"task:task:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 22:33:22', 9);
INSERT INTO `sys_oper_log` VALUES (349, '任务分配，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息', 3, 'com.ruoyi.system.controller.TaskController.remove()', 'DELETE', 1, 'admin', '研发部门', '/task/task/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-26 23:32:22', 9);
INSERT INTO `sys_oper_log` VALUES (350, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Operation.getOperationName()\" because the return value of \"com.ruoyi.system.mapper.OperationMapper.selectOperationByOperationId(java.lang.Long)\" is null', '2024-11-27 10:35:01', 20);
INSERT INTO `sys_oper_log` VALUES (351, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Operation.getOperationName()\" because the return value of \"com.ruoyi.system.mapper.OperationMapper.selectOperationByOperationId(java.lang.Long)\" is null', '2024-11-27 10:35:05', 17);
INSERT INTO `sys_oper_log` VALUES (352, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Operation.getOperationName()\" because the return value of \"com.ruoyi.system.mapper.OperationMapper.selectOperationByOperationId(java.lang.Long)\" is null', '2024-11-27 10:35:05', 28);
INSERT INTO `sys_oper_log` VALUES (353, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Operation.getOperationName()\" because the return value of \"com.ruoyi.system.mapper.OperationMapper.selectOperationByOperationId(java.lang.Long)\" is null', '2024-11-27 10:38:04', 27);
INSERT INTO `sys_oper_log` VALUES (354, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Operation.getOperationName()\" because the return value of \"com.ruoyi.system.mapper.OperationMapper.selectOperationByOperationId(java.lang.Long)\" is null', '2024-11-27 10:39:10', 36);
INSERT INTO `sys_oper_log` VALUES (355, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-27 10:42:15', 26);
INSERT INTO `sys_oper_log` VALUES (356, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-27 10:42:41', 14);
INSERT INTO `sys_oper_log` VALUES (357, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-27 10:44:18', 30);
INSERT INTO `sys_oper_log` VALUES (358, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-27 10:44:24', 15);
INSERT INTO `sys_oper_log` VALUES (359, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-27 10:44:55', 25);
INSERT INTO `sys_oper_log` VALUES (360, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_task_machine\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-27 18:09:29', 82);
INSERT INTO `sys_oper_log` VALUES (361, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":1}]}', 0, NULL, '2024-11-27 18:54:41', 28);
INSERT INTO `sys_oper_log` VALUES (362, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":38,\"contractName\":\"2\",\"contractNumber\":\"2\",\"customerName\":\"2\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:06:16', 83);
INSERT INTO `sys_oper_log` VALUES (363, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":7}]}', 0, NULL, '2024-11-28 09:28:44', 20);
INSERT INTO `sys_oper_log` VALUES (364, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/38', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-28 09:28:59', 22);
INSERT INTO `sys_oper_log` VALUES (365, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":7}]}', 0, NULL, '2024-11-28 09:29:02', 12);
INSERT INTO `sys_oper_log` VALUES (366, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/38', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":0}]}', 0, NULL, '2024-11-28 09:29:04', 11);
INSERT INTO `sys_oper_log` VALUES (367, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_checkin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:43:31', 28);
INSERT INTO `sys_oper_log` VALUES (368, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"checkin\",\"className\":\"Checkin\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识\",\"columnId\":109,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-28 09:43:31\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EmployeeId\",\"columnComment\":\"员工ID\",\"columnId\":110,\"columnName\":\"employee_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-11-28 09:43:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"employeeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInTime\",\"columnComment\":\"出勤时间\",\"columnId\":111,\"columnName\":\"check_in_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-11-28 09:43:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckOutTime\",\"columnComment\":\"退勤时间\",\"columnId\":112,\"columnName\":\"check_out_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-11-28 09:43:31\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:44:44', 47);
INSERT INTO `sys_oper_log` VALUES (369, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_checkin\"}', NULL, 0, NULL, '2024-11-28 09:44:50', 581);
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"checkin/checkin/index\",\"createTime\":\"2024-11-28 09:46:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2054,\"menuName\":\"出勤，记录员工的出勤信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"checkin\",\"perms\":\"checkin:checkin:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:47:48', 15);
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"checkin/checkin/index\",\"createTime\":\"2024-11-28 09:46:51\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2054,\"menuName\":\"出勤\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"checkin\",\"perms\":\"checkin:checkin:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:48:01', 12);
INSERT INTO `sys_oper_log` VALUES (372, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-07 16:47:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059],\"params\":{},\"roleId\":100,\"roleKey\":\"worker\",\"roleName\":\"员工\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 09:48:17', 24);
INSERT INTO `sys_oper_log` VALUES (373, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Project\\RuoYi\\MES\\RuoYi-Vue-master\\ruoyi-admin\\target\\classes\\mapper\\checkin\\CheckinMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CheckinMapper.insertCheckin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_checkin          ( check_in_time )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-11-28 09:59:33', 268);
INSERT INTO `sys_oper_log` VALUES (374, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28\",\"id\":1,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 10:02:56', 220);
INSERT INTO `sys_oper_log` VALUES (375, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28\",\"id\":2,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 10:23:27', 11);
INSERT INTO `sys_oper_log` VALUES (376, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28 10:49:30\",\"id\":3,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 10:49:30', 31);
INSERT INTO `sys_oper_log` VALUES (377, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28 10:51:37\",\"id\":4,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 10:51:37', 8);
INSERT INTO `sys_oper_log` VALUES (378, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28 16:18:53\",\"id\":5,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 16:18:53', 66);
INSERT INTO `sys_oper_log` VALUES (379, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258111', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-28 17:24:23\",\"id\":6,\"params\":{},\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-28 17:24:23', 12);
INSERT INTO `sys_oper_log` VALUES (380, '产品，存储产品相关信息', 1, 'com.ruoyi.system.controller.ProductsController.add()', 'POST', 1, 'admin', '研发部门', '/products/products', '127.0.0.1', '内网IP', '{\"category\":\"4\",\"description\":\"修蜡件\",\"params\":{},\"price\":200,\"productCode\":\"1006\",\"productId\":6,\"productName\":\"修蜡件\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 14:43:57', 22);
INSERT INTO `sys_oper_log` VALUES (381, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/38', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":2}]}', 0, NULL, '2024-11-29 15:17:08', 46);
INSERT INTO `sys_oper_log` VALUES (382, '合同进度', 0, 'com.ruoyi.system.controller.ContractsController.getProgress()', 'GET', 1, 'admin', '研发部门', '/Contracts/contracts/getProgress/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"total\":7,\"quantity\":10,\"name\":\"射蜡件\",\"completed\":7}]}', 0, NULL, '2024-11-29 15:17:10', 40);
INSERT INTO `sys_oper_log` VALUES (383, '合同，存储合同相关信息及其产品详情', 1, 'com.ruoyi.system.controller.ContractsController.add()', 'POST', 1, 'admin', '研发部门', '/Contracts/contracts', '127.0.0.1', '内网IP', '{\"contractId\":39,\"contractName\":\"3\",\"contractNumber\":\"3\",\"customerName\":\"3\",\"params\":{},\"productDetails\":[{\"allPrice\":2000.0,\"productCode\":\"1005\",\"productId\":5,\"productName\":\"射蜡件\",\"quantity\":10,\"unitPrice\":200.0},{\"allPrice\":2000.0,\"productCode\":\"1006\",\"productId\":6,\"productName\":\"修蜡件\",\"quantity\":10,\"unitPrice\":200.0},{\"allPrice\":100.0,\"productCode\":\"1001\",\"productId\":1,\"productName\":\"产品1\",\"quantity\":10,\"unitPrice\":10.0}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 15:18:04', 144);
INSERT INTO `sys_oper_log` VALUES (384, '出勤，记录员工的出勤信息', 1, 'com.ruoyi.system.controller.CheckinController.add()', 'POST', 1, '258222', NULL, '/checkin/checkin', '192.168.43.1', '内网IP', '{\"checkInTime\":\"2024-11-29 15:52:53\",\"id\":7,\"params\":{},\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-11-29 15:52:53', 15);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-10-01 11:04:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-10-01 11:04:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-10-01 11:04:21', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '员工', 'worker', 3, '1', 1, 1, '0', '0', 'admin', '2024-10-07 16:47:55', 'admin', '2024-11-28 09:48:17', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '258', '00', 'Lhw258333@gmail.com', '18832122809', '0', '/profile/avatar/2024/10/10/258_1_20241010104221A001.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-11-29 15:50:44', 'admin', '2024-10-01 11:04:21', '', '2024-11-29 15:50:43', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-01 11:04:21', 'admin', '2024-10-01 11:04:21', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '员工1', '员工1', '00', '', '', '0', '', '$2a$10$73kVBk62zvaEYMSsJmajCeP8xtlx6GBTqCsXeA2u42oUkADVd.uie', '0', '2', '', NULL, 'admin', '2024-10-06 20:18:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '258111', '258111', '00', '', '', '0', '/profile/avatar/2024/10/18/1729223916958_20241018115837A001.png', '$2a$10$F.rhypWnp6cMy.2QiLs3EO5JPr2jjo6bL8sOjIt/bn/zZjpWbMNB6', '0', '0', '192.168.43.1', '2024-11-29 16:05:47', 'admin', '2024-10-07 16:43:43', 'admin', '2024-11-29 16:05:47', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '258222', '258222', '00', '', '', '0', '', '$2a$10$upWiPCk4LLmOekuIotjr9eGWF3V1JUgQ98HDtH6EGt6U/x9h/Ttl2', '0', '0', '192.168.43.1', '2024-11-29 16:02:32', 'admin', '2024-10-07 16:44:39', 'admin', '2024-11-29 16:02:32', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, '258333', '258333', '00', '', '', '0', '', '$2a$10$i5uMC.PiCASjFotROjB8Wev4H6CFADqgpUq5BWMTWhb51e269RBq2', '0', '0', '127.0.0.1', '2024-10-13 13:24:17', 'admin', '2024-10-07 16:44:51', 'admin', '2024-10-13 13:24:16', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 100);

-- ----------------------------
-- Table structure for tb_checkin
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkin`;
CREATE TABLE `tb_checkin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `user_id` bigint NOT NULL COMMENT '员工ID',
  `check_in_time` datetime NOT NULL COMMENT '出勤时间',
  `check_out_time` datetime NULL DEFAULT NULL COMMENT '退勤时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '出勤表，记录员工的出勤信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_checkin
-- ----------------------------
INSERT INTO `tb_checkin` VALUES (4, 101, '2024-11-26 10:51:37', '2024-11-28 16:16:54');
INSERT INTO `tb_checkin` VALUES (5, 101, '2024-11-26 16:18:53', '2024-11-28 17:22:48');
INSERT INTO `tb_checkin` VALUES (6, 101, '2024-11-28 17:24:23', '2024-11-28 17:25:14');
INSERT INTO `tb_checkin` VALUES (7, 102, '2024-11-29 15:52:54', '2024-11-29 16:04:25');

-- ----------------------------
-- Table structure for tb_contracts
-- ----------------------------
DROP TABLE IF EXISTS `tb_contracts`;
CREATE TABLE `tb_contracts`  (
  `contract_id` int NOT NULL AUTO_INCREMENT COMMENT '合同唯一标识',
  `contract_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同编号',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户名称',
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户地址',
  `start_date` date NULL DEFAULT NULL COMMENT '合同开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '合同结束日期',
  `total_value` decimal(10, 2) NULL DEFAULT NULL COMMENT '合同总金额',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同状态（如：有效、无效）',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `product_details` json NULL COMMENT '产品编号及数量信息 (JSON格式)',
  `contract_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '合同名称',
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '合同表，存储合同相关信息及其产品详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_contracts
-- ----------------------------
INSERT INTO `tb_contracts` VALUES (37, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 22:03:26', '2024-11-26 22:03:26', '[{\"allPrice\": 2000.0, \"quantity\": 10, \"productId\": 5, \"unitPrice\": 200.0, \"productCode\": \"1005\", \"productName\": \"射蜡件\"}]', '1');
INSERT INTO `tb_contracts` VALUES (38, '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-28 09:06:16', '2024-11-28 09:06:16', '[{\"allPrice\": 2000.0, \"quantity\": 10, \"productId\": 5, \"unitPrice\": 200.0, \"productCode\": \"1005\", \"productName\": \"射蜡件\"}]', '2');
INSERT INTO `tb_contracts` VALUES (39, '3', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 15:18:04', '2024-11-29 15:18:04', '[{\"allPrice\": 2000.0, \"quantity\": 10, \"productId\": 5, \"unitPrice\": 200.0, \"productCode\": \"1005\", \"productName\": \"射蜡件\"}, {\"allPrice\": 2000.0, \"quantity\": 10, \"productId\": 6, \"unitPrice\": 200.0, \"productCode\": \"1006\", \"productName\": \"修蜡件\"}, {\"allPrice\": 100.0, \"quantity\": 10, \"productId\": 1, \"unitPrice\": 10.0, \"productCode\": \"1001\", \"productName\": \"产品1\"}]', '3');

-- ----------------------------
-- Table structure for tb_machine
-- ----------------------------
DROP TABLE IF EXISTS `tb_machine`;
CREATE TABLE `tb_machine`  (
  `machine_id` int NOT NULL AUTO_INCREMENT COMMENT '机器ID',
  `machine_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机器名称',
  `machine_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '机器类型',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '可用' COMMENT '机器状态（可用、占用、维护中）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '机器描述',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`machine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '机器表，存储所有机器的相关信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_machine
-- ----------------------------
INSERT INTO `tb_machine` VALUES (1, '激光切割机-1', '激光切割机', '可用', '用于材料切割的激光设备', '2024-10-12 13:03:46', '2024-11-28 08:31:29');
INSERT INTO `tb_machine` VALUES (2, '激光切割机-2', '激光切割机', '可用', '用于材料切割的激光设备', '2024-10-12 13:03:46', '2024-11-28 08:31:29');
INSERT INTO `tb_machine` VALUES (3, '激光切割机-3', '激光切割机', '可用', '用于材料切割的激光设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (4, '焊接机-1', '焊接机', '可用', '用于金属焊接的设备', '2024-10-12 13:03:46', '2024-11-28 08:31:29');
INSERT INTO `tb_machine` VALUES (5, '焊接机-2', '焊接机', '可用', '用于金属焊接的设备', '2024-10-12 13:03:46', '2024-11-28 08:31:29');
INSERT INTO `tb_machine` VALUES (6, '焊接机-3', '焊接机', '可用', '用于金属焊接的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (7, '组装机器人-1', '组装机器人', '可用', '用于产品组装的机器人', '2024-10-12 13:03:46', '2024-11-28 08:31:29');
INSERT INTO `tb_machine` VALUES (8, '组装机器人-2', '组装机器人', '可用', '用于产品组装的机器人', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (9, '打磨机-1', '打磨机', '可用', '用于产品表面处理的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (10, '打磨机-2', '打磨机', '可用', '用于产品表面处理的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (11, '铣削机-1', '铣削机', '可用', '用于材料铣削的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (12, '铣削机-2', '铣削机', '可用', '用于材料铣削的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (13, '冲压机-1', '冲压机', '可用', '用于金属冲压的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (14, '冲压机-2', '冲压机', '维护中', '用于金属冲压的设备', '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_machine` VALUES (30, '射蜡机1', '铸造设备', '可用', '用于射蜡的高精度机器1', '2024-10-31 16:50:59', '2024-11-29 16:07:15');
INSERT INTO `tb_machine` VALUES (31, '射蜡机2', '铸造设备', '可用', '用于射蜡的高精度机器2', '2024-10-31 16:50:59', '2024-10-31 16:50:59');
INSERT INTO `tb_machine` VALUES (32, '射蜡机3', '铸造设备', '可用', '用于射蜡的高精度机器3', '2024-10-31 16:50:59', '2024-10-31 16:50:59');
INSERT INTO `tb_machine` VALUES (33, '射蜡机4', '铸造设备', '可用', '用于射蜡的高精度机器4', '2024-10-31 16:50:59', '2024-10-31 16:50:59');
INSERT INTO `tb_machine` VALUES (34, '射蜡机5', '铸造设备', '可用', '用于射蜡的高精度机器5', '2024-10-31 16:50:59', '2024-10-31 16:50:59');
INSERT INTO `tb_machine` VALUES (35, '电热板1', '加热设备', '可用', '用于蜡件的加热处理1', '2024-10-31 16:51:28', '2024-10-31 16:51:28');
INSERT INTO `tb_machine` VALUES (36, '电热板2', '加热设备', '可用', '用于蜡件的加热处理2', '2024-10-31 16:51:28', '2024-10-31 16:51:28');
INSERT INTO `tb_machine` VALUES (37, '冰水机1', '冷却设备', '可用', '用于蜡件的快速冷却1', '2024-10-31 16:51:28', '2024-10-31 16:51:28');
INSERT INTO `tb_machine` VALUES (38, '冰水机2', '冷却设备', '可用', '用于蜡件的快速冷却2', '2024-10-31 16:51:28', '2024-10-31 16:51:28');
INSERT INTO `tb_machine` VALUES (39, '催化燃烧', '燃烧设备', '可用', '用于蜡件的催化燃烧处理', '2024-10-31 16:51:28', '2024-11-29 15:53:20');
INSERT INTO `tb_machine` VALUES (40, '中央空调', '空调设备', '可用', '用于车间内的温度控制', '2024-10-31 16:51:28', '2024-10-31 16:51:28');
INSERT INTO `tb_machine` VALUES (41, '修蜡机-1', '修蜡设备', '可用', '用于修蜡件的设备', '2024-11-29 15:00:46', '2024-11-29 15:00:46');
INSERT INTO `tb_machine` VALUES (42, '热处理机-1', '热处理设备', '可用', '用于蜡件热处理的设备', '2024-11-29 15:00:46', '2024-11-29 15:00:46');
INSERT INTO `tb_machine` VALUES (43, '气枪', '辅助设备', '可用', '用于吹除蜡削的设备', '2024-11-29 15:07:18', '2024-11-29 15:07:18');

-- ----------------------------
-- Table structure for tb_material
-- ----------------------------
DROP TABLE IF EXISTS `tb_material`;
CREATE TABLE `tb_material`  (
  `material_id` int NOT NULL AUTO_INCREMENT COMMENT '物料ID',
  `material_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料名称',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位（如吨、公斤、个）',
  `quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '库存数量',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单价（当期出库加权价格）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '可用' COMMENT '物料状态（可用、不可用）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料描述',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物料表，存储生产所需的物料信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_material
-- ----------------------------
INSERT INTO `tb_material` VALUES (1, '钢材', '公斤', 100.00, 5.00, '可用', '用于切割和焊接的钢材', '2024-10-12 15:48:44', '2024-10-12 15:48:44');
INSERT INTO `tb_material` VALUES (2, '焊接材料', '公斤', 200.00, 30.00, '可用', '用于焊接的材料', '2024-10-12 15:48:44', '2024-10-12 15:48:44');
INSERT INTO `tb_material` VALUES (3, '包装盒', '个', 500.00, 2.50, '可用', '用于成品的包装', '2024-10-12 15:48:44', '2024-10-12 15:48:44');
INSERT INTO `tb_material` VALUES (4, '油漆', '升', 300.00, 50.00, '可用', '用于喷涂的油漆', '2024-10-12 15:48:44', '2024-10-12 15:48:44');
INSERT INTO `tb_material` VALUES (5, '塑料件', '个', 150.00, 15.00, '可用', '用于组装的塑料件', '2024-10-12 15:48:44', '2024-10-12 15:48:44');
INSERT INTO `tb_material` VALUES (6, '162蜡', '公斤', 100.00, 10.00, '可用', '用于蜡模制造的162蜡', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (7, '168蜡', '公斤', 150.00, 12.00, '可用', '用于蜡模制造的168蜡', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (8, '自制蜡', '公斤', 200.00, 8.00, '可用', '工厂自制的蜡材料', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (9, '水溶蜡', '公斤', 50.00, 15.00, '可用', '用于水溶芯的水溶蜡', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (10, '尿素', '公斤', 80.00, 5.00, '可用', '用于尿素芯的尿素', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (11, '脱模剂', '升', 30.00, 20.00, '可用', '用于蜡模的脱模处理', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (12, '石英芯', '个', 500.00, 1.50, '可用', '用于增强蜡模的石英芯', '2024-10-31 16:14:06', '2024-10-31 16:14:06');
INSERT INTO `tb_material` VALUES (13, '地板蜡', '公斤', 100.00, 15.00, '可用', '用于蜡件表面缺陷修补的主料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (14, '煤油', '升', 50.00, 20.00, '可用', '用于清洗和混合的主料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (15, '红蜡', '公斤', 75.00, 25.00, '可用', '用于特定工艺的主料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (16, '锯条', '个', 200.00, 0.50, '可用', '用于切割的辅料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (17, '牙套配件', '个', 150.00, 3.00, '可用', '用于上牙套和修牙套工序的配件', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (18, '烫处理材料', '升', 30.00, 40.00, '可用', '用于烫工序的化学试剂或材料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (19, '堵孔材料', '个', 120.00, 2.00, '可用', '用于堵孔工序的物料', '2024-11-29 15:10:53', '2024-11-29 15:10:53');
INSERT INTO `tb_material` VALUES (20, '清洗剂', '升', 25.00, 15.00, '可用', '用于涮芯工序的清洗剂', '2024-11-29 15:10:53', '2024-11-29 15:10:53');

-- ----------------------------
-- Table structure for tb_operation
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation`;
CREATE TABLE `tb_operation`  (
  `operation_id` int NOT NULL AUTO_INCREMENT COMMENT '工序ID',
  `operation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工序名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序描述',
  `duration` decimal(10, 2) NULL DEFAULT NULL COMMENT '工序预计时长（小时）',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`operation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工序表，存储工序及其相关信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operation
-- ----------------------------
INSERT INTO `tb_operation` VALUES (1, '切割', '对材料进行切割', 2.00, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (2, '焊接', '将切割后的部件焊接在一起', 1.50, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (3, '组装', '将焊接后的产品进行组装', 3.00, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (4, '打磨', '对产品进行打磨', 1.00, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (5, '检验', '对成品进行质量检验', 1.00, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (6, '包装', '对产品进行包装', 1.50, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (7, '运输', '将产品运输到仓库', 2.00, '2024-10-12 13:03:46', '2024-10-12 13:03:46');
INSERT INTO `tb_operation` VALUES (9, '射水溶芯', '射水溶芯工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (10, '射尿素芯', '射尿素芯工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (11, '化芯', '化芯工序', 2.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (12, '射刺头', '射刺头工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (13, '射冷蜡块', '射冷蜡块工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (14, '射牙套', '射牙套工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (15, '射帽', '射帽工序', 1.00, '2024-10-31 16:13:16', '2024-10-31 16:13:16');
INSERT INTO `tb_operation` VALUES (16, '修水溶芯', '修水溶芯工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (17, '修尿素芯', '修尿素芯工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (18, '上牙套', '上牙套工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (19, '修牙套', '修牙套工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (20, '修帽', '修帽工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (21, '烫', '烫工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (22, '堵孔', '堵孔工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');
INSERT INTO `tb_operation` VALUES (23, '涮芯', '涮芯工序', NULL, '2024-11-29 14:51:18', '2024-11-29 14:51:18');

-- ----------------------------
-- Table structure for tb_operation_machine
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_machine`;
CREATE TABLE `tb_operation_machine`  (
  `operation_id` int NOT NULL COMMENT '工序ID',
  `machine_id` int NOT NULL COMMENT '机器ID',
  PRIMARY KEY (`operation_id`, `machine_id`) USING BTREE,
  INDEX `machine_id`(`machine_id` ASC) USING BTREE,
  CONSTRAINT `tb_operation_machine_ibfk_1` FOREIGN KEY (`operation_id`) REFERENCES `tb_operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_operation_machine_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `tb_machine` (`machine_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工序机器关联表，存储工序与机器的多对多关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operation_machine
-- ----------------------------
INSERT INTO `tb_operation_machine` VALUES (1, 1);
INSERT INTO `tb_operation_machine` VALUES (1, 2);
INSERT INTO `tb_operation_machine` VALUES (1, 3);
INSERT INTO `tb_operation_machine` VALUES (2, 4);
INSERT INTO `tb_operation_machine` VALUES (2, 5);
INSERT INTO `tb_operation_machine` VALUES (2, 6);
INSERT INTO `tb_operation_machine` VALUES (3, 7);
INSERT INTO `tb_operation_machine` VALUES (3, 8);
INSERT INTO `tb_operation_machine` VALUES (4, 9);
INSERT INTO `tb_operation_machine` VALUES (4, 10);
INSERT INTO `tb_operation_machine` VALUES (5, 11);
INSERT INTO `tb_operation_machine` VALUES (5, 12);
INSERT INTO `tb_operation_machine` VALUES (6, 13);
INSERT INTO `tb_operation_machine` VALUES (6, 14);
INSERT INTO `tb_operation_machine` VALUES (9, 30);
INSERT INTO `tb_operation_machine` VALUES (10, 30);
INSERT INTO `tb_operation_machine` VALUES (12, 30);
INSERT INTO `tb_operation_machine` VALUES (13, 30);
INSERT INTO `tb_operation_machine` VALUES (14, 30);
INSERT INTO `tb_operation_machine` VALUES (15, 30);
INSERT INTO `tb_operation_machine` VALUES (9, 31);
INSERT INTO `tb_operation_machine` VALUES (10, 31);
INSERT INTO `tb_operation_machine` VALUES (12, 31);
INSERT INTO `tb_operation_machine` VALUES (13, 31);
INSERT INTO `tb_operation_machine` VALUES (14, 31);
INSERT INTO `tb_operation_machine` VALUES (15, 31);
INSERT INTO `tb_operation_machine` VALUES (9, 32);
INSERT INTO `tb_operation_machine` VALUES (10, 32);
INSERT INTO `tb_operation_machine` VALUES (12, 32);
INSERT INTO `tb_operation_machine` VALUES (13, 32);
INSERT INTO `tb_operation_machine` VALUES (14, 32);
INSERT INTO `tb_operation_machine` VALUES (15, 32);
INSERT INTO `tb_operation_machine` VALUES (9, 33);
INSERT INTO `tb_operation_machine` VALUES (10, 33);
INSERT INTO `tb_operation_machine` VALUES (12, 33);
INSERT INTO `tb_operation_machine` VALUES (13, 33);
INSERT INTO `tb_operation_machine` VALUES (14, 33);
INSERT INTO `tb_operation_machine` VALUES (15, 33);
INSERT INTO `tb_operation_machine` VALUES (9, 34);
INSERT INTO `tb_operation_machine` VALUES (10, 34);
INSERT INTO `tb_operation_machine` VALUES (12, 34);
INSERT INTO `tb_operation_machine` VALUES (13, 34);
INSERT INTO `tb_operation_machine` VALUES (14, 34);
INSERT INTO `tb_operation_machine` VALUES (15, 34);
INSERT INTO `tb_operation_machine` VALUES (11, 35);
INSERT INTO `tb_operation_machine` VALUES (11, 36);

-- ----------------------------
-- Table structure for tb_operation_materials
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_materials`;
CREATE TABLE `tb_operation_materials`  (
  `operation_id` int NOT NULL COMMENT '工序ID',
  `material_id` int NOT NULL COMMENT '物料ID',
  `quantity` decimal(10, 2) NOT NULL COMMENT '物料消耗数量',
  PRIMARY KEY (`operation_id`, `material_id`) USING BTREE,
  INDEX `material_id`(`material_id` ASC) USING BTREE,
  CONSTRAINT `tb_operation_materials_ibfk_1` FOREIGN KEY (`operation_id`) REFERENCES `tb_operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_operation_materials_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `tb_material` (`material_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工序物料关联表，记录工序中使用的物料及其数量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_operation_materials
-- ----------------------------
INSERT INTO `tb_operation_materials` VALUES (1, 1, 10.00);
INSERT INTO `tb_operation_materials` VALUES (1, 2, 5.00);
INSERT INTO `tb_operation_materials` VALUES (2, 2, 3.00);
INSERT INTO `tb_operation_materials` VALUES (3, 5, 20.00);
INSERT INTO `tb_operation_materials` VALUES (4, 4, 10.00);
INSERT INTO `tb_operation_materials` VALUES (5, 3, 50.00);
INSERT INTO `tb_operation_materials` VALUES (6, 3, 100.00);
INSERT INTO `tb_operation_materials` VALUES (9, 6, 5.00);
INSERT INTO `tb_operation_materials` VALUES (9, 7, 3.00);
INSERT INTO `tb_operation_materials` VALUES (9, 8, 1.00);
INSERT INTO `tb_operation_materials` VALUES (9, 9, 2.00);
INSERT INTO `tb_operation_materials` VALUES (10, 6, 2.00);
INSERT INTO `tb_operation_materials` VALUES (10, 7, 1.00);
INSERT INTO `tb_operation_materials` VALUES (10, 8, 4.00);
INSERT INTO `tb_operation_materials` VALUES (10, 10, 3.00);
INSERT INTO `tb_operation_materials` VALUES (11, 6, 6.00);
INSERT INTO `tb_operation_materials` VALUES (11, 7, 4.00);
INSERT INTO `tb_operation_materials` VALUES (11, 8, 1.00);
INSERT INTO `tb_operation_materials` VALUES (11, 11, 1.50);
INSERT INTO `tb_operation_materials` VALUES (12, 6, 3.00);
INSERT INTO `tb_operation_materials` VALUES (12, 7, 1.00);
INSERT INTO `tb_operation_materials` VALUES (12, 8, 1.00);
INSERT INTO `tb_operation_materials` VALUES (12, 12, 2.00);
INSERT INTO `tb_operation_materials` VALUES (13, 6, 1.00);
INSERT INTO `tb_operation_materials` VALUES (13, 7, 4.00);
INSERT INTO `tb_operation_materials` VALUES (13, 8, 2.00);
INSERT INTO `tb_operation_materials` VALUES (14, 6, 1.00);
INSERT INTO `tb_operation_materials` VALUES (14, 7, 1.00);
INSERT INTO `tb_operation_materials` VALUES (14, 8, 3.00);
INSERT INTO `tb_operation_materials` VALUES (14, 11, 1.00);
INSERT INTO `tb_operation_materials` VALUES (15, 6, 2.00);
INSERT INTO `tb_operation_materials` VALUES (15, 7, 1.00);
INSERT INTO `tb_operation_materials` VALUES (15, 8, 3.00);
INSERT INTO `tb_operation_materials` VALUES (16, 13, 1.00);
INSERT INTO `tb_operation_materials` VALUES (16, 15, 0.50);
INSERT INTO `tb_operation_materials` VALUES (17, 14, 0.50);
INSERT INTO `tb_operation_materials` VALUES (17, 20, 0.10);
INSERT INTO `tb_operation_materials` VALUES (18, 17, 2.00);
INSERT INTO `tb_operation_materials` VALUES (19, 13, 0.50);
INSERT INTO `tb_operation_materials` VALUES (19, 17, 2.00);
INSERT INTO `tb_operation_materials` VALUES (20, 15, 0.10);
INSERT INTO `tb_operation_materials` VALUES (21, 18, 0.30);
INSERT INTO `tb_operation_materials` VALUES (22, 19, 1.20);
INSERT INTO `tb_operation_materials` VALUES (23, 20, 0.25);

-- ----------------------------
-- Table structure for tb_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders`;
CREATE TABLE `tb_orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '制令编号',
  `parent_id` int NULL DEFAULT NULL COMMENT '父制令 ID',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '制令类型（如：总制令、分制令、子制令）',
  `contract_id` int NULL DEFAULT NULL COMMENT '关联的合同 ID',
  `operation_id` int NULL DEFAULT NULL COMMENT '工序ID',
  `product_id` int NULL DEFAULT NULL COMMENT '关联的产品 ID',
  `quantity` int NULL DEFAULT NULL COMMENT '生产数量',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '制令状态（如：待生产、生产中、已完成、已发货、已关闭、暂停、异常）',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `operation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工序',
  `operation_sequence` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_number`(`order_number` ASC) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `contract_id`(`contract_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `operation_id`(`operation_id` ASC) USING BTREE,
  CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`contract_id`) REFERENCES `tb_contracts` (`contract_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `tb_products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_orders_ibfk_4` FOREIGN KEY (`operation_id`) REFERENCES `tb_operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '制令表，存储总制令、分制令和子制令的信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_orders
-- ----------------------------
INSERT INTO `tb_orders` VALUES (139, '37-20241126-1', NULL, '总制令', 37, NULL, NULL, NULL, '待生产', '2024-11-26 22:03:26', '2024-11-26 22:03:26', NULL, NULL);
INSERT INTO `tb_orders` VALUES (140, '37-20241126-2-1', 139, '分制令', NULL, NULL, 5, 10, '待生产', '2024-11-26 22:03:26', '2024-11-26 22:03:26', NULL, NULL);
INSERT INTO `tb_orders` VALUES (141, '37-20241126-3-1', 140, '子制令', NULL, 9, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射水溶芯', 1);
INSERT INTO `tb_orders` VALUES (142, '37-20241126-3-2', 140, '子制令', NULL, 10, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射尿素芯', 2);
INSERT INTO `tb_orders` VALUES (143, '37-20241126-3-3', 140, '子制令', NULL, 11, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '化芯', 3);
INSERT INTO `tb_orders` VALUES (144, '37-20241126-3-4', 140, '子制令', NULL, 12, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射刺头', 4);
INSERT INTO `tb_orders` VALUES (145, '37-20241126-3-5', 140, '子制令', NULL, 13, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射冷蜡块', 5);
INSERT INTO `tb_orders` VALUES (146, '37-20241126-3-6', 140, '子制令', NULL, 14, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射牙套', 6);
INSERT INTO `tb_orders` VALUES (147, '37-20241126-3-7', 140, '子制令', NULL, 15, NULL, 10, '已完成', '2024-11-26 22:03:26', '2024-11-28 16:33:13', '射帽', 7);
INSERT INTO `tb_orders` VALUES (148, '38-20241128-1', NULL, '总制令', 38, NULL, NULL, NULL, '未完成', '2024-11-28 09:06:16', '2024-11-28 09:06:16', NULL, NULL);
INSERT INTO `tb_orders` VALUES (149, '38-20241128-2-1', 148, '分制令', NULL, NULL, 5, 10, '未完成', '2024-11-28 09:06:16', '2024-11-28 09:06:16', NULL, NULL);
INSERT INTO `tb_orders` VALUES (150, '38-20241128-3-1', 149, '子制令', NULL, 9, NULL, 0, '已完成', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射水溶芯', 1);
INSERT INTO `tb_orders` VALUES (151, '38-20241128-3-2', 149, '子制令', NULL, 10, NULL, 0, '已完成', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射尿素芯', 2);
INSERT INTO `tb_orders` VALUES (152, '38-20241128-3-3', 149, '子制令', NULL, 11, NULL, 10, '已分配', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '化芯', 3);
INSERT INTO `tb_orders` VALUES (153, '38-20241128-3-4', 149, '子制令', NULL, 12, NULL, 10, '待分配', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射刺头', 4);
INSERT INTO `tb_orders` VALUES (154, '38-20241128-3-5', 149, '子制令', NULL, 13, NULL, 10, '待分配', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射冷蜡块', 5);
INSERT INTO `tb_orders` VALUES (155, '38-20241128-3-6', 149, '子制令', NULL, 14, NULL, 10, '待分配', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射牙套', 6);
INSERT INTO `tb_orders` VALUES (156, '38-20241128-3-7', 149, '子制令', NULL, 15, NULL, 10, '待分配', '2024-11-28 09:06:16', '2024-11-28 09:06:16', '射帽', 7);
INSERT INTO `tb_orders` VALUES (157, '39-20241129-1', NULL, '总制令', 39, NULL, NULL, NULL, '未完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', NULL, NULL);
INSERT INTO `tb_orders` VALUES (158, '39-20241129-2-1', 157, '分制令', NULL, NULL, 5, 10, '未完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', NULL, NULL);
INSERT INTO `tb_orders` VALUES (159, '39-20241129-3-1', 158, '子制令', NULL, 9, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射水溶芯', 1);
INSERT INTO `tb_orders` VALUES (160, '39-20241129-3-2', 158, '子制令', NULL, 10, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射尿素芯', 2);
INSERT INTO `tb_orders` VALUES (161, '39-20241129-3-3', 158, '子制令', NULL, 11, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '化芯', 3);
INSERT INTO `tb_orders` VALUES (162, '39-20241129-3-4', 158, '子制令', NULL, 12, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射刺头', 4);
INSERT INTO `tb_orders` VALUES (163, '39-20241129-3-5', 158, '子制令', NULL, 13, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射冷蜡块', 5);
INSERT INTO `tb_orders` VALUES (164, '39-20241129-3-6', 158, '子制令', NULL, 14, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射牙套', 6);
INSERT INTO `tb_orders` VALUES (165, '39-20241129-3-7', 158, '子制令', NULL, 15, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '射帽', 7);
INSERT INTO `tb_orders` VALUES (166, '39-20241129-2-2', 157, '分制令', NULL, NULL, 6, 10, '未完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', NULL, NULL);
INSERT INTO `tb_orders` VALUES (167, '39-20241129-3-8', 166, '子制令', NULL, 16, NULL, 0, '已完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '修水溶芯', 1);
INSERT INTO `tb_orders` VALUES (168, '39-20241129-3-9', 166, '子制令', NULL, 17, NULL, 0, '已完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '修尿素芯', 2);
INSERT INTO `tb_orders` VALUES (169, '39-20241129-3-10', 166, '子制令', NULL, 18, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '上牙套', 3);
INSERT INTO `tb_orders` VALUES (170, '39-20241129-3-11', 166, '子制令', NULL, 19, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '修牙套', 4);
INSERT INTO `tb_orders` VALUES (171, '39-20241129-3-12', 166, '子制令', NULL, 20, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '修帽', 5);
INSERT INTO `tb_orders` VALUES (172, '39-20241129-3-13', 166, '子制令', NULL, 21, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '烫', 6);
INSERT INTO `tb_orders` VALUES (173, '39-20241129-3-14', 166, '子制令', NULL, 22, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '堵孔', 7);
INSERT INTO `tb_orders` VALUES (174, '39-20241129-3-15', 166, '子制令', NULL, 23, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '涮芯', 8);
INSERT INTO `tb_orders` VALUES (175, '39-20241129-2-3', 157, '分制令', NULL, NULL, 1, 10, '未完成', '2024-11-29 15:18:04', '2024-11-29 15:18:04', NULL, NULL);
INSERT INTO `tb_orders` VALUES (176, '39-20241129-3-16', 175, '子制令', NULL, 1, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '切割', 1);
INSERT INTO `tb_orders` VALUES (177, '39-20241129-3-17', 175, '子制令', NULL, 2, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '焊接', 2);
INSERT INTO `tb_orders` VALUES (178, '39-20241129-3-18', 175, '子制令', NULL, 3, NULL, 10, '待分配', '2024-11-29 15:18:04', '2024-11-29 15:18:04', '组装', 3);

-- ----------------------------
-- Table structure for tb_product_operation
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_operation`;
CREATE TABLE `tb_product_operation`  (
  `product_id` int NOT NULL COMMENT '产品ID',
  `operation_id` int NOT NULL COMMENT '工序ID',
  `sequence_number` int NOT NULL COMMENT '工序在产品中的顺序号',
  PRIMARY KEY (`product_id`, `operation_id`) USING BTREE,
  INDEX `operation_id`(`operation_id` ASC) USING BTREE,
  CONSTRAINT `tb_product_operation_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_product_operation_ibfk_2` FOREIGN KEY (`operation_id`) REFERENCES `tb_operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品工序关联表，存储产品与工序的多对多关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_product_operation
-- ----------------------------
INSERT INTO `tb_product_operation` VALUES (1, 1, 1);
INSERT INTO `tb_product_operation` VALUES (1, 2, 2);
INSERT INTO `tb_product_operation` VALUES (1, 3, 3);
INSERT INTO `tb_product_operation` VALUES (2, 2, 1);
INSERT INTO `tb_product_operation` VALUES (2, 4, 2);
INSERT INTO `tb_product_operation` VALUES (3, 1, 1);
INSERT INTO `tb_product_operation` VALUES (3, 3, 2);
INSERT INTO `tb_product_operation` VALUES (4, 5, 1);
INSERT INTO `tb_product_operation` VALUES (5, 9, 1);
INSERT INTO `tb_product_operation` VALUES (5, 10, 2);
INSERT INTO `tb_product_operation` VALUES (5, 11, 3);
INSERT INTO `tb_product_operation` VALUES (5, 12, 4);
INSERT INTO `tb_product_operation` VALUES (5, 13, 5);
INSERT INTO `tb_product_operation` VALUES (5, 14, 6);
INSERT INTO `tb_product_operation` VALUES (5, 15, 7);
INSERT INTO `tb_product_operation` VALUES (6, 16, 1);
INSERT INTO `tb_product_operation` VALUES (6, 17, 2);
INSERT INTO `tb_product_operation` VALUES (6, 18, 3);
INSERT INTO `tb_product_operation` VALUES (6, 19, 4);
INSERT INTO `tb_product_operation` VALUES (6, 20, 5);
INSERT INTO `tb_product_operation` VALUES (6, 21, 6);
INSERT INTO `tb_product_operation` VALUES (6, 22, 7);
INSERT INTO `tb_product_operation` VALUES (6, 23, 8);

-- ----------------------------
-- Table structure for tb_products
-- ----------------------------
DROP TABLE IF EXISTS `tb_products`;
CREATE TABLE `tb_products`  (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '产品唯一标识',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品编号（或SKU）',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品分类',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '产品单价',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '产品描述',
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `modified_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品表，存储产品相关信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_products
-- ----------------------------
INSERT INTO `tb_products` VALUES (1, '产品1', '1001', '1', 10.00, '产品1', '2024-10-02 17:33:20', '2024-10-11 22:10:02');
INSERT INTO `tb_products` VALUES (2, '产品2', '1002', '2', 20.00, '产品2', '2024-10-02 17:33:48', '2024-10-11 22:10:02');
INSERT INTO `tb_products` VALUES (3, '产品3', '1003', '3', 30.00, '产品3', '2024-10-02 17:34:14', '2024-10-11 22:10:02');
INSERT INTO `tb_products` VALUES (4, '产品4', '1004', '1', 40.00, '产品4', '2024-10-02 17:34:33', '2024-10-11 22:10:02');
INSERT INTO `tb_products` VALUES (5, '射蜡件', '1005', '4', 200.00, '射蜡件', '2024-10-31 16:01:03', '2024-10-31 16:01:03');
INSERT INTO `tb_products` VALUES (6, '修蜡件', '1006', '4', 200.00, '修蜡件', '2024-11-29 14:43:57', '2024-11-29 14:43:57');

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task`  (
  `task_id` int NOT NULL AUTO_INCREMENT COMMENT '任务分配ID',
  `order_id` int NOT NULL COMMENT '制令ID',
  `user_id` bigint NOT NULL COMMENT '员工ID',
  `assigned_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务分配时间',
  `is_completed` tinyint(1) NULL DEFAULT 0 COMMENT '是否完成工序',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `operation_id` int NOT NULL COMMENT '工序ID',
  `is_started` tinyint(1) NULL DEFAULT 0 COMMENT '是否开始',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `operation_id`(`operation_id` ASC) USING BTREE,
  CONSTRAINT `tb_task_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_task_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_task_ibfk_4` FOREIGN KEY (`operation_id`) REFERENCES `tb_operation` (`operation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务分配表，存储每个子制令的任务分配情况，包括机器、物料、工序及完成状态等信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task
-- ----------------------------
INSERT INTO `tb_task` VALUES (13, 141, 101, '2024-11-26 23:32:52', 1, NULL, 9, 1);
INSERT INTO `tb_task` VALUES (14, 142, 101, '2024-11-26 23:32:56', 1, NULL, 10, 1);
INSERT INTO `tb_task` VALUES (15, 143, 101, '2024-11-28 08:24:09', 1, NULL, 11, 1);
INSERT INTO `tb_task` VALUES (16, 144, 101, '2024-11-28 08:24:13', 1, NULL, 12, 1);
INSERT INTO `tb_task` VALUES (17, 145, 101, '2024-11-28 08:49:59', 1, NULL, 13, 1);
INSERT INTO `tb_task` VALUES (18, 146, 101, '2024-11-28 08:50:01', 1, NULL, 14, 1);
INSERT INTO `tb_task` VALUES (19, 147, 101, '2024-11-28 08:50:03', 1, NULL, 15, 1);
INSERT INTO `tb_task` VALUES (20, 150, 101, '2024-11-28 09:06:29', 1, NULL, 9, 1);
INSERT INTO `tb_task` VALUES (21, 151, 101, '2024-11-28 09:06:31', 1, NULL, 10, 1);
INSERT INTO `tb_task` VALUES (22, 152, 101, '2024-11-28 09:06:33', 0, NULL, 11, 0);
INSERT INTO `tb_task` VALUES (23, 168, 101, '2024-11-29 15:51:13', 1, NULL, 17, 1);
INSERT INTO `tb_task` VALUES (24, 167, 102, '2024-11-29 15:52:19', 1, NULL, 16, 1);

-- ----------------------------
-- Table structure for tb_task_machine
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_machine`;
CREATE TABLE `tb_task_machine`  (
  `task_id` int NOT NULL COMMENT '任务分配ID，关联tb_task表',
  `machine_id` int NOT NULL COMMENT '机器ID，关联tb_machine表',
  `start_time` datetime NOT NULL COMMENT '任务开始使用机器的时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '任务结束使用机器的时间，可为空表示任务未完成',
  PRIMARY KEY (`task_id`, `machine_id`) USING BTREE,
  INDEX `machine_id`(`machine_id` ASC) USING BTREE,
  CONSTRAINT `tb_task_machine_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_task_machine_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `tb_machine` (`machine_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务与机器的关联表，用于记录任务在特定机器上的使用情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task_machine
-- ----------------------------
INSERT INTO `tb_task_machine` VALUES (13, 39, '2024-11-27 17:23:26', '2024-11-28 08:34:58');
INSERT INTO `tb_task_machine` VALUES (14, 30, '2024-11-28 08:31:49', '2024-11-28 08:57:57');
INSERT INTO `tb_task_machine` VALUES (15, 30, '2024-11-28 08:40:37', '2024-11-28 08:58:03');
INSERT INTO `tb_task_machine` VALUES (16, 30, '2024-11-28 08:43:05', '2024-11-28 08:58:05');
INSERT INTO `tb_task_machine` VALUES (17, 30, '2024-11-28 08:52:32', '2024-11-28 08:58:06');
INSERT INTO `tb_task_machine` VALUES (18, 30, '2024-11-28 08:54:31', '2024-11-28 08:58:07');
INSERT INTO `tb_task_machine` VALUES (19, 30, '2024-11-28 08:57:33', '2024-11-28 08:57:51');
INSERT INTO `tb_task_machine` VALUES (20, 30, '2024-11-28 17:24:05', '2024-11-28 17:24:15');
INSERT INTO `tb_task_machine` VALUES (21, 30, '2024-11-28 17:24:41', '2024-11-28 17:25:04');
INSERT INTO `tb_task_machine` VALUES (23, 30, '2024-11-29 16:07:15', '2024-11-29 16:07:25');
INSERT INTO `tb_task_machine` VALUES (24, 39, '2024-11-29 15:53:20', '2024-11-29 15:55:10');

-- ----------------------------
-- Table structure for tb_task_material
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_material`;
CREATE TABLE `tb_task_material`  (
  `task_id` int NOT NULL COMMENT '任务分配ID',
  `material_id` int NOT NULL COMMENT '物料ID',
  `quantity` decimal(10, 2) NOT NULL COMMENT '物料使用量',
  PRIMARY KEY (`task_id`, `material_id`) USING BTREE,
  INDEX `material_id`(`material_id` ASC) USING BTREE,
  CONSTRAINT `tb_task_material_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_task_material_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `tb_material` (`material_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务物料关联表，记录每个任务使用的物料及其数量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task_material
-- ----------------------------
INSERT INTO `tb_task_material` VALUES (13, 7, 4.00);
INSERT INTO `tb_task_material` VALUES (13, 9, 8.00);
INSERT INTO `tb_task_material` VALUES (14, 6, 9.00);
INSERT INTO `tb_task_material` VALUES (14, 8, 8.00);
INSERT INTO `tb_task_material` VALUES (15, 11, 2.00);
INSERT INTO `tb_task_material` VALUES (16, 12, 9.00);
INSERT INTO `tb_task_material` VALUES (17, 8, 10.00);
INSERT INTO `tb_task_material` VALUES (18, 8, 3.00);
INSERT INTO `tb_task_material` VALUES (18, 11, 5.00);
INSERT INTO `tb_task_material` VALUES (19, 8, 5.00);
INSERT INTO `tb_task_material` VALUES (20, 7, 1.00);
INSERT INTO `tb_task_material` VALUES (20, 8, 2.00);
INSERT INTO `tb_task_material` VALUES (20, 9, 9.00);
INSERT INTO `tb_task_material` VALUES (21, 6, 5.00);
INSERT INTO `tb_task_material` VALUES (21, 7, 2.00);
INSERT INTO `tb_task_material` VALUES (21, 8, 4.00);
INSERT INTO `tb_task_material` VALUES (21, 10, 3.00);
INSERT INTO `tb_task_material` VALUES (23, 20, 1.00);
INSERT INTO `tb_task_material` VALUES (24, 13, 1.00);
INSERT INTO `tb_task_material` VALUES (24, 15, 2.00);

-- ----------------------------
-- Table structure for tb_work_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_work_report`;
CREATE TABLE `tb_work_report`  (
  `work_report_id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识每条报工记录',
  `user_id` int NOT NULL COMMENT '标识报工员工的唯一ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '报工员工的姓名',
  `team_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工所在班组的名称',
  `machine_id` int NOT NULL COMMENT '标识使用的机器',
  `operation_id` int NOT NULL COMMENT '标识对应工序的唯一ID',
  `operation_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报工涉及的工序名称',
  `quantity` int NOT NULL COMMENT '报工的产品数量',
  `start_time` datetime NOT NULL COMMENT '报工的开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '报工的结束时间',
  `report_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报工单的当前状态（如已完成、进行中）',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录额外的报工信息',
  PRIMARY KEY (`work_report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '报工表，用于记录员工的报工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_work_report
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
