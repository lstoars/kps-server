/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50534
 Source Host           : localhost
 Source Database       : kps

 Target Server Type    : MySQL
 Target Server Version : 50534
 File Encoding         : utf-8

 Date: 11/24/2013 22:11:31 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for CARD_CODE
-- ----------------------------
DROP TABLE IF EXISTS CARD_CODE;
CREATE TABLE CARD_CODE (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CODE varchar(16) NOT NULL,
  TERM int(11) NOT NULL,
  BEGIN_TIME datetime DEFAULT NULL,
  END_TIME datetime DEFAULT NULL,
  USER_NAME varchar(100) DEFAULT NULL,
  CREATE_TIME datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY CODE_UNIQUE (CODE)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for VERSION_INFO
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

SET FOREIGN_KEY_CHECKS = 1;
