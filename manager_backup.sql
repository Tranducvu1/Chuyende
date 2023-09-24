-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: manager
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eip_m_company`
--

DROP TABLE IF EXISTS `eip_m_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eip_m_company` (
  `company_id` int NOT NULL,
  `company_name` varchar(64) NOT NULL,
  `company_name_kana` varchar(64) DEFAULT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `fax_number` varchar(15) DEFAULT NULL,
  `url` varchar(99) DEFAULT NULL,
  `ipaddress` varchar(99) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `ipaddress_internal` varchar(99) DEFAULT NULL,
  `port_internal` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eip_m_company`
--

LOCK TABLES `eip_m_company` WRITE;
/*!40000 ALTER TABLE `eip_m_company` DISABLE KEYS */;
INSERT INTO `eip_m_company` VALUES (1,'Company A','Company A Kana','12345','123 Company St','555-1234','555-5678','http://www.companyA.com','192.168.1.1',80,'192.168.1.2',8080,'2023-09-23','2023-09-23 02:40:55'),(2,'Company B','Company A Kana','12345','123 Company St','555-1234','555-5678','http://www.companyA.com','192.168.1.1',80,'192.168.1.2',8080,'2023-09-23','2023-09-23 03:52:22');
/*!40000 ALTER TABLE `eip_m_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eip_m_position`
--

DROP TABLE IF EXISTS `eip_m_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eip_m_position` (
  `position_id` int NOT NULL,
  `position_name` varchar(64) NOT NULL,
  `sort` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eip_m_position`
--

LOCK TABLES `eip_m_position` WRITE;
/*!40000 ALTER TABLE `eip_m_position` DISABLE KEYS */;
INSERT INTO `eip_m_position` VALUES (1,'Manager',1,'2023-09-23','2023-09-23 02:40:59');
/*!40000 ALTER TABLE `eip_m_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eip_m_post`
--

DROP TABLE IF EXISTS `eip_m_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eip_m_post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `post_name` varchar(64) NOT NULL,
  `zipcode` varchar(8) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `in_telephone` varchar(15) DEFAULT NULL,
  `out_telephone` varchar(15) DEFAULT NULL,
  `fax_number` varchar(15) DEFAULT NULL,
  `group_name` varchar(99) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `eipmpost_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `group_name` (`group_name`),
  KEY `idx_eipmpost_id` (`eipmpost_id`),
  KEY `fk_post_company` (`company_id`),
  CONSTRAINT `eip_m_post_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `eip_m_company` (`company_id`),
  CONSTRAINT `fk_post_company` FOREIGN KEY (`company_id`) REFERENCES `eip_m_company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eip_m_post`
--

LOCK TABLES `eip_m_post` WRITE;
/*!40000 ALTER TABLE `eip_m_post` DISABLE KEYS */;
INSERT INTO `eip_m_post` VALUES (1,1,'Post A','54321','456 Post St','555-4321','555-8765','555-9876','Group A',1,'2023-09-23','2023-09-23 02:41:02',NULL,NULL),(2,1,'TEST2 group,test department',NULL,'123 Main St',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2,'TEST2 group,test department','54321','456 Post St','555-4321','555-8765','555-9876','Group B',1,'2023-09-23','2023-09-23 03:54:58',NULL,NULL),(4,2,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,'Post A','54321','456 Post St','555-4321','555-8765','555-9876','Unique Group Name',1,'2023-09-23','2023-09-23 02:41:02',NULL,NULL),(11,NULL,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,1,'Post A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,'TEST2 group,test department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `eip_m_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turbine_group`
--

DROP TABLE IF EXISTS `turbine_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turbine_group` (
  `group_id` int NOT NULL,
  `group_name` varchar(99) NOT NULL,
  `objectdata` blob,
  `owner_id` int DEFAULT NULL,
  `group_alias_name` varchar(99) DEFAULT NULL,
  `public_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `turbine_group_group_name_key` (`group_name`),
  UNIQUE KEY `turbine_group_owner_id_group_alias_name_key` (`owner_id`,`group_alias_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbine_group`
--

LOCK TABLES `turbine_group` WRITE;
/*!40000 ALTER TABLE `turbine_group` DISABLE KEYS */;
INSERT INTO `turbine_group` VALUES (1,'Group A',NULL,1,'Alias A','Y');
/*!40000 ALTER TABLE `turbine_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turbine_user`
--

DROP TABLE IF EXISTS `turbine_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turbine_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `login_name` varchar(32) DEFAULT NULL,
  `password_value` varchar(200) DEFAULT NULL,
  `first_name` varchar(99) DEFAULT NULL,
  `last_name` varchar(99) DEFAULT NULL,
  `email` varchar(99) DEFAULT NULL,
  `confirm_value` varchar(99) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `disabled` char(1) DEFAULT NULL,
  `objectdata` blob,
  `password_changed` timestamp NULL DEFAULT NULL,
  `company_id` int DEFAULT '1',
  `position_id` int DEFAULT NULL,
  `in_telephone` varchar(15) DEFAULT NULL,
  `out_telephone` varchar(15) DEFAULT NULL,
  `cellular_phone` varchar(15) DEFAULT NULL,
  `cellular_mail` varchar(99) DEFAULT NULL,
  `cellular_uid` varchar(99) DEFAULT NULL,
  `first_name_kana` varchar(99) DEFAULT NULL,
  `last_name_kana` varchar(99) DEFAULT NULL,
  `photo` blob,
  `has_photo` char(1) DEFAULT NULL,
  `photo_modified` timestamp NULL DEFAULT NULL,
  `photo_smartphone` blob,
  `has_photo_smartphone` char(1) DEFAULT NULL,
  `photo_modified_smartphone` timestamp NULL DEFAULT NULL,
  `tutorial_forbid` char(1) DEFAULT NULL,
  `migrate_version` int NOT NULL DEFAULT '0',
  `created_user_id` int DEFAULT NULL,
  `updated_user_id` int DEFAULT NULL,
  `eipmpost_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `is_admin` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_name` (`login_name`),
  KEY `eipmpost_id` (`eipmpost_id`),
  KEY `fk_user_position` (`position_id`),
  KEY `FKp2tfp9uwrx66n27y9xrlo368x` (`company_id`),
  KEY `turbine_user_ibfk_4` (`post_id`),
  CONSTRAINT `FKp2tfp9uwrx66n27y9xrlo368x` FOREIGN KEY (`company_id`) REFERENCES `eip_m_company` (`company_id`),
  CONSTRAINT `turbine_user_ibfk_3` FOREIGN KEY (`eipmpost_id`) REFERENCES `eip_m_post` (`eipmpost_id`),
  CONSTRAINT `turbine_user_ibfk_4` FOREIGN KEY (`post_id`) REFERENCES `eip_m_post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turbine_user`
--

LOCK TABLES `turbine_user` WRITE;
/*!40000 ALTER TABLE `turbine_user` DISABLE KEYS */;
INSERT INTO `turbine_user` VALUES (1,'user1','password123','John','Doe','john@example.com',NULL,NULL,'2023-09-23 02:00:00',NULL,'N',NULL,NULL,1,1,'555-1234','555-5678','555-9101',NULL,NULL,'ジョン','ドウ',NULL,'N',NULL,NULL,'N',NULL,'N',0,NULL,NULL,NULL,1,1,NULL),(2,'longld','password123','Jong','luu','john@example.com',NULL,NULL,'2023-09-23 02:00:00',NULL,'N',NULL,NULL,1,1,'555-1234','555-5678','555-9101',NULL,NULL,'ジョン','ドウ',NULL,'N',NULL,NULL,'N',NULL,'N',0,NULL,NULL,NULL,3,NULL,NULL),(10,'test',NULL,'vu',NULL,'Tranducvuht@gmail.com',NULL,NULL,NULL,NULL,'\0',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary 'z4715586121241_e0d16e7732b6ac82fd79d10043f442e3.jpg','\0',NULL,NULL,'\0',NULL,'\0',0,NULL,NULL,NULL,NULL,NULL,1),(33,'name','12345','vu','vu','Tranducvuht@gmail.com','12345',NULL,NULL,NULL,'\0',NULL,NULL,NULL,20,'0345934782','0345934782','0345934782','0345934782',NULL,NULL,NULL,_binary 'z4715586121241_e0d16e7732b6ac82fd79d10043f442e3.jpg','\0',NULL,NULL,'\0',NULL,'\0',0,NULL,NULL,NULL,28,NULL,1),(36,'name1','12345','vu','vu','Tranducvuht@gmail.com','12345',NULL,NULL,NULL,'\0',NULL,NULL,NULL,20,'0345934782','0345934782','0345934782','0345934782',NULL,NULL,NULL,_binary '377260615_274985122128338_509207352715671836_n.jpg','\0',NULL,NULL,'\0',NULL,'\0',0,NULL,NULL,NULL,31,NULL,1),(38,'name2','12345','vu','vu','Tranducvuht@gmail.com','1234',NULL,NULL,NULL,'\0',NULL,NULL,NULL,20,'0345934782','0345934782','0345934782','0345934782',NULL,'vu','vu',_binary 'z4715586125735_17bd2a250ff9b8c37f4ad5435df3ff25.jpg','\0',NULL,NULL,'\0',NULL,'\0',0,NULL,NULL,NULL,33,NULL,1);
/*!40000 ALTER TABLE `turbine_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25  0:29:50
