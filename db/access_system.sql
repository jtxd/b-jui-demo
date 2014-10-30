-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.25 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 access_system.sysbuttonlog 结构
CREATE TABLE IF NOT EXISTS `sysbuttonlog` (
  `logId` bigint(13) NOT NULL AUTO_INCREMENT COMMENT '操作日志ID',
  `userId` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `urlId` int(8) DEFAULT NULL COMMENT '菜单ID',
  `permission` varchar(255) DEFAULT NULL COMMENT '操作权限类',
  `permValue` int(4) DEFAULT NULL COMMENT '权限值',
  `operaTime` bigint(13) NOT NULL COMMENT '操作时间',
  `logIp` varchar(31) DEFAULT NULL COMMENT '操作Ip',
  `logDesc` varchar(1000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- 正在导出表  access_system.sysbuttonlog 的数据：~23 rows (大约)
DELETE FROM `sysbuttonlog`;
/*!40000 ALTER TABLE `sysbuttonlog` DISABLE KEYS */;
INSERT INTO `sysbuttonlog` (`logId`, `userId`, `urlId`, `permission`, `permValue`, `operaTime`, `logIp`, `logDesc`) VALUES
	(271, 10, 0, 'com.sevendosoft.access.constant.permethod.role.LogPermission', 1, 1409653500447, '0:0:0:0:0:0:0:1', '清空操作日志');
/*!40000 ALTER TABLE `sysbuttonlog` ENABLE KEYS */;


-- 导出  表 access_system.sysbuttonloghis 结构
CREATE TABLE IF NOT EXISTS `sysbuttonloghis` (
  `logId` bigint(13) NOT NULL COMMENT '操作日志ID',
  `userId` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `urlId` int(8) DEFAULT NULL COMMENT '菜单ID',
  `permission` varchar(255) DEFAULT NULL COMMENT '操作权限类',
  `permValue` int(4) DEFAULT NULL COMMENT '权限值',
  `operaTime` bigint(13) NOT NULL COMMENT '操作时间',
  `logIp` varchar(31) DEFAULT NULL COMMENT '操作Ip',
  `logDesc` varchar(1000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- 正在导出表  access_system.sysbuttonloghis 的数据：~0 rows (大约)
DELETE FROM `sysbuttonloghis`;
/*!40000 ALTER TABLE `sysbuttonloghis` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysbuttonloghis` ENABLE KEYS */;


-- 导出  表 access_system.sysinfoparameter 结构
CREATE TABLE IF NOT EXISTS `sysinfoparameter` (
  `parameterId` int(4) NOT NULL AUTO_INCREMENT COMMENT '系统参数ID',
  `paraName` varchar(16) NOT NULL COMMENT '参数名称',
  `paraDesc` varchar(16) DEFAULT NULL COMMENT '参数描述',
  `paraValue` varchar(32) NOT NULL COMMENT '参数值',
  `createTime` bigint(13) DEFAULT NULL COMMENT '创建时间',
  `isUsed` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效0无效，1有效',
  PRIMARY KEY (`parameterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表';

-- 正在导出表  access_system.sysinfoparameter 的数据：~0 rows (大约)
DELETE FROM `sysinfoparameter`;
/*!40000 ALTER TABLE `sysinfoparameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysinfoparameter` ENABLE KEYS */;


-- 导出  表 access_system.sysinforole 结构
CREATE TABLE IF NOT EXISTS `sysinforole` (
  `roleId` int(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleCode` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `roleName` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `isUsed` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `createTime` bigint(13) DEFAULT NULL COMMENT '创建时间',
  `parentId` bigint(11) DEFAULT NULL COMMENT '父级角色',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  access_system.sysinforole 的数据：~3 rows (大约)
DELETE FROM `sysinforole`;
/*!40000 ALTER TABLE `sysinforole` DISABLE KEYS */;
INSERT INTO `sysinforole` (`roleId`, `roleCode`, `roleName`, `isUsed`, `createTime`, `parentId`) VALUES
	(1, 'ADMIN', '超级管理员', 1, NULL, -1),
	(4, 'ADMIN', '管理员', 1, NULL, 1),
	(6, 'user04', 'user04', 1, NULL, 5);
/*!40000 ALTER TABLE `sysinforole` ENABLE KEYS */;


-- 导出  表 access_system.sysinfourl 结构
CREATE TABLE IF NOT EXISTS `sysinfourl` (
  `urlId` int(8) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` int(4) DEFAULT NULL COMMENT '类型',
  `href` varchar(64) DEFAULT NULL COMMENT 'url地址',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `description` varchar(64) DEFAULT NULL COMMENT '描述',
  `target` varchar(20) DEFAULT NULL COMMENT '目标（mainFrame、 _blank、_self、_parent、_top）',
  `rel` varchar(128) DEFAULT NULL COMMENT 'rel',
  `parentId` int(8) DEFAULT NULL COMMENT '父级',
  `createTime` bigint(13) DEFAULT NULL COMMENT '创建时间',
  `isUsed` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `sortNo` int(8) DEFAULT NULL COMMENT '排序号',
  `permission` varchar(64) DEFAULT NULL COMMENT '权限类',
  PRIMARY KEY (`urlId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- 正在导出表  access_system.sysinfourl 的数据：~7 rows (大约)
DELETE FROM `sysinfourl`;
/*!40000 ALTER TABLE `sysinfourl` DISABLE KEYS */;
INSERT INTO `sysinfourl` (`urlId`, `name`, `type`, `href`, `icon`, `description`, `target`, `rel`, `parentId`, `createTime`, `isUsed`, `sortNo`, `permission`) VALUES
	(11, '系统管理', 0, '', '', '', '', '', -1, 1407140785011, 1, 99, ''),
	(12, '角色列表', 0, '/user/role/listview', '', '角色列表', 'navTab', 'user_role_listview', 11, 1407141914856, 1, 1, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(13, '用户列表', 0, '/user/info/listview', '', '用户列表', 'navTab', 'user_info_listview', 11, 1407141964456, 1, 2, 'com.sevendosoft.access.constant.permethod.role.UserPermission'),
	(14, '菜单列表', 0, '/order/info/listview', '', '菜单列表', 'navTab', 'order_info_listview', 11, 1407142023060, 1, 3, 'com.sevendosoft.access.constant.permethod.role.MenuPermission'),
	(15, '日志管理', 0, '', '', '', '', '', -1, 1409642077554, 1, 100, ''),
	(16, '操作日志', 0, '/log/node/listview', '', '', 'navTab', 'log_node_listview', 15, 1409642132551, 1, 1, 'com.sevendosoft.access.constant.permethod.role.LogPermission'),
	(17, '登录日志', NULL, '//log/login/listview', '', '登录日志', 'navTab', 'log_login_listview', 15, 1409648279391, 1, 1, 'com.sevendosoft.access.constant.permethod.role.LoginPermission');
/*!40000 ALTER TABLE `sysinfourl` ENABLE KEYS */;


-- 导出  表 access_system.sysinfouser 结构
CREATE TABLE IF NOT EXISTS `sysinfouser` (
  `userId` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `roleId` int(8) DEFAULT NULL,
  `userName` varchar(64) NOT NULL COMMENT '用户名称',
  `passWord` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `createTime` bigint(13) DEFAULT NULL COMMENT '创建时间',
  `sex` int(1) DEFAULT '1' COMMENT '性别;0女1男',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `idCard` varchar(32) DEFAULT NULL COMMENT '身份证',
  `mobile` bigint(11) DEFAULT NULL COMMENT '手机',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮件',
  `addr` varchar(128) DEFAULT NULL COMMENT '地址',
  `createUserId` bigint(11) DEFAULT NULL COMMENT '创建者ID',
  `createIp` varchar(32) DEFAULT NULL COMMENT '创建IP',
  `operateUserId` bigint(11) DEFAULT NULL COMMENT '操作人',
  `opetateTime` bigint(13) DEFAULT NULL COMMENT '操作时间',
  `isDefPassWord` int(1) DEFAULT '0' COMMENT '是否默认0是1否',
  `isUsed` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `sortNo` int(8) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 正在导出表  access_system.sysinfouser 的数据：~2 rows (大约)
DELETE FROM `sysinfouser`;
/*!40000 ALTER TABLE `sysinfouser` DISABLE KEYS */;
INSERT INTO `sysinfouser` (`userId`, `roleId`, `userName`, `passWord`, `createTime`, `sex`, `birthday`, `idCard`, `mobile`, `phone`, `email`, `addr`, `createUserId`, `createIp`, `operateUserId`, `opetateTime`, `isDefPassWord`, `isUsed`, `sortNo`) VALUES
	(9, 4, 'root', '14e1b600b1fd579f47433b88e8d85291', 1406691374696, 1, NULL, '', 0, NULL, '', '', -1, '0:0:0:0:0:0:0:1', 0, 0, 1, 1, 1),
	(10, 4, 'admin', '14e1b600b1fd579f47433b88e8d85291', 1406691444637, 1, NULL, '', 0, NULL, '', '', -1, '0:0:0:0:0:0:0:1', 0, 0, 1, 1, 2);
/*!40000 ALTER TABLE `sysinfouser` ENABLE KEYS */;


-- 导出  表 access_system.sysloglog 结构
CREATE TABLE IF NOT EXISTS `sysloglog` (
  `logId` bigint(13) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `userId` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `loginTime` bigint(13) DEFAULT NULL COMMENT '登录时间',
  `logoutTime` bigint(13) DEFAULT NULL COMMENT '退出时间',
  `logIp` varchar(31) DEFAULT NULL COMMENT '登录Ip',
  `lastlogTime` bigint(13) DEFAULT NULL COMMENT '上次登录时间',
  `status` int(1) DEFAULT NULL COMMENT '状态;1在线0下线',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- 正在导出表  access_system.sysloglog 的数据：~20 rows (大约)
DELETE FROM `sysloglog`;
/*!40000 ALTER TABLE `sysloglog` DISABLE KEYS */;
INSERT INTO `sysloglog` (`logId`, `userId`, `loginTime`, `logoutTime`, `logIp`, `lastlogTime`, `status`) VALUES
	(23, 10, 1409649881261, -1, '0:0:0:0:0:0:0:1', 0, 1),
	(24, 10, 1409649987859, -1, '0:0:0:0:0:0:0:1', 1409649881261, 1),
	(25, 10, 1409650078892, -1, '0:0:0:0:0:0:0:1', 1409649987859, 1),
	(26, 10, 1409651505023, -1, '0:0:0:0:0:0:0:1', 1409650078892, 1),
	(27, 10, 1409652390781, -1, '0:0:0:0:0:0:0:1', 1409651505023, 1),
	(28, 10, 1409653493502, -1, '0:0:0:0:0:0:0:1', 1409652390781, 1),
	(29, 10, 1409653867019, -1, '0:0:0:0:0:0:0:1', 1409653493502, 1),
	(30, 10, 1410330848475, -1, '0:0:0:0:0:0:0:1', 1409653867019, 1),
	(31, 10, 1410332468202, -1, '0:0:0:0:0:0:0:1', 1410330848475, 1),
	(32, 10, 1410334213617, -1, '0:0:0:0:0:0:0:1', 1410332468202, 1),
	(33, 10, 1410336440649, -1, '0:0:0:0:0:0:0:1', 1410334213617, 1),
	(34, 10, 1410337576130, -1, '0:0:0:0:0:0:0:1', 1410336440649, 1),
	(35, 10, 1410338139756, -1, '0:0:0:0:0:0:0:1', 1410337576130, 1),
	(36, 10, 1410488564283, -1, '127.0.0.1', 1410338139756, 1),
	(37, 10, 1410502997681, -1, '127.0.0.1', 1410488564283, 1),
	(38, 10, 1410505586060, -1, '127.0.0.1', 1410502997681, 1),
	(39, 10, 1410505772362, -1, '127.0.0.1', 1410505586060, 1),
	(40, 10, 1410586344218, -1, '0:0:0:0:0:0:0:1', 1410505772362, 1),
	(41, 10, 1410586731460, -1, '0:0:0:0:0:0:0:1', 1410586344218, 1),
	(42, 10, 1410588114621, -1, '0:0:0:0:0:0:0:1', 1410586731460, 1);
/*!40000 ALTER TABLE `sysloglog` ENABLE KEYS */;


-- 导出  表 access_system.syslogloghis 结构
CREATE TABLE IF NOT EXISTS `syslogloghis` (
  `logId` bigint(13) NOT NULL COMMENT '日志ID',
  `userId` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `loginTime` bigint(13) DEFAULT NULL COMMENT '登录时间',
  `logoutTime` bigint(13) DEFAULT NULL COMMENT '退出时间',
  `logIp` varchar(31) DEFAULT NULL COMMENT '登录Ip',
  `lastlogTime` bigint(13) DEFAULT NULL COMMENT '上次登录时间',
  `status` int(1) DEFAULT NULL COMMENT '状态;1在线0下线',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志历史表';

-- 正在导出表  access_system.syslogloghis 的数据：~0 rows (大约)
DELETE FROM `syslogloghis`;
/*!40000 ALTER TABLE `syslogloghis` DISABLE KEYS */;
/*!40000 ALTER TABLE `syslogloghis` ENABLE KEYS */;


-- 导出  表 access_system.sysprivilege 结构
CREATE TABLE IF NOT EXISTS `sysprivilege` (
  `privilegeId` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '权限管理表ID',
  `roleId` bigint(11) DEFAULT NULL COMMENT '角色ID',
  `urlId` int(8) DEFAULT NULL COMMENT '菜单ID',
  `permValue` int(4) DEFAULT NULL COMMENT '权限值',
  `Permission` varchar(64) DEFAULT NULL COMMENT '权限类',
  PRIMARY KEY (`privilegeId`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='权限管理表';

-- 正在导出表  access_system.sysprivilege 的数据：~18 rows (大约)
DELETE FROM `sysprivilege`;
/*!40000 ALTER TABLE `sysprivilege` DISABLE KEYS */;
INSERT INTO `sysprivilege` (`privilegeId`, `roleId`, `urlId`, `permValue`, `Permission`) VALUES
	(19, 5, 2, -1, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(20, 5, 4, 1, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(22, 3, 2, 1, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(23, 3, 4, 1, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(132, 4, 11, 0, NULL),
	(133, 4, 12, 31, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(134, 4, 13, 15, 'com.sevendosoft.access.constant.permethod.role.UserPermission'),
	(135, 4, 14, 15, 'com.sevendosoft.access.constant.permethod.role.MenuPermission'),
	(136, 4, 15, 0, NULL),
	(137, 4, 16, 1, 'com.sevendosoft.access.constant.permethod.role.LogPermission'),
	(138, 4, 17, 1, 'com.sevendosoft.access.constant.permethod.role.LoginPermission'),
	(139, 1, 11, 0, NULL),
	(140, 1, 12, 31, 'com.sevendosoft.access.constant.permethod.role.RolePermission'),
	(141, 1, 13, 15, 'com.sevendosoft.access.constant.permethod.role.UserPermission'),
	(142, 1, 14, 15, 'com.sevendosoft.access.constant.permethod.role.MenuPermission'),
	(143, 1, 15, 0, NULL),
	(144, 1, 16, 1, 'com.sevendosoft.access.constant.permethod.role.LogPermission'),
	(145, 1, 17, 1, 'com.sevendosoft.access.constant.permethod.role.LoginPermission');
/*!40000 ALTER TABLE `sysprivilege` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
