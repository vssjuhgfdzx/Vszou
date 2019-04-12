/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : biportal

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 09/04/2019 09:10:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_user_info
-- ----------------------------
DROP TABLE IF EXISTS `app_user_info`;
CREATE TABLE `app_user_info`  (
  `userPassCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通行证编码',
  `tenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用编码',
  `userPassType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通行证类型(账户类型,如:email,mobile,qq,weixin)',
  `userCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编码(一个用户可以拥有多个应用的通行证;创建通行证时还没有用户基本信息,维护用户基本信息后回写用户编码)',
  `userNickName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userPassword` varchar(520) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通行证密码',
  `userPassStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通行证状态',
  `loginedFlag` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首次登录标志N未(登录,Y已登录过)\r\n',
  `mainPassFlag` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主通行证标志(每个用户有一个主要通行证)',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantCode`, `appCode`, `userPassCode`) USING BTREE,
  INDEX `FK_Reference_1`(`userCode`, `tenantCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户需要租户隔离，通行证也可以作为用户与外部系统的账号映射关系表，例如微信，钉钉，QQ等等，如果需要，可以通过auth2' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_info
-- ----------------------------
INSERT INTO `app_user_info` VALUES ('5d0c289072044b5e', 'up001', 'up001', 'weixin', '9219e9ca00b14806', 'userUp', 'up123', '正常', '', '主', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `app_user_info` VALUES ('78a1e946f23042f6', 'up123', 'up132', 'qq', '9219e9ca00b14806', 'upuo', '123', '123', '', '主,', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dict_catalog
-- ----------------------------
DROP TABLE IF EXISTS `dict_catalog`;
CREATE TABLE `dict_catalog`  (
  `catalogCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典分类编码',
  `catalogName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典分类名称',
  `catalogStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典分类状态',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`catalogCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典分类定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_catalog
-- ----------------------------
INSERT INTO `dict_catalog` VALUES ('79241d7501864e8d', '嘻嘻', '正常', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS `dict_item`;
CREATE TABLE `dict_item`  (
  `catalogCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典分类编码',
  `dictItemCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项编码',
  `dictItemValue` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项值',
  `dictItemName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项名称',
  `dictItemOrder` int(11) NULL DEFAULT NULL COMMENT '显示序号',
  `status` varchar(4) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`catalogCode`, `dictItemCode`, `dictItemValue`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典项信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_item
-- ----------------------------
INSERT INTO `dict_item` VALUES ('79241d7501864e8d', '编号002', '字典项002', '字典名称002', 11, '无效', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `dict_item` VALUES ('79241d7501864e8d', '编码001', '字典项001', '字典项名称001', 1, '正常', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for param_catalog
-- ----------------------------
DROP TABLE IF EXISTS `param_catalog`;
CREATE TABLE `param_catalog`  (
  `catalogCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数分类编码',
  `catalogName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数分类名称',
  `catalogDesc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数分类描述',
  `catalogStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:无效,1:有效',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`catalogCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数分类定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_catalog
-- ----------------------------
INSERT INTO `param_catalog` VALUES ('89b60d4d88814f87', '很棒', 'Nice', '删除', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for param_info
-- ----------------------------
DROP TABLE IF EXISTS `param_info`;
CREATE TABLE `param_info`  (
  `paramCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数编码',
  `tenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '使用模块',
  `catalogCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数分类编码',
  `paramName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `paramDesc` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `paramValueType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:字符,2:数值,3:布尔值,4:JSON，5:XML',
  `paramValue` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `paramStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:无效,1:有效',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`paramCode`, `tenantCode`, `appCode`, `moduleCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统的配置参数信息。一般对saas系统而言代码提供默认配置，配置文件提供出厂配置，数据库提供定制化配置。通过缓存刷新的方' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_info
-- ----------------------------
INSERT INTO `param_info` VALUES ('ba9ad0e94f6c4d83', '租户编码111', '应用编码111', '模块编码111', '89b60d4d88814f87', '参数名称002', '参数描述002', '参数值类型002', '200', '无效', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_info` VALUES ('cc53dbdae8f541a9', '租户编码1', '应用编码1', '模块编码1', '89b60d4d88814f87', '参数名称001', '参数描述001', '100', '参数值001', '有效', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tenant_attr
-- ----------------------------
DROP TABLE IF EXISTS `tenant_attr`;
CREATE TABLE `tenant_attr`  (
  `tenantAttrCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性编码',
  `tenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编码',
  `tenantAttrName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `tenantAttrType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性类型(1:基础属性,2:扩展属性,3:业务属性)',
  `tenantAttrValueType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值类型(1:字符,2:数值,3:布尔值,4:JSON，5:XML)',
  `tenantAttrValue` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `tenantAttrStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性状态(0:无效,1:有效)',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantAttrCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定义租户的时区属性，语言属性，风格样式属性等' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `tenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编码',
  `tenantName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `parentTenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级租户编码',
  `tenantStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户状态',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户隔离是SaaS应用的基础,系统提供默认租户以及相应的一套默认属性' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES ('169f6fd661ff41a8', 'zou', 'zou001', '删除', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `user_base_info`;
CREATE TABLE `user_base_info`  (
  `userCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户编码（一个用户可以拥有多个应用的通行证;创建通行证时还没有用户基本信息,维护用户基本信息后回写用户编码）',
  `tenantCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编码',
  `familyName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓',
  `familyNameSpell` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓拼写',
  `givenName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名',
  `givenNameSpell` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名拼写',
  `userFullName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `userFullNameSpell` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名全拼',
  `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `userStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态',
  `remarks` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`userCode`, `tenantCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户隔离,系统不隔离,统一客户数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_base_info
-- ----------------------------
INSERT INTO `user_base_info` VALUES ('9219e9ca00b14806', 'up001', '奏', 'zou', '凌', 'ling', '奏凌', 'zouling', '男', '1997-09-11', '删除', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
