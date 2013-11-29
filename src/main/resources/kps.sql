/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : kps

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-11-29 15:34:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for card_code
-- ----------------------------
DROP TABLE IF EXISTS card_code;
CREATE TABLE card_code (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CODE varchar(16) NOT NULL,
  TERM int(11) NOT NULL,
  SMS_COUNT int(11) DEFAULT NULL,
  BEGIN_TIME datetime DEFAULT NULL,
  SMS_USE_COUNT int(11) NOT NULL DEFAULT '0',
  END_TIME datetime DEFAULT NULL,
  USER_NAME varchar(100) DEFAULT NULL,
  SALE_CHANNEL varchar(10) DEFAULT NULL,
  CLIENT_ID varchar(10) DEFAULT NULL,
  FEATURES varchar(255) DEFAULT NULL,
  CREATE_TIME datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY CODE_UNIQUE (CODE)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for card_code_copy
-- ----------------------------
DROP TABLE IF EXISTS card_code_copy;
CREATE TABLE card_code_copy (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CODE varchar(16) NOT NULL,
  TERM int(11) NOT NULL,
  SMS_COUNT int(11) DEFAULT NULL,
  BEGIN_TIME datetime DEFAULT NULL,
  SMS_USE_COUNT int(11) DEFAULT NULL,
  END_TIME datetime DEFAULT NULL,
  USER_NAME varchar(100) DEFAULT NULL,
  SALE_CHANNEL varchar(10) DEFAULT NULL,
  CLIENT_ID varchar(10) DEFAULT NULL,
  FEATURES varchar(255) DEFAULT NULL,
  CREATE_TIME datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY CODE_UNIQUE (CODE)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sms_record
-- ----------------------------
DROP TABLE IF EXISTS sms_record;
CREATE TABLE sms_record (
  id int(11) NOT NULL AUTO_INCREMENT,
  phone varchar(11) NOT NULL,
  title varchar(255) NOT NULL,
  refer varchar(255) NOT NULL,
  customer_phone varchar(11) NOT NULL,
  create_time datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for version_info
-- ----------------------------
DROP TABLE IF EXISTS version_info;
CREATE TABLE version_info (
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
