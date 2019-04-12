/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql5
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : euicpdb

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-01 11:23:05
*/

SET FOREIGN_KEY_CHECKS=0;

select @@sql_mode;
select @@global.sql_mode;
/* 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */
set sql_mode ='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- ----------------------------
-- Table structure for app_attr
-- ----------------------------
DROP TABLE IF EXISTS `app_attr`;
CREATE TABLE `app_attr` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `appAttrCode` varchar(64) NOT NULL COMMENT '应用属性编码',
  `appAttrName` varchar(256) NOT NULL COMMENT '应用属性名称',
  `appAttrType` varchar(8) DEFAULT NULL COMMENT '应用属性类型',
  `appAttrValueType` varchar(8) DEFAULT NULL COMMENT '应用属性值类型',
  `appAttrValue` varchar(512) DEFAULT NULL COMMENT '应用属性值',
  `appAttrStatus` varchar(4) DEFAULT NULL COMMENT '应用属性状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`,`appAttrCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用扩展属性信息';

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `appName` varchar(256) NOT NULL COMMENT '应用名称',
  `appShortName` varchar(128) DEFAULT NULL COMMENT '应用简称',
  `appIcon` varchar(512) DEFAULT NULL COMMENT '应用图标',
  `appBaseUrl` varchar(512) DEFAULT NULL COMMENT '应用地址',
  `appDesc` varchar(512) DEFAULT NULL COMMENT '应用描述',
  `appStatus` varchar(4) DEFAULT NULL COMMENT '应用状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用基本信息';

-- ----------------------------
-- Table structure for app_log
-- ----------------------------
DROP TABLE IF EXISTS `app_log`;
CREATE TABLE `app_log` (
  `appLogId` bigint(20) NOT NULL COMMENT '系统日志序号',
  `appCode` varchar(64) DEFAULT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) DEFAULT NULL COMMENT '应用模块',
  `tenantCode` varchar(64) DEFAULT NULL COMMENT '租户编码',
  `interfaceCode` varchar(64) DEFAULT NULL COMMENT '应用接口',
  `operation` varchar(32) DEFAULT NULL COMMENT '应用动作',
  `operBefore` varchar(256) DEFAULT NULL COMMENT '动作前信息',
  `operAfter` varchar(256) DEFAULT NULL COMMENT '动作后信息',
  `content` varchar(256) DEFAULT NULL COMMENT '动作内容',
  `result` varchar(64) DEFAULT NULL COMMENT '处理结果',
  `response` varchar(256) DEFAULT NULL COMMENT '返回内容',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志信息';

