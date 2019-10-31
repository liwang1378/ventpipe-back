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

/*Data for the table `aircontainer` */

insert  into `aircontainer`(`aircontaierid`,`customerid`,`type`,`address`,`containername`,`status`,`power`,`power2`,`versioninfo`,`range_wind`,`range_postion`,`range_red`,`range_temp`,`range_wet`,`range_press`,`range_pind`,`range_pind2`,`control_wind_mode`,`control_wind_normal`,`control_wind_less`,`control_press_mode`,`control_press_sets`,`control_press_setsvalueno`,`control_press_setsvalue`,`control_press_value`,`control_pind_sets`,`control_pind_setsvalue1no`,`control_pind_setsvalue2no`,`control_pind_setsvalue1`,`control_pind_setsvalue2`,`control_pind_value1`,`control_pind_value2`,`online_wind_value`,`online_wind_door`,`online_wind_feel`,`online_press_door`,`online_press_value`,`online_press_temp`,`online_press_wet`,`online_pind_value1`,`online_pind_value2`,`alert_switch`,`alert_para`,`urgent_status`,`urgent_status2`,`relaystatus`,`chooserelay`,`ip_mode`,`ipaddress`,`ipmask`,`ipgate`,`serverip`,`serverport`,`mac`,`keepalive`,`menu_switch`,`menu_pass`,`event_rpt_intev`,`calader`,`pid1_p`,`pid1_i`,`pid1_d`,`pid1_period`,`pid2_period`,`pid2_p`,`pid2_i`,`pid2_d`,`online_status`,`parentuuid`,`uuid`) values (1,1,0,'A001','一号通风柜',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,0,'A002','二号通风柜',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,1,'F001','1#房间压差控制器',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,2,'G001','管道静压控制器',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,2,'G009','2#号管道静压控制器',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Data for the table `aircontainer_history` */

/*Data for the table `basesystem` */

insert  into `basesystem`(`basesystemid`,`basename`,`remark`,`type`,`customerid`) values (1,'一号新风系统',NULL,1,1),(2,'二号新风系统',NULL,1,1),(3,'三号新风系统',NULL,1,1),(4,'一号排风系统',NULL,2,1),(5,'三号排风系统',NULL,2,1);

/*Data for the table `building` */

insert  into `building`(`uuid`,`code`,`name`,`type`,`parentuuid`,`isfile`,`customerid`,`orderseq`) values (1,NULL,'控制系统','root',NULL,NULL,1,'1'),(2,1,'行政楼','house',1,NULL,1,'1'),(3,2,'教学楼','house',1,NULL,1,'1'),(4,3,'图书馆','house',1,NULL,1,'4'),(5,4,'实验室','house',1,NULL,1,'2'),(6,1,'一号新风系统','wind1',2,NULL,1,'0'),(7,2,'二号新风系统','wind1',3,NULL,1,'0'),(8,3,'三号新风系统','wind1',3,NULL,1,'0'),(9,5,'三号排风系统','wind2',3,NULL,1,'7'),(10,4,'一号排风系统','wind2',4,NULL,1,'0'),(11,4,'管道静压控制器','cup',7,NULL,1,'0'),(12,5,'101','room',6,NULL,1,'0'),(13,6,'102','room',6,NULL,1,'12'),(14,1,'一号通风柜','cup',12,NULL,1,'0'),(15,2,'二号通风柜','cup',13,NULL,1,'0'),(16,3,'房间压差控制器','cup',13,NULL,1,'0'),(17,5,'2#号管道静压控制器','cup',6,NULL,1,'12');

/*Data for the table `command` */

insert  into `command`(`cmdid`,`customerid`,`cmd_datetime`,`cmd_cat`,`cmd_subcat`,`cmd_state`,`type`,`address`,`containername`,`status`,`power`,`power2`,`versioninfo`,`range_wind`,`range_postion`,`range_red`,`range_temp`,`range_wet`,`range_press`,`range_pind`,`range_pind2`,`control_wind_mode`,`control_wind_normal`,`control_wind_less`,`control_press_mode`,`control_press_sets`,`control_press_setsvalueno`,`control_press_setsvalue`,`control_press_value`,`control_pind_sets`,`control_pind_setsvalue1no`,`control_pind_setsvalue2no`,`control_pind_setsvalue1`,`control_pind_setsvalue2`,`control_pind1_value`,`control_pind2_value`,`online_wind_value`,`online_wind_door`,`online_wind_feel`,`online_press_door`,`online_press_value`,`online_press_temp`,`online_press_wet`,`online_pind_value1`,`online_pind_value2`,`alert_switch`,`alert_para`,`urgent_status`,`urgent_status2`,`relaystatus`,`chooserelay`,`ip_mode`,`ipaddress`,`ipmask`,`ipgate`,`serverip`,`serverport`,`mac`,`keepalive`,`menu_switch`,`menu_pass`,`event_rpt_intev`,`calader`,`pid1_p`,`pid1_i`,`pid1_d`,`pid1_period`,`pid2_period`,`pid2_i`,`pid2_d`,`responsecode`,`pid2_p`,`control_pind_value1`,`control_pind_value2`,`online_status`) values (1,7,'2019-12-30',3,33,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL),(2,7,'2019-12-30',3,34,NULL,1,'00002','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL),(3,8,'2019-12-30',3,35,NULL,2,'00003','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL),(4,8,'2019-12-30',3,80,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL),(5,8,'2019-12-30',3,81,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,NULL,NULL),(6,7,'2019-12-30',3,82,NULL,1,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5',NULL,NULL,NULL,NULL),(7,9,'2019-12-30',3,83,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL),(8,8,'2019-12-30',4,0,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL),(9,8,'2019-12-30',3,1,NULL,2,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL),(10,9,'2019-12-30',3,2,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL),(11,9,'2019-12-30',3,35,NULL,0,'00001','一号通风柜',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL);

/*Data for the table `customer` */

insert  into `customer`(`customerid`,`custname`,`telephone`,`period`,`activeflag`) values (1,'超级管理员','15078688888','2999-09-09',1),(2,'经理','13859596868','2019-10-30',1),(3,'李旺','15007926045','2019-11-29',1);

/*Data for the table `houseroom` */

insert  into `houseroom`(`houseroomid`,`hsname`,`type`,`address`,`parentid`,`customerid`) values (1,'行政楼',1,'九江职院十里校区',NULL,1),(2,'教学楼',1,'九江职院新校区',NULL,1),(3,'图书馆',1,NULL,NULL,1),(4,'实验室',1,'九江职业技术学院',NULL,1),(5,'101',2,NULL,1,1),(6,'102',2,NULL,1,1),(7,'101',2,NULL,2,1),(8,'102',2,NULL,3,1),(9,'101',2,NULL,4,1),(10,'103',2,NULL,4,1);

/*Data for the table `role` */

insert  into `role`(`roleid`,`rolename`,`rolecode`,`customerid`) values (1,'管理员',NULL,8),(2,'经理',NULL,8),(3,'普通员工',NULL,8);

/*Data for the table `rolepermission` */

/*Data for the table `user` */

insert  into `user`(`userid`,`loginname`,`password`,`username`,`usertype`,`customerid`,`roleid`,`rolecode`,`rolename`) values (1,'admin','123456','超级管理员',1,1,NULL,NULL,NULL),(2,'mananger','123456','经理',2,2,NULL,NULL,NULL),(3,'liw','111111','李旺',2,3,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
