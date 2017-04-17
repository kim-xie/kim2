/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : kim

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2015-11-29 02:02:43
*/

-- 清除所有外键
-- SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for [smallBeanName]
-- ----------------------------
-- DROP TABLE IF EXISTS `[smallBeanName]`;

CREATE TABLE `[smallBeanName]` (
  `[smallBeanName]_id` varchar(32) NOT NULL,
  `[smallBeanName]_content` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `[smallBeanName]_description` varchar(100) DEFAULT NULL,
  `[smallBeanName]_status` int(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`[smallBeanName]_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- ----------------------------
-- Records of [smallBeanName]
-- ----------------------------
-- INSERT INTO `[smallBeanName]` VALUES ('1', '1', '柯柯', '2015-11-29 01:46:38', null, '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('2', '1', '柯柯2342', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('3', '1', '柯柯23', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('4', '1', '柯柯34', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('5', '1', '柯柯34', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('6', '1', '柯柯234', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('7', '1', '柯柯23', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('8', '1', '柯柯23423', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('9', '1', '柯柯23', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('10', '1', '柯柯234234', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');
--INSERT INTO `[smallBeanName]` VALUES ('11', '1', '柯234234', '2015-11-29 01:46:38', '2015-11-29 01:46:47', '0', '1', '1');