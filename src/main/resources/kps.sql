/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : kps

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-11-29 18:33:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for CARD_CODE
-- ----------------------------
DROP TABLE IF EXISTS CARD_CODE;
CREATE TABLE CARD_CODE (
  id int(11) NOT NULL AUTO_INCREMENT,
  code varchar(12) NOT NULL,
  status tinyint(4) NOT NULL,
  term int(11) NOT NULL,
  sms_count int(11) NOT NULL,
  create_time datetime NOT NULL,
  modify_time datetime NOT NULL,
  use_time datetime DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PAY_HISTORY
-- ----------------------------
DROP TABLE IF EXISTS PAY_HISTORY;
CREATE TABLE PAY_HISTORY (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  card_id int(11) NOT NULL,
  type tinyint(4) NOT NULL COMMENT '类型，1：续费时间、2：续费短信条数',
  old_value varchar(20) NOT NULL,
  inc_value int(11) NOT NULL,
  create_time datetime DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SMS_RECORD
-- ----------------------------
DROP TABLE IF EXISTS SMS_RECORD;
CREATE TABLE SMS_RECORD (
  id int(11) NOT NULL AUTO_INCREMENT,
  phone varchar(11) NOT NULL,
  title varchar(255) NOT NULL,
  refer varchar(255) NOT NULL,
  customer_phone varchar(11) NOT NULL,
  create_time datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for USER_INFO
-- ----------------------------
DROP TABLE IF EXISTS USER_INFO;
CREATE TABLE USER_INFO (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_name varbinary(50) NOT NULL,
  client_id varchar(10) NOT NULL,
  begin_time date DEFAULT NULL,
  end_time date DEFAULT NULL,
  sms_count int(11) NOT NULL DEFAULT '0',
  sms_use_count int(11) NOT NULL DEFAULT '0',
  version int(11) NOT NULL DEFAULT '0',
  create_time datetime NOT NULL,
  modify_time datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY U_C_UK (user_name,client_id) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for VERSION_INFO
-- ----------------------------
DROP TABLE IF EXISTS VERSION_INFO;
CREATE TABLE VERSION_INFO (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CLIENT_ID varchar(20) NOT NULL,
  VERSION varchar(5) NOT NULL,
  URL varchar(100) NOT NULL,
  VERSION_INFO varchar(255) NOT NULL,
  MUST_UPGRADE tinyint(4) NOT NULL DEFAULT '0',
  STATUS tinyint(4) NOT NULL DEFAULT '1',
  CREATE_TIME datetime NOT NULL,
  MODIFY_TIME datetime NOT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