-- ----------------------------
-- Table structure for app_user_info
-- ----------------------------
DROP TABLE IF EXISTS `app_user_info`;
CREATE TABLE `app_user_info` (
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `appName` varchar(256) DEFAULT NULL COMMENT '应用名称',
  `userPassType` varchar(8) NOT NULL COMMENT '通行证类型',
  `userCode` varchar(64) DEFAULT NULL COMMENT '用户编码',
  `userNickName` varchar(256) DEFAULT NULL COMMENT '用户昵称',
  `userPassword` varchar(520) DEFAULT NULL COMMENT '通行证密码',
  `userPassStatus` varchar(4) DEFAULT NULL COMMENT '通行证状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantCode`,`appCode`,`userPassCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户需要租户隔离';

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log` (
  `auditLogId` bigint(20) NOT NULL COMMENT '审计日志序号',
  `appCode` varchar(64) DEFAULT NULL COMMENT '应用编码',
  `appName` varchar(256) DEFAULT NULL COMMENT '应用名称',
  `moduleCode` varchar(64) DEFAULT NULL COMMENT '应用模块',
  `moduleName` varchar(256) DEFAULT NULL COMMENT '模块名称',
  `tenantCode` varchar(64) DEFAULT NULL COMMENT '租户编码',
  `auditObjectCode` varchar(64) DEFAULT NULL COMMENT '审计对象编码',
  `auditObjectName` varchar(256) DEFAULT NULL COMMENT '审计对象名称',
  `userCode` varchar(64) DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `fromIp` varchar(128) DEFAULT NULL COMMENT '来源地址',
  `fromenv` varchar(128) DEFAULT NULL COMMENT '来源环境',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`auditLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审计日志信息';

-- ----------------------------
-- Table structure for base_res
-- ----------------------------
DROP TABLE IF EXISTS `base_res`;
CREATE TABLE `base_res` (
  `resCode` varchar(64) NOT NULL COMMENT '资源编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `parentResCode` varchar(64) DEFAULT NULL COMMENT '上层资源编码',
  `resName` varchar(256) NOT NULL COMMENT '资源名称',
  `resType` varchar(8) NOT NULL COMMENT '资源类型',
  `resStatus` varchar(4) DEFAULT NULL COMMENT '资源状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`resCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源的基础表';

-- ----------------------------
-- Table structure for button_info
-- ----------------------------
DROP TABLE IF EXISTS `button_info`;
CREATE TABLE `button_info` (
  `resCode` varchar(64) NOT NULL COMMENT '资源编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `menuCode` varchar(64) NOT NULL COMMENT '菜单编码',
  `buttonType` varchar(8) DEFAULT NULL COMMENT '按钮类型',
  `buttonIcon` varchar(256) DEFAULT NULL COMMENT '按钮图标',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`resCode`,`tenantCode`,`appCode`,`menuCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按钮资源';

-- ----------------------------
-- Table structure for data_dim_info
-- ----------------------------
DROP TABLE IF EXISTS `data_dim_info`;
CREATE TABLE `data_dim_info` (
  `dimCode` varchar(64) NOT NULL COMMENT '维度编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `parentDimCode` varchar(64) DEFAULT NULL COMMENT '上级维度编码',
  `dimType` varchar(8) NOT NULL COMMENT '维度类型',
  `dimName` varchar(256) DEFAULT NULL COMMENT '维度名称',
  `srcTableCode` varchar(64) DEFAULT NULL COMMENT '维度源表编码',
  `srcTableName` varchar(128) DEFAULT NULL COMMENT '维度源表名称',
  `srcFieldCode` varchar(64) DEFAULT NULL COMMENT '维度源表字段编码',
  `srcFieldName` varchar(128) DEFAULT NULL COMMENT '维度源表字段名称',
  `dimStatus` varchar(4) DEFAULT NULL COMMENT '维度状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`dimCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='根据维度定义动态创建基础数据权限维度表,行变列,在以基础数据权限维度表跟用户关联授权,报表查询业务数据时直接按用户已授权';

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `resCode` varchar(64) NOT NULL COMMENT '资源编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `fileType` varchar(8) NOT NULL COMMENT '文件类型',
  `filePath` varchar(512) NOT NULL COMMENT '文件地址',
  `readAble` char(1) DEFAULT NULL COMMENT '读标志',
  `writeAble` char(1) DEFAULT NULL COMMENT '写标志',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`resCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资源';

-- ----------------------------
-- Table structure for geo_info
-- ----------------------------
DROP TABLE IF EXISTS `geo_info`;
CREATE TABLE `geo_info` (
  `geoCode` varchar(64) NOT NULL COMMENT '位置编码',
  `geoType` varchar(8) NOT NULL COMMENT '位置类型',
  `geoName` varchar(256) NOT NULL COMMENT '位置名称',
  `geoShortName` varchar(128) DEFAULT NULL COMMENT '位置简称',
  `parentGeoCode` varchar(64) DEFAULT NULL COMMENT '上层位置编码',
  `geoStatus` varchar(4) DEFAULT NULL COMMENT '状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`geoCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地理位置不需要租户隔离';

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) NOT NULL COMMENT '模块编码',
  `interfaceCode` varchar(64) NOT NULL COMMENT '接口编码',
  `interfaceName` varchar(256) NOT NULL COMMENT '接口名称',
  `interfaceUrl` varchar(512) DEFAULT NULL COMMENT '接口地址',
  `accessMethod` varchar(8) DEFAULT NULL COMMENT '请求方式',
  `interfaceDesc` varchar(512) DEFAULT NULL COMMENT '接口描述',
  `interfaceStatus` varchar(8) DEFAULT NULL COMMENT '接口状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`,`moduleCode`,`interfaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口基本信息';

-- ----------------------------
-- Table structure for interface_param
-- ----------------------------
DROP TABLE IF EXISTS `interface_param`;
CREATE TABLE `interface_param` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) NOT NULL COMMENT '模块编码',
  `interfaceCode` varchar(64) NOT NULL COMMENT '接口编码',
  `paramCode` varchar(64) NOT NULL COMMENT '接口参数编码',
  `paramName` varchar(256) NOT NULL COMMENT '接口参数名称',
  `paramType` varchar(8) DEFAULT NULL COMMENT '接口参数类型',
  `paramValueType` varchar(8) DEFAULT NULL COMMENT '接口参数值类型',
  `paramDesc` varchar(512) DEFAULT NULL COMMENT '接口参数说明',
  `paramValue` varchar(512) DEFAULT NULL COMMENT '接口参数值示例',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`,`moduleCode`,`interfaceCode`,`paramCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数信息';

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info` (
  `resCode` varchar(64) NOT NULL COMMENT '资源编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `menuUrl` varchar(512) DEFAULT NULL COMMENT '菜单地址',
  `menuLevel` int(11) DEFAULT NULL COMMENT '菜单层级',
  `menuIcon` varchar(256) DEFAULT NULL COMMENT '菜单图标',
  `orderSn` int(11) DEFAULT NULL COMMENT '显示顺序',
  `leafFlag` varchar(4) DEFAULT NULL COMMENT '叶子菜单标志',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`resCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单资源';

-- ----------------------------
-- Table structure for module_attr
-- ----------------------------
DROP TABLE IF EXISTS `module_attr`;
CREATE TABLE `module_attr` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) NOT NULL COMMENT '模块编码',
  `moduleAttrCode` varchar(64) NOT NULL COMMENT '模块属性编码',
  `moduleAttrName` varchar(256) NOT NULL COMMENT '模块属性名称',
  `moduleAttrType` varchar(8) DEFAULT NULL COMMENT '模块属性类型',
  `moduleAttrValueType` varchar(8) DEFAULT NULL COMMENT '模块属性值类型',
  `moduleAttrValue` varchar(512) DEFAULT NULL COMMENT '模块属性值',
  `moduleAttrStatus` varchar(4) DEFAULT NULL COMMENT '模块属性状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`,`moduleCode`,`moduleAttrCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块扩展属性';

