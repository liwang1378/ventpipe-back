/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.45 : Database - ventpipe
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ventpipe` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ventpipe`;

/*Table structure for table `aircontainer` */

DROP TABLE IF EXISTS `aircontainer`;

CREATE TABLE `aircontainer` (
  `aircontaierid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customerid` int(11) DEFAULT NULL COMMENT '所属客户ID',
  `type` int(11) DEFAULT NULL COMMENT '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
  `address` varchar(20) DEFAULT NULL COMMENT '机柜地址(编号)',
  `containername` varchar(100) DEFAULT NULL COMMENT '机柜名称',
  `status` int(11) DEFAULT NULL COMMENT '机柜状态(0 设备正常  1 设备故障 2 离线状态)',
  `power` int(11) DEFAULT NULL COMMENT '开机状态(0 关机   1 开机)--(如是管道静压则代表通道1)',
  `power2` int(11) DEFAULT NULL COMMENT '开机状态(0 关机   1 开机) --通道2',
  `versioninfo` varchar(50) DEFAULT NULL COMMENT '协议版本',
  `range_wind` int(11) DEFAULT NULL COMMENT '传感器量程-风速',
  `range_postion` int(11) DEFAULT NULL COMMENT '传感器量程-移-位',
  `range_red` int(11) DEFAULT NULL COMMENT '传感 器量程-红外',
  `range_temp` int(11) DEFAULT NULL COMMENT '传感 器量程-温度',
  `range_wet` int(11) DEFAULT NULL COMMENT '传感 器量程-湿度',
  `range_press` int(11) DEFAULT NULL COMMENT '传感 器量程-压差',
  `range_pind` int(11) DEFAULT NULL COMMENT '传感器量程-管道1静压',
  `range_pind2` int(11) DEFAULT NULL COMMENT '传感器量程-管道2静压',
  `control_wind_mode` int(11) DEFAULT NULL COMMENT '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
  `control_wind_normal` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-常规风速',
  `control_wind_less` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-节能风速',
  `control_press_mode` int(11) DEFAULT NULL COMMENT '房间压差控制-方向(0：正压差   1 负 差)',
  `control_press_sets` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值设定数量',
  `control_press_setsvalueno` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值选定值编号',
  `control_press_setsvalue` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值选定值',
  `control_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值(| 分隔多个值)',
  `control_pind_sets` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值设定数量',
  `control_pind_setsvalue1no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道1',
  `control_pind_setsvalue2no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道2',
  `control_pind_setsvalue1` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道1',
  `control_pind_setsvalue2` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道2',
  `control_pind_value1` varchar(50) DEFAULT NULL COMMENT '管道静压控制-预设值-通道1(| 分隔多个值)',
  `control_pind_value2` varchar(50) DEFAULT NULL COMMENT '管道静压控制预设值-通道2(| 分隔多个值)',
  `online_wind_value` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前风速值',
  `online_wind_door` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前门高值',
  `online_wind_feel` int(11) DEFAULT NULL COMMENT '通风柜在线状态-人体感应状态',
  `online_press_door` int(11) DEFAULT NULL COMMENT '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
  `online_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前压差',
  `online_press_temp` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前温度',
  `online_press_wet` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前湿度',
  `online_pind_value1` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道1)',
  `online_pind_value2` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道2)',
  `alert_switch` varchar(3) DEFAULT NULL COMMENT '告警开关\n            对于通风柜控制器来说，格式如下\n            Bit0：总开关\n            Bit1：风速告警开关\n            Bit2：门高告警开关\n            对于房间压差控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压差告警开关\n            Bit2：门开告警开关\n            对于管道静压控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压力告警开',
  `alert_para` varchar(20) DEFAULT NULL COMMENT '告警参数(参数间以 ｜ 分隔 )\n            通风柜控制器告警参数\n            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100\n            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100\n            [4:5] 门低 告警阀值   保留2位小数点，传输时*100\n            [6:7] 门高 告警阀值   保留2位小数点，传输时*100\n            房间压差控制器告警参数\n            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100\n            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100\n            管道静压控制器告警参数\n            [0:1] 通道1压力过低 告警阀值\n            [2:3] 通道1压力过高 告警阀值\n            [4:5] 通道2压力过低 告警阀值\n            [6:7] 通道2压力过高 告警阀值',
  `urgent_status` int(11) DEFAULT NULL COMMENT '当前紧急排风状态(0表示关机 1表示开机)-若是管道静压则代表通道1',
  `urgent_status2` char(10) DEFAULT NULL COMMENT '当前紧急排风状态(0表示关机 1表示开机)--通道2',
  `relaystatus` varchar(20) DEFAULT NULL COMMENT '继电器状态(多个继电器状态排列 10',
  `chooserelay` varchar(20) DEFAULT NULL COMMENT '选择继电器',
  `ip_mode` int(11) DEFAULT NULL COMMENT 'ip地址模式(0 DHCP  1 STATIC）',
  `ipaddress` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `ipmask` varchar(20) DEFAULT NULL COMMENT 'ip掩码',
  `ipgate` varchar(20) DEFAULT NULL COMMENT 'ip网关',
  `serverip` varchar(20) DEFAULT NULL COMMENT '服务器IP',
  `serverport` varchar(20) DEFAULT NULL COMMENT '服务器端口',
  `mac` varchar(20) DEFAULT NULL COMMENT 'mac地址',
  `keepalive` int(11) DEFAULT NULL COMMENT '心跳间隔时间',
  `menu_switch` int(11) DEFAULT NULL COMMENT '菜单开关(0 关  1 开)',
  `menu_pass` varchar(20) DEFAULT NULL COMMENT '菜单密码',
  `event_rpt_intev` int(11) DEFAULT NULL COMMENT '事件上报时间间隔',
  `calader` varchar(20) DEFAULT NULL COMMENT '日历时间',
  `pid1_p` varchar(20) DEFAULT NULL COMMENT 'PID1_P',
  `pid1_i` varchar(20) DEFAULT NULL COMMENT 'PID1_I',
  `pid1_d` varchar(20) DEFAULT NULL COMMENT 'PID1_D',
  `pid1_period` int(11) DEFAULT NULL COMMENT 'PID1-时间间隔',
  `pid2_period` int(11) DEFAULT NULL COMMENT 'PID2-时间间隔',
  `pid2_p` varchar(20) DEFAULT NULL COMMENT 'PID2_P',
  `pid2_i` varchar(20) DEFAULT NULL COMMENT 'PID2_I',
  `pid2_d` varchar(20) DEFAULT NULL COMMENT 'PID2_D',
  `online_status` int(11) DEFAULT NULL,
  `parentuuid` int(11) DEFAULT NULL,
  `uuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`aircontaierid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `aircontainer_history` */

