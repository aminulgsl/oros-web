/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.0.51b-community : Database - tomcatbu_budgetview
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `vendor_bank_account` */

DROP TABLE IF EXISTS `vendor_bank_account`;

CREATE TABLE `vendor_bank_account` (
  `id` int(11) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `bank_account_name` varchar(100) NOT NULL,
  `bank_account_no` varchar(50) NOT NULL,
  `iban_prefix` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_bank_account` */

LOCK TABLES `vendor_bank_account` WRITE;

insert  into `vendor_bank_account`(`id`,`version`,`bank_account_name`,`bank_account_no`,`iban_prefix`,`status`,`vendor_id`) values (1,0,'Grameen Solutions ltd','421027843','ABNA0001',1,1),(2,0,'Budgetview','151725004','ABNA',1,2),(3,0,'None','1','a',1,3),(4,0,'None','None','a',1,4),(5,0,'ABN AMRO','421027838','ABNA001',1,5),(6,0,'a','a','a',1,6),(7,0,'11111111','869533843','111111',1,9),(8,0,'werwerewr','597129800','111111',1,9),(10,0,'ewewttwetewt','243185340','werewrewr',1,1),(11,0,'','','',1,25),(12,0,'','','',1,28),(13,0,'asfasf','','',1,29),(14,0,'asdsad','fsdfasfas','',1,30),(15,0,'','','',1,32),(16,0,'fsdfdsf','dsfsdf','dsfsdf',1,33);

UNLOCK TABLES;


/*Table structure for table `vendor_master` */

DROP TABLE IF EXISTS `vendor_master`;

CREATE TABLE `vendor_master` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `by_shop` int(11) NOT NULL,
  `cham_of_commerce` varchar(50) default NULL,
  `comments` varchar(255) default NULL,
  `company_name` varchar(100) default NULL,
  `credit_status` varchar(50) NOT NULL,
  `curr_code` varchar(3) default NULL,
  `default_gl_account` varchar(15) default NULL,
  `email` varchar(60) default NULL,
  `first_name` varchar(30) default NULL,
  `frequency_of_invoice` varchar(30) default NULL,
  `gender` varchar(30) default NULL,
  `last_name` varchar(30) default NULL,
  `middle_name` varchar(30) default NULL,
  `moment_of_sending` varchar(30) default NULL,
  `payment_term_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `vat` varchar(55) default NULL,
  `vendor_code` varchar(15) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `vendor_type` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_master` */

LOCK TABLES `vendor_master` WRITE;

insert  into `vendor_master`(`id`,`version`,`by_shop`,`cham_of_commerce`,`comments`,`company_name`,`credit_status`,`curr_code`,`default_gl_account`,`email`,`first_name`,`frequency_of_invoice`,`gender`,`last_name`,`middle_name`,`moment_of_sending`,`payment_term_id`,`status`,`vat`,`vendor_code`,`vendor_name`,`vendor_type`) values (1,3,0,'','','null','Good History','EUR','4100','','','monthly','Male','','','null',2,1,'2','00001','Grameen Solutions Limited Bangladesh','vn'),(2,0,0,'','','null','Good History','EUR','4450','','',NULL,'Male','','','null',2,1,'1','00002','Budgetview222','bn'),(3,0,0,NULL,NULL,NULL,'Good History','EUR','4500',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,'00003','Office Supplies','bn'),(4,2,0,NULL,NULL,NULL,'Good History','EUR','4960',NULL,NULL,'Quarterly','Male',NULL,NULL,NULL,2,1,'3','00004','Banking cost & Interest','bn'),(5,0,0,NULL,NULL,NULL,'Good History','EUR','4960',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,'00005','ABN Amro Bank','vn'),(6,1,0,'','','null','Good History','EUR','4500','','','monthly','Male','','','null',2,1,'1','00006','Office Center','sn'),(7,0,0,'','','','','Goo','EUR','7000','','','Male','','','',1,0,'1','00009','Shawpon Ven','rp'),(8,0,0,'','','','Good History','EUR','7000','','','monthly','Male','','','',1,1,'1','00011','Shawpon Ven','rp'),(9,0,0,'','','','Good History','EUR','7000','','','monthly','Male','','','',1,1,'1','00012','Shawpon Ven','vn'),(10,0,0,'','','null','Good History','EUR','7000','malick.seye@gmail.com','',NULL,'Male','','','null',1,1,'1','00013','SKBBBBBBBBBB','bn'),(11,0,0,'','','null','Good History','EUR','7000','','',NULL,'Male','','','null',2,1,'1','00014','Shawpon Test 0001','vn'),(12,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',2,1,'','00015','Shawpon Test RP-001','rp'),(13,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00016','SHAWPON SHOP','sn'),(14,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',2,1,'','00017','Without Bank account Budget','bn'),(15,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00018','with Bank Budget','bn'),(16,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00019','SHAWPON SHOP111','sn'),(17,0,1,'','','null','Good History','EUR','7000','','',NULL,'Male','','','null',1,1,'1','00020','SHAWPON SHOP1113','rp'),(18,0,1,'','','null','Good History','EUR','7000','','',NULL,'Male','','','null',1,1,'1','00021','SHAWPON SHOP11133','sn'),(19,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00022','SHAWPON 1223','bn'),(20,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00023','SHAWPON 1223123','sn'),(21,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00024','Hasnat','bn'),(22,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00025','Hasnat Shop','sn'),(23,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00026','Hasnat11111111111111111111','bn'),(24,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00027','Hasnat22222222222222','sn'),(25,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00028','dasdasd','vn'),(26,0,1,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00029','dasdasd','sn'),(27,0,0,'','','null','Good History','EUR','7000','','',NULL,'Male','','','null',1,1,'1','00030','Hasnat','bn'),(28,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00031','SDDDD','vn'),(29,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00032','Sdasdasd','vn'),(30,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00033','dasdsadsa','vn'),(31,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00034','dasdasd','bn'),(32,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00035','asdasdasd','vn'),(33,0,0,'','','','Good History','EUR','7000','','',NULL,'','','','',1,1,'','00036','asdasdasdsdfsdfsdfds','vn');

UNLOCK TABLES;


/*Table structure for table `vendor_general_address` */

DROP TABLE IF EXISTS `vendor_general_address`;

CREATE TABLE `vendor_general_address` (
  `id` int(11) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `address_line1` varchar(255) default NULL,
  `address_line2` varchar(255) default NULL,
  `city` varchar(50) NOT NULL,
  `contact_deal_type` varchar(30) default NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_reference` varchar(100) default NULL,
  `country_id` varchar(30) NOT NULL,
  `fax` varchar(60) default NULL,
  `mobile_no` varchar(60) default NULL,
  `phone_no` varchar(60) default NULL,
  `postal_code` varchar(50) NOT NULL,
  `second_email` varchar(60) default NULL,
  `state` varchar(100) default NULL,
  `status` int(11) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `website_address` varchar(60) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK2FF94EA6755728B6` (`vendor_id`),
  CONSTRAINT `FK2FF94EA6755728B6` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_general_address` */

LOCK TABLES `vendor_general_address` WRITE;

insert  into `vendor_general_address`(`id`,`version`,`address_line1`,`address_line2`,`city`,`contact_deal_type`,`contact_person_name`,`contact_person_reference`,`country_id`,`fax`,`mobile_no`,`phone_no`,`postal_code`,`second_email`,`state`,`status`,`vendor_id`,`website_address`) values (1,0,'','','Dhaka','','Shawpon Bhowmic','','gbr','','3333333333333333','1111111111111111','1234','','',1,2,''),(2,0,'','sdfsdfsdf','sdfsdfd','','sfsdf','','deu','','','sdfsdfsd','sdfsdfsdf','fsdfsdfdsf','',1,18,'');

UNLOCK TABLES;

/*Table structure for table `vendor_postal_address` */

DROP TABLE IF EXISTS `vendor_postal_address`;

CREATE TABLE `vendor_postal_address` (
  `id` int(11) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `postal_address_line1` varchar(255) default NULL,
  `postal_address_line2` varchar(255) default NULL,
  `postal_city` varchar(50) default NULL,
  `postal_contact_person_name` varchar(255) default NULL,
  `postal_country_id` varchar(30) NOT NULL,
  `postal_postcode` varchar(50) default NULL,
  `postal_state` varchar(100) default NULL,
  `status` int(11) NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKABB5D457755728B6` (`vendor_id`),
  CONSTRAINT `FKABB5D457755728B6` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `vendor_postal_address` */

LOCK TABLES `vendor_postal_address` WRITE;

insert  into `vendor_postal_address`(`id`,`version`,`postal_address_line1`,`postal_address_line2`,`postal_city`,`postal_contact_person_name`,`postal_country_id`,`postal_postcode`,`postal_state`,`status`,`vendor_id`) values (1,0,'','','','Hassan Uz-Zaman','deu','','',1,2);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
