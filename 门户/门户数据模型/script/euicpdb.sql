/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql5
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : euicpdb

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-01 10:15:56
*/

SET FOREIGN_KEY_CHECKS=0;



/* 
utf8mb4  utf8mb4_general_ci  

ALTER DATABASE euicpdb DEFAULT CHARACTER SET = utf8 DEFAULT COLLATE = utf8_general_ci;
DROP DATABASE IF EXISTS euicpdb;

show charset;
show collation;
show grants;
*/
CREATE DATABASE IF NOT EXISTS euicpdb DEFAULT CHARACTER SET = utf8 DEFAULT COLLATE = utf8_general_ci;

CREATE USER IF NOT EXISTS 'euicpdba'@'%' IDENTIFIED BY '1qaz@wsx';
/* DROP USER IF EXISTS 'euicpdba'@'%' */

GRANT GRANT OPTION ON *.* TO 'euicpdba'@'%';

/* GRANT ALL ON euicpdb.* TO 'euicpdba'@'%'; */
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER ON euicpdb.* TO 'euicpdba'@'%';