-- ----------------------------
-- Table structure for module_info
-- ----------------------------
DROP TABLE IF EXISTS `module_info`;
CREATE TABLE `module_info` (
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) NOT NULL COMMENT '模块编码',
  `moduleName` varchar(256) NOT NULL COMMENT '模块名称',
  `moduleShortName` varchar(128) DEFAULT NULL COMMENT '模块简称',
  `moduleIcon` varchar(256) DEFAULT NULL COMMENT '模块图标',
  `modulePath` varchar(128) DEFAULT NULL COMMENT '模块路径',
  `moduleDesc` varchar(256) DEFAULT NULL COMMENT '模块描述',
  `moduleStatus` varchar(4) DEFAULT NULL COMMENT '模块状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`appCode`,`moduleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块基本信息';

-- ----------------------------
-- Table structure for org_attr
-- ----------------------------
DROP TABLE IF EXISTS `org_attr`;
CREATE TABLE `org_attr` (
  `orgCode` varchar(64) NOT NULL COMMENT '组织编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `orgAttrCode` varchar(64) NOT NULL COMMENT '组织属性编码',
  `orgAttrName` varchar(256) NOT NULL COMMENT '组织属性名称',
  `orgAttrType` varchar(8) DEFAULT NULL COMMENT '组织属性类型',
  `orgAttrValueType` varchar(8) DEFAULT NULL COMMENT '组织属性值类型',
  `orgAttrValue` varchar(512) DEFAULT NULL COMMENT '组织属性值',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`orgCode`,`tenantCode`,`orgAttrCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织的扩展信息,比如负责人,组织职能';

-- ----------------------------
-- Table structure for org_info
-- ----------------------------
DROP TABLE IF EXISTS `org_info`;
CREATE TABLE `org_info` (
  `orgCode` varchar(64) NOT NULL COMMENT '组织编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `orgName` varchar(256) NOT NULL COMMENT '组织名称',
  `orgShortName` varchar(128) DEFAULT NULL COMMENT '组织简称',
  `parentOrgCode` varchar(64) DEFAULT NULL COMMENT '上层组织编码',
  `geoCode` varchar(64) DEFAULT NULL COMMENT '位置编码',
  `orgType` varchar(8) DEFAULT NULL COMMENT '组织类型',
  `orgLevel` int(11) DEFAULT NULL COMMENT '组织层级',
  `ordersn` int(11) DEFAULT NULL COMMENT '显示序号',
  `orgStatus` varchar(4) DEFAULT NULL COMMENT '组织状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`orgCode`,`tenantCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织需要租户隔离';

-- ----------------------------
-- Table structure for param_info
-- ----------------------------
DROP TABLE IF EXISTS `param_info`;
CREATE TABLE `param_info` (
  `paramCode` varchar(128) NOT NULL COMMENT '参数编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `moduleCode` varchar(64) NOT NULL COMMENT '模块编码',
  `paramName` varchar(256) DEFAULT NULL COMMENT '参数名称',
  `paramDesc` varchar(512) DEFAULT NULL COMMENT '参数描述',
  `paramValueType` varchar(8) DEFAULT NULL COMMENT '参数值类型',
  `paramValue` varchar(512) DEFAULT NULL COMMENT '参数值',
  `paramStatus` varchar(4) DEFAULT NULL COMMENT '参数状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`paramCode`,`tenantCode`,`appCode`,`moduleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数信息表';

-- ----------------------------
-- Table structure for password_history
-- ----------------------------
DROP TABLE IF EXISTS `password_history`;
CREATE TABLE `password_history` (
  `passwordId` bigint(20) NOT NULL COMMENT '密码历史标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `userPasswordOld` varchar(520) DEFAULT NULL COMMENT '通行证密码旧',
  `userPasswordNew` varchar(520) DEFAULT NULL COMMENT '通行证密码新',
  `causeOfChange` varchar(520) DEFAULT NULL COMMENT '变更原因',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`passwordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通行证密码历史信息';

-- ----------------------------
-- Table structure for rolegroup_role
-- ----------------------------
DROP TABLE IF EXISTS `rolegroup_role`;
CREATE TABLE `rolegroup_role` (
  `roleGroup2RoleId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `roleCode` varchar(64) NOT NULL COMMENT '角色编码',
  `roleGroupCode` varchar(64) NOT NULL COMMENT '角色组编码',
  PRIMARY KEY (`roleGroup2RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与角色组关系表';

-- ----------------------------
-- Table structure for rolegroup_user
-- ----------------------------
DROP TABLE IF EXISTS `rolegroup_user`;
CREATE TABLE `rolegroup_user` (
  `rolegroup2userId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `roleGroupCode` varchar(64) NOT NULL COMMENT '角色组编码',
  PRIMARY KEY (`rolegroup2userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色组关系表';

-- ----------------------------
-- Table structure for role_group
-- ----------------------------
DROP TABLE IF EXISTS `role_group`;
CREATE TABLE `role_group` (
  `roleGroupCode` varchar(64) NOT NULL COMMENT '角色组编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `roleGroupName` varchar(256) NOT NULL COMMENT '角色组名称',
  `roleGroupStatus` varchar(4) DEFAULT NULL COMMENT '角色组状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`roleGroupCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色组信息';

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `roleCode` varchar(64) NOT NULL COMMENT '角色编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `roleName` varchar(256) NOT NULL COMMENT '角色名称',
  `roleStatus` varchar(4) DEFAULT NULL COMMENT '角色状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`roleCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息';

-- ----------------------------
-- Table structure for role_res
-- ----------------------------
DROP TABLE IF EXISTS `role_res`;
CREATE TABLE `role_res` (
  `role2resId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `resCode` varchar(64) NOT NULL COMMENT '资源编码',
  `roleCode` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`role2resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与资源关系表';

-- ----------------------------
-- Table structure for tenant_attr
-- ----------------------------
DROP TABLE IF EXISTS `tenant_attr`;
CREATE TABLE `tenant_attr` (
  `tenantAttrCode` varchar(64) NOT NULL COMMENT '属性编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `tenantAttrName` varchar(256) DEFAULT NULL COMMENT '属性名称',
  `tenantAttrType` varchar(8) DEFAULT NULL COMMENT '属性类型',
  `tenantAttrValueType` varchar(8) DEFAULT NULL COMMENT '属性值类型',
  `tenantAttrValue` varchar(512) DEFAULT NULL COMMENT '属性值',
  `tenantAttrStatus` varchar(4) DEFAULT NULL COMMENT '属性状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantAttrCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定义租户的时区属性，语言属性，风格样式属性等';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `tenantName` varchar(256) DEFAULT NULL COMMENT '租户名称',
  `parentTenantCode` varchar(64) DEFAULT NULL COMMENT '上级租户编码',
  `tenantStatus` varchar(4) DEFAULT NULL COMMENT '租户状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户隔离是SaaS应用的基础,系统提供默认租户以及相应的一套默认属性';

-- ----------------------------
-- Table structure for usergroup_role
-- ----------------------------
DROP TABLE IF EXISTS `usergroup_role`;
CREATE TABLE `usergroup_role` (
  `usergroup2roleId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userGroupCode` varchar(64) NOT NULL COMMENT '用户组编码',
  `roleCode` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`usergroup2roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组与角色关系';

-- ----------------------------
-- Table structure for usergroup_rolegroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup_rolegroup`;
CREATE TABLE `usergroup_rolegroup` (
  `usergroup2rolegroupId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userGroupCode` varchar(64) NOT NULL COMMENT '用户组编码',
  `roleGroupCode` varchar(64) NOT NULL COMMENT '角色组编码',
  PRIMARY KEY (`usergroup2rolegroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组与角色组关系';

-- ----------------------------
-- Table structure for usergroup_user
-- ----------------------------
DROP TABLE IF EXISTS `usergroup_user`;
CREATE TABLE `usergroup_user` (
  `userGroup2UserId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `userGroupCode` varchar(64) NOT NULL COMMENT '用户组编码',
  PRIMARY KEY (`userGroup2UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与用户组关系表';

-- ----------------------------
-- Table structure for user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `user_base_info`;
CREATE TABLE `user_base_info` (
  `userCode` varchar(64) NOT NULL COMMENT '用户编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `familyName` varchar(32) DEFAULT NULL COMMENT '姓',
  `familyNameSpell` varchar(64) DEFAULT NULL COMMENT '姓拼写',
  `givenName` varchar(32) DEFAULT NULL COMMENT '名',
  `givenNameSpell` varchar(64) DEFAULT NULL COMMENT '名拼写',
  `userFullName` varchar(128) DEFAULT NULL COMMENT '姓名',
  `userFullNameSpell` varchar(256) DEFAULT NULL COMMENT '姓名全拼',
  `gender` varchar(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `userStatus` varchar(8) DEFAULT NULL COMMENT '用户状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`userCode`,`tenantCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户隔离,系统不隔离,统一客户数据';

-- ----------------------------
-- Table structure for user_communication
-- ----------------------------
DROP TABLE IF EXISTS `user_communication`;
CREATE TABLE `user_communication` (
  `commCode` varchar(64) NOT NULL COMMENT '通讯编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `userCode` varchar(64) NOT NULL COMMENT '用户编码',
  `commType` varchar(8) NOT NULL COMMENT '通讯方式',
  `commContent` varchar(64) NOT NULL COMMENT '通讯对象',
  `commStatus` varchar(4) DEFAULT NULL COMMENT '通讯方式状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`commCode`,`tenantCode`,`userCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通讯信息';

-- ----------------------------
-- Table structure for user_dept
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept` (
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `userCode` varchar(64) NOT NULL COMMENT '用户编码',
  `orgCode` varchar(64) NOT NULL COMMENT '部门编码',
  `positionCode` varchar(64) DEFAULT NULL COMMENT '职位编码',
  `postCode` varchar(64) DEFAULT NULL COMMENT '职务编码',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`tenantCode`,`userCode`,`orgCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户部门信息';

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `userGroupCode` varchar(64) NOT NULL COMMENT '用户组编码',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userGroupName` varchar(256) NOT NULL COMMENT '用户组名称',
  `userGroupStatus` varchar(4) DEFAULT NULL COMMENT '用户组状态',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`userGroupCode`,`tenantCode`,`appCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history` (
  `userLoginId` bigint(20) NOT NULL COMMENT '用户登录标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `fromIp` varchar(128) DEFAULT NULL COMMENT '登录来源IP',
  `loginDevice` varchar(128) DEFAULT NULL COMMENT '登录设备',
  `loginPlatform` varchar(128) DEFAULT NULL COMMENT '浏览器平台',
  `LoginResult` varchar(32) DEFAULT NULL COMMENT '登录结果',
  `failureNum` int(11) DEFAULT NULL COMMENT '失败次数',
  `failureCause` varchar(256) DEFAULT NULL COMMENT '失败原因',
  `lockFlag` varchar(4) DEFAULT NULL COMMENT '冻结标志',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastModifyBy` varchar(64) DEFAULT NULL COMMENT '最近修改人',
  `lastModifyDate` datetime DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`userLoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录历史信息';

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user2RoleId` bigint(20) NOT NULL COMMENT '关系标识',
  `tenantCode` varchar(64) NOT NULL COMMENT '租户编码',
  `appCode` varchar(64) NOT NULL COMMENT '应用编码',
  `userPassCode` varchar(64) NOT NULL COMMENT '通行证编码',
  `roleCode` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user2RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关系表';
