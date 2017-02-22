/*
Navicat MySQL Data Transfer

Source Server         : zptest
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : rms

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2017-02-22 21:59:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `p_resource`
-- ----------------------------
DROP TABLE IF EXISTS `p_resource`;
CREATE TABLE `p_resource` (
  `id` char(32) NOT NULL,
  `parent_id` char(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `component` varchar(256) DEFAULT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `urls` varchar(256) DEFAULT NULL,
  `from_class` varchar(256) DEFAULT NULL,
  `resource_type` varchar(50) DEFAULT NULL,
  `leaf` bit(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `beiz` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_resource
-- ----------------------------
INSERT INTO `p_resource` VALUES ('100001', '0', '系统管理', null, 'icon-gear', null, null, null, null, '', '99', null, null);
INSERT INTO `p_resource` VALUES ('100002', '100001', '用户', null, 'icon-user', '/rms/user', null, null, null, null, '1', null, null);
INSERT INTO `p_resource` VALUES ('100003', '100001', '菜单', null, 'icon-user', 'rms/resource', null, null, null, null, '3', null, null);
INSERT INTO `p_resource` VALUES ('100004', '100001', '角色', null, 'icon-user', '/rms/role', null, null, null, null, '2', null, null);
INSERT INTO `p_resource` VALUES ('100010', '100001', '角色节点设置', null, 'icon-user', 'rms/role_resource', null, null, null, null, '4', null, null);
INSERT INTO `p_resource` VALUES ('100012', '100001', '用户角色设置', null, 'icon-user', '/rms/user_role', null, null, null, null, '5', null, null);
INSERT INTO `p_resource` VALUES ('100014', '100001', '用户安全设置', null, 'icon-user', 'user/user_safe', null, null, null, null, '7', null, null);
INSERT INTO `p_resource` VALUES ('100015', '100001', '在线人员查看', null, 'icon-user', 'toGetOnLineUsers', null, null, null, null, '8', null, null);
INSERT INTO `p_resource` VALUES ('200001', '0', '帮助', null, 'icon-help', 'help.do', null, null, null, null, '100', null, null);
INSERT INTO `p_resource` VALUES ('666666', '0', '测试', null, 'icon-gear', 'hltest.do', null, null, null, null, '451', '1', null);

-- ----------------------------
-- Table structure for `p_role`
-- ----------------------------
DROP TABLE IF EXISTS `p_role`;
CREATE TABLE `p_role` (
  `id` char(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `sort` smallint(6) DEFAULT NULL,
  `beiz` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_role
-- ----------------------------
INSERT INTO `p_role` VALUES ('100000', '系统管理员', '1', '1', null);
INSERT INTO `p_role` VALUES ('90d7650cead54019a53bd12ab3c4d9e8', '测试1', '1', '3', null);

-- ----------------------------
-- Table structure for `p_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `p_role_resource`;
CREATE TABLE `p_role_resource` (
  `id` char(32) NOT NULL,
  `resource_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`resource_id`),
  KEY `FK_Reference_11` (`role_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`resource_id`) REFERENCES `p_resource` (`id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`role_id`) REFERENCES `p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_role_resource
-- ----------------------------
INSERT INTO `p_role_resource` VALUES ('', '200001', '100000');
INSERT INTO `p_role_resource` VALUES ('1', '100001', '100000');
INSERT INTO `p_role_resource` VALUES ('2', '100002', '100000');
INSERT INTO `p_role_resource` VALUES ('3', '100003', '100000');
INSERT INTO `p_role_resource` VALUES ('4', '100004', '100000');
INSERT INTO `p_role_resource` VALUES ('5', '100012', '100000');
INSERT INTO `p_role_resource` VALUES ('6', '100010', '100000');
INSERT INTO `p_role_resource` VALUES ('7', '100015', '100000');
INSERT INTO `p_role_resource` VALUES ('be9c6de936b648659d08855f31edad5c', '100015', '90d7650cead54019a53bd12ab3c4d9e8');

-- ----------------------------
-- Table structure for `p_user`
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user` (
  `id` varchar(32) NOT NULL,
  `loginname` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `org_id` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `create_user_id` varchar(32) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_user_id` varchar(32) DEFAULT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `beiz` varchar(256) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES ('0ded0ed776814f5db7bc3a38baeb7636', 't2', '1', '1', null, '', null, null, null, '2017-01-14 10:37:22', null, '2017-01-14 10:38:16', null, '1');
INSERT INTO `p_user` VALUES ('1', 'admin', '权限管理员', '1', null, null, null, null, null, '2017-01-11 09:37:47', null, '2017-01-14 10:38:17', null, '1');
INSERT INTO `p_user` VALUES ('4796b79cc3d248718adc81d97f7843c6', 't3', '1', '2', null, '', null, null, null, '2017-01-14 13:32:48', null, '2017-01-14 13:32:48', null, '1');
INSERT INTO `p_user` VALUES ('c30afb58c16446df9e953923d94c8e87', 't1', 'cs11', '1', null, '', null, null, null, '2017-01-14 10:19:25', null, '2017-01-14 13:43:45', null, '1');

-- ----------------------------
-- Table structure for `p_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role` (
  `id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  `role_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`user_id`),
  KEY `FK_Reference_2` (`role_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`role_id`) REFERENCES `p_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user_role
-- ----------------------------
INSERT INTO `p_user_role` VALUES ('1', '1', '100000');
INSERT INTO `p_user_role` VALUES ('22a04d57a3c84550ab4eecff92fcefbe', '4796b79cc3d248718adc81d97f7843c6', '100000');