DROP TABLE IF EXISTS `aircontainer_history`;

CREATE TABLE `aircontainer_history` (
  `historyid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aircontaierid` int(11) NOT NULL COMMENT '主键',
  `customerid` int(11) DEFAULT NULL COMMENT '所属客户ID',
  `type` int(11) DEFAULT NULL COMMENT '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
  `address` varchar(20) DEFAULT NULL COMMENT '机柜地址(编号)',
  `containername` varchar(100) DEFAULT NULL COMMENT '机柜名称',
  `status` int(11) DEFAULT NULL COMMENT '机柜状态(0 设备正常  1 设备故障)',
  `power` int(11) DEFAULT NULL COMMENT '开机状态(0 关机   1 开机)',
  `power2` int(11) DEFAULT NULL,
  `versioninfo` varchar(50) DEFAULT NULL COMMENT '协议版本',
  `range_wind` int(11) DEFAULT NULL COMMENT '传感器量程-风速',
  `range_postion` int(11) DEFAULT NULL COMMENT '传感器量程-移-位',
  `range_red` int(11) DEFAULT NULL COMMENT '传感 器量程-红外',
  `range_temp` int(11) DEFAULT NULL COMMENT '传感 器量程-温度',
  `range_wet` int(11) DEFAULT NULL COMMENT '传感 器量程-湿度',
  `range_press` int(11) DEFAULT NULL COMMENT '传感 器量程-压差',
  `range_pind` int(11) DEFAULT NULL COMMENT '传感器量程-管道1静压',
  `range_pind2` int(11) DEFAULT NULL COMMENT '传感器量程-管道2静压',
  `control_wind_mode` int(11) DEFAULT NULL COMMENT '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
  `control_wind_normal` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-常规风速',
  `control_wind_less` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-节能风速',
  `control_press_mode` int(11) DEFAULT NULL COMMENT '房间压差控制-方向(0：正压差   1 负 差)',
  `control_press_sets` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值设定数量',
  `control_press_setsvalueno` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值选定值编号',
  `control_press_setsvalue` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值选定值',
  `control_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值(| 分隔多个值)',
  `control_pind_sets` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值设定数量',
  `control_pind_setsvalue1no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道1',
  `control_pind_setsvalue2no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道2',
  `control_pind_setsvalue1` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道1',
  `control_pind_setsvalue2` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道2',
  `control_pind_value1` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值-通道1(| 分隔多个值)',
  `control_pind_value2` varchar(20) DEFAULT NULL COMMENT '管道静压控制预设值-通道2(| 分隔多个值)',
  `online_wind_value` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前风速值',
  `online_wind_door` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前门高值',
  `online_wind_feel` int(11) DEFAULT NULL COMMENT '通风柜在线状态-人体感应状态',
  `online_press_door` int(11) DEFAULT NULL COMMENT '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
  `online_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前压差',
  `online_press_temp` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前温度',
  `online_press_wet` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前湿度',
  `online_pind_value1` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道1)',
  `online_pind_value2` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道2)',
  `alert_switch` varchar(3) DEFAULT NULL COMMENT '告警开关\n            对于通风柜控制器来说，格式如下\n            Bit0：总开关\n            Bit1：风速告警开关\n            Bit2：门高告警开关\n            对于房间压差控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压差告警开关\n            Bit2：门开告警开关\n            对于管道静压控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压力告警开',
  `alert_para` varchar(20) DEFAULT NULL COMMENT '告警参数\n            通风柜控制器告警参数\n            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100\n            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100\n            [4:5] 门低 告警阀值   保留2位小数点，传输时*100\n            [6:7] 门高 告警阀值   保留2位小数点，传输时*100\n            房间压差控制器告警参数\n            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100\n            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100\n            管道静压控制器告警参数\n            [0:1] 通道1压力过低 告警阀值\n            [2:3] 通道1压力过高 告警阀值\n            [4:5] 通道2压力过低 告警阀值\n            [6:7] 通道2压力过高 告警阀值',
  `urgent_status` int(11) DEFAULT NULL COMMENT '当前紧急排风状态(0表示关机 1表示开机)',
  `urgent_status2` int(11) DEFAULT NULL,
  `relaystatus` varchar(20) DEFAULT NULL COMMENT '继电器状态',
  `chooserelay` varchar(20) DEFAULT NULL COMMENT '选择继电器',
  `ip_mode` int(11) DEFAULT NULL COMMENT 'ip地址模式(0 DHCP  1 STATIC）',
  `ipaddress` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `ipmask` varchar(20) DEFAULT NULL COMMENT 'ip掩码',
  `ipgate` varchar(20) DEFAULT NULL COMMENT 'ip网关',
  `serverip` varchar(20) DEFAULT NULL COMMENT '服务器IP',
  `serverport` varchar(20) DEFAULT NULL COMMENT '服务器端口',
  `mac` varchar(20) DEFAULT NULL COMMENT 'mac地址',
  `keepalive` int(11) DEFAULT NULL COMMENT '心跳间隔时间',
  `menu_switch` int(11) DEFAULT NULL COMMENT '菜单开关(0 关  1 开)',
  `menu_pass` varchar(20) DEFAULT NULL COMMENT '菜单密码',
  `event_rpt_intev` int(11) DEFAULT NULL COMMENT '事件上报时间间隔',
  `calader` varchar(20) DEFAULT NULL COMMENT '日历时间',
  `pid1_p` varchar(20) DEFAULT NULL COMMENT 'PID1_P',
  `pid1_i` varchar(20) DEFAULT NULL COMMENT 'PID1_I',
  `pid1_d` varchar(20) DEFAULT NULL COMMENT 'PID1_D',
  `pid1_period` int(11) DEFAULT NULL COMMENT 'PID1-时间间隔',
  `pid2_period` int(11) DEFAULT NULL COMMENT 'PID2-时间间隔',
  `pid2_p` varchar(20) DEFAULT NULL COMMENT 'PID2_P',
  `pid2_i` varchar(20) DEFAULT NULL COMMENT 'PID2_I',
  `pid2_d` varchar(20) DEFAULT NULL COMMENT 'PID2_D',
  PRIMARY KEY (`historyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `basesystem` */

DROP TABLE IF EXISTS `basesystem`;

CREATE TABLE `basesystem` (
  `basesystemid` int(11) NOT NULL AUTO_INCREMENT,
  `basename` varchar(100) DEFAULT NULL COMMENT '系统名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注说明',
  `type` int(11) DEFAULT NULL COMMENT '类型(1. 新风系统  2  排风系统)',
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`basesystemid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` int(11) DEFAULT NULL COMMENT 'houseroom, basesystem,aircontainer表中的主键值',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（root: 顶级  house: 楼栋  wind1  新风   wind2 排风  room  房间\n             cup 设备)',
  `parentuuid` int(11) DEFAULT NULL COMMENT '父键',
  `isfile` int(11) DEFAULT NULL COMMENT '是否父节点',
  `customerid` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `orderseq` varchar(50) DEFAULT NULL COMMENT '排序字段',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `command` */

DROP TABLE IF EXISTS `command`;

CREATE TABLE `command` (
  `cmdid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customerid` int(11) DEFAULT NULL COMMENT '所属客户ID',
  `cmd_datetime` varchar(50) DEFAULT NULL COMMENT '发布命令的日期时间',
  `cmd_cat` int(11) DEFAULT NULL COMMENT '命令大类',
  `cmd_subcat` int(11) DEFAULT NULL COMMENT '命令小类',
  `cmd_state` int(11) DEFAULT NULL COMMENT '命令状态(0 已处理   1 未处理)',
  `type` int(11) DEFAULT NULL COMMENT '机柜类型(0.通风柜风速控制器   1.房间压差控制器   2.管道静压控制器)',
  `address` varchar(20) DEFAULT NULL COMMENT '机柜地址(编号)',
  `containername` varchar(100) DEFAULT NULL COMMENT '机柜名称',
  `status` int(11) DEFAULT NULL COMMENT '机柜状态(0 设备正常  1 设备故障)',
  `power` int(11) DEFAULT NULL COMMENT '开机状态(0 关机   1 开机)',
  `power2` int(11) DEFAULT NULL,
  `versioninfo` varchar(50) DEFAULT NULL COMMENT '协议版本',
  `range_wind` int(11) DEFAULT NULL COMMENT '传感器量程-风速',
  `range_postion` int(11) DEFAULT NULL COMMENT '传感器量程-移-位',
  `range_red` int(11) DEFAULT NULL COMMENT '传感 器量程-红外',
  `range_temp` int(11) DEFAULT NULL COMMENT '传感 器量程-温度',
  `range_wet` int(11) DEFAULT NULL COMMENT '传感 器量程-湿度',
  `range_press` int(11) DEFAULT NULL COMMENT '传感 器量程-压差',
  `range_pind` int(11) DEFAULT NULL COMMENT '传感器量程-管道1静压',
  `range_pind2` char(10) DEFAULT NULL COMMENT '传感器量程-管道2静压',
  `control_wind_mode` int(11) DEFAULT NULL COMMENT '通风柜风速控制-控制模式(0 正常模式   1 节能模式)',
  `control_wind_normal` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-常规风速',
  `control_wind_less` varchar(20) DEFAULT NULL COMMENT '通风柜风速控制-节能风速',
  `control_press_mode` int(11) DEFAULT NULL COMMENT '房间压差控制-方向(0：正压差   1 负 差)',
  `control_press_sets` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值设定数量',
  `control_press_setsvalueno` int(11) DEFAULT NULL COMMENT '房间压差控制-预设值选定值编号',
  `control_press_setsvalue` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值选定值',
  `control_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差控制-预设值(| 分隔多个值)',
  `control_pind_sets` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值设定数量',
  `control_pind_setsvalue1no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道1',
  `control_pind_setsvalue2no` int(11) DEFAULT NULL COMMENT '管道静压控制-预设值选定值编号-通道2',
  `control_pind_setsvalue1` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道1',
  `control_pind_setsvalue2` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值选定值-通道2',
  `control_pind1_value` varchar(20) DEFAULT NULL COMMENT '管道静压控制-预设值-通道1(| 分隔多个值)',
  `control_pind2_value` varchar(20) DEFAULT NULL COMMENT '管道静压控制预设值-通道2(| 分隔多个值)',
  `online_wind_value` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前风速值',
  `online_wind_door` varchar(20) DEFAULT NULL COMMENT '通风柜在线状态-当前门高值',
  `online_wind_feel` int(11) DEFAULT NULL COMMENT '通风柜在线状态-人体感应状态',
  `online_press_door` int(11) DEFAULT NULL COMMENT '房间压差在线状态-门开状态(0 门关闭  1表示门打开)',
  `online_press_value` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前压差',
  `online_press_temp` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前温度',
  `online_press_wet` varchar(20) DEFAULT NULL COMMENT '房间压差在线状态-当前湿度',
  `online_pind_value1` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道1)',
  `online_pind_value2` varchar(20) DEFAULT NULL COMMENT '管道静压在线状态-当前管道静压值(管道2)',
  `alert_switch` varchar(3) DEFAULT NULL COMMENT '告警开关\n            对于通风柜控制器来说，格式如下\n            Bit0：总开关\n            Bit1：风速告警开关\n            Bit2：门高告警开关\n            对于房间压差控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压差告警开关\n            Bit2：门开告警开关\n            对于管道静压控制器来说，格式如下\n            Bit0：总开关\n            Bit1：压力告警开',
  `alert_para` varchar(20) DEFAULT NULL COMMENT '告警参数\n            通风柜控制器告警参数\n            [0:1] 风速低 告警阀值   保留2位小数点，传输时*100\n            [2:3] 风速高 告警阀值   保留2位小数点，传输时*100\n            [4:5] 门低 告警阀值   保留2位小数点，传输时*100\n            [6:7] 门高 告警阀值   保留2位小数点，传输时*100\n            房间压差控制器告警参数\n            [0:1] 压力过低 告警阀值  保留2位小数点，传输时*100\n            [2:3] 压力过高 告警阀值  保留2位小数点，传输时*100\n            管道静压控制器告警参数\n            [0:1] 通道1压力过低 告警阀值\n            [2:3] 通道1压力过高 告警阀值\n            [4:5] 通道2压力过低 告警阀值\n            [6:7] 通道2压力过高 告警阀值',
  `urgent_status` int(11) DEFAULT NULL COMMENT '当前紧急排风状态(0表示关机 1表示开机)',
  `urgent_status2` int(11) DEFAULT NULL,
  `relaystatus` varchar(20) DEFAULT NULL COMMENT '继电器状态',
  `chooserelay` varchar(20) DEFAULT NULL COMMENT '选择继电器',
  `ip_mode` int(11) DEFAULT NULL COMMENT 'ip地址模式(0 DHCP  1 STATIC）',
  `ipaddress` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `ipmask` varchar(20) DEFAULT NULL COMMENT 'ip掩码',
  `ipgate` varchar(20) DEFAULT NULL COMMENT 'ip网关',
  `serverip` varchar(20) DEFAULT NULL COMMENT '服务器IP',
  `serverport` varchar(20) DEFAULT NULL COMMENT '服务器端口',
  `mac` varchar(20) DEFAULT NULL COMMENT 'mac地址',
  `keepalive` int(11) DEFAULT NULL COMMENT '心跳间隔时间',
  `menu_switch` int(11) DEFAULT NULL COMMENT '菜单开关(0 关  1 开)',
  `menu_pass` varchar(20) DEFAULT NULL COMMENT '菜单密码',
  `event_rpt_intev` int(11) DEFAULT NULL COMMENT '事件上报时间间隔',
  `calader` varchar(20) DEFAULT NULL COMMENT '日历时间',
  `pid1_p` varchar(20) DEFAULT NULL COMMENT 'PID1_P',
  `pid1_i` varchar(20) DEFAULT NULL COMMENT 'PID1_I',
  `pid1_d` varchar(20) DEFAULT NULL COMMENT 'PID1_D',
  `pid1_period` int(11) DEFAULT NULL COMMENT 'PID1-时间间隔',
  `pid2_period` int(11) DEFAULT NULL COMMENT 'PID2-时间间隔',
  `pid2_i` varchar(20) DEFAULT NULL COMMENT 'PID2_I',
  `pid2_d` varchar(20) DEFAULT NULL COMMENT 'PID2_D',
  `responsecode` varchar(20) DEFAULT NULL COMMENT '命令响应代码',
  `pid2_p` varchar(20) DEFAULT NULL COMMENT 'PID2_P',
  `control_pind_value1` varchar(255) DEFAULT NULL,
  `control_pind_value2` varchar(255) DEFAULT NULL,
  `online_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmdid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `custname` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `period` varchar(20) DEFAULT NULL COMMENT '使用期限',
  `activeflag` int(11) DEFAULT NULL COMMENT '激活标志\n             1. 激活状态\n             2  非激活状态 ',
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `houseroom` */

DROP TABLE IF EXISTS `houseroom`;

CREATE TABLE `houseroom` (
  `houseroomid` int(11) NOT NULL AUTO_INCREMENT,
  `hsname` varchar(100) DEFAULT NULL COMMENT '楼栋名称、房间名称',
  `type` int(11) DEFAULT NULL COMMENT '1. 楼栋     2 房间',
  `address` varchar(100) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`houseroomid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `rolecode` char(10) DEFAULT NULL COMMENT '角色代码:  max',
  `customerid` int(11) DEFAULT NULL COMMENT '所属客户ID',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `rolepermission` */

DROP TABLE IF EXISTS `rolepermission`;

CREATE TABLE `rolepermission` (
  `rolepermissionid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `uuid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rolepermissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) DEFAULT NULL COMMENT '登录账户',
  `password` varchar(50) DEFAULT NULL COMMENT '登产密码',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `usertype` int(11) DEFAULT NULL COMMENT '1：平台管理用户     2.：商业管理用户   3 ：商业其他用户',
  `customerid` int(11) DEFAULT NULL COMMENT '客户ID',
  `roleid` int(11) DEFAULT NULL COMMENT '角色ID',
  `rolecode` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FKg47igcumihklbwscqn0uxxgk3` (`customerid`),
  CONSTRAINT `FKg47igcumihklbwscqn0uxxgk3` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/* Function  structure for function  `get_parent_node` */

/*!50003 DROP FUNCTION IF EXISTS `get_parent_node` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `get_parent_node`(rootid VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
BEGIN
  DECLARE fid VARCHAR(100) DEFAULT '';   
  DECLARE str VARCHAR(1000) DEFAULT rootId;     
  WHILE rootId IS NOT NULL DO   
    SET fid =(SELECT parentuuid FROM building WHERE UUID = rootid);   
    IF fid IS NOT NULL THEN   
        SET str = CONCAT(str, ',', fid);   
        SET rootId = fid;   
    ELSE   
        SET rootId = fid;   
    END IF;
  END WHILE;
RETURN str;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
