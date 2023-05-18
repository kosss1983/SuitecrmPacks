-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: suitecrm
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `industry` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `annual_revenue` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_office` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_alternate` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ownership` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employees` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ticker_symbol` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sic_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `opportunity_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_actions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acltype` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aclaccess` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('1012bbd5-19bf-f5c5-2933-645e56e38b20','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','SurveyQuestionOptions','module',90,0),('10253df1-9b2e-f7f2-24ae-645e56277518','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_Products','module',90,0),('112ffa87-3e4b-6343-9d74-645e567dab9c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_Products','module',90,0),('118dee79-d3e5-4e8e-fc63-646389c54fee','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','edit','f_Pricelist','module',90,0),('11c21859-e185-373a-1e69-645e56f94b7a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','SurveyQuestionOptions','module',90,0),('12624791-1740-f95a-fb3b-645e56889eed','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Spots','module',90,0),('12973fb3-362c-d831-7de7-645e56f54591','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','FP_events','module',89,0),('13f5d68d-61c8-d34b-5b1f-645e56ff71a7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','FP_events','module',90,0),('14050bfb-13b0-17a9-54b1-645e563e5ec2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Spots','module',90,0),('14fb6518-c320-38ea-3785-645e5649c010','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','FP_events','module',90,0),('1509f9f4-eb8c-52da-b68b-646389f88175','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','delete','f_Pricelist','module',90,0),('16ddd096-ba25-997a-d46a-645e56131a6b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','FP_events','module',90,0),('17373173-d908-68b1-6e44-645e56fd61bf','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Spots','module',90,0),('173903d4-0a39-6d1a-bbd1-645e56a9f01d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','SurveyQuestionOptions','module',89,0),('177e0f7c-068f-215a-6d12-645e56a2688f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Contacts','module',90,0),('17e40394-f5a3-530d-ea13-645e56b8742c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','ExternalOAuthProvider','module',90,0),('18457284-b060-4f6c-e299-645e5669e4c0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','FP_events','module',90,0),('186d4fa7-261a-52fd-2ff0-646389471598','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','import','f_Pricelist','module',90,0),('18cd8613-4bd3-94c0-64a8-645e569b08ba','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Tasks','module',89,0),('192b06a8-266f-fd1f-7cab-645e5628f552','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Meetings','module',90,0),('19796914-5341-5d20-7d86-645e56cf20dd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Spots','module',90,0),('19b679c0-8fc7-60e4-6228-645e56fcecc6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','TemplateSectionLine','module',89,0),('1a084049-26ba-3efb-d823-645e560ebda8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Tasks','module',90,0),('1a13d029-0f0b-e5af-9fc9-645e561f9f8c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','FP_events','module',90,0),('1b3c1e11-fdf1-3f63-f207-645e56b067af','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','TemplateSectionLine','module',90,0),('1b5e62f0-72e3-f662-6523-646389ef0ed9','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','export','f_Pricelist','module',90,0),('1b712424-d970-1b33-9ba1-645e56cc2164','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Tasks','module',90,0),('1b941104-9a8f-eaa1-9aff-645e56bf9107','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Spots','module',90,0),('1c1c531b-24ef-a8ab-b210-645e56116cce','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','FP_events','module',90,0),('1c380cf7-65f7-362c-c79d-645e56d5cbc4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','jjwg_Markers','module',90,0),('1c7211c4-661a-af56-6bb5-645e56456cd8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','TemplateSectionLine','module',90,0),('1cb5b043-f81e-d508-2907-645e56d1d304','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Tasks','module',90,0),('1d4ce654-d3c8-b5df-823d-645e5627cd42','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Spots','module',90,0),('1dace639-ed8e-e81a-e7a6-645e568a1258','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','ProjectTask','module',89,0),('1e0bd00d-0d01-237a-1e5f-645e560ab88b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Tasks','module',90,0),('1e22458b-de84-6083-8524-645e56f23788','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','TemplateSectionLine','module',90,0),('1e234420-4bbd-0768-69ad-64638962787d','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','massupdate','f_Pricelist','module',90,0),('1ee7064f-5738-e534-26bd-645e5651935a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','FP_events','module',90,0),('1f34b39c-6d55-36a1-5a49-645e56e4c0d6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Tasks','module',90,0),('1f9db341-deab-cb75-9e6c-645e56b3db68','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','jjwg_Areas','module',89,0),('1faba80f-96a5-8ebd-8e1a-645e5650c19e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','ProjectTask','module',90,0),('2005feea-801f-e28d-afa6-645e56d010ca','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','TemplateSectionLine','module',90,0),('20f5d22e-e320-5a8e-0456-645e567e0c40','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Tasks','module',90,0),('218e01cf-4987-8cdf-94d5-645e565d36ac','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','jjwg_Areas','module',90,0),('2194da01-a31b-62a1-bfa8-645e56f7b960','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','ProjectTask','module',90,0),('22acae8e-842f-d823-9eb4-645e5650d6bc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Tasks','module',90,0),('22d72b16-88b3-396f-e6b0-645e56b3550d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','jjwg_Areas','module',90,0),('22db1231-f13e-365e-75f2-645e56907b9e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','TemplateSectionLine','module',90,0),('22fdeb7b-5f07-d880-77d3-645e56946a1e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','ProjectTask','module',90,0),('23fa8bb9-ed9b-4148-ed4c-645e5639f6d0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','jjwg_Areas','module',90,0),('243c1212-9e53-3768-6b4d-645e565fba3b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','ProjectTask','module',90,0),('24c2f0cb-a2ab-7170-6cca-645e56ba2541','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','TemplateSectionLine','module',90,0),('24dac193-5a33-78fc-649a-645e567ac34b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Accounts','module',89,0),('2521a354-fce4-1ef0-0944-645e56c7784e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','ProjectTask','module',90,0),('254f7235-9098-aaf9-53be-645e5601ede6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','jjwg_Areas','module',90,0),('25c1faef-ab8d-e918-6d56-645e568f7458','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Accounts','module',90,0),('260aff8b-df68-64b4-8d32-645e56dde651','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','ProjectTask','module',90,0),('26934633-1596-36d4-8533-645e562305a2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','TemplateSectionLine','module',90,0),('26970305-d658-f08c-8ae4-645e56a7af25','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Accounts','module',90,0),('26d86645-d073-381a-75e8-645e565c73ea','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','ProjectTask','module',90,0),('271d81c4-24a8-0340-73b1-645e56251c6b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','jjwg_Areas','module',90,0),('27667b96-bd41-a6ee-43e8-645e56934a7c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Accounts','module',90,0),('286f54a3-dde7-f8e9-e7f6-645e56b5eb34','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Accounts','module',90,0),('29a867cb-1146-4b40-69b7-645e56614a64','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','jjwg_Areas','module',90,0),('29c37bf9-4218-f927-2fe1-645e56ade2b4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Accounts','module',90,0),('2ac44662-27dc-c3d4-ea7e-645e5607320d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Accounts','module',90,0),('2ba592eb-6f05-44ed-6074-645e56160d95','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','jjwg_Areas','module',90,0),('2bac1727-d075-3b17-315b-645e56de2d3b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Accounts','module',90,0),('33310d43-d868-f415-463d-645e563128e8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','jjwg_Markers','module',90,0),('33b0d17c-6288-15e7-95ae-64638978daed','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','access','f_Customers','module',89,0),('33d136c8-29ef-1c36-678e-645e56db10af','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','FP_Event_Locations','module',89,0),('34eae236-0b4f-3b29-b73e-645e56680127','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','FP_Event_Locations','module',90,0),('36487c89-84a0-30b4-e335-645e560f4343','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','FP_Event_Locations','module',90,0),('3652b267-abf1-8f0a-872f-6463890a6a6b','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','view','f_Customers','module',90,0),('374fff8b-5321-41a3-be57-645e5637a1e4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','FP_Event_Locations','module',90,0),('3850d541-96f8-912f-21be-645e565e9076','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','FP_Event_Locations','module',90,0),('3910f046-3593-ba6e-9ac0-6463893bed3b','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','list','f_Customers','module',90,0),('398f1224-5e4b-b3b3-da65-645e56f501c1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','FP_Event_Locations','module',90,0),('3b3660a7-f15c-8641-b05f-645e56eb205f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','FP_Event_Locations','module',90,0),('3b3bad69-e37b-740e-5c85-646389652ba4','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','edit','f_Customers','module',90,0),('3ce6f146-ddd4-0912-adbd-645e56261fcf','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOR_Scheduled_Reports','module',89,0),('3ceedc14-ec51-41eb-b525-645e564aec36','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','FP_Event_Locations','module',90,0),('3d020c53-b623-3f39-f42d-645e56f674ba','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Project','module',89,0),('3d100e5e-c0d1-c2ab-9468-645e5618792d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','jjwg_Markers','module',90,0),('3d1efe14-1b74-8049-bcc2-64638930dffd','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','delete','f_Customers','module',90,0),('3d8a0347-4f2f-05ab-95a6-645e561bcd22','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Meetings','module',90,0),('3eae180d-2961-d3ba-b521-645e5627ed8e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOR_Scheduled_Reports','module',90,0),('3f5f0531-615a-3bc4-5925-645e56b00f4c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','SurveyQuestionOptions','module',90,0),('3ff5f9cb-a4bf-bd20-df51-645e56393d7b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','EAPM','module',89,0),('405071e2-75bf-13ac-5dde-646389b09bd2','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','import','f_Customers','module',90,0),('40a0f437-3521-cf1a-bd01-645e56168936','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOR_Scheduled_Reports','module',90,0),('40c8dee8-e279-7f96-01bd-645e568df9d2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','jjwg_Address_Cache','module',89,0),('4116b78f-cfdb-bd6b-aff8-645e5622ad18','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','EAPM','module',90,0),('41fb0c37-3f3a-b774-d0d9-645e56d11076','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','ExternalOAuthProvider','module',90,0),('42783ab8-5403-9fdb-b176-645e563bbe6b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','EAPM','module',90,0),('42a2cf59-b9f0-6c9c-5658-645e56f0c922','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOR_Scheduled_Reports','module',90,0),('42bdff48-aa15-f6b6-1844-645e56a78388','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Campaigns','module',89,0),('4323a286-36b4-629b-a8e4-646389579f9e','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','export','f_Customers','module',90,0),('435367a2-58da-1c39-d535-645e56490fe1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','jjwg_Address_Cache','module',90,0),('437c58e3-71a6-15a8-528e-645e56e142bd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','EAPM','module',90,0),('44521c7b-a666-16f0-66ae-645e566dcc41','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Campaigns','module',90,0),('44834131-a78a-3e04-d35e-645e56d29d0d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','EAPM','module',90,0),('450be156-dc47-977c-6010-645e56c844ab','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOR_Scheduled_Reports','module',90,0),('4530d2d6-dde5-7eda-46a9-645e566448b5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','jjwg_Address_Cache','module',90,0),('45a0ac77-6c6e-0eff-d5d7-645e56573861','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','EAPM','module',90,0),('45f626f2-402b-6f1f-0189-645e561337d0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Campaigns','module',90,0),('46768ee4-ea31-0c73-6d3b-646389a190c1','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','massupdate','f_Customers','module',90,0),('4696c1a1-d0ac-ad94-b65b-645e56f04d76','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','EAPM','module',90,0),('469fd2ca-2e30-ab94-7881-645e56dd11eb','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOR_Scheduled_Reports','module',90,0),('473f037c-30bf-fcfa-5370-645e5646c143','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','jjwg_Address_Cache','module',90,0),('473fadc8-518a-0c17-e4c5-645e569810dd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Campaigns','module',90,0),('475ee092-b96e-25d4-b7f6-645e56dd4139','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','EAPM','module',90,0),('482a99e4-9508-1f4c-7134-645e56c55c8f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOR_Scheduled_Reports','module',90,0),('48973557-a970-a44c-de79-645e56b96205','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Campaigns','module',90,0),('493f4914-8580-b7e9-5efd-645e56f2bc82','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','jjwg_Address_Cache','module',90,0),('49d10c38-36cd-c623-762d-645e56f08927','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Campaigns','module',90,0),('4a530350-432d-f811-73bb-645e56ca4374','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOR_Scheduled_Reports','module',90,0),('4abf41e4-0e6a-275f-1252-645e56957499','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Campaigns','module',90,0),('4b2a3e60-098a-934f-05cd-645e5643b2ed','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','jjwg_Address_Cache','module',90,0),('4bb9f744-f4b8-b8b6-aab1-645e56711640','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Campaigns','module',90,0),('4bf95881-2318-2f43-dd3b-645e56b7e671','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Opportunities','module',89,0),('4c040758-c31c-27c5-d835-645e56086050','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','jjwg_Markers','module',90,0),('4d4205b2-c763-9647-f9c9-645e56d365c7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Opportunities','module',90,0),('4da8d4e7-2a7f-c2d8-99ed-645e56421d3a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','jjwg_Address_Cache','module',90,0),('4ec20499-a4bf-ca11-fc7c-645e56dd2de9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Opportunities','module',90,0),('4f4c32a5-0903-2ed6-1383-645e56c9516c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','jjwg_Address_Cache','module',90,0),('4ff8842d-8caf-6fe7-0754-645e56b607df','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Opportunities','module',90,0),('514f709d-c1ba-3e64-3dfb-645e5673676b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Opportunities','module',90,0),('52000f3d-31e2-a56b-84e4-645e56a1a4c8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Project','module',90,0),('52495af1-732e-1167-32a9-645e565911a5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Opportunities','module',90,0),('52ef4834-09a2-1a37-0dab-645e56464b0a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','SurveyResponses','module',89,0),('5375267f-c382-9219-6214-645e56671d41','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Opportunities','module',90,0),('548592f8-5464-6b6b-e821-645e56514d54','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Opportunities','module',90,0),('558c10b4-7eb7-7326-4afe-645e564016ce','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','SurveyResponses','module',90,0),('57ea0fe5-0388-9b79-2efd-645e5663f149','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','SurveyResponses','module',90,0),('58757c01-29da-5b86-fd40-645e567cf469','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_Contracts','module',89,0),('592ae95b-a2fb-f56f-a09d-645e56896490','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOD_IndexEvent','module',89,0),('5996b213-6cc8-f9d6-481f-645e56d1927f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_Contracts','module',90,0),('5a0a72f8-07c3-ab4d-b8cf-645e568c98ff','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_Quotes','module',89,0),('5a49c516-d9dc-5654-b4ac-645e568fd263','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','SurveyResponses','module',90,0),('5ab4ce01-7c80-bb83-05a6-645e566454b3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_Contracts','module',90,0),('5adad7b2-a899-beae-f83f-645e56dc7f1c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOD_IndexEvent','module',90,0),('5b3355c3-5952-537b-53a4-645e56a22106','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_Quotes','module',90,0),('5bf60e80-c8ac-e85d-3771-645e566f45f1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_Contracts','module',90,0),('5c21ee04-d547-128a-5853-645e562d40bb','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_Quotes','module',90,0),('5c38fafb-25b5-e280-2ddf-645e56e8bdff','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOD_IndexEvent','module',90,0),('5ca5570d-8c32-6829-3661-645e561cfac0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','SurveyResponses','module',90,0),('5d21f91e-d9b9-6f3e-ea0d-645e56957ec7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_Quotes','module',90,0),('5d332af7-cf35-3913-ca90-645e56cd0d4b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_Contracts','module',90,0),('5deb4a4f-94d6-1442-2a8a-645e56de4f77','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_Quotes','module',90,0),('5df13904-ce6c-0a6b-37ca-645e560aaf54','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOD_IndexEvent','module',90,0),('5e78638a-4b00-cbf5-7ff5-645e5676d9e9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_Contracts','module',90,0),('5e7b06ff-da6c-b5bf-25dd-645e565fedd4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Project','module',90,0),('5ec42b4d-2696-a72b-59a4-645e56c69923','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','SurveyResponses','module',90,0),('5f0c2054-d989-7f5a-2d90-645e56b20df9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_Quotes','module',90,0),('5f93df57-6269-9d68-b592-645e56bc7c5e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_Contracts','module',90,0),('5f9c8b5b-f489-5f31-2047-645e5663871f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOD_IndexEvent','module',90,0),('6023b35d-5d83-6521-aac6-645e560d2284','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_Quotes','module',90,0),('60e5edd4-c6ee-57ce-b7d1-645e56a3f04c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_Contracts','module',90,0),('6101ba58-07d0-c6ce-28db-645e56286d8d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_Quotes','module',90,0),('615870cf-6fd7-09c7-da01-645e564348a0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOD_IndexEvent','module',90,0),('6169c985-e65f-f1ea-7078-645e56e7b23f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','SurveyResponses','module',90,0),('635d41ad-911a-7b3b-918e-645e56b76ed4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOD_IndexEvent','module',90,0),('63830be8-bf77-4f3c-d789-645e561ed33b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','SurveyResponses','module',90,0),('643d0819-911a-0b49-0aa0-645e56af2069','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Leads','module',89,0),('64a68b87-47da-e7b7-c68a-645e5698ce44','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Calls_Reschedule','module',89,0),('6567caa4-8584-883b-f3a1-645e561db805','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOD_IndexEvent','module',90,0),('65fe676b-223a-2cea-1cf5-645e56719a68','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Calls_Reschedule','module',90,0),('66973e32-dd6f-9126-7680-645e5662faf6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','ProspectLists','module',89,0),('66e20e4b-6cb7-57f3-5960-645e5622be81','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Contacts','module',90,0),('66fd9925-24c9-8deb-0bb6-645e567b473e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Alerts','module',89,0),('675728a1-49b1-868e-7c1a-645e5645a2f6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Leads','module',90,0),('675a7610-2334-edfa-d87a-645e56b3441d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Calls_Reschedule','module',90,0),('685c7da5-53a8-1622-c8cd-645e56a6f4a3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','ProspectLists','module',90,0),('68a8dc24-58f4-e1cb-3564-645e5639999a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Alerts','module',90,0),('69109a07-8676-9b17-ea07-645e56d19d5f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AM_ProjectTemplates','module',89,0),('6936d784-807d-9266-89fa-645e566686b6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Leads','module',90,0),('699cc259-1f9e-6c89-709b-645e56d947af','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Calls_Reschedule','module',90,0),('69f20b3a-3063-9912-18d5-645e56f6eedc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','ExternalOAuthProvider','module',90,0),('6a0ecb8f-55d6-4ab2-b798-645e5698bd29','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','ProspectLists','module',90,0),('6a270e01-940b-614b-54e9-645e568a8242','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','jjwg_Markers','module',90,0),('6a7dc54d-1ee7-1761-a1e4-645e56bd994f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Alerts','module',90,0),('6a8056b9-7057-acdd-7a02-645e563ff285','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AM_ProjectTemplates','module',90,0),('6b05ec0f-85d5-2c51-d44b-645e5662bff9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Leads','module',90,0),('6b78c91e-f212-59e4-e422-645e56342990','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Calls_Reschedule','module',90,0),('6b7b421d-492b-c385-b88a-645e56e89795','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','ProspectLists','module',90,0),('6bb5e625-c00b-68c9-f1aa-645e56c73176','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AM_ProjectTemplates','module',90,0),('6c13bc9d-8a62-66e9-5455-645e5687f5c6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Alerts','module',90,0),('6c5f0efc-318a-e0dd-1482-645e56a464f3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Meetings','module',90,0),('6cd88679-4d81-a906-b03c-645e56f8de8d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AM_ProjectTemplates','module',90,0),('6cdbd0ee-3c50-04bb-bc2a-645e56c0bec2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Leads','module',90,0),('6d37665a-df38-f48b-e6d6-645e566c1db2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Calls_Reschedule','module',90,0),('6da3552a-67af-6819-0f89-645e565fda05','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','ProspectLists','module',90,0),('6db9e396-5fac-da00-9bbf-645e56d944db','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AM_ProjectTemplates','module',90,0),('6e05cd89-9688-fec1-411a-645e56079672','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Alerts','module',90,0),('6e070173-01cf-42ca-3859-645e56d99c2d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Project','module',90,0),('6e20dd7a-6642-e7aa-4288-645e566a64e4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Leads','module',90,0),('6ed21f32-29a3-8de4-7361-645e56775f98','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AM_ProjectTemplates','module',90,0),('6f5bb6a5-f56a-8943-49f4-645e5668ee60','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Calls_Reschedule','module',90,0),('6f667231-9ede-88b5-9c79-645e567d694f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','ProspectLists','module',90,0),('6fb234ea-9262-f198-a9a4-645e561f3f86','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Leads','module',90,0),('6fbfc9b4-b7d9-03d3-e13c-645e5680d3c1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AM_ProjectTemplates','module',90,0),('6fd86716-7534-ad7a-a33d-645e56e4c08e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Alerts','module',90,0),('70b36bb7-1142-6192-cf40-645e56a67182','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Calls_Reschedule','module',90,0),('70ead0bd-4ae9-e26b-8449-645e56d1fb91','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AM_ProjectTemplates','module',90,0),('713dedf2-66a5-434b-b353-645e564d888d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Leads','module',90,0),('717880dd-684e-f557-2eaf-645e561227c9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','ProspectLists','module',90,0),('71b1f33b-9872-dbef-e09e-645e5675bbd4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Alerts','module',90,0),('72e3d6d1-7618-125c-20f3-645e56c9c9ed','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','ProspectLists','module',90,0),('739aed2f-74da-187d-e290-645e56e4ea69','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Alerts','module',90,0),('73a2f3b7-7f3e-e229-972c-645e56ba94bc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','EmailTemplates','module',89,0),('74f4bdb8-d8b1-6b28-4cf3-645e56bf6c3a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','EmailTemplates','module',90,0),('7634d2db-ceb6-b0ad-a431-645e56092408','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','EmailTemplates','module',90,0),('77c443fd-f014-d9b6-8a85-645e561b1daa','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','EmailTemplates','module',90,0),('77f60c15-9b64-9e11-48dc-645e5658d401','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_Products','module',89,0),('79aa6624-4ee9-e65f-d7f7-645e56c3f42b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','EmailTemplates','module',90,0),('7acc06e0-ccb1-49ac-9c5e-645e56113189','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','SurveyQuestionOptions','module',90,0),('7b56d5de-5e89-bcca-60aa-645e566b601e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','EmailTemplates','module',90,0),('7b8a31bb-c514-4dc2-9a88-645e5601e528','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOW_WorkFlow','module',89,0),('7cafa523-a772-fb1f-c0f9-645e56f52e3a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOW_WorkFlow','module',90,0),('7ce96720-792e-da8f-e217-645e56fccb68','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','EmailTemplates','module',90,0),('7d7ba2a9-e69d-001c-aa79-645e56b329a2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOW_WorkFlow','module',90,0),('7e501194-1d18-8875-ba59-645e5662e5d4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Surveys','module',89,0),('7e77f409-a1c9-d632-21eb-645e56d83cb0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOW_WorkFlow','module',90,0),('7ede117c-7c1e-7483-c868-645e564bf9b9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','EmailTemplates','module',90,0),('7fa24152-8aee-c972-b23e-645e5696d83e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOW_WorkFlow','module',90,0),('7fc2aead-50ca-4365-0ab4-645e56de2082','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Surveys','module',90,0),('8011098a-fadb-49c6-f7f6-645e564691d4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Contacts','module',90,0),('80aa28e3-55ba-31df-1b23-645e5632128a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOD_Index','module',89,0),('8127a0e1-2156-45d2-a35d-645e56262b00','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOW_WorkFlow','module',90,0),('8144633b-ce28-5577-9256-645e561fadce','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Surveys','module',90,0),('81d6da20-bf21-cc41-b397-645e565c5359','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_Invoices','module',89,0),('81e59f94-ad5d-3bbf-857d-645e5636a73c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AM_TaskTemplates','module',89,0),('820a8a9e-796c-51b1-d53b-645e5670a56b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOD_Index','module',90,0),('826984b6-c836-7539-2f28-645e567d0e31','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOW_WorkFlow','module',90,0),('83075dde-19c0-3815-ef54-645e560ba19e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Surveys','module',90,0),('83495d2e-c325-65b6-d0c1-645e56644e9c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOD_Index','module',90,0),('83878efc-5e02-d55b-1bbe-645e568ff0f1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AM_TaskTemplates','module',90,0),('83a336b5-0476-4f56-f33c-645e5634468f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOW_WorkFlow','module',90,0),('83b9e32d-2c56-0295-88d3-645e569edcd7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_Invoices','module',90,0),('84b95eb0-452e-41ab-0de2-645e569b6edb','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOD_Index','module',90,0),('8512f006-0a6b-1003-b3bd-645e569fd741','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Surveys','module',90,0),('8547dd17-f8a5-2621-2c49-645e56ea844c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_Invoices','module',90,0),('854d54ea-5b75-a917-e0d3-645e56a29a9c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AM_TaskTemplates','module',90,0),('856b03ac-cb7d-6541-8475-645e563bab59','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Project','module',90,0),('861c51e3-63d4-69bd-15a8-645e56ec6c2c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOD_Index','module',90,0),('866c0c4e-58ff-d87a-ba1c-645e566fd8fe','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Meetings','module',90,0),('86f84221-1100-7c6e-c2dc-645e56bc2486','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AM_TaskTemplates','module',90,0),('8705bdd7-7d47-6a48-5b42-645e5653922e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_Invoices','module',90,0),('8748d3b7-c2d1-b28c-71b5-645e56b192ca','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Prospects','module',89,0),('87b08fa0-c767-c2ec-18d6-645e56ff4b3b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOD_Index','module',90,0),('87b2f7a5-a947-9a24-dcb2-645e5621d64c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Surveys','module',90,0),('88a32f60-7491-ff9d-0a3a-645e566f72f3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AM_TaskTemplates','module',90,0),('88ca540e-17fc-218c-a933-645e563219e0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Documents','module',89,0),('88e5a60e-f9c3-29eb-f9c7-645e56dfdc0f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Prospects','module',90,0),('88ea422e-0e49-fc93-d9a0-645e560051ff','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOD_Index','module',90,0),('88ee31cf-ec84-8bb6-9d2e-645e5640fcc7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','SecurityGroups','module',89,0),('891da9a3-fbc2-11d5-3b81-645e56935300','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_Invoices','module',90,0),('89c87504-fae7-b304-8ac0-645e561a7b75','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Surveys','module',90,0),('8a0107ff-d502-b1f9-d403-645e563f1d50','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOD_Index','module',90,0),('8a5bb4f1-2703-9434-cf34-645e5636d504','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Documents','module',90,0),('8a90a384-26fd-1b98-b86e-645e56a0ebd5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AM_TaskTemplates','module',90,0),('8a9b244e-77f4-1d1f-49f0-645e56ce828d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Prospects','module',90,0),('8aa2115b-9fc2-7c7c-a7e6-645e5662c0f7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_Invoices','module',90,0),('8b6e0dc0-0286-40c1-5e09-645e568bfbf8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','SecurityGroups','module',90,0),('8bdc29b9-7ee6-ab0f-a482-645e563efa90','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Documents','module',90,0),('8c1ba2f1-1757-70f8-c501-645e56ab3473','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Prospects','module',90,0),('8c2efcde-0d34-c54c-88ff-645e5611d556','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Surveys','module',90,0),('8cc2a921-f47e-3b1a-2217-645e56a8ff3e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_Invoices','module',90,0),('8cef70f5-af3f-d6c9-8be4-645e56449b92','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AM_TaskTemplates','module',90,0),('8d523ec3-67a3-5f4d-8f29-645e56fb33e4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Prospects','module',90,0),('8d63a305-112d-5ed2-bc2d-645e56ec1393','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Documents','module',90,0),('8dd5edd1-27af-6c0f-3ddb-645e56072040','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','SecurityGroups','module',90,0),('8e1e47b3-1d69-db19-12f3-645e568483dd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Notes','module',89,0),('8e849716-12dd-cc13-bcd4-645e56c14b31','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_Invoices','module',90,0),('8e8c3fc8-04d7-1d9d-8a28-645e565ea171','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AM_TaskTemplates','module',90,0),('8e8f0086-886e-3ec4-e49c-645e5686c643','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Documents','module',90,0),('8f164aa1-aed8-093e-944f-645e56771b9b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Notes','module',90,0),('8f815bd5-0ab7-d550-6624-645e563e7af9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Prospects','module',90,0),('8fdc75b8-9607-83fd-b565-645e56ca6319','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Documents','module',90,0),('903606f0-0541-5c2e-3e4f-645e56ab1cc3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','SecurityGroups','module',90,0),('907190d0-de02-87b7-9b4e-645e56360e9f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Notes','module',90,0),('911d5c48-70d2-d2d2-2345-645e5681ea1b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Documents','module',90,0),('91c233cd-0dca-0ad3-de42-645e5675f9fd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Cases','module',89,0),('91ce7c07-8491-74d1-7537-645e56f0d324','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Prospects','module',90,0),('91d6016e-3c2d-f102-de7a-645e568af5b5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_Products','module',90,0),('91dbb9c6-4280-1390-f1b9-645e56268f08','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Notes','module',90,0),('92355797-ddb5-df39-dc83-645e56e76840','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Documents','module',90,0),('92a282e6-857e-e7ea-7e10-645e56aa9351','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','SecurityGroups','module',90,0),('92e72529-1f7a-600d-d7b6-645e56eb03ce','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Cases','module',90,0),('9336c4ba-7943-e8b2-4a9d-645e56fc7afe','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Notes','module',90,0),('935b9ecb-63de-b87c-7ca5-645e566c8d66','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Prospects','module',90,0),('93cc2bfa-6974-1e18-aee3-645e56e5d387','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Cases','module',90,0),('940b9273-665b-1150-8e68-645e564bb39c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','SecurityGroups','module',90,0),('94af5f83-66df-4a22-3924-645e5609dcc8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Cases','module',90,0),('94d58794-e27d-d35d-cf85-645e5639ea71','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Notes','module',90,0),('955b8b57-a41b-64c4-7d15-645e561ed583','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','SecurityGroups','module',90,0),('95ce79cf-4b74-c158-2b03-645e568f45d8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Cases','module',90,0),('963ff3f8-c4c7-fd69-ef6d-645e56588229','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Notes','module',90,0),('96950dfe-d0ed-6005-e2ea-645e56b405a6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Contacts','module',90,0),('96f4fa6a-6d75-31c1-f9ff-645e567b3700','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','SecurityGroups','module',90,0),('9721d337-053f-e03b-74d6-645e56258d33','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Cases','module',90,0),('97c62bef-7582-56b8-d95a-645e56842082','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Notes','module',90,0),('994d857e-69da-6f58-59fe-645e56778248','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Cases','module',90,0),('9b3fb4d5-994a-2867-a518-645e56cf9743','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Cases','module',90,0),('9b5d3fa4-0a23-addb-e14a-645e568bf29e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOP_Case_Events','module',89,0),('9d859864-9c29-c63b-b04e-645e56d6602b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOW_Processed','module',89,0),('9da92415-9fa9-bea8-2bc6-645e56bd9582','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOP_Case_Events','module',90,0),('9f9abf7b-7434-0113-6a75-645e563244b3','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOP_Case_Events','module',90,0),('9fc1d759-e2ea-1c0c-050c-645e56244b7c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOW_Processed','module',90,0),('a140ba10-5a84-0126-0ac2-645e56011b2f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOP_Case_Events','module',90,0),('a1d03597-31e4-cf3e-efa2-645e56bf740a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOW_Processed','module',90,0),('a3e38959-4a6e-3842-182d-645e5602adc1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOP_Case_Events','module',90,0),('a405d99f-b8f5-7b12-b055-645e560b548f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOW_Processed','module',90,0),('a47715e3-fba9-4165-d44e-645e56db03c4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','SurveyQuestionResponses','module',89,0),('a48c0cc7-4bdd-a259-85cf-645e56659e5b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','SurveyQuestionOptions','module',90,0),('a5a68374-c729-f1b6-3bda-645e5682a4b4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOW_Processed','module',90,0),('a5df02f0-d99b-18f3-909a-645e56b3fae6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','SurveyQuestionResponses','module',90,0),('a61b342d-76a8-b4ab-4c5d-645e5699c7e1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOP_Case_Events','module',90,0),('a69b03ff-2fa7-6b4c-3421-645e56e69ddc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Contacts','module',90,0),('a7009b17-7700-e2ba-141a-645e5622022e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','SurveyQuestionResponses','module',90,0),('a77e84d0-25db-ff68-74f7-645e56d8e650','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOW_Processed','module',90,0),('a7a7af8d-8b27-7320-6520-645e5632bd2d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOK_Knowledge_Base_Categories','module',89,0),('a7f0d95a-4403-d4e5-6b2a-645e560da404','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOP_Case_Events','module',90,0),('a858098a-0ed0-5762-c134-645e56bd522a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Calls','module',89,0),('a85aeb07-16f6-249e-7573-645e5604f01a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','OutboundEmailAccounts','module',89,0),('a87871c3-8def-265a-6787-645e56c52d1a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','SurveyQuestionResponses','module',90,0),('a8c00e5a-36cc-3ecf-2e49-645e56f2ef09','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOK_Knowledge_Base_Categories','module',90,0),('a92801ee-633d-9715-02c4-645e565f478a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOW_Processed','module',90,0),('a9449cd5-aa2f-7ec3-b323-645e56f37886','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_PDF_Templates','module',89,0),('a9dcaec9-e60c-dadb-ad47-645e56f9e7a4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOP_Case_Events','module',90,0),('a9ed1c82-0f8a-0c53-8ca9-645e568f998b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','SurveyQuestionResponses','module',90,0),('a9f16f70-abe9-fe9d-6ef6-645e56c2ef74','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOK_Knowledge_Base_Categories','module',90,0),('aa14f5de-d2a4-c7ea-f715-645e56ca89da','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Calls','module',90,0),('aa210e02-2e8d-11e5-4464-645e561275c5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Project','module',90,0),('aa4cee90-45db-af69-3364-645e56fa54e9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','OutboundEmailAccounts','module',90,0),('ab159af1-3ce8-4724-7e4f-645e56dee7e4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_PDF_Templates','module',90,0),('ab219433-2419-ec6a-e49b-645e5617e655','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOW_Processed','module',90,0),('abb874b7-8aff-94af-580f-645e564b193c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOK_Knowledge_Base_Categories','module',90,0),('ac20ab2e-0d1b-d90b-2992-645e56a8c506','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Calls','module',90,0),('ac5128fe-006f-7e61-c175-645e56bccdc9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','SurveyQuestionResponses','module',90,0),('ac813068-310a-5706-ed8f-645e560a5a82','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','EmailMarketing','module',89,0),('ac929cc8-af7c-9f79-93e2-645e56873458','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','OutboundEmailAccounts','module',90,0),('ad3fbd8b-388f-ff67-242d-645e562e7550','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOK_Knowledge_Base_Categories','module',90,0),('ad54e799-9b66-7632-701e-645e5613168c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_PDF_Templates','module',90,0),('adebdd50-7fe6-1588-d184-645e56f293a4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Calls','module',90,0),('ae739064-d2b3-252c-bf65-645e56a7f6d0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','EmailMarketing','module',90,0),('ae90a854-9168-56bd-94c9-645e56065968','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','OutboundEmailAccounts','module',90,0),('aeda8a94-1f25-02a7-13e4-645e56b2f433','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','SurveyQuestionResponses','module',90,0),('aeeccc1a-916c-70c2-7a9b-645e564deba0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOK_Knowledge_Base_Categories','module',90,0),('af0c0a2e-a808-1353-677a-645e56e4dc09','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_Products','module',90,0),('afac6138-04de-1754-6629-645e56b9663d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Calls','module',90,0),('afb6af99-6ac8-df3d-000d-645e5605fee1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_PDF_Templates','module',90,0),('b0472bd4-0438-cc0e-df92-645e5625f1da','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','EmailMarketing','module',90,0),('b0d47945-30a0-6174-f529-645e56571d77','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','OutboundEmailAccounts','module',90,0),('b1163f81-a250-cc49-651f-645e561ae7fc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','SurveyQuestionResponses','module',90,0),('b12dd640-3290-4cfd-be67-645e56179e6b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOK_Knowledge_Base_Categories','module',90,0),('b1defa14-5d10-f7b6-a44c-645e569af738','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Calls','module',90,0),('b277b61b-d0fa-d183-b12f-645e560ab6fe','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_PDF_Templates','module',90,0),('b2b81501-4fd6-fdb2-3cca-645e5698c8a0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','EmailMarketing','module',90,0),('b2bd79d0-f30a-4e71-8222-645e565f4600','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','OutboundEmailAccounts','module',90,0),('b2d4aa55-67dc-a6cb-b281-645e5640b1dd','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOK_Knowledge_Base_Categories','module',90,0),('b3e7a064-632c-cbae-a9d9-645e5659392c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Calls','module',90,0),('b4223c46-dd21-92bd-a303-645e56c36a42','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','EmailMarketing','module',90,0),('b48aab37-d0a7-c67c-e17a-645e56119b3c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','OutboundEmailAccounts','module',90,0),('b525858a-7c35-44c8-6b0f-645e56777153','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_PDF_Templates','module',90,0),('b59e61b7-a9aa-01c6-0e5e-645e56356e30','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Bugs','module',89,0),('b5c5d5be-c37c-2a9a-365f-645e56c7f07f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','EmailMarketing','module',90,0),('b5f2cdee-4c44-c0cb-7121-645e56c3eee0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Calls','module',90,0),('b60337c8-0e64-a62b-fb9d-645e5677c8c8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','OutboundEmailAccounts','module',90,0),('b76ca350-bd8c-a871-7502-645e56394c3c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Bugs','module',90,0),('b776836d-b22d-b806-f7c4-645e56bc63fc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_PDF_Templates','module',90,0),('b784c05f-84b5-a7d8-9bc9-645e56adc631','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','EmailMarketing','module',90,0),('b8cc6695-3bf3-53e1-631b-645e566e2d3f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Bugs','module',90,0),('b93addb6-b9d5-3f7e-d047-645e569dce9e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','EmailMarketing','module',90,0),('b99d9b37-b390-d1ce-751b-645e564abb7f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_PDF_Templates','module',90,0),('b9ee3a01-b3e6-a9b1-660c-645e567a37d5','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Bugs','module',90,0),('bb144e65-1faf-6c56-715e-645e56e6b1e8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Bugs','module',90,0),('bba2068a-8e0e-5919-b891-645e56d8042f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Contacts','module',90,0),('bbd9e879-4a94-369d-6c41-645e56707cd0','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','InboundEmail','module',89,0),('bc180a47-e14c-c236-cf75-645e568ee00e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','jjwg_Markers','module',90,0),('bc1c4711-6d79-cf12-fe2d-645e5691dca9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Bugs','module',90,0),('bc370120-d134-3bbe-8251-646389457760','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','access','f_Pricelist','module',89,0),('bd578575-03bc-1047-5643-645e560e14ab','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','InboundEmail','module',90,0),('bd644c31-a7bc-8fcc-e102-645e5689f68e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Bugs','module',90,0),('bec79337-013e-2878-5d3f-645e56497e12','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','InboundEmail','module',90,0),('becf217d-8a3a-ee65-28b1-645e56dd32fc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Bugs','module',90,0),('bffa4f10-b5ea-82e9-219f-645e56d3848c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','InboundEmail','module',90,0),('c05000dc-b59a-738e-47cb-645e563a3b10','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOR_Reports','module',90,0),('c0a38b6c-17ea-7a08-f5e2-645e565ebc8d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOP_Case_Updates','module',89,0),('c145a6fb-7784-e5f0-4d48-645e56486ab7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','InboundEmail','module',90,0),('c3763299-ed3e-a4f4-2f36-645e565e407e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','InboundEmail','module',90,0),('c39fa48d-5fb1-45ed-8a78-645e56449894','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOP_Case_Updates','module',90,0),('c59c95f3-3ad8-0585-6c35-645e56f1cef2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','InboundEmail','module',90,0),('c5bc6fc0-c3db-2e5d-150b-645e56c3310f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOP_Case_Updates','module',90,0),('c6cd03e5-5479-9082-41b9-645e56733c1a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','SurveyQuestionOptions','module',90,0),('c7519642-0c13-03ef-df71-645e5663174a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','InboundEmail','module',90,0),('c8f50b36-ad43-a4a5-9f3a-645e56778b37','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_Products','module',90,0),('ca2a9848-f455-9521-6429-645e5680b309','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','SurveyQuestions','module',89,0),('ca83ae63-895c-21fe-9328-645e56f761cc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOP_Case_Updates','module',90,0),('cab3dc73-a053-7af3-edb3-645e56df8c99','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','jjwg_Maps','module',89,0),('cc24c21c-b069-811e-8f07-645e56243285','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOP_Case_Updates','module',90,0),('ccb61cf9-6c9b-8306-8840-645e56ce7eb7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','jjwg_Maps','module',90,0),('cce2b9b8-2a69-46b9-5f11-645e5617c9ed','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','SurveyQuestions','module',90,0),('cd9bf209-0c3e-9427-6ac1-645e564a3a8d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOP_Case_Updates','module',90,0),('ce0b3100-6539-d0e5-7d11-645e56fedd22','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOS_Product_Categories','module',89,0),('ce43d929-ade0-2923-d701-645e56166e5f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','jjwg_Maps','module',90,0),('cf0ee43d-1808-bea8-9aca-645e56ca8570','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOP_Case_Updates','module',90,0),('cf4e723d-aaad-b1b9-63bc-645e567d3b73','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','SurveyQuestions','module',90,0),('cf9f4720-c26e-59d7-e3e0-645e567a071d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','ExternalOAuthConnection','module',89,0),('cfd8743f-61e4-c790-d7c5-645e5659765c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','jjwg_Maps','module',90,0),('cfeda23b-23c5-5c93-f190-645e564b62f6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Emails','module',89,0),('d02e9d5a-cf19-159d-e411-645e56e43110','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOK_KnowledgeBase','module',89,0),('d10a0fa5-4e82-4965-0316-645e561239d9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOS_Product_Categories','module',90,0),('d10a4f21-fc80-8395-7525-645e5688537b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOP_Case_Updates','module',90,0),('d16622f7-bc46-390d-15ae-645e56ae8556','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOK_KnowledgeBase','module',90,0),('d17570bb-d8e6-4e48-04bf-645e568abc3b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Emails','module',90,0),('d1c27085-02ef-a7c3-4c31-645e567ea647','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','ExternalOAuthConnection','module',90,0),('d1d92f03-1813-7238-c40d-645e56f8b8ac','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','jjwg_Maps','module',90,0),('d1ed1e4d-f78b-fbba-182e-645e5612bdd1','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','SurveyQuestions','module',90,0),('d2d2ddbc-7ebe-591f-d51b-645e56f22813','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOK_KnowledgeBase','module',90,0),('d30864fe-299b-e901-ca1c-645e56837503','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Emails','module',90,0),('d38f1dc1-b3d7-0636-b7e2-645e56a60f86','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOS_Product_Categories','module',90,0),('d3b72a97-aaac-a4aa-6f1f-645e5608197d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','SurveyQuestions','module',90,0),('d3d5ff91-f620-7759-4397-645e56c61d06','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOK_KnowledgeBase','module',90,0),('d3ec0cc9-11ea-6182-305e-645e565875ae','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','jjwg_Maps','module',90,0),('d3f22818-72ef-9dce-7cf7-645e56e0c4fa','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','ExternalOAuthConnection','module',90,0),('d46c0c61-4edc-f1c5-0821-645e56a85bf8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Project','module',90,0),('d4abb7d1-f58e-de24-3f44-645e56a90eb8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Emails','module',90,0),('d4ae4c22-3587-c3bf-fdea-645e56a16657','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOK_KnowledgeBase','module',90,0),('d56e09ad-1f6c-7ed3-8a95-645e561962f8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','jjwg_Maps','module',90,0),('d593e003-7fd1-ad07-c19d-645e5668bb73','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOK_KnowledgeBase','module',90,0),('d5bbcb12-3c00-f92b-1d20-645e56a51b36','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','SurveyQuestions','module',90,0),('d628eb8c-45e2-cf3d-e440-645e56a2dd86','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOS_Product_Categories','module',90,0),('d6374370-93dc-395c-e37a-645e56a77aaa','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Emails','module',90,0),('d6939ab9-b01d-be58-0ebd-645e5650a111','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','ExternalOAuthConnection','module',90,0),('d6f8a108-ab9e-be60-4c1a-645e56a27d10','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','jjwg_Maps','module',90,0),('d7b60622-06b0-1f18-3891-645e56e6c258','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Spots','module',89,0),('d7c2cc3a-552c-c51d-5f96-645e560d0ff2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Emails','module',90,0),('d7c906f3-c2eb-20a9-5b9b-645e56d3db2b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','SurveyQuestions','module',90,0),('d840708b-661d-67af-3272-645e565d1645','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_Product_Categories','module',90,0),('d84499b1-904b-7dd3-f08c-645e56033136','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOK_KnowledgeBase','module',90,0),('d8990099-7d3a-f9db-4699-646389db208e','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','view','f_Pricelist','module',90,0),('d8fac1db-4bfc-d617-8e40-645e56e77e67','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Users','module',89,0),('d9171f16-1409-7485-a532-645e5677146c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','ExternalOAuthConnection','module',90,0),('d92d6142-6c0c-e855-a291-646389132622','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','access','f_Orders','module',89,0),('d9c825ad-1602-b2af-f778-645e56ddd8f8','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOK_KnowledgeBase','module',90,0),('d9db48c4-1c70-8454-0d9f-645e56d3f07b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Emails','module',90,0),('da378d14-b83a-dfca-46cb-645e567cb81c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','SurveyQuestions','module',90,0),('da3e00b8-29f5-9dcf-13f9-645e56ef4b84','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Users','module',90,0),('da797c42-be20-f7eb-e980-645e5634880c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_Product_Categories','module',90,0),('daa3fffd-2d36-53a7-898f-645e56d3e7d6','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','ExternalOAuthConnection','module',90,0),('db26a3fa-4b6f-cfa8-6674-645e5691032e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Users','module',90,0),('db2a5fbf-09a9-18b6-be23-645e56ca484a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Emails','module',90,0),('dc2b4ddc-da53-cdfd-05ab-645e56bc2bba','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Users','module',90,0),('dc5dfa1b-40da-4931-1889-645e567f6a0c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','ExternalOAuthConnection','module',90,0),('dcd67b18-0298-6ce5-408a-646389dab03f','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','view','f_Orders','module',90,0),('dd167398-2cb3-bed2-bea0-645e56532041','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','Users','module',90,0),('dd88ccd3-61d5-1747-80d5-645e56cac727','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOS_Product_Categories','module',90,0),('ddcafaa1-4ac3-881f-81d0-645e56e86c81','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','ExternalOAuthConnection','module',90,0),('ddf53e35-754d-2001-44e9-645e56bb3bbc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','Users','module',90,0),('de850c24-00da-309a-9976-645e56497a3a','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','jjwg_Markers','module',90,0),('deb40dd9-2bb7-7c78-9f8b-645e5637853b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOS_Products','module',90,0),('debfa546-3575-32eb-7a56-6463898fa8b4','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','list','f_Orders','module',90,0),('df3171a2-bbdf-7b31-2b67-645e56c62e4b','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','Users','module',90,0),('e07c7725-967f-0dc3-f27a-645e5620c61d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','AOS_Product_Categories','module',90,0),('e0890555-172f-9f40-6c6f-645e56c8fd76','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Users','module',90,0),('e0d80bbc-801b-7d6b-f3fa-645e5653d2a9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','SurveyQuestionOptions','module',90,0),('e1106753-4da1-e681-a46c-6463895241d9','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','edit','f_Orders','module',90,0),('e4134a19-a0c3-33c6-2479-646389b60a7e','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','delete','f_Orders','module',90,0),('e5eda773-b7c0-affe-fc8f-64638917914d','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','import','f_Orders','module',90,0),('e9393944-d560-2721-68fc-64638926aa38','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','export','f_Orders','module',90,0),('ea144eee-2aad-bb37-2af8-645e56c3dfca','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','AOR_Reports','module',89,0),('ebac400a-e370-427c-7299-645e56edf81d','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','ExternalOAuthProvider','module',89,0),('ebf924a9-18df-20d1-06b2-645e56385d0c','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','AOR_Reports','module',90,0),('ed0336d6-267f-c059-d1a2-64638964ce7c','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','massupdate','f_Orders','module',90,0),('ed567a42-c0b4-16a2-665d-645e56c7f0b7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Meetings','module',89,0),('ed6aa13f-7b9e-568f-ebf3-645e56e3f52e','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','ExternalOAuthProvider','module',90,0),('ee40b080-06a4-2fdc-0eea-645e56ccdb93','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','AOR_Reports','module',90,0),('ef68649c-01a4-b937-e1ac-645e560a3fe2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','ExternalOAuthProvider','module',90,0),('efa31a8d-6c09-9de5-8891-645e5691a7eb','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Meetings','module',90,0),('efe069bb-24ef-805b-d530-645e563cec02','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','AOR_Reports','module',90,0),('f0180505-849a-384e-a9dc-645e56c4b012','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','massupdate','Project','module',90,0),('f150c23b-e15c-7e5a-1d47-645e56e0cc33','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','ExternalOAuthProvider','module',90,0),('f1874506-f46f-5db3-0ed3-645e56e41cc9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','AOR_Reports','module',90,0),('f18d08e9-ca64-f8a9-55d1-645e564e3c0f','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOS_Products','module',90,0),('f1c551cf-cb95-efc1-1849-645e56872dca','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','list','Meetings','module',90,0),('f24c2f0e-91dd-86de-0e34-645e567d4b26','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','Contacts','module',89,0),('f2c83b90-54ac-56a8-4bc8-645e56185cac','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','import','AOR_Reports','module',90,0),('f2fc69f3-51fd-4fb4-8797-645e56053880','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','access','jjwg_Markers','module',89,0),('f336e94f-5cc4-01c0-f2d4-645e56dc5099','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','delete','ExternalOAuthProvider','module',90,0),('f3c32e79-3375-a725-de82-645e56397c76','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','export','AOR_Reports','module',90,0),('f3e60844-95eb-539f-f9ec-645e56927352','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Contacts','module',90,0),('f3f85543-6f23-7aa5-9217-645e56f945f9','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','edit','Meetings','module',90,0),('f5c80998-4997-aee8-f5bd-6463890b9432','2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','list','f_Pricelist','module',90,0),('fbeb0c3e-26c6-a590-0a99-645e564a88de','2023-05-12 15:08:06','2023-05-12 15:08:06','1','','view','Spots','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_roles` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
INSERT INTO `acl_roles` VALUES ('9442f9e6-ad82-5d05-b410-646385bd5a31','2023-05-16 13:28:49','2023-05-16 13:28:49','1','1','Sales','',0),('99059629-c3c9-f60e-1886-6463848ed01a','2023-05-16 13:27:39','2023-05-16 13:27:39','1','1','Marketing','',0),('9e92646e-9a36-efb1-0031-646384eba694','2023-05-16 13:28:02','2023-05-16 13:28:02','1','1','Producers','',0),('c8d3aa12-e018-0d5f-bb4d-646384da0a66','2023-05-16 13:28:16','2023-05-16 13:28:16','1','1','C level','',0),('ca199c29-5be9-030c-06d5-6463859d0018','2023-05-16 13:28:36','2023-05-16 13:28:36','1','1','Sales mgr','',0);
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_override` int DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `bean` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bean_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_redirect` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reminder_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates`
--

DROP TABLE IF EXISTS `am_projecttemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_projecttemplates` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Draft',
  `priority` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates`
--

LOCK TABLES `am_projecttemplates` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_audit`
--

DROP TABLE IF EXISTS `am_projecttemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_audit`
--

LOCK TABLES `am_projecttemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contacts_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_contacts_1_c`
--

LOCK TABLES `am_projecttemplates_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_project_1_c`
--

LOCK TABLES `am_projecttemplates_project_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `users_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_users_1_c`
--

LOCK TABLES `am_projecttemplates_users_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates`
--

DROP TABLE IF EXISTS `am_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_tasktemplates` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Not Started',
  `priority` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'High',
  `percent_complete` int DEFAULT '0',
  `predecessors` int DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'FS',
  `task_number` int DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `estimated_effort` int DEFAULT NULL,
  `utilization` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '0',
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates`
--

LOCK TABLES `am_tasktemplates` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_am_projecttemplates_c`
--

LOCK TABLES `am_tasktemplates_am_projecttemplates_c` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_audit`
--

DROP TABLE IF EXISTS `am_tasktemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_audit`
--

LOCK TABLES `am_tasktemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aobh_businesshours`
--

DROP TABLE IF EXISTS `aobh_businesshours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aobh_businesshours` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `opening_hours` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '1',
  `closing_hours` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '1',
  `open_status` tinyint(1) DEFAULT NULL,
  `day` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aobh_businesshours`
--

LOCK TABLES `aobh_businesshours` WRITE;
/*!40000 ALTER TABLE `aobh_businesshours` DISABLE KEYS */;
/*!40000 ALTER TABLE `aobh_businesshours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index`
--

DROP TABLE IF EXISTS `aod_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aod_index` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index`
--

LOCK TABLES `aod_index` WRITE;
/*!40000 ALTER TABLE `aod_index` DISABLE KEYS */;
INSERT INTO `aod_index` VALUES ('1','Index','2023-05-12 15:09:53','2023-05-12 15:09:53','1','1',NULL,0,NULL,NULL,'modules/AOD_Index/Index/Index');
/*!40000 ALTER TABLE `aod_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index_audit`
--

DROP TABLE IF EXISTS `aod_index_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aod_index_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index_audit`
--

LOCK TABLES `aod_index_audit` WRITE;
/*!40000 ALTER TABLE `aod_index_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_index_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent`
--

DROP TABLE IF EXISTS `aod_indexevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aod_indexevent` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `error` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `record_module` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent`
--

LOCK TABLES `aod_indexevent` WRITE;
/*!40000 ALTER TABLE `aod_indexevent` DISABLE KEYS */;
INSERT INTO `aod_indexevent` VALUES ('153b2de2-86ec-e382-2e1a-6463be1580f5','test','2023-05-16 17:34:48','2023-05-16 17:35:21','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'',NULL,1,'72fe0258-5f74-744a-9b3d-6463bef8c04b','Tasks'),('6605885e-e01a-849e-6b8e-6463ac674c25','Send notification when user change status on tasks','2023-05-16 16:18:57','2023-05-16 17:33:56','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'',NULL,1,'6128a86c-f21c-1fe5-5606-6463ac49ffab','AOW_WorkFlow'),('7f62cd0e-2f64-97b5-edf1-6463a833a73b','[1.2] Email notification on user assignment to tasks','2023-05-16 15:59:45','2023-05-16 17:34:11','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'',NULL,1,'713af385-8bf3-b273-e6c1-6463a835d3ca','AOW_WorkFlow');
/*!40000 ALTER TABLE `aod_indexevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent_audit`
--

DROP TABLE IF EXISTS `aod_indexevent_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent_audit`
--

LOCK TABLES `aod_indexevent_audit` WRITE;
/*!40000 ALTER TABLE `aod_indexevent_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories`
--

LOCK TABLES `aok_knowledge_base_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories_audit`
--

LOCK TABLES `aok_knowledge_base_categories_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase`
--

DROP TABLE IF EXISTS `aok_knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aok_knowledgebase` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Draft',
  `revision` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `additional_info` text COLLATE utf8mb4_general_ci,
  `user_id_c` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id1_c` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase`
--

LOCK TABLES `aok_knowledgebase` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_audit`
--

DROP TABLE IF EXISTS `aok_knowledgebase_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_audit`
--

LOCK TABLES `aok_knowledgebase_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_categories`
--

DROP TABLE IF EXISTS `aok_knowledgebase_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_categories`
--

LOCK TABLES `aok_knowledgebase_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events`
--

DROP TABLE IF EXISTS `aop_case_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aop_case_events` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events`
--

LOCK TABLES `aop_case_events` WRITE;
/*!40000 ALTER TABLE `aop_case_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events_audit`
--

DROP TABLE IF EXISTS `aop_case_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events_audit`
--

LOCK TABLES `aop_case_events_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates`
--

DROP TABLE IF EXISTS `aop_case_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aop_case_updates` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates`
--

LOCK TABLES `aop_case_updates` WRITE;
/*!40000 ALTER TABLE `aop_case_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates_audit`
--

DROP TABLE IF EXISTS `aop_case_updates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates_audit`
--

LOCK TABLES `aop_case_updates_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_updates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_charts`
--

DROP TABLE IF EXISTS `aor_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_charts` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `x_field` int DEFAULT NULL,
  `y_field` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_charts`
--

LOCK TABLES `aor_charts` WRITE;
/*!40000 ALTER TABLE `aor_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_conditions`
--

DROP TABLE IF EXISTS `aor_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_conditions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_order` int DEFAULT NULL,
  `logic_op` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parenthesis` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module_path` longtext COLLATE utf8mb4_general_ci,
  `field` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `operator` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_conditions`
--

LOCK TABLES `aor_conditions` WRITE;
/*!40000 ALTER TABLE `aor_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_fields`
--

DROP TABLE IF EXISTS `aor_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_fields` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_order` int DEFAULT NULL,
  `module_path` longtext COLLATE utf8mb4_general_ci,
  `field` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_function` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort_order` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_display` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_fields`
--

LOCK TABLES `aor_fields` WRITE;
/*!40000 ALTER TABLE `aor_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports`
--

DROP TABLE IF EXISTS `aor_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_reports` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `report_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `graphs_per_row` int DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports`
--

LOCK TABLES `aor_reports` WRITE;
/*!40000 ALTER TABLE `aor_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports_audit`
--

DROP TABLE IF EXISTS `aor_reports_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports_audit`
--

LOCK TABLES `aor_reports_audit` WRITE;
/*!40000 ALTER TABLE `aor_reports_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_scheduled_reports`
--

DROP TABLE IF EXISTS `aor_scheduled_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_recipients` longtext COLLATE utf8mb4_general_ci,
  `aor_report_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_scheduled_reports`
--

LOCK TABLES `aor_scheduled_reports` WRITE;
/*!40000 ALTER TABLE `aor_scheduled_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_scheduled_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts`
--

DROP TABLE IF EXISTS `aos_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_contracts` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reference_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Type',
  `contract_account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `call_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts`
--

LOCK TABLES `aos_contracts` WRITE;
/*!40000 ALTER TABLE `aos_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_audit`
--

DROP TABLE IF EXISTS `aos_contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_audit`
--

LOCK TABLES `aos_contracts_audit` WRITE;
/*!40000 ALTER TABLE `aos_contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_documents`
--

DROP TABLE IF EXISTS `aos_contracts_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `documents_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_revision_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_documents`
--

LOCK TABLES `aos_contracts_documents` WRITE;
/*!40000 ALTER TABLE `aos_contracts_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices`
--

DROP TABLE IF EXISTS `aos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_invoices` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` int NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quote_number` int DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `template_ddown_c` text COLLATE utf8mb4_general_ci,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices`
--

LOCK TABLES `aos_invoices` WRITE;
/*!40000 ALTER TABLE `aos_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices_audit`
--

DROP TABLE IF EXISTS `aos_invoices_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices_audit`
--

LOCK TABLES `aos_invoices_audit` WRITE;
/*!40000 ALTER TABLE `aos_invoices_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups`
--

DROP TABLE IF EXISTS `aos_line_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number` int DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups`
--

LOCK TABLES `aos_line_item_groups` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups_audit`
--

DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups_audit`
--

LOCK TABLES `aos_line_item_groups_audit` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates`
--

DROP TABLE IF EXISTS `aos_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pdfheader` longtext COLLATE utf8mb4_general_ci,
  `pdffooter` longtext COLLATE utf8mb4_general_ci,
  `margin_left` int DEFAULT '15',
  `margin_right` int DEFAULT '15',
  `margin_top` int DEFAULT '16',
  `margin_bottom` int DEFAULT '16',
  `margin_header` int DEFAULT '9',
  `margin_footer` int DEFAULT '9',
  `page_size` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `orientation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates`
--

LOCK TABLES `aos_pdf_templates` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates_audit`
--

DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates_audit`
--

LOCK TABLES `aos_pdf_templates_audit` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories`
--

DROP TABLE IF EXISTS `aos_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_product_categories` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories`
--

LOCK TABLES `aos_product_categories` WRITE;
/*!40000 ALTER TABLE `aos_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories_audit`
--

DROP TABLE IF EXISTS `aos_product_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories_audit`
--

LOCK TABLES `aos_product_categories_audit` WRITE;
/*!40000 ALTER TABLE `aos_product_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products`
--

DROP TABLE IF EXISTS `aos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_products` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `maincode` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'XXXX',
  `part_number` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aos_product_category_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products`
--

LOCK TABLES `aos_products` WRITE;
/*!40000 ALTER TABLE `aos_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_audit`
--

DROP TABLE IF EXISTS `aos_products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_products_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_audit`
--

LOCK TABLES `aos_products_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes`
--

DROP TABLE IF EXISTS `aos_products_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` text COLLATE utf8mb4_general_ci,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `part_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_description` text COLLATE utf8mb4_general_ci,
  `number` int DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '5.0',
  `parent_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes`
--

LOCK TABLES `aos_products_quotes` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes_audit`
--

DROP TABLE IF EXISTS `aos_products_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes_audit`
--

LOCK TABLES `aos_products_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes`
--

DROP TABLE IF EXISTS `aos_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_quotes` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approval_issue` text COLLATE utf8mb4_general_ci,
  `billing_account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `billing_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int DEFAULT NULL,
  `opportunity_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `template_ddown_c` text COLLATE utf8mb4_general_ci,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stage` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Draft',
  `term` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `terms_c` text COLLATE utf8mb4_general_ci,
  `approval_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoice_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes`
--

LOCK TABLES `aos_quotes` WRITE;
/*!40000 ALTER TABLE `aos_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_aos_invoices_c`
--

LOCK TABLES `aos_quotes_aos_invoices_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_audit`
--

DROP TABLE IF EXISTS `aos_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_audit`
--

LOCK TABLES `aos_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_os_contracts_c`
--

LOCK TABLES `aos_quotes_os_contracts_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_project_c`
--

DROP TABLE IF EXISTS `aos_quotes_project_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_project_c`
--

LOCK TABLES `aos_quotes_project_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_project_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_project_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_actions`
--

DROP TABLE IF EXISTS `aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_actions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action_order` int DEFAULT NULL,
  `action` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_actions`
--

LOCK TABLES `aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_actions` DISABLE KEYS */;
INSERT INTO `aow_actions` VALUES ('6cd49b2f-65fe-0dad-46fd-6463aca91528','test: notification on changed','2023-05-16 16:18:57','2023-05-16 17:33:56','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'6128a86c-f21c-1fe5-5606-6463ac49ffab',1,'SendEmail','YTo1OntzOjE2OiJpbmRpdmlkdWFsX2VtYWlsIjtzOjE6IjAiO3M6MTQ6ImVtYWlsX3RlbXBsYXRlIjtzOjM2OiI1YjFlMWJmZi1hOTY0LWVjYTItZTk4Yy02NDYzYTk5NWY5YjAiO3M6MTM6ImVtYWlsX3RvX3R5cGUiO2E6MTp7aTowO3M6MjoidG8iO31zOjE3OiJlbWFpbF90YXJnZXRfdHlwZSI7YToxOntpOjA7czoxMzoiUmVsYXRlZCBGaWVsZCI7fXM6NToiZW1haWwiO2E6MTp7aTowO3M6MTU6ImNyZWF0ZWRfYnlfbmFtZSI7fX0='),('8946fbd5-0383-764d-a0c8-6463a81dc73a','test: notification on assignment','2023-05-16 15:59:45','2023-05-16 17:34:11','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'713af385-8bf3-b273-e6c1-6463a835d3ca',1,'SendEmail','YTo1OntzOjE2OiJpbmRpdmlkdWFsX2VtYWlsIjtzOjE6IjAiO3M6MTQ6ImVtYWlsX3RlbXBsYXRlIjtzOjM2OiI1MWFkMGNlNS01NDJmLTZhMmUtNmEzMy02NDYzYTkwYTU3MGUiO3M6MTM6ImVtYWlsX3RvX3R5cGUiO2E6MTp7aTowO3M6MjoidG8iO31zOjE3OiJlbWFpbF90YXJnZXRfdHlwZSI7YToxOntpOjA7czoxMzoiUmVsYXRlZCBGaWVsZCI7fXM6NToiZW1haWwiO2E6MTp7aTowO3M6MTg6ImFzc2lnbmVkX3VzZXJfbmFtZSI7fX0=');
/*!40000 ALTER TABLE `aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_conditions`
--

DROP TABLE IF EXISTS `aow_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_conditions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition_order` int DEFAULT NULL,
  `module_path` longtext COLLATE utf8mb4_general_ci,
  `field` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `operator` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_conditions`
--

LOCK TABLES `aow_conditions` WRITE;
/*!40000 ALTER TABLE `aow_conditions` DISABLE KEYS */;
INSERT INTO `aow_conditions` VALUES ('699fb813-817a-55b0-bb66-6463ac5858eb','','2023-05-16 16:18:57','2023-05-16 17:33:56','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'6128a86c-f21c-1fe5-5606-6463ac49ffab',1,'YToxOntpOjA7czo1OiJUYXNrcyI7fQ==','status','Equal_To','Multi','^Accepted^,^Completed^,^Rejected^'),('8361ab2c-475e-d9a2-7365-6463a8fc7e66','','2023-05-16 15:59:45','2023-05-16 17:34:11','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'713af385-8bf3-b273-e6c1-6463a835d3ca',1,'YToxOntpOjA7czo1OiJUYXNrcyI7fQ==','assigned_user_name','Equal_To','Any_Change',NULL);
/*!40000 ALTER TABLE `aow_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed`
--

DROP TABLE IF EXISTS `aow_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_processed` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed`
--

LOCK TABLES `aow_processed` WRITE;
/*!40000 ALTER TABLE `aow_processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed_aow_actions`
--

DROP TABLE IF EXISTS `aow_processed_aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `aow_processed_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aow_action_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(36) COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed_aow_actions`
--

LOCK TABLES `aow_processed_aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_processed_aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed_aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow`
--

DROP TABLE IF EXISTS `aow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_workflow` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flow_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flow_run_on` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '0',
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `run_when` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT '0',
  `run_on_import` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow`
--

LOCK TABLES `aow_workflow` WRITE;
/*!40000 ALTER TABLE `aow_workflow` DISABLE KEYS */;
INSERT INTO `aow_workflow` VALUES ('6128a86c-f21c-1fe5-5606-6463ac49ffab','Send notification when user change status on tasks','2023-05-16 16:18:57','2023-05-16 17:33:56','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','Send notification when user change status on tasks ',0,'1cfb5d64-05b5-0167-275e-64637d811e9d','Tasks','All_Records','Inactive','On_Save',0,0),('713af385-8bf3-b273-e6c1-6463a835d3ca','[1.2] Email notification on user assignment to tasks','2023-05-16 15:59:45','2023-05-16 17:34:11','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'1cfb5d64-05b5-0167-275e-64637d811e9d','Tasks','All_Records','Inactive','On_Save',1,0);
/*!40000 ALTER TABLE `aow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow_audit`
--

DROP TABLE IF EXISTS `aow_workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow_audit`
--

LOCK TABLES `aow_workflow_audit` WRITE;
/*!40000 ALTER TABLE `aow_workflow_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugs` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_number` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resolution` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `work_log` text COLLATE utf8mb4_general_ci,
  `found_in_release` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fixed_in_release` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration_hours` int DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Planned',
  `direction` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reminder_time` int DEFAULT '-1',
  `email_reminder_time` int DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repeat_type` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repeat_interval` int DEFAULT '1',
  `repeat_dow` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int DEFAULT NULL,
  `repeat_parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recurring_source` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `call_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `call_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule`
--

DROP TABLE IF EXISTS `calls_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls_reschedule` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reason` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `call_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule`
--

LOCK TABLES `calls_reschedule` WRITE;
/*!40000 ALTER TABLE `calls_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule_audit`
--

DROP TABLE IF EXISTS `calls_reschedule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule_audit`
--

LOCK TABLES `calls_reschedule_audit` WRITE;
/*!40000 ALTER TABLE `calls_reschedule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `call_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_log` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target_tracker_key` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activity_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int DEFAULT '0',
  `list_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marketing_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `tracker_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tracker_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'http://',
  `tracker_key` int NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tracker_key` int NOT NULL AUTO_INCREMENT,
  `tracker_count` int DEFAULT '0',
  `refer_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'http://',
  `tracker_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `impressions` int DEFAULT '0',
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `objective` text COLLATE utf8mb4_general_ci,
  `content` text COLLATE utf8mb4_general_ci,
  `frequency` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `survey_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`),
  KEY `idx_survey_id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_number` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resolution` text COLLATE utf8mb4_general_ci,
  `work_log` text COLLATE utf8mb4_general_ci,
  `account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Open',
  `contact_created_by_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_cstm`
--

DROP TABLE IF EXISTS `cases_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_cstm`
--

LOCK TABLES `cases_cstm` WRITE;
/*!40000 ALTER TABLE `cases_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `category` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_general_ci,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','crm@flavorhub.pl'),('notify','fromname','SuiteCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.25'),('MySettings','tab','YTozNTp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6MTA6IkFPU19RdW90ZXMiO3M6MTA6IkFPU19RdW90ZXMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjU6IlNwb3RzIjtzOjU6IlNwb3RzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6MTI6IkFPU19JbnZvaWNlcyI7czoxMjoiQU9TX0ludm9pY2VzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjU6IkNhc2VzIjtzOjU6IkNhc2VzIjtzOjk6IlByb3NwZWN0cyI7czo5OiJQcm9zcGVjdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6NzoiUHJvamVjdCI7czo3OiJQcm9qZWN0IjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjk6IkZQX2V2ZW50cyI7czo5OiJGUF9ldmVudHMiO3M6MTg6IkZQX0V2ZW50X0xvY2F0aW9ucyI7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoxNzoiQU9TX1BERl9UZW1wbGF0ZXMiO3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtzOjExOiJBT1JfUmVwb3J0cyI7czoxMToiQU9SX1JlcG9ydHMiO3M6MTc6IkFPS19Lbm93bGVkZ2VCYXNlIjtzOjE3OiJBT0tfS25vd2xlZGdlQmFzZSI7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO3M6Mjk6IkFPS19Lbm93bGVkZ2VfQmFzZV9DYXRlZ29yaWVzIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7czoxNDoiRW1haWxUZW1wbGF0ZXMiO3M6NzoiU3VydmV5cyI7czo3OiJTdXJ2ZXlzIjtzOjg6ImZfT3JkZXJzIjtzOjg6ImZfT3JkZXJzIjtzOjExOiJmX1ByaWNlbGlzdCI7czoxMToiZl9QcmljZWxpc3QiO3M6MTE6ImZfQ3VzdG9tZXJzIjtzOjExOiJmX0N1c3RvbWVycyI7fQ=='),('portal','on','0'),('tracker','Tracker','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Opportunities','1'),('Update','CheckUpdates','manual'),('system','name','SuiteCRM'),('system','adminwizard','1'),('notify','allow_default_outbound','0'),('proxy','on','0'),('proxy','host',''),('proxy','port',''),('proxy','auth','0'),('proxy','username',''),('proxy','password','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_mobile` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_work` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_other` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lawful_basis` text COLLATE utf8mb4_general_ci,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_source` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reports_to_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `joomla_account_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_role` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_role` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `bean_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iso4217` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES ('32f6b6af-e6f3-357e-c546-646387db5561','Polish zł','zł','PLN',1,'Active',0,'2023-05-16 13:38:37','2023-05-16 13:38:37','1cfb5d64-05b5-0167-275e-64637d811e9d'),('d5a10887-17b4-3209-bca8-646387c5a162','EURO','€','EUR',1.09226,'Active',0,'2023-05-16 13:39:18','2023-05-16 13:39:18','1cfb5d64-05b5-0167-275e-64637d811e9d'),('ed85bec6-3712-da8e-bbd3-64638797d688','Polish PLN','zł','PLN',0.2336,'Active',0,'2023-05-16 13:39:54','2023-05-16 13:39:54','1cfb5d64-05b5-0167-275e-64637d811e9d');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `set_num` int DEFAULT '0',
  `field0` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field3` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field4` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field5` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field6` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field7` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field8` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field9` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `change_log` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_ext` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_mime_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `revision` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doc_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Sugar',
  `doc_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subcategory_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_revision_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_doc_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_doc_rev_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bug_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `case_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eapm` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `application` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'webex',
  `api_data` text COLLATE utf8mb4_general_ci,
  `consumer_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oauth_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oauth_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `bean_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `bean_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('1f1eaaca-4b7d-f019-35c5-64637db94eae','1f82e9da-aaaf-845b-12fc-64637db2cee3','1cfb5d64-05b5-0167-275e-64637d811e9d','Users',1,0,'2023-05-16 12:55:00','2023-05-16 12:55:00',0),('3b3c4bf9-8d94-f11d-8086-64639ee673d8','3ba4f072-f25e-a80e-a63c-64639ede497c','37f516c7-8bab-bd9f-b1f9-64639e43000e','Users',1,0,'2023-05-16 15:19:17','2023-05-16 15:19:17',0),('a9f64734-5c82-65c0-4d6a-64637cfbb7d3','aa2a9926-d6c6-7279-3bf6-64637c504283','a9073e6e-08a7-f63b-2e4e-64637c6dc2d0','Users',1,0,'2023-05-16 12:54:12','2023-05-16 12:54:12',0),('affd722a-f885-1fa2-3fdd-6463994ac92a','b03039ec-b235-7e70-7a42-646399518642','ae816cc0-77b4-1967-ec23-646399769bfc','Users',1,0,'2023-05-16 14:54:07','2023-05-16 14:54:07',0),('c0dc9899-0413-a580-1558-64639a821280','1f82e9da-aaaf-845b-12fc-64637db2cee3','bf6995cc-1a50-0a14-f507-64639aac50fd','Users',1,0,'2023-05-16 14:58:39','2023-05-16 14:58:39',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addresses` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_address_caps` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `confirm_opt_in` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('1f82e9da-aaaf-845b-12fc-64637db2cee3','tung.brodi@gmail.com','TUNG.BRODI@GMAIL.COM',0,0,'not-opt-in',NULL,NULL,NULL,NULL,'2023-05-16 12:55:00','2023-05-16 12:55:00',0),('3ba4f072-f25e-a80e-a63c-64639ede497c','cs@flavorhub.pl','CS@FLAVORHUB.PL',0,0,'not-opt-in',NULL,NULL,NULL,NULL,'2023-05-16 15:19:17','2023-05-16 15:19:17',0),('aa2a9926-d6c6-7279-3bf6-64637c504283','constantineck83@gmail.com','CONSTANTINECK83@GMAIL.COM',0,0,'not-opt-in',NULL,NULL,NULL,NULL,'2023-05-16 12:54:12','2023-05-16 12:54:12',0),('b03039ec-b235-7e70-7a42-646399518642','flavorhub.pl@gmail.com','FLAVORHUB.PL@GMAIL.COM',0,0,'not-opt-in',NULL,NULL,NULL,NULL,'2023-05-16 14:54:07','2023-05-16 14:54:07',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses_audit`
--

DROP TABLE IF EXISTS `email_addresses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addresses_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_email_addresses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses_audit`
--

LOCK TABLES `email_addresses_audit` WRITE;
/*!40000 ALTER TABLE `email_addresses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_addresses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mbox` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fromaddr` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `toaddr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mailsize` int unsigned DEFAULT NULL,
  `imap_uid` int unsigned DEFAULT NULL,
  `msgno` int unsigned DEFAULT NULL,
  `recent` tinyint DEFAULT NULL,
  `flagged` tinyint DEFAULT NULL,
  `answered` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `seen` tinyint DEFAULT NULL,
  `draft` tinyint DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_marketing` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_addr` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_to_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_to_addr` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inbound_email_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `outbound_email_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `prospect_list_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_marketing_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `published` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `subject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_general_ci,
  `body_html` longtext COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('300c2868-52a7-e842-b63d-645e568e9ffc','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Case Closure','Template for informing a contact that their case has been closed.','$acase_name [CASE:$acase_case_number] closed','Hi $contact_first_name $contact_last_name,\n\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\n					   Status:				$acase_status\n					   Reference:			$acase_case_number\n					   Resolution:			$acase_resolution','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\n					    <table border=\"0\"><tbody>\n					    <tr><td>Status</td><td>$acase_status</td></tr>\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\n					    <tr><td>Resolution</td><td>$acase_resolution</td></tr>\n					    </tbody></table>',0,NULL,NULL,'system'),('3264e0a4-2543-2f60-5284-645e561a6f52','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Joomla Account Creation','Template used when informing a contact that they\'ve been given an account on the joomla portal.','Support Portal Account Created','Hi $contact_name,\n					   An account has been created for you at $portal_address.\n					   You may login using this email address and the password $joomla_pass','<p>Hi $contact_name,</p>\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\n					    <p>You may login using this email address and the password $joomla_pass</p>',0,NULL,NULL,'system'),('33d456d0-f2eb-cb36-5a1c-645e56ce0709','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Case Creation','Template to send to a contact when a case is received from them.','$acase_name [CASE:$acase_case_number]','Hi $contact_first_name $contact_last_name,\n\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\n					   Status:		$acase_status\n					   Reference:	$acase_case_number\n					   Description:	$acase_description','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\n					    <table border=\"0\"><tbody>\n					    <tr><td>Status</td><td>$acase_status</td></tr>\n					    <tr><td>Reference</td><td>$acase_case_number</td></tr>\n					    <tr><td>Description</td><td>$acase_description</td></tr>\n					    </tbody></table>',0,NULL,NULL,'system'),('3795769a-e209-a5a0-546c-645e56f434d7','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Contact Case Update','Template to send to a contact when their case is updated.','$acase_name update [CASE:$acase_case_number]','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description','<p>Hi $contact_first_name $contact_last_name,</p>\n					    <p> </p>\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>',0,NULL,NULL,'system'),('39212e56-e55f-8873-97f3-645e5606d0c2','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','User Case Update','Email template to send to a SuiteCRM user when their case is updated.','$acase_name (# $acase_case_number) update','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description\n                        You may review this Case at:\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;','<p>Hi $user_first_name $user_last_name,</p>\n					     <p> </p>\n					     <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					     <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\n					     <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\n					     <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>',0,NULL,NULL,'system'),('4094f1f5-c3f8-22f1-2799-645e56ce1c33','2013-05-24 14:31:45','2023-05-12 15:08:06','1','1','off','Event Invite Template','Default event invite template.','You have been invited to $fp_events_name','Dear $contact_name,\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\n$fp_events_description\nYours Sincerely,\n','\n<p>Dear $contact_name,</p>\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\n<p>$fp_events_description</p>\n<p>If you would like to accept this invititation please click accept.</p>\n<p> $fp_events_link or $fp_events_link_declined</p>\n<p>Yours Sincerely,</p>\n',0,NULL,NULL,'system'),('51ad0ce5-542f-6a2e-6a33-6463a90a570e','2023-05-16 16:03:04','2023-05-16 16:06:18','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','off','Email notification on user assignment to tasks','Email notification on user assignment to tasks','Task assigned for you','Hi, $task_assigned_user_name\n\nThe task assigned to you [Assigned task](/index.php?action=DetailView&module=Tasks&record=$task_id)','<div class=\"mozaik-inner\" style=\"max-width:600px;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px 30px;margin:0px auto;width:600px;background-color:rgb(250,250,250);\"><h2 style=\"font-family:Arial, Helvetica, sans-serif;font-size:18px;line-height:28.8px;color:#444444;padding:0px;margin:0px;\">Hi, $task_assigned_user_name</h2><p style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;\">The task assigned to you <a style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px auto;\" href=\"$sugarurl/index.php?action=DetailView&module=Tasks&record=$task_id\">Assigned task</a></p><div class=\"mozaik-clear\" style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px;height:0px;\"><br style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px auto;\" /></div></div>',0,'1cfb5d64-05b5-0167-275e-64637d811e9d',0,'email'),('5b1e1bff-a964-eca2-e98c-6463a995f9b0','2023-05-16 16:05:00','2023-05-16 16:05:00','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','off','Task status changed','Template to send to a user when a status of task is changed.','Status of task is changed!','','<div class=\"mozaik-inner\" style=\"max-width:600px;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px 30px;margin:0px auto;width:600px;background-color:rgb(250,250,250);\"><p style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;\">Hi $task_created_by_name,</p><p style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;\">Status of task is changed!</p><p style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;\">You may review this Task at: <a style=\"font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px auto;\" href=\"$sugarurl/index.php?action=DetailView&module=Tasks&record=$task_id\">task link</a></p></div>',0,'1cfb5d64-05b5-0167-275e-64637d811e9d',0,'email'),('e6df037b-16b1-309e-7e92-645e56e2de24','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('e9b03d8e-4589-0980-4c9e-645e560bd881','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('ebfc1a20-99de-6206-4d5e-645e5667d8a4','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Two Factor Authentication email','This template is used to send a user a code for Two Factor Authentication.','Two Factor Authentication Code','Two Factor Authentication code is $code.','<div><table width=\"550\"><tbody><tr><td><p>Two Factor Authentication code is <b>$code</b>.</p>  </td>         </tr><tr><td></td>         </tr> </tbody></table> </div>',0,NULL,0,'system'),('f0f224da-27ea-113a-5567-645e565fe6eb','2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','off','Confirmed Opt In','Email template to send to a contact to confirm they have opted in.','Confirm Opt In','Hi $contact_first_name $contact_last_name, \\n Please confirm that you have opted in by selecting the following link: $sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_email_address','<p>Hi $contact_first_name $contact_last_name,</p>\n             <p>\n                Please confirm that you have opted in by selecting the following link:\n                <a href=\"$sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_confirm_opt_in_token\">Opt In</a>\n             </p>',0,NULL,NULL,'system');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marketing_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `list_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_confirm_opt_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent_received` datetime DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'pick',
  `mailbox_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  KEY `idx_email_cat` (`category_id`),
  KEY `idx_email_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails_beans` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `email_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bean_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bean_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_data` text COLLATE utf8mb4_general_ci,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `email_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `address_type` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_address_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `from_addr` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_to_addr` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `to_addrs` text COLLATE utf8mb4_general_ci,
  `cc_addrs` text COLLATE utf8mb4_general_ci,
  `bcc_addrs` text COLLATE utf8mb4_general_ci,
  `description` longtext COLLATE utf8mb4_general_ci,
  `description_html` longtext COLLATE utf8mb4_general_ci,
  `raw_source` longtext COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_oauth_connections`
--

DROP TABLE IF EXISTS `external_oauth_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_oauth_connections` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_type` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expires_in` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_general_ci,
  `refresh_token` text COLLATE utf8mb4_general_ci,
  `external_oauth_provider_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_oauth_connections`
--

LOCK TABLES `external_oauth_connections` WRITE;
/*!40000 ALTER TABLE `external_oauth_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_oauth_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_oauth_providers`
--

DROP TABLE IF EXISTS `external_oauth_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_oauth_providers` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connector` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scope` text COLLATE utf8mb4_general_ci,
  `url_authorize` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorize_url_options` text COLLATE utf8mb4_general_ci,
  `url_access_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `extra_provider_params` text COLLATE utf8mb4_general_ci,
  `get_token_request_grant` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'authorization_code',
  `get_token_request_options` text COLLATE utf8mb4_general_ci,
  `refresh_token_request_grant` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'refresh_token',
  `refresh_token_request_options` text COLLATE utf8mb4_general_ci,
  `access_token_mapping` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'access_token',
  `expires_in_mapping` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'expires_in',
  `refresh_token_mapping` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'refresh_token',
  `token_type_mapping` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_oauth_providers`
--

LOCK TABLES `external_oauth_providers` WRITE;
/*!40000 ALTER TABLE `external_oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_oauth_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_customers`
--

DROP TABLE IF EXISTS `f_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_customers` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_mobile` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_work` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_other` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lawful_basis` text COLLATE utf8mb4_general_ci,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_customers`
--

LOCK TABLES `f_customers` WRITE;
/*!40000 ALTER TABLE `f_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_customers_audit`
--

DROP TABLE IF EXISTS `f_customers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_customers_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_f_customers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_customers_audit`
--

LOCK TABLES `f_customers_audit` WRITE;
/*!40000 ALTER TABLE `f_customers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_customers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_orders`
--

DROP TABLE IF EXISTS `f_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_orders` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_orders`
--

LOCK TABLES `f_orders` WRITE;
/*!40000 ALTER TABLE `f_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_orders_audit`
--

DROP TABLE IF EXISTS `f_orders_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_orders_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_f_orders_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_orders_audit`
--

LOCK TABLES `f_orders_audit` WRITE;
/*!40000 ALTER TABLE `f_orders_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_orders_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_pricelist`
--

DROP TABLE IF EXISTS `f_pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_pricelist` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_pricelist`
--

LOCK TABLES `f_pricelist` WRITE;
/*!40000 ALTER TABLE `f_pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_pricelist_audit`
--

DROP TABLE IF EXISTS `f_pricelist_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_pricelist_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_f_pricelist_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_pricelist_audit`
--

LOCK TABLES `f_pricelist_audit` WRITE;
/*!40000 ALTER TABLE `f_pricelist_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_pricelist_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `help` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `custom_module` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `len` int DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ext2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ext3` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ext4` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Accounts','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Accounts','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Accounts','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Accountsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Accounts','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Cases','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Cases','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Cases','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Cases','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Contacts','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Contacts','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Contacts','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Contacts','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Leads','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Leads','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Leads','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Leads','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Meetings','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Meetings','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Meetings','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Meetings','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Opportunities','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Opportunities','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Opportunities','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Opportunities','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Project','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Project','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Project','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Project','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Prospects','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Prospects','varchar',255,0,NULL,'2023-05-12 15:08:06',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Prospects','float',10,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Prospects','float',11,0,'0.00000000','2023-05-12 15:08:06',0,0,0,0,1,'true','8','','','');
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `folder_type` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_folder` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text COLLATE utf8mb4_general_ci,
  `assign_to_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `modified_by` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders_rel` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `folder_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `polymorphic_module` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `polymorphic_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `folder_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations`
--

DROP TABLE IF EXISTS `fp_event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_event_locations` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_country` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations`
--

LOCK TABLES `fp_event_locations` WRITE;
/*!40000 ALTER TABLE `fp_event_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_audit`
--

DROP TABLE IF EXISTS `fp_event_locations_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_audit`
--

LOCK TABLES `fp_event_locations_audit` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_fp_events_1_c`
--

LOCK TABLES `fp_event_locations_fp_events_1_c` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events`
--

DROP TABLE IF EXISTS `fp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration_hours` int DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invite_templates` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accept_redirect` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `decline_redirect` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activity_status_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events`
--

LOCK TABLES `fp_events` WRITE;
/*!40000 ALTER TABLE `fp_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_audit`
--

DROP TABLE IF EXISTS `fp_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_audit`
--

LOCK TABLES `fp_events_audit` WRITE;
/*!40000 ALTER TABLE `fp_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_contacts_c`
--

DROP TABLE IF EXISTS `fp_events_contacts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invite_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'Not Invited',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'No Response',
  `email_responded` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_contacts_c`
--

LOCK TABLES `fp_events_contacts_c` WRITE;
/*!40000 ALTER TABLE `fp_events_contacts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_contacts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_delegates_1_c`
--

LOCK TABLES `fp_events_fp_event_delegates_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_locations_1_c`
--

LOCK TABLES `fp_events_fp_event_locations_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_leads_1_c`
--

DROP TABLE IF EXISTS `fp_events_leads_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invite_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'Not Invited',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'No Response',
  `email_responded` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_leads_1_c`
--

LOCK TABLES `fp_events_leads_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_leads_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_leads_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_prospects_1_c`
--

DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invite_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'Not Invited',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'No Response',
  `email_responded` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_prospects_1_c`
--

LOCK TABLES `fp_events_prospects_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_maps` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `source` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enclosure` varchar(1) COLLATE utf8mb4_general_ci DEFAULT ' ',
  `delimiter` varchar(1) COLLATE utf8mb4_general_ci DEFAULT ',',
  `module` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `default_values` text COLLATE utf8mb4_general_ci,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_published` varchar(3) COLLATE utf8mb4_general_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `server_url` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connection_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `port` int DEFAULT '143',
  `service` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mailbox` text COLLATE utf8mb4_general_ci,
  `sentFolder` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trashFolder` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delete_seen` tinyint(1) DEFAULT '0',
  `move_messages_to_trash_after_import` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `template_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stored_options` text COLLATE utf8mb4_general_ci,
  `group_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `auth_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'basic',
  `protocol` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'imap',
  `is_ssl` tinyint(1) DEFAULT '0',
  `distribution_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `outbound_email_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_case_template_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `external_oauth_connection_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ie_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ie_timestamp` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache`
--

DROP TABLE IF EXISTS `jjwg_address_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache`
--

LOCK TABLES `jjwg_address_cache` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache_audit`
--

DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache_audit`
--

LOCK TABLES `jjwg_address_cache_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas`
--

DROP TABLE IF EXISTS `jjwg_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_areas` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coordinates` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas`
--

LOCK TABLES `jjwg_areas` WRITE;
/*!40000 ALTER TABLE `jjwg_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas_audit`
--

DROP TABLE IF EXISTS `jjwg_areas_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas_audit`
--

LOCK TABLES `jjwg_areas_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_areas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps`
--

DROP TABLE IF EXISTS `jjwg_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_maps` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'mi',
  `module_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Accounts',
  `parent_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps`
--

LOCK TABLES `jjwg_maps` WRITE;
/*!40000 ALTER TABLE `jjwg_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_audit`
--

DROP TABLE IF EXISTS `jjwg_maps_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_audit`
--

LOCK TABLES `jjwg_maps_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_areas_c`
--

LOCK TABLES `jjwg_maps_jjwg_areas_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_markers_c`
--

LOCK TABLES `jjwg_maps_jjwg_markers_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers`
--

DROP TABLE IF EXISTS `jjwg_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_markers` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers`
--

LOCK TABLES `jjwg_markers` WRITE;
/*!40000 ALTER TABLE `jjwg_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers_audit`
--

DROP TABLE IF EXISTS `jjwg_markers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers_audit`
--

LOCK TABLES `jjwg_markers_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_markers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resolution` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `target` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_general_ci,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint DEFAULT NULL,
  `failure_count` tinyint DEFAULT NULL,
  `job_delay` int DEFAULT NULL,
  `client` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `percent_complete` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_mobile` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_work` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_other` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lawful_basis` text COLLATE utf8mb4_general_ci,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_source_description` text COLLATE utf8mb4_general_ci,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_description` text COLLATE utf8mb4_general_ci,
  `reports_to_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_description` text COLLATE utf8mb4_general_ci,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_amount` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `portal_app` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_cstm`
--

DROP TABLE IF EXISTS `leads_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_cstm`
--

LOCK TABLES `leads_cstm` WRITE;
/*!40000 ALTER TABLE `leads_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_type` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `document_revision_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_url` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `host_url` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `displayed_url` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `creator` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `external_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `duration_hours` int DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Planned',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Sugar',
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reminder_time` int DEFAULT '-1',
  `email_reminder_time` int DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `repeat_type` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repeat_interval` int DEFAULT '1',
  `repeat_dow` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int DEFAULT NULL,
  `repeat_parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recurring_source` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gsync_id` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gsync_lastsync` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `meeting_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_cstm`
--

DROP TABLE IF EXISTS `meetings_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_cstm`
--

LOCK TABLES `meetings_cstm` WRITE;
/*!40000 ALTER TABLE `meetings_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `meeting_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `meeting_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `required` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '1',
  `accept_status` varchar(25) COLLATE utf8mb4_general_ci DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_mime_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2clients`
--

DROP TABLE IF EXISTS `oauth2clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2clients` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `secret` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redirect_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT '1',
  `allowed_grant_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'password',
  `duration_value` int DEFAULT NULL,
  `duration_amount` int DEFAULT NULL,
  `duration_unit` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2clients`
--

LOCK TABLES `oauth2clients` WRITE;
/*!40000 ALTER TABLE `oauth2clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2tokens`
--

DROP TABLE IF EXISTS `oauth2tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2tokens` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refresh_token` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2tokens`
--

LOCK TABLES `oauth2tokens` WRITE;
/*!40000 ALTER TABLE `oauth2tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `nonce` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `nonce_ts` bigint DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `secret` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tstate` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `token_ts` bigint DEFAULT NULL,
  `verify` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunities` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lead_source` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sales_stage` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opportunity_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_role` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_cstm`
--

DROP TABLE IF EXISTS `opportunities_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_cstm`
--

LOCK TABLES `opportunities_cstm` WRITE;
/*!40000 ALTER TABLE `opportunities_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_email` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_general_ci DEFAULT 'user',
  `user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `smtp_from_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `smtp_from_addr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_to_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_to_addr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_general_ci,
  `mail_sendtype` varchar(8) COLLATE utf8mb4_general_ci DEFAULT 'SMTP',
  `mail_smtptype` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'other',
  `mail_smtpserver` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_smtpport` varchar(5) COLLATE utf8mb4_general_ci DEFAULT '25',
  `mail_smtpuser` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_smtppass` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) COLLATE utf8mb4_general_ci DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('b8a7614e-0fd2-893b-2943-645e56f7eb79','system','system','1','SuiteCRM','crm@flavorhub.pl',NULL,NULL,NULL,'SMTP','other','serwer1854601.home.pl','465','crm@flavorhub.pl','+ZszQX1NTmMonmZu/pVYgg==',1,'1',NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email_audit`
--

DROP TABLE IF EXISTS `outbound_email_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbound_email_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email_audit`
--

LOCK TABLES `outbound_email_audit` WRITE;
/*!40000 ALTER TABLE `outbound_email_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound_email_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts_1_c`
--

DROP TABLE IF EXISTS `project_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts_1_c`
--

LOCK TABLES `project_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `project_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_cstm`
--

DROP TABLE IF EXISTS `project_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_cstm`
--

LOCK TABLES `project_cstm` WRITE;
/*!40000 ALTER TABLE `project_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_task` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `project_task_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `relationship_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `predecessors` text COLLATE utf8mb4_general_ci,
  `date_start` date DEFAULT NULL,
  `time_start` int DEFAULT NULL,
  `time_finish` int DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `duration_unit` text COLLATE utf8mb4_general_ci,
  `actual_duration` int DEFAULT NULL,
  `percent_complete` int DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int DEFAULT '1',
  `task_number` int DEFAULT NULL,
  `estimated_effort` int DEFAULT NULL,
  `actual_effort` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_users_1_c`
--

DROP TABLE IF EXISTS `project_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_users_1users_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users_1_c`
--

LOCK TABLES `project_users_1_c` WRITE;
/*!40000 ALTER TABLE `project_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `bug_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `opportunity_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `project_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `prospect_list_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `list_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `domain_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `prospect_list_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_type` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`,`deleted`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospects` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_mobile` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_work` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_other` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lawful_basis` text COLLATE utf8mb4_general_ci,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt_address_country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `assistant_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tracker_key` int NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects_cstm`
--

DROP TABLE IF EXISTS `prospects_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospects_cstm` (
  `id_c` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects_cstm`
--

LOCK TABLES `prospects_cstm` WRITE;
/*!40000 ALTER TABLE `prospects_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationships` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `relationship_name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lhs_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lhs_table` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lhs_key` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rhs_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rhs_table` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rhs_key` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_table` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_key_lhs` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `join_key_rhs` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `relationship_type` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `relationship_role_column` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `relationship_role_column_value` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('1124ad2e-671f-732d-b98a-646392c902bd','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('11339745-42e6-4a6c-5ae1-6463928ce3e6','aos_product_categories_modified_user','Users','users','id','AOS_Product_Categories','aos_product_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('123d05c0-a4c7-6f3e-f9df-6463928c0e8a','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('124e3b04-377c-c8d5-3405-646392f2639f','aos_product_categories_created_by','Users','users','id','AOS_Product_Categories','aos_product_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('136a0b23-93d3-f12a-6726-64639299f41c','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1377d70d-13bb-e902-b9f8-646392f43ab5','aos_product_categories_assigned_user','Users','users','id','AOS_Product_Categories','aos_product_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('145b3ad2-2e88-5ce3-946d-646392e1819b','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','job_queue','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('149effb9-a061-e70b-7a13-646392a5f182','securitygroups_aos_product_categories','SecurityGroups','securitygroups','id','AOS_Product_Categories','aos_product_categories','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Product_Categories',0,0),('15638149-b461-53a8-8f9b-6463925c59f0','sub_product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Product_Categories','aos_product_categories','parent_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1768d4d4-33cd-ce62-231d-64639273cdbc','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1857a7c0-b7e2-190f-67b7-64639204895b','aos_products_modified_user','Users','users','id','AOS_Products','aos_products','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('18748512-303f-039e-8334-646392e7ff69','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('19360561-565a-f89b-4194-646392a527d2','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('194453f2-3d67-c091-9458-6463921c1c3b','aos_products_created_by','Users','users','id','AOS_Products','aos_products','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('19819167-6738-1a32-0865-646392065874','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1a152ef4-dd5a-343c-f31d-646392dfe625','aos_products_assigned_user','Users','users','id','AOS_Products','aos_products','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1ad00643-85f8-aac4-85ff-646392f6f160','securitygroups_aos_products','SecurityGroups','securitygroups','id','AOS_Products','aos_products','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Products',0,0),('1adb2e47-0026-11c9-9456-6463923357f1','securitygroups_contacts','SecurityGroups','securitygroups','id','Contacts','contacts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Contacts',0,0),('1b939dac-fa71-70d5-3fb0-646392e25405','product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Products','aos_products','aos_product_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c0c3704-2808-0512-918d-64639249a982','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('1d52a06b-33e7-afd1-9a36-646392f10cb4','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('1de9bb1b-acbd-c0b8-b086-646392e72865','aos_products_quotes_modified_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e90b603-fe6b-8c6b-53d5-646392f79d06','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1edf83b4-7c0f-b98c-7785-646392d3a202','aos_products_quotes_created_by','Users','users','id','AOS_Products_Quotes','aos_products_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f9521ad-aa8d-b68c-18ff-646392180b56','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f9639c9-7f53-3b1a-5a76-646392b25267','aos_products_quotes_assigned_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('20664824-2567-0178-9d60-646392b3cd58','aos_product_quotes_aos_products','AOS_Products','aos_products','id','AOS_Products_Quotes','aos_products_quotes','product_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('20ca7ff7-770d-0866-49be-646392c5c2ee','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('219f0ae9-ed0d-ab3a-a722-64639275790c','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('228f91dd-5f01-bb0b-a2a4-64639253eccc','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('2311c108-66e0-e39c-fe7f-6463928bd4dc','aos_line_item_groups_modified_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2366f60c-cf0d-236b-3320-646392f7b1a9','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('23a30d03-072c-9792-fc0a-646392efce35','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('243d4835-c999-ee8a-26f0-64639294aa20','aos_line_item_groups_created_by','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('24433764-fa9f-24e0-f071-6463929055c2','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('25252b0d-e34f-787a-e8cd-646392650a11','aos_line_item_groups_assigned_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2556c742-1de8-e379-33a3-6463924f411c','contact_aos_quotes','Contacts','contacts','id','AOS_Quotes','aos_quotes','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('260a1abf-7a11-ab7b-907f-6463926b6c52','groups_aos_product_quotes','AOS_Line_Item_Groups','aos_line_item_groups','id','AOS_Products_Quotes','aos_products_quotes','group_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2709cc2b-4f45-78ff-2f27-6463929b66f8','contact_aos_invoices','Contacts','contacts','id','AOS_Invoices','aos_invoices','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('28e227ea-bbd7-7ba3-1a5a-64639236d0a4','contact_aos_contracts','Contacts','contacts','id','AOS_Contracts','aos_contracts','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('294acf39-2aee-6d0c-c4cc-646392e2be1d','aos_quotes_modified_user','Users','users','id','AOS_Quotes','aos_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a0aeaca-40e4-3b30-36a9-64639216fc01','contacts_aop_case_updates','Contacts','contacts','id','AOP_Case_Updates','aop_case_updates','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a5b9f4e-25ad-ed30-2e5d-6463924b8749','aos_quotes_created_by','Users','users','id','AOS_Quotes','aos_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2b0c367a-1ea0-22ef-3827-646392b1fc52','aos_quotes_assigned_user','Users','users','id','AOS_Quotes','aos_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2bc9cbda-892a-c4df-4de7-6463926c1d9d','securitygroups_aos_quotes','SecurityGroups','securitygroups','id','AOS_Quotes','aos_quotes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Quotes',0,0),('2c8f60b1-45fb-dd43-0605-6463920dd2c3','aos_quotes_aos_product_quotes','AOS_Quotes','aos_quotes','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2d67cc32-d660-477f-124f-646392b12d95','aos_quotes_aos_line_item_groups','AOS_Quotes','aos_quotes','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2d92ca22-317e-d461-63c8-64639247a1d5','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2eb51938-3a0b-71a4-74fd-64639284a63a','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2ec400f2-8f2a-c8fd-c35c-646392055bb7','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('2fde30be-e393-395b-7630-6463929f73e9','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('30513f47-1702-dfb2-2733-6463926039e9','aow_actions_modified_user','Users','users','id','AOW_Actions','aow_actions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('30cbc752-a277-df9c-eadb-6463926446e8','securitygroups_accounts','SecurityGroups','securitygroups','id','Accounts','accounts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Accounts',0,0),('3134e31e-1cc2-1919-3e3b-6463929e900f','aow_actions_created_by','Users','users','id','AOW_Actions','aow_actions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('31bd5546-79f4-d5db-82a4-646392e3a9b3','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('3279ed5e-2d0f-ef12-2cfb-646392d2092c','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('3378fe1e-4f6c-1584-05c2-646392425c55','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('33c8a2ad-f1b5-c7f3-a5f7-646392821097','aow_workflow_modified_user','Users','users','id','AOW_WorkFlow','aow_workflow','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('347359c2-94dd-4881-dc58-646392a4e231','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('34a1e3ec-e20f-97e9-8c27-646392272662','aow_workflow_created_by','Users','users','id','AOW_WorkFlow','aow_workflow','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('356b7745-6de1-a776-fc13-646392bd835d','aow_workflow_assigned_user','Users','users','id','AOW_WorkFlow','aow_workflow','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3571a653-32dd-a44e-9623-646392078e9e','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('365a7dae-c5e4-4dde-f861-646392c820c3','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('367558cd-7689-ef21-e4c4-6463929e7d70','securitygroups_aow_workflow','SecurityGroups','securitygroups','id','AOW_WorkFlow','aow_workflow','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOW_WorkFlow',0,0),('37275565-c561-5685-2c57-6463922c4dec','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('373db150-0057-0505-38d6-646392ad5dc5','aow_workflow_aow_conditions','AOW_WorkFlow','aow_workflow','id','AOW_Conditions','aow_conditions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('37e56c4f-a090-e0b0-1d17-646392d44955','aow_workflow_aow_actions','AOW_WorkFlow','aow_workflow','id','AOW_Actions','aow_actions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('37e65699-9e5c-a0bf-8774-64639275815d','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('38c47931-dbd0-cc52-2b86-646392598868','aow_workflow_aow_processed','AOW_WorkFlow','aow_workflow','id','AOW_Processed','aow_processed','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('38ce97f0-8678-a9f3-aa06-6463920ead2a','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('39a8324a-e2bc-def5-c7c4-646392bd7f18','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3a070ef4-a79c-c52a-6b77-646392218c63','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('3a543dc3-be9a-31ab-d8db-646392f64128','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('3b1e5efb-0932-a09f-210f-646392b39ac0','account_aos_quotes','Accounts','accounts','id','AOS_Quotes','aos_quotes','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3b3ccb77-c5b5-7d83-e0c4-646392ba3711','aow_processed_modified_user','Users','users','id','AOW_Processed','aow_processed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3be07d12-2dc1-aa3b-0277-646392a86abe','account_aos_invoices','Accounts','accounts','id','AOS_Invoices','aos_invoices','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3c3c20d1-85e2-25ac-5bbc-6463927ebdb7','aow_processed_created_by','Users','users','id','AOW_Processed','aow_processed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3cbf4ef3-0da2-4e53-1574-6463924a9ced','account_aos_contracts','Accounts','accounts','id','AOS_Contracts','aos_contracts','contract_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3e201971-46eb-484f-66c7-646392a61da1','aow_conditions_modified_user','Users','users','id','AOW_Conditions','aow_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3f32b550-36f6-3ede-1d8a-6463925734db','aow_conditions_created_by','Users','users','id','AOW_Conditions','aow_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('409c7fc4-86be-eb5e-9212-6463928e104d','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('40ca0714-4643-12cb-4fe3-6463923f55ba','aos_invoices_modified_user','Users','users','id','AOS_Invoices','aos_invoices','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4177ba1a-42a0-3ae4-b502-6463924cf59a','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('419221eb-7c89-41c5-33b8-646392d2340e','jjwg_maps_modified_user','Users','users','id','jjwg_Maps','jjwg_maps','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('424e14d0-57c5-343e-58db-6463921e1747','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('428559bb-7e94-d17b-3244-64639287f343','jjwg_maps_created_by','Users','users','id','jjwg_Maps','jjwg_maps','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42ebdf7a-de27-206d-0092-646392e4fc1b','securitygroups_opportunities','SecurityGroups','securitygroups','id','Opportunities','opportunities','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Opportunities',0,0),('435d7fc4-fd14-9e2c-62ae-646392629838','jjwg_maps_assigned_user','Users','users','id','jjwg_Maps','jjwg_maps','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('437e5bb6-8356-db3c-1fef-64639230935b','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('43fb0a08-2b93-9a26-c702-646392277dba','securitygroups_jjwg_maps','SecurityGroups','securitygroups','id','jjwg_Maps','jjwg_maps','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Maps',0,0),('4421df45-811f-8e3e-2579-6463929e07b7','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('449ad041-638f-da88-8686-646392542699','jjwg_Maps_accounts','jjwg_Maps','jjwg_Maps','parent_id','Accounts','accounts','id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('44d51481-26bf-5a29-88b7-646392548c42','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('454addb8-4f17-00f8-aa3f-646392703245','jjwg_Maps_contacts','jjwg_Maps','jjwg_Maps','parent_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('454dba39-7285-9a0a-e404-646392f6783c','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('45d004d4-089e-b00d-c824-646392bba8c0','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('461216b5-d82a-889d-1817-646392bb2d12','jjwg_Maps_leads','jjwg_Maps','jjwg_Maps','parent_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('463133c9-299a-0bb6-86ae-646392962514','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('46c2d84d-7646-2523-ef4a-646392f6bc3d','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('46dc5289-6413-8bb3-f864-646392258bfc','jjwg_Maps_opportunities','jjwg_Maps','jjwg_Maps','parent_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('47311bd9-35fe-a08f-07da-646392f27d09','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('47a3930e-5174-b4fc-3e36-6463928ab846','jjwg_Maps_cases','jjwg_Maps','jjwg_Maps','parent_id','Cases','cases','id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('47db8489-6a41-4f1a-e5c8-6463929aeb31','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48425ebf-1288-b939-e80e-6463929ca2b1','jjwg_Maps_projects','jjwg_Maps','jjwg_Maps','parent_id','Project','project','id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('485e0b0b-df3a-7beb-ded1-646392921d31','opportunity_aos_quotes','Opportunities','opportunities','id','AOS_Quotes','aos_quotes','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48e74581-9ccb-37b3-24cf-6463926b2694','opportunity_aos_contracts','Opportunities','opportunities','id','AOS_Contracts','aos_contracts','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4962b6e1-cec7-bed3-24af-646392a27917','jjwg_Maps_meetings','jjwg_Maps','jjwg_Maps','parent_id','Meetings','meetings','id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('4a48f401-e1ee-7a37-d869-646392402c24','jjwg_Maps_prospects','jjwg_Maps','jjwg_Maps','parent_id','Prospects','prospects','id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('4b050cdc-37b3-f89c-5d51-646392ee1107','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('4be744d7-dceb-5275-4813-646392486eb4','securitygroups_emailtemplates','SecurityGroups','securitygroups','id','EmailTemplates','email_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailTemplates',0,0),('4cb6c147-bbeb-9064-12df-646392af8339','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d9fa1fe-2dd4-b78f-fa5c-646392fb3dce','jjwg_markers_modified_user','Users','users','id','jjwg_Markers','jjwg_markers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4e7005eb-b77e-1b7b-77f1-6463929ee44e','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f12d2d9-a5cb-fccd-28c2-646392b1da47','jjwg_markers_created_by','Users','users','id','jjwg_Markers','jjwg_markers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4f39d17a-dd4f-2933-6910-646392c83bcb','securitygroups_notes','SecurityGroups','securitygroups','id','Notes','notes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Notes',0,0),('4fe751a6-7e5a-a6fb-8d38-64639239df62','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('501b6f94-046f-02fc-05b7-646392b326ac','jjwg_markers_assigned_user','Users','users','id','jjwg_Markers','jjwg_markers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('507faeae-d116-5042-3d4b-64639263d5c0','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('50e79787-cca1-96c9-6e09-646392c7f29b','securitygroups_jjwg_markers','SecurityGroups','securitygroups','id','jjwg_Markers','jjwg_markers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Markers',0,0),('520787ce-87b0-2809-5be4-646392f0645c','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52b0c9b3-c50a-3c25-3340-646392141c84','jjwg_areas_modified_user','Users','users','id','jjwg_Areas','jjwg_areas','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52c830c7-30ad-6a4c-bf78-646392c6c0e5','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5340028c-0400-e927-1b1a-6463925882e5','aos_invoices_created_by','Users','users','id','AOS_Invoices','aos_invoices','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5381ad97-f038-259e-c9d3-64639243a0c7','jjwg_areas_created_by','Users','users','id','jjwg_Areas','jjwg_areas','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53b36b85-5934-3710-7ce7-64639233174a','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('542548b3-a9aa-1e1f-dcd3-6463920892fd','securitygroups_calls','SecurityGroups','securitygroups','id','Calls','calls','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Calls',0,0),('545fa3a7-ccbd-69aa-9720-64639284f877','jjwg_areas_assigned_user','Users','users','id','jjwg_Areas','jjwg_areas','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('54d12018-e390-659c-4e88-6463927e5009','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('55109370-3eba-6d63-703a-6463926a6534','securitygroups_jjwg_areas','SecurityGroups','securitygroups','id','jjwg_Areas','jjwg_areas','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Areas',0,0),('55757ff1-468d-a421-97f7-64639202ba8c','calls_reschedule','Calls','calls','id','Calls_Reschedule','calls_reschedule','call_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('56b3c81a-9e72-6c7a-eb4d-64639278d80f','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5722457c-b2a5-88be-445e-646392f80854','jjwg_address_cache_modified_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('575ea435-b43d-8da1-af6a-6463921f0230','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('57cd6900-e5eb-314f-0835-64639246d562','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5840edf1-e752-3e68-49b7-64639264a278','jjwg_address_cache_created_by','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('587cf6f9-701b-6100-9736-64639208a902','securitygroups_emails','SecurityGroups','securitygroups','id','Emails','emails','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Emails',0,0),('58fbb375-a584-1009-fb3b-646392daceb9','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5924d026-3a21-5809-f8b7-646392c985a0','jjwg_address_cache_assigned_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('59e837a5-cafe-2088-7bc4-6463928160a3','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('5ab9b616-079a-8683-90e9-6463923e9abe','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('5b278592-d042-c45f-d0b3-646392d4fd82','calls_reschedule_modified_user','Users','users','id','Calls_Reschedule','calls_reschedule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5b9674d9-ef1d-40d4-58c0-646392e7294d','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('5c06ed8f-c577-3617-084d-6463920979eb','calls_reschedule_created_by','Users','users','id','Calls_Reschedule','calls_reschedule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5c2dc2df-0334-7eb7-c78d-646392bbbd59','emails_aos_contracts_rel','Emails','emails','id','AOS_Contracts','aos_contracts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','AOS_Contracts',0,0),('5c971214-b0ef-f288-6e6b-646392912c6b','emails_meetings_rel','Emails','emails','id','Meetings','meetings','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Meetings',0,0),('5cf5cce4-f2ec-3efd-7ce4-6463921e4247','calls_reschedule_assigned_user','Users','users','id','Calls_Reschedule','calls_reschedule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e76bea3-c082-93df-6cf6-64639205155e','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5f30f3bf-cfc0-42da-9d06-646392e1e2e8','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5f6d0b11-35f1-22f0-2d5f-646392d43c4a','aos_invoices_assigned_user','Users','users','id','AOS_Invoices','aos_invoices','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5f9c8f4a-02fc-f23f-b98f-6463921b9bc7','securitygroups_modified_user','Users','users','id','SecurityGroups','securitygroups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5fba9589-1d83-b44e-60d4-646392499bc7','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('608979d4-483d-b045-1ae6-6463925dd4d9','securitygroups_meetings','SecurityGroups','securitygroups','id','Meetings','meetings','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Meetings',0,0),('60b7ac35-6394-d6dc-8420-6463928c1bbe','securitygroups_created_by','Users','users','id','SecurityGroups','securitygroups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6164e969-8006-84f5-917f-64639209c10f','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('618d996e-7924-86f9-1c6f-64639226fcbe','securitygroups_assigned_user','Users','users','id','SecurityGroups','securitygroups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6390e150-cd50-6fa8-a3d9-646392e5face','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('64aaa96e-6553-be35-eff4-646392575f1a','securitygroups_outboundemailaccounts','SecurityGroups','securitygroups','id','OutboundEmailAccounts','outbound_email','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','OutboundEmailAccounts',0,0),('64c983fd-2540-1b63-60e0-6463926bd2e8','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('659c3011-7bb4-cb62-8552-646392341ead','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65da529e-c4a1-4bfa-a726-646392993f59','outbound_email_owner_user','Users','users','id','OutboundEmailAccounts','outbound_email','user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6645e0a9-27e1-4c10-f3ae-646392a86344','securitygroups_tasks','SecurityGroups','securitygroups','id','Tasks','tasks','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Tasks',0,0),('66e1ae9d-f3c4-cb38-e054-646392d61111','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6706a869-eb1e-d101-93a3-6463921a8009','outbound_email_modified_user','Users','users','id','OutboundEmailAccounts','outbound_email','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('67aa841a-4dc9-423c-0495-6463924a529d','outbound_email_created_by','Users','users','id','OutboundEmailAccounts','outbound_email','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('685e1ca2-5126-35eb-5ab5-646392099518','outbound_email_assigned_user','Users','users','id','OutboundEmailAccounts','outbound_email','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('69600830-64c8-bd0d-e9c4-6463927deef3','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('6976019b-791a-fdf2-499d-646392729e6e','securitygroups_aos_invoices','SecurityGroups','securitygroups','id','AOS_Invoices','aos_invoices','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Invoices',0,0),('6a5b44bc-875b-9878-8faa-646392956b84','externaloauthconnection_modified_user','Users','users','id','ExternalOAuthConnection','external_oauth_connections','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b0677d1-e13f-3fa2-f60d-64639233cb69','alerts_modified_user','Users','users','id','Alerts','alerts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b13c1b5-c8e0-d053-53f6-6463928f62e9','externaloauthconnection_created_by','Users','users','id','ExternalOAuthConnection','external_oauth_connections','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6bf7c448-b365-6d41-4144-646392623e5e','securitygroups_externaloauthconnection','SecurityGroups','securitygroups','id','ExternalOAuthConnection','external_oauth_connections','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ExternalOAuthConnection',0,0),('6c185147-8bfe-601d-385c-646392c76cf2','alerts_created_by','Users','users','id','Alerts','alerts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6c86491b-fc0c-1682-972b-6463929e1e90','external_oauth_connections_external_oauth_providers','ExternalOAuthProvider','external_oauth_providers','id','ExternalOAuthConnection','external_oauth_connections','external_oauth_provider_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d3a19c7-bd44-a500-a81c-646392b380b6','alerts_assigned_user','Users','users','id','Alerts','alerts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6e3f8bfb-9b0e-db10-3fe4-64639242aebf','externaloauthprovider_modified_user','Users','users','id','ExternalOAuthProvider','external_oauth_providers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6f22e8e5-8cac-f8be-9c0c-64639212a28d','externaloauthprovider_created_by','Users','users','id','ExternalOAuthProvider','external_oauth_providers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('704d2e34-fd33-e2aa-9f31-646392caaac2','securitygroups_externaloauthprovider','SecurityGroups','securitygroups','id','ExternalOAuthProvider','external_oauth_providers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ExternalOAuthProvider',0,0),('7097851c-c80d-a337-38c1-646392b2ceae','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('71f936f4-1a88-7f86-74bc-646392ece8ab','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('726894ca-3c77-9f53-1f18-646392a66a05','templatesectionline_modified_user','Users','users','id','TemplateSectionLine','templatesectionline','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('72e9407f-6c11-386b-e1ef-646392210f4b','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('734697e4-febd-5baf-1f36-64639271a4db','templatesectionline_created_by','Users','users','id','TemplateSectionLine','templatesectionline','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('73db9ee5-b9e9-513d-b52b-6463928b1a5a','securitygroups_documents','SecurityGroups','securitygroups','id','Documents','documents','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Documents',0,0),('74b618dd-d718-1532-5e65-646392ac9ecc','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7592fc44-5d3d-1be9-f920-646392cf122e','oauth2tokens_modified_user','Users','users','id','OAuth2Tokens','oauth2tokens','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('760cf644-99f5-6bc8-5dc6-64639268a41d','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('767a19f2-e2c1-96f9-fcb9-6463926703cc','oauth2tokens_created_by','Users','users','id','OAuth2Tokens','oauth2tokens','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('76c80ac8-0bfe-d6a8-6235-646392c4f881','aos_invoices_aos_product_quotes','AOS_Invoices','aos_invoices','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('776d3626-e8e6-10fd-4895-646392065fd1','oauth2tokens_assigned_user','Users','users','id','OAuth2Tokens','oauth2tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('79a433b5-1f01-d064-90fa-6463921a8726','securitygroups_inboundemail','SecurityGroups','securitygroups','id','InboundEmail','inbound_email','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','InboundEmail',0,0),('79e62497-86ad-e040-59f1-646392b3c40a','oauth2clients_modified_user','Users','users','id','OAuth2Clients','oauth2clients','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b32fcd6-1076-2280-b745-646392bacf00','inbound_emails_distribution_user','Users','users','id','InboundEmail','inbound_email','distribution_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b96b8d9-1a88-e1fe-8800-646392d81fc7','oauth2clients_created_by','Users','users','id','OAuth2Clients','oauth2clients','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ed43eea-3e83-92cc-f224-64639240db6d','inbound_emails_autoreply_email_templates','EmailTemplates','email_templates','id','InboundEmail','inbound_email','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80262a39-6460-8716-89c7-6463920fa491','inbound_emails_case_email_templates','EmailTemplates','email_templates','id','InboundEmail','inbound_email','create_case_template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('814b5d48-cace-e678-e408-64639267bf5a','inbound_emails_external_oauth_connections','ExternalOAuthConnection','external_oauth_connections','id','InboundEmail','inbound_email','external_oauth_connection_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81a535fd-fad3-38c6-fedc-6463922a6e51','oauth2clients_oauth2tokens','OAuth2Clients','oauth2clients','id','OAuth2Tokens','oauth2tokens','client',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('824803a8-9bde-3997-e42a-646392b0d416','aos_invoices_aos_line_item_groups','AOS_Invoices','aos_invoices','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('825bae11-bf52-c4e4-fd85-64639282d226','inbound_outbound_email_accounts','OutboundEmailAccounts','outbound_email','id','InboundEmail','inbound_email','outbound_email_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('82c43dbe-70f5-f324-4007-646392a2e68b','oauth2clients_assigned_user','Users','users','id','OAuth2Clients','oauth2clients','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('832615a8-5a22-a307-f87b-64639249b50d','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('842821b0-ee62-e5ba-fe0c-64639298ced8','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('849c2582-b139-284f-3a1c-646392408588','surveyresponses_modified_user','Users','users','id','SurveyResponses','surveyresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('857b95e2-61c3-6e4a-3407-6463926555e4','surveyresponses_created_by','Users','users','id','SurveyResponses','surveyresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('85fd666b-3b5d-3b3b-1785-646392d5c9cf','surveyresponses_assigned_user','Users','users','id','SurveyResponses','surveyresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86ce3924-0346-9810-35f9-646392ff8c62','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86ebc923-94ae-eaf4-8698-646392f442f5','securitygroups_surveyresponses','SecurityGroups','securitygroups','id','SurveyResponses','surveyresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyResponses',0,0),('87cc953a-79cf-73e9-ee1e-646392b8cead','surveyresponses_surveyquestionresponses','SurveyResponses','surveyresponses','id','SurveyQuestionResponses','surveyquestionresponses','surveyresponse_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('88f056df-0f50-9299-b6e6-646392d75d5c','surveyresponses_contacts','Contacts','contacts','id','SurveyResponses','surveyresponses','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89a8c895-9fde-eb7a-ee4f-64639286a0f9','surveyresponses_accounts','Accounts','accounts','id','SurveyResponses','surveyresponses','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ad0cf3a-6e25-030d-3dae-64639270d23d','surveys_modified_user','Users','users','id','Surveys','surveys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8b62a447-892d-a9ea-bbcc-64639290d5ec','spots_modified_user','Users','users','id','Spots','spots','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8b68924f-e45a-4460-821d-6463920a1d35','surveys_created_by','Users','users','id','Surveys','surveys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8bf9da74-a5ca-dc37-a5f7-646392026978','surveys_assigned_user','Users','users','id','Surveys','surveys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c50a93c-970b-9812-fb88-6463926e3f6e','spots_created_by','Users','users','id','Spots','spots','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8c894ff4-d11e-d094-f4e4-646392b68074','securitygroups_surveys','SecurityGroups','securitygroups','id','Surveys','surveys','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Surveys',0,0),('8d234b74-f188-0144-f68e-646392e7b926','surveys_surveyquestions','Surveys','surveys','id','SurveyQuestions','surveyquestions','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8d2d9272-7106-e5c8-7ba8-646392f628f0','spots_assigned_user','Users','users','id','Spots','spots','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8dba5198-9dd6-7b38-915c-6463926b2690','surveys_surveyresponses','Surveys','surveys','id','SurveyResponses','surveyresponses','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8dd6ac7f-e27f-7c2c-a960-64639272b2c2','securitygroups_spots','SecurityGroups','securitygroups','id','Spots','spots','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Spots',0,0),('8e8642a2-fe40-405f-734d-646392f37d2a','surveys_campaigns','Surveys','surveys','id','Campaigns','campaigns','survey_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f8b62a0-7895-3f1c-186f-6463929c6e7a','aobh_businesshours_modified_user','Users','users','id','AOBH_BusinessHours','aobh_businesshours','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9013880c-3202-a6a8-1bfe-6463926177e0','surveyquestionresponses_modified_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('905cd4ec-6d96-2bc4-0028-646392bfdb88','aobh_businesshours_created_by','Users','users','id','AOBH_BusinessHours','aobh_businesshours','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('90c8d8fc-2b70-888e-38e0-64639252ac0f','surveyquestionresponses_created_by','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('91749b41-ab9a-0790-894e-646392a1a3ba','surveyquestionresponses_assigned_user','Users','users','id','SurveyQuestionResponses','surveyquestionresponses','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('920dd719-491c-8142-274d-64639253395b','securitygroups_surveyquestionresponses','SecurityGroups','securitygroups','id','SurveyQuestionResponses','surveyquestionresponses','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionResponses',0,0),('92b89ec0-43b2-a866-13b6-6463925e8c74','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('939748fc-8c96-6b99-49db-646392098c39','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('93f00710-02ad-db7d-53db-6463921ac566','aos_contracts_aos_line_item_groups','AOS_Contracts','aos_contracts','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94071f76-fe16-d61c-c91d-6463924d178d','surveyquestions_modified_user','Users','users','id','SurveyQuestions','surveyquestions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('947ee555-c73f-1e67-90d6-6463920dd80e','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94c028cb-ba3e-9413-1bab-646392a1a745','surveyquestions_created_by','Users','users','id','SurveyQuestions','surveyquestions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9560da6d-d1a4-c00d-65f0-6463925e02df','surveyquestions_assigned_user','Users','users','id','SurveyQuestions','surveyquestions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('961208d5-4226-fc66-d097-64639276630f','securitygroups_surveyquestions','SecurityGroups','securitygroups','id','SurveyQuestions','surveyquestions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestions',0,0),('96ffe676-196e-2d75-661f-646392602d0d','surveyquestions_surveyquestionoptions','SurveyQuestions','surveyquestions','id','SurveyQuestionOptions','surveyquestionoptions','survey_question_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97a10946-bae0-3c71-5c16-6463920cc168','securitygroups_emailmarketing','SecurityGroups','securitygroups','id','EmailMarketing','email_marketing','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailMarketing',0,0),('97d1b378-b497-fd95-4efd-64639282892a','surveyquestions_surveyquestionresponses','SurveyQuestions','surveyquestions','id','SurveyQuestionResponses','surveyquestionresponses','surveyquestion_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9804e577-f7cf-d618-0126-64639279e005','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('98e89e20-efc2-9ea3-e716-646392dbca3e','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('998b8136-d4c7-5bbf-8ab9-646392b3b0e2','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9a04ed0f-d6b9-2061-5707-646392b98c25','surveyquestionoptions_modified_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9adc24fe-7f02-26fa-04fc-646392904c91','surveyquestionoptions_created_by','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b60e674-2ae6-b80e-67c9-64639214444b','surveyquestionoptions_assigned_user','Users','users','id','SurveyQuestionOptions','surveyquestionoptions','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9bcbc3a6-6447-5ce4-4738-646392f5e2bb','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauth_consumer','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c14076b-7a77-0f97-cf49-646392c67626','securitygroups_surveyquestionoptions','SecurityGroups','securitygroups','id','SurveyQuestionOptions','surveyquestionoptions','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','SurveyQuestionOptions',0,0),('9cea0238-bd13-51b5-e032-6463922fcc3e','oauthkeys_created_by','Users','users','id','OAuthKeys','oauth_consumer','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e106034-a9fa-c94c-0ce8-646392e245fc','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauth_consumer','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e30a1ff-2c71-a20a-cc73-646392cebd9a','f_orders_modified_user','Users','users','id','f_Orders','f_orders','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9ef7001e-4b35-9f39-ee4e-6463926f8e0a','f_orders_created_by','Users','users','id','f_Orders','f_orders','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9f83a457-d441-ef0a-fe26-6463921f4b6e','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9fafb783-967f-27e5-b07e-64639270384d','f_orders_assigned_user','Users','users','id','f_Orders','f_orders','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a0487b4c-67c5-9f08-9476-6463924c11f7','securitygroups_f_orders','SecurityGroups','securitygroups','id','f_Orders','f_orders','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','f_Orders',0,0),('a07c81b0-ec95-dcce-cae0-64639221de6c','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a228a813-6fd5-87b4-8705-646392bd8792','f_pricelist_modified_user','Users','users','id','f_Pricelist','f_pricelist','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a2d6587a-507d-7e5d-b867-6463929fcb79','f_pricelist_created_by','Users','users','id','f_Pricelist','f_pricelist','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a360b382-52f9-2104-81cb-646392103793','am_projecttemplates_modified_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a3a40ccb-79bb-0a3b-53ad-6463924f7db5','f_pricelist_assigned_user','Users','users','id','f_Pricelist','f_pricelist','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4470aae-3afc-98a6-6810-646392c37a05','securitygroups_f_pricelist','SecurityGroups','securitygroups','id','f_Pricelist','f_pricelist','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','f_Pricelist',0,0),('a49a5dde-285d-9e79-4950-6463929c20d4','am_projecttemplates_created_by','Users','users','id','AM_ProjectTemplates','am_projecttemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a5a6a25c-7e52-a845-4578-64639253cf6d','am_projecttemplates_assigned_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a78826d5-14d1-63a4-9d37-6463920b4037','f_customers_modified_user','Users','users','id','f_Customers','f_customers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a86314ed-2de7-3295-5b49-646392479ca2','f_customers_created_by','Users','users','id','f_Customers','f_customers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a8ebc748-206b-eb88-19e9-6463929d92ce','am_tasktemplates_modified_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9591f9c-59c1-2a5d-60c9-646392bc64a5','f_customers_assigned_user','Users','users','id','f_Customers','f_customers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9a50225-cb03-803a-51a5-646392e268e7','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa333f03-b722-4207-c345-646392780a68','am_tasktemplates_created_by','Users','users','id','AM_TaskTemplates','am_tasktemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa4498bb-1823-c5b5-494a-646392964554','securitygroups_f_customers','SecurityGroups','securitygroups','id','f_Customers','f_customers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','f_Customers',0,0),('ab16634b-5c59-5559-3946-6463926197f0','am_tasktemplates_assigned_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab2ed748-85a4-f0f4-cbac-6463927442c5','f_customers_email_addresses','f_Customers','f_customers','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','f_Customers',0,0),('ac03331f-d630-5fcd-9701-64639218559c','f_customers_email_addresses_primary','f_Customers','f_customers','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('acf029e0-298d-9436-dd03-646392760f91','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('ad0d420c-8876-a879-a7f5-6463923a5677','favorites_modified_user','Users','users','id','Favorites','favorites','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ad4013de-09f9-6acd-c71b-646392c480c1','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('add40dd9-4451-d25f-2467-646392934646','aos_pdf_templates_modified_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('adf93f00-2ec6-c8ac-5179-646392ba13a9','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('adfd7b88-2fcf-15e7-42c7-6463924f3e78','favorites_created_by','Users','users','id','Favorites','favorites','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aeba792a-5887-d73c-1dcb-646392d8be11','favorites_assigned_user','Users','users','id','Favorites','favorites','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aef56719-bf09-2561-1ea4-6463927f7963','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('af1cc3f6-4142-ddc6-c343-64639271c16e','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('afb6ddcb-34a0-225a-50f0-646392dcd519','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aff3fc60-8c32-a8a3-8224-6463923550f4','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('b06d14fa-cbc6-1eb1-97b0-64639286d048','aok_knowledge_base_categories_modified_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b0a6a8bc-be37-7e86-5668-646392565c1a','securitygroups_leads','SecurityGroups','securitygroups','id','Leads','leads','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Leads',0,0),('b0f3e31d-fc3c-6cac-1fe6-64639212e552','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('b142c027-3c52-c618-a584-64639235fed1','aok_knowledge_base_categories_created_by','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b1a40d96-2194-e663-7fe6-6463924bcd5c','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('b1cdcef9-6bb1-3846-ee30-646392df59ce','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('b2277f47-1793-1524-d7f9-646392a0e804','aok_knowledge_base_categories_assigned_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b266822a-87f7-d2cc-6e54-646392d844a1','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b298b81a-28a9-3ea4-347d-64639277e6c5','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('b2dd4d12-9e7a-e6ce-f959-646392e7df09','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b3cbcd0b-4b51-3393-9da9-646392dab6d6','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('b3e4002d-dad5-860b-c296-646392c9e8d2','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('b496df68-4dbb-8254-5719-646392d86381','aok_knowledgebase_modified_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4c479c7-3d4d-6cc8-0e4f-6463924f13c1','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('b4c96334-f079-b95a-4874-6463928ef9c5','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('b56649b5-d39c-596f-7164-646392b835c4','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('b57e4dd2-0662-769e-c232-646392bb088f','aok_knowledgebase_created_by','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b5cb189d-cb9a-0e6c-a919-64639237d021','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('b60d18d1-7045-b197-80d7-646392b37238','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('b6692e2d-3e21-4669-4423-64639233eb4d','aok_knowledgebase_assigned_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b68b9bad-8fb0-b60c-b4af-64639268bbad','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('b71bdd28-8641-c4cf-0d1a-646392cd6565','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('b73167ab-9859-15f9-400e-6463923362b7','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('b73f1ceb-b108-d9f4-f5df-646392ec22dd','securitygroups_aok_knowledgebase','SecurityGroups','securitygroups','id','AOK_KnowledgeBase','aok_knowledgebase','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOK_KnowledgeBase',0,0),('b7e78c3d-c024-bc61-59a3-64639266ce9f','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('b944124c-9e2f-68e6-f66f-6463922500a1','reminders_modified_user','Users','users','id','Reminders','reminders','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ba1fe02b-45b5-63fa-8042-646392b91f28','reminders_created_by','Users','users','id','Reminders','reminders','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ba88ea69-8c97-201b-7401-646392cf551b','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bafb6e96-a70e-b956-cd5f-646392f42eec','reminders_assigned_user','Users','users','id','Reminders','reminders','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bb5720c5-1b1a-54ff-cb6e-64639259db3f','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bbf2935c-ac04-03d0-f1d6-646392e6d97a','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bc6e9dae-b4a0-7da2-135c-646392d9c212','securitygroups_cases','SecurityGroups','securitygroups','id','Cases','cases','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Cases',0,0),('bc8ba02a-6aee-2a56-1749-64639242ea33','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('bcf99954-36ba-4425-898a-6463924c77a8','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('bd49ecb4-ff02-c979-0c32-646392e19f29','reminders_invitees_modified_user','Users','users','id','Reminders_Invitees','reminders_invitees','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bd6ada81-e3dc-3735-000e-646392785162','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('bdd36812-5a75-d492-b4f2-646392e6b799','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('bdeadcf1-3946-63af-53eb-646392e839e0','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('be273e41-f3bd-2d41-ae1d-646392f7c358','reminders_invitees_created_by','Users','users','id','Reminders_Invitees','reminders_invitees','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('be2fa6d6-c3b6-1eee-d4a4-646392f77525','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('be4006f1-edfb-9e63-f1a4-646392886282','aos_pdf_templates_created_by','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('be9db3f4-2dc8-582a-ce9f-6463923d5050','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('bedbc5b0-a974-dfa6-6e9f-646392b01652','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('bf05d084-9607-3ba4-56d6-646392464ef6','reminders_invitees_assigned_user','Users','users','id','Reminders_Invitees','reminders_invitees','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf0afd72-ba1c-9dca-2870-64639286980a','cases_created_contact','Contacts','contacts','id','Cases','cases','contact_created_by_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bfca760f-b3c1-bd76-5e04-6463926cbc14','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('c0c092d1-f92d-cd45-3495-646392b0fd16','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('c0fc62e2-f2a6-d07c-cc39-646392d72095','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c184f6ed-8b6e-a73b-3899-646392b2a5f8','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c19879a7-c734-43b6-8f6e-6463921e06db','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('c1e2412a-95f6-9b42-dd31-6463923719a9','fp_events_modified_user','Users','users','id','FP_events','fp_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c20339f7-cde5-c37a-6bf1-6463923fd732','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c2752c14-d90d-fe18-7902-646392213c45','securitygroups_bugs','SecurityGroups','securitygroups','id','Bugs','bugs','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Bugs',0,0),('c29ad80a-6b70-132d-55ef-646392b29a73','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('c2fd2841-ce73-d905-f9f6-646392d2fc79','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c31855be-bc46-729e-1f86-6463923fc84f','fp_events_created_by','Users','users','id','FP_events','fp_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c343ea49-41bb-a676-47ff-6463922a1a46','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('c36bb1a7-b393-8204-7128-64639280afc7','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c3ce7b45-7f57-4939-1a91-6463924bae10','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c415ff77-c948-ef80-d4e0-646392a479c6','fp_events_assigned_user','Users','users','id','FP_events','fp_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c43290d9-b7d2-8a67-cfb8-646392c9c025','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c44239d2-b55f-ac52-3c98-646392ebdd01','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('c4abbd4d-5a0d-4455-3284-64639213130f','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c4f3344a-16c9-e286-ce15-646392a1e8fa','securitygroups_fp_events','SecurityGroups','securitygroups','id','FP_events','fp_events','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_events',0,0),('c508fb76-5c74-1bb1-71e8-646392d508c5','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c520255d-2c24-5763-b744-646392dad051','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('c57ba8ca-546c-702a-0af6-6463920c1414','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c5df7492-46fc-6d73-dc0c-646392450741','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c64a5612-75b4-4b61-458b-646392413609','users_users_password_link','Users','users','id',NULL,'users_signatures','user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c64c08ac-2bbb-5f41-b455-64639251a3ed','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('c6e766b1-a79b-6b86-306f-64639265b73b','fp_event_locations_modified_user','Users','users','id','FP_Event_Locations','fp_event_locations','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c7005a8e-f450-40b1-55b8-6463922da8c1','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('c76af850-2457-3e01-1a5f-6463924b7d64','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('c77c0dca-1229-f11d-1076-64639261a346','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c7b7dee6-009e-d9c4-4273-646392fc456d','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('c7da2dda-4aa4-0876-f8a7-646392edc840','fp_event_locations_created_by','Users','users','id','FP_Event_Locations','fp_event_locations','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c84e02f9-f0e5-fc4b-383b-6463924ad708','fp_event_locations_assigned_user','Users','users','id','FP_Event_Locations','fp_event_locations','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c8be9365-2df9-cd05-cf1a-646392bb1813','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('c8d12592-b22c-b3a5-83fb-6463929118e9','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c90585a2-5063-ef93-8431-646392be7bd6','securitygroups_fp_event_locations','SecurityGroups','securitygroups','id','FP_Event_Locations','fp_event_locations','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_Event_Locations',0,0),('c9601d97-d415-51ed-e02d-646392d92326','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c994f8f9-6a54-a7c6-38fb-646392973576','optimistic_locking',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('ca003454-f778-d9d6-efd8-646392ff6b3f','unified_search',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('ca2a6565-2b4e-3c38-9acd-646392fbcf0c','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('ca31c5f4-b599-430f-0552-646392320864','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cacf6f96-0443-52e9-e7fc-6463922fc244','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cb4816fe-133e-83d6-85c4-6463920f76e0','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('cb758d16-890f-9ad2-5044-6463922c64f3','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cb766fac-5a27-8f7b-0626-6463926dd5f0','aod_indexevent_modified_user','Users','users','id','AOD_IndexEvent','aod_indexevent','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cc41380b-b642-5961-5705-6463923b2580','aod_indexevent_created_by','Users','users','id','AOD_IndexEvent','aod_indexevent','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cc955a4b-03ee-dc1c-c06a-6463924732f3','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('cca9be3b-2924-1816-2c15-646392fbcb87','aod_indexevent_assigned_user','Users','users','id','AOD_IndexEvent','aod_indexevent','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cd3009b3-7e79-6f74-a6d8-64639272bd39','aos_pdf_templates_assigned_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cdad4ae2-5eb3-8f2f-725d-6463924564f2','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('ce702abb-4c64-8c32-9672-64639282a06b','securitygroups_project','SecurityGroups','securitygroups','id','Project','project','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Project',0,0),('ce745e9c-d6bb-7db1-6277-6463923d9354','aod_index_modified_user','Users','users','id','AOD_Index','aod_index','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ce807d5a-400d-5923-9a07-646392ccdf6e','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('cf39588a-3431-1723-620e-646392c80f17','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('cf43ab4f-149c-925c-9d5c-646392099e3b','aod_index_created_by','Users','users','id','AOD_Index','aod_index','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cf9a0d0e-2107-3209-de74-64639206b08a','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('cffd5415-aead-b462-8f0f-64639283653d','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('d0615738-7c30-7988-1a46-646392784ec0','aod_index_assigned_user','Users','users','id','AOD_Index','aod_index','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d0b84926-7598-df4f-a293-6463925c6b4d','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d0bbe846-3725-f91d-eb79-646392a521eb','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('d1888dde-c882-2dcd-9b9d-646392126ccd','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('d1a71a5e-ec04-3635-dc88-6463925dd2c1','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d236a28f-de3e-91e0-052f-6463928998d8','aop_case_events_modified_user','Users','users','id','AOP_Case_Events','aop_case_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2761506-e5f6-f7be-4288-646392840fac','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d27f9394-65b4-4ddb-4e0c-64639213e1b3','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('d320037e-2618-b21c-e178-64639261152c','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('d341952b-7c9d-409c-2a92-64639277ff68','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('d35dc097-3a15-4b47-5303-646392d2222f','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('d391717a-9ea6-0d9c-2036-646392faa977','aop_case_events_created_by','Users','users','id','AOP_Case_Events','aop_case_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d3ec7d1f-c935-bb81-bf83-6463926c28bc','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4169ebf-dd20-7fb6-ca6a-64639271a792','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('d4cc33ff-99d0-25c9-1ff2-646392c400ab','aop_case_events_assigned_user','Users','users','id','AOP_Case_Events','aop_case_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4ce3f82-eb8f-3f69-6e5c-6463929abef7','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4e2fdbf-1493-be7d-cc65-64639293d8ac','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('d58cb797-9f12-7d0f-9a56-64639269c963','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('d5bd749c-a587-3287-35b2-6463928c60d4','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5c69998-308c-746f-531f-646392a30a2f','cases_aop_case_events','Cases','cases','id','AOP_Case_Events','aop_case_events','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5feb714-0a42-d0ec-24ba-6463927558a5','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('d68e0600-1dac-b5ba-25b2-646392a0fb3c','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('d6bdf9c9-2eb6-5277-bba8-646392da6c80','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d71273cd-ceb3-4117-fe5b-646392b064f7','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('d7c2a06f-aaaf-ab98-218b-646392588175','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('d8428770-2d1e-dafe-c67a-646392dc227c','aop_case_updates_modified_user','Users','users','id','AOP_Case_Updates','aop_case_updates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d8503cd5-8bcc-39d0-f21d-646392ab75e4','aok_knowledgebase_categories','AOK_KnowledgeBase','aok_knowledgebase','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','id','aok_knowledgebase_categories','aok_knowledgebase_id','aok_knowledge_base_categories_id','many-to-many',NULL,NULL,0,0),('d8ca4554-3997-53c4-0bc4-6463926cd1e6','am_projecttemplates_project_1','AM_ProjectTemplates','am_projecttemplates','id','Project','project','id','am_projecttemplates_project_1_c','am_projecttemplates_project_1am_projecttemplates_ida','am_projecttemplates_project_1project_idb','many-to-many',NULL,NULL,0,0),('d8f6350e-389c-f40c-dc8e-64639276a23d','aop_case_updates_created_by','Users','users','id','AOP_Case_Updates','aop_case_updates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d93ba047-6ed5-5b21-ed0c-6463927faefb','am_projecttemplates_contacts_1','AM_ProjectTemplates','am_projecttemplates','id','Contacts','contacts','id','am_projecttemplates_contacts_1_c','am_projecttemplates_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('d9a2a41a-3c5f-f5be-28f4-646392aa729f','am_projecttemplates_users_1','AM_ProjectTemplates','am_projecttemplates','id','Users','users','id','am_projecttemplates_users_1_c','am_projecttemplates_ida','users_idb','many-to-many',NULL,NULL,0,0),('d9b9b152-efaf-a9bf-4c29-64639214330d','aop_case_updates_assigned_user','Users','users','id','AOP_Case_Updates','aop_case_updates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('da262e43-64af-c63e-6b96-646392a38a8f','securitygroups_projecttask','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('da303315-4e3c-831d-1e9b-64639221c034','am_tasktemplates_am_projecttemplates','AM_ProjectTemplates','am_projecttemplates','id','AM_TaskTemplates','am_tasktemplates','id','am_tasktemplates_am_projecttemplates_c','am_tasktemplates_am_projecttemplatesam_projecttemplates_ida','am_tasktemplates_am_projecttemplatesam_tasktemplates_idb','many-to-many',NULL,NULL,0,0),('da581fd1-8f71-658b-5d7d-64639297a331','cases_aop_case_updates','Cases','cases','id','AOP_Case_Updates','aop_case_updates','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dab80af2-422c-cd5b-8760-646392eea6e1','aos_contracts_documents','AOS_Contracts','aos_contracts','id','Documents','documents','id','aos_contracts_documents','aos_contracts_id','documents_id','many-to-many',NULL,NULL,0,0),('dafdd8e3-69c4-565e-45de-646392be6a35','aop_case_updates_notes','AOP_Case_Updates','aop_case_updates','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOP_Case_Updates',0,0),('db536bce-96fa-16dd-a4df-6463922b8d23','aos_quotes_aos_contracts','AOS_Quotes','aos_quotes','id','AOS_Contracts','aos_contracts','id','aos_quotes_os_contracts_c','aos_quotese81e_quotes_ida','aos_quotes4dc0ntracts_idb','many-to-many',NULL,NULL,0,0),('db5e104f-0435-21d0-a3af-646392d75152','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('dbcb0846-3dcb-8300-e239-646392a2717e','aos_quotes_aos_invoices','AOS_Quotes','aos_quotes','id','AOS_Invoices','aos_invoices','id','aos_quotes_aos_invoices_c','aos_quotes77d9_quotes_ida','aos_quotes6b83nvoices_idb','many-to-many',NULL,NULL,0,0),('dc4eb0d3-ed5e-54d9-739d-64639205e705','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('dc7c33d2-fde3-34a4-3d07-646392da25f6','aos_quotes_project','AOS_Quotes','aos_quotes','id','Project','project','id','aos_quotes_project_c','aos_quotes1112_quotes_ida','aos_quotes7207project_idb','many-to-many',NULL,NULL,0,0),('dcab5738-c034-00df-9292-6463924c04f3','aor_reports_modified_user','Users','users','id','AOR_Reports','aor_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dcfca5f3-943f-e68f-dda2-64639263d828','aow_processed_aow_actions','AOW_Processed','aow_processed','id','AOW_Actions','aow_actions','id','aow_processed_aow_actions','aow_processed_id','aow_action_id','many-to-many',NULL,NULL,0,0),('dd0aa731-78ab-015f-4a36-646392f47b18','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('dd3b508e-ab13-04de-71e6-646392573ad5','aor_reports_created_by','Users','users','id','AOR_Reports','aor_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ddaa9c16-f784-889e-74fe-646392798052','aor_reports_assigned_user','Users','users','id','AOR_Reports','aor_reports','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ddbca571-6ad2-5339-5dd3-6463929cf946','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('ddc48474-342a-ff8c-a092-646392152da8','fp_event_locations_fp_events_1','FP_Event_Locations','fp_event_locations','id','FP_events','fp_events','id','fp_event_locations_fp_events_1_c','fp_event_locations_fp_events_1fp_event_locations_ida','fp_event_locations_fp_events_1fp_events_idb','many-to-many',NULL,NULL,0,0),('de367479-d725-4a10-088a-646392ce789e','securitygroups_aor_reports','SecurityGroups','securitygroups','id','AOR_Reports','aor_reports','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOR_Reports',0,0),('de736732-8df3-6a3a-535f-646392f2f03f','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('de7b69ea-794a-d69a-9e00-6463922c0d5e','fp_events_contacts','FP_events','fp_events','id','Contacts','contacts','id','fp_events_contacts_c','fp_events_contactsfp_events_ida','fp_events_contactscontacts_idb','many-to-many',NULL,NULL,0,0),('deab0895-377f-a605-838e-646392dff5e5','aor_reports_aor_fields','AOR_Reports','aor_reports','id','AOR_Fields','aor_fields','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df33795c-7b13-1f47-d9c9-646392429d74','fp_events_fp_event_locations_1','FP_events','fp_events','id','FP_Event_Locations','fp_event_locations','id','fp_events_fp_event_locations_1_c','fp_events_fp_event_locations_1fp_events_ida','fp_events_fp_event_locations_1fp_event_locations_idb','many-to-many',NULL,NULL,0,0),('df48c948-d4a3-ba89-80b9-646392ef6483','aor_reports_aor_conditions','AOR_Reports','aor_reports','id','AOR_Conditions','aor_conditions','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('df972890-499e-bc56-7531-646392d4ba26','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dfae354c-5ba2-0154-7d16-646392972ea0','fp_events_leads_1','FP_events','fp_events','id','Leads','leads','id','fp_events_leads_1_c','fp_events_leads_1fp_events_ida','fp_events_leads_1leads_idb','many-to-many',NULL,NULL,0,0),('dfbf3afd-45a6-8768-5ff3-646392ddcf0b','aor_scheduled_reports_aor_reports','AOR_Reports','aor_reports','id','AOR_Scheduled_Reports','aor_scheduled_reports','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0474bee-1f79-f1f4-e461-6463926bf4f1','fp_events_prospects_1','FP_events','fp_events','id','Prospects','prospects','id','fp_events_prospects_1_c','fp_events_prospects_1fp_events_ida','fp_events_prospects_1prospects_idb','many-to-many',NULL,NULL,0,0),('e0759602-cb83-0a57-c054-6463926ee297','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0ee4d8c-45e4-aa9c-3e12-646392a9deb8','jjwg_maps_jjwg_areas','jjwg_Maps','jjwg_maps','id','jjwg_Areas','jjwg_areas','id','jjwg_maps_jjwg_areas_c','jjwg_maps_5304wg_maps_ida','jjwg_maps_41f2g_areas_idb','many-to-many',NULL,NULL,0,0),('e11e001d-0150-ca91-ce01-64639293caee','securitygroups_aos_pdf_templates','SecurityGroups','securitygroups','id','AOS_PDF_Templates','aos_pdf_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_PDF_Templates',0,0),('e1359b74-a91b-df6a-02a5-64639212c203','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e13660cf-0e68-065b-1744-6463926dbe77','aor_fields_modified_user','Users','users','id','AOR_Fields','aor_fields','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e17ab213-1660-dd04-1691-646392d3020e','jjwg_maps_jjwg_markers','jjwg_Maps','jjwg_maps','id','jjwg_Markers','jjwg_markers','id','jjwg_maps_jjwg_markers_c','jjwg_maps_b229wg_maps_ida','jjwg_maps_2e31markers_idb','many-to-many',NULL,NULL,0,0),('e1aafcc0-79e3-f06a-7f78-64639280a9fb','aor_fields_created_by','Users','users','id','AOR_Fields','aor_fields','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e22af6b1-2fb8-8160-d065-6463923d8e83','project_contacts_1','Project','project','id','Contacts','contacts','id','project_contacts_1_c','project_contacts_1project_ida','project_contacts_1contacts_idb','many-to-many',NULL,NULL,0,0),('e2b2997d-bf07-2271-0ed2-646392f89e74','project_users_1','Project','project','id','Users','users','id','project_users_1_c','project_users_1project_ida','project_users_1users_idb','many-to-many',NULL,NULL,0,0),('e32a98bb-61d7-0abf-f7ff-646392b2d771','aor_charts_modified_user','Users','users','id','AOR_Charts','aor_charts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e346bd2d-19ca-daa7-9100-6463926491d4','securitygroups_acl_roles','SecurityGroups','securitygroups','id','ACLRoles','acl_roles','id','securitygroups_acl_roles','securitygroup_id','role_id','many-to-many',NULL,NULL,0,0),('e3626e03-add8-b6af-b73a-646392a84ddd','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e3c7292f-e594-3826-4b19-646392be84b1','aor_charts_created_by','Users','users','id','AOR_Charts','aor_charts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e42b595c-8059-b000-0a3c-646392df4d90','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e49adf35-d454-b5c9-5a93-6463928c07ec','aor_charts_aor_reports','AOR_Reports','aor_reports','id','AOR_Charts','aor_charts','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e4bb9b82-f23e-4489-4d2c-6463926c34df','securitygroups_project_task','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('e4f43da1-544e-8c4b-4ad2-6463920be728','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e56ef312-e33b-795e-aa7e-6463926bb984','securitygroups_prospect_lists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('e5fc9e0b-4f04-a7c9-d799-646392fc7ccb','securitygroups_campaigns','SecurityGroups','securitygroups','id','Campaigns','campaigns','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Campaigns',0,0),('e630b2e9-9db1-8a95-a5e6-6463923db780','securitygroups_users','SecurityGroups','securitygroups','id','Users','users','id','securitygroups_users','securitygroup_id','user_id','many-to-many',NULL,NULL,0,0),('e6c6c3fb-6236-e069-d507-64639237b1f1','surveyquestionoptions_surveyquestionresponses','SurveyQuestionOptions','surveyquestionoptions','id','SurveyQuestionResponses','surveyquestionresponses','id','surveyquestionoptions_surveyquestionresponses','surveyq72c7options_ida','surveyq10d4sponses_idb','many-to-many',NULL,NULL,0,0),('e7196bba-4c2c-5b32-13c4-64639264f92b','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7ca568b-01ea-5454-f473-646392e7a6ec','aor_conditions_modified_user','Users','users','id','AOR_Conditions','aor_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7da7079-9d0b-fbe6-c872-646392225759','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e84c3dd5-0c3a-7e43-abe2-646392b0a8a6','aor_conditions_created_by','Users','users','id','AOR_Conditions','aor_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e8b8413a-e380-9c6d-f163-64639220cceb','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e99873bd-7879-2552-64db-64639288e8e7','aor_scheduled_reports_modified_user','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e99c4357-d0aa-91f3-32b0-646392b42fc5','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea3c3113-42ed-3bf2-4e44-646392d36e49','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea47ad8b-4829-86e9-a129-64639258103f','aor_scheduled_reports_created_by','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eac50636-acd8-577b-a4fe-646392eb736d','securitygroups_aor_scheduled_reports','SecurityGroups','securitygroups','id','AOR_Scheduled_Reports','aor_scheduled_reports','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOR_Scheduled_Reports',0,0),('eadae4c9-33a1-f074-b8a8-646392aa6ecd','campaign_notes','Campaigns','campaigns','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Campaigns',0,0),('eb707f52-7242-dc83-7642-646392495e69','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec354db6-bb1b-2ba9-95a7-6463925d8b09','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ecd5d684-f91c-57fe-c54e-646392a33ddd','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ecd6fe08-c04b-054e-8025-646392d69c03','aos_contracts_modified_user','Users','users','id','AOS_Contracts','aos_contracts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed413bbf-3574-5b8a-9055-646392149dc3','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('edd3a563-cccd-1e2b-3cb2-646392f93c8c','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ede97700-d8e6-e931-82b9-64639287a1d3','aos_contracts_created_by','Users','users','id','AOS_Contracts','aos_contracts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee48994f-df15-8604-a11c-64639206f4db','surveyresponses_campaigns','Campaigns','campaigns','id','SurveyResponses','surveyresponses','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee7da484-fe6e-b428-b3fc-646392010658','aos_contracts_assigned_user','Users','users','id','AOS_Contracts','aos_contracts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ef7f7c2a-f9a7-1551-ce70-6463929d5dd0','securitygroups_aos_contracts','SecurityGroups','securitygroups','id','AOS_Contracts','aos_contracts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Contracts',0,0),('ef8f1732-154f-0b15-921a-64639281433f','prospectlists_assigned_user','Users','users','id','ProspectLists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0423f18-2f92-1d7b-2d4f-64639296af9b','securitygroups_prospectlists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('f06f475f-b707-4bec-55c6-6463928ea114','aos_contracts_tasks','AOS_Contracts','aos_contracts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('f1a148af-56d6-0a24-daee-64639243d068','aos_contracts_notes','AOS_Contracts','aos_contracts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('f1ce7a3e-7e33-b73a-c743-64639279dec6','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f258a78f-5c92-9df2-5246-646392768509','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f26ee084-cc26-2472-67e6-646392bd60ce','aos_contracts_meetings','AOS_Contracts','aos_contracts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('f2f063f2-5021-e619-9f40-6463927efba0','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f316a79c-4192-fc7a-9a43-646392783211','aos_contracts_calls','AOS_Contracts','aos_contracts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('f3b8343d-6f58-dc8d-d4f2-646392396424','securitygroups_prospects','SecurityGroups','securitygroups','id','Prospects','prospects','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Prospects',0,0),('f3c8d439-3418-fdfc-5982-646392ab39c2','aos_contracts_aos_products_quotes','AOS_Contracts','aos_contracts','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `releases` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `list_order` int DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timer_email` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_event_module` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_event_module_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_willexecute` int DEFAULT '-1',
  `popup_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders_invitees`
--

DROP TABLE IF EXISTS `reminders_invitees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders_invitees` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reminder_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `related_invitee_module` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_invitee_module_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders_invitees`
--

LOCK TABLES `reminders_invitees` WRITE;
/*!40000 ALTER TABLE `reminders_invitees` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders_invitees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `modules` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_search` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `search_module` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contents` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('c6242ccb-c097-5587-eac5-645e568b5690',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Process Workflow Tasks','function::processAOW_Workflow','2015-01-01 11:45:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('c7d24556-6500-cdb0-1ffd-645e56ae3732',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Run Report Generation Scheduled Tasks','function::aorRunScheduledReports','2015-01-01 19:00:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',1),('c91ae915-64f2-7880-7cf2-645e560e4ca6',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Prune Tracker Tables','function::trimTracker','2015-01-01 07:15:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('ca98f7e6-16ad-c002-9643-645e56fdf225',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxesAOP','2015-01-01 18:30:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('ceb593cd-b6e8-44d8-d7e3-645e567eb649',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2015-01-01 17:15:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('cfece136-21b9-9d95-87d5-645e563c1133',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2015-01-01 09:00:01',NULL,'0::2-6::*::*::*',NULL,NULL,NULL,'Active',1),('d13440af-499c-1630-8af7-645e56552fa0',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Prune Database on 1st of Month','function::pruneDatabase','2015-01-01 10:45:01',NULL,'0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('d25e86ac-109a-e90f-efe6-645e5670b87f',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Perform Lucene Index','function::aodIndexUnindexed','2015-01-01 16:15:01',NULL,'0::0::*::*::*',NULL,NULL,NULL,'Active',0),('d3b06bcd-1d2f-8ad4-aeca-645e56b297bd',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Optimise AOD Index','function::aodOptimiseIndex','2015-01-01 19:00:01',NULL,'0::*/3::*::*::*',NULL,NULL,NULL,'Active',0),('d4ed0c89-d336-2d78-cdd7-645e5613753b',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2015-01-01 15:45:01',NULL,'*::*::*::*::*',NULL,NULL,NULL,'Active',0),('d649af34-802d-cbd7-c499-645e5674304b',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Clean Jobs Queue','function::cleanJobQueue','2015-01-01 17:00:01',NULL,'0::5::*::*::*',NULL,NULL,NULL,'Active',0),('d76d5075-9e80-0107-3973-645e566d8993',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2015-01-01 19:45:01',NULL,'0::3::1::*::*',NULL,NULL,NULL,'Active',0),('d87ac3cd-1fa2-700e-a4ab-645e56b9e13d',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Prune SuiteCRM Feed Tables','function::trimSugarFeeds','2015-01-01 08:45:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('dab5b325-9ac7-108c-3580-645e563743ff',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Google Calendar Sync','function::syncGoogleCalendar','2015-01-01 19:15:01',NULL,'*/15::*::*::*::*',NULL,NULL,NULL,'Active',0);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
INSERT INTO `securitygroups` VALUES ('abee2ca1-b9cd-bb79-4900-6463980b8e25','Security Group test','2023-05-16 14:50:02','2023-05-16 14:50:02','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','',0,'1cfb5d64-05b5-0167-275e-64637d811e9d',1);
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_acl_roles`
--

DROP TABLE IF EXISTS `securitygroups_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `securitygroup_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_acl_roles`
--

LOCK TABLES `securitygroups_acl_roles` WRITE;
/*!40000 ALTER TABLE `securitygroups_acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_audit`
--

DROP TABLE IF EXISTS `securitygroups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_audit`
--

LOCK TABLES `securitygroups_audit` WRITE;
/*!40000 ALTER TABLE `securitygroups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_default`
--

DROP TABLE IF EXISTS `securitygroups_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups_default` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `securitygroup_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_default`
--

LOCK TABLES `securitygroups_default` WRITE;
/*!40000 ALTER TABLE `securitygroups_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_records`
--

DROP TABLE IF EXISTS `securitygroups_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups_records` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `securitygroup_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `record_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_records`
--

LOCK TABLES `securitygroups_records` WRITE;
/*!40000 ALTER TABLE `securitygroups_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_users`
--

DROP TABLE IF EXISTS `securitygroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_users`
--

LOCK TABLES `securitygroups_users` WRITE;
/*!40000 ALTER TABLE `securitygroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spots` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_general_ci,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_module` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `related_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions`
--

DROP TABLE IF EXISTS `surveyquestionoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestionoptions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `survey_question_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions`
--

LOCK TABLES `surveyquestionoptions` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_audit`
--

DROP TABLE IF EXISTS `surveyquestionoptions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestionoptions_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionoptions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_audit`
--

LOCK TABLES `surveyquestionoptions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionoptions_surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionoptions_surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `surveyq72c7options_ida` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionoptions_surveyquestionresponses`
--

LOCK TABLES `surveyquestionoptions_surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionoptions_surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses`
--

DROP TABLE IF EXISTS `surveyquestionresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestionresponses` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_general_ci,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `surveyresponse_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses`
--

LOCK TABLES `surveyquestionresponses` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestionresponses_audit`
--

DROP TABLE IF EXISTS `surveyquestionresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestionresponses_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestionresponses_audit`
--

LOCK TABLES `surveyquestionresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestionresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions`
--

DROP TABLE IF EXISTS `surveyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestions` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions`
--

LOCK TABLES `surveyquestions` WRITE;
/*!40000 ALTER TABLE `surveyquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyquestions_audit`
--

DROP TABLE IF EXISTS `surveyquestions_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyquestions_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyquestions_audit`
--

LOCK TABLES `surveyquestions_audit` WRITE;
/*!40000 ALTER TABLE `surveyquestions_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyquestions_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses`
--

DROP TABLE IF EXISTS `surveyresponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyresponses` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `happiness` int DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `campaign_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `survey_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses`
--

LOCK TABLES `surveyresponses` WRITE;
/*!40000 ALTER TABLE `surveyresponses` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyresponses_audit`
--

DROP TABLE IF EXISTS `surveyresponses_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyresponses_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_surveyresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyresponses_audit`
--

LOCK TABLES `surveyresponses_audit` WRITE;
/*!40000 ALTER TABLE `surveyresponses_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveyresponses_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'LBL_DRAFT',
  `submit_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Submit',
  `satisfied_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Satisfied',
  `neither_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Dissatisfied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys_audit`
--

DROP TABLE IF EXISTS `surveys_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys_audit` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_value_string` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_value_text` text COLLATE utf8mb4_general_ci,
  `after_value_text` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_surveys_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys_audit`
--

LOCK TABLES `surveys_audit` WRITE;
/*!40000 ALTER TABLE `surveys_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `surveys_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES ('72fe0258-5f74-744a-9b3d-6463bef8c04b','test','2023-05-16 17:34:48','2023-05-16 17:35:21','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d',NULL,0,'ae816cc0-77b4-1967-ec23-646399769bfc','In Progress',1,NULL,0,'2023-05-15 22:00:00','Accounts','','','High');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesectionline`
--

DROP TABLE IF EXISTS `templatesectionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatesectionline` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `deleted` tinyint(1) DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grp` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ord` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesectionline`
--

LOCK TABLES `templatesectionline` WRITE;
/*!40000 ALTER TABLE `templatesectionline` DISABLE KEYS */;
INSERT INTO `templatesectionline` VALUES ('1b60a86f-0ec6-6186-dcaa-6463a88a4e0b','Headline','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<h1>Add your headline here..</h1>',0,'include/javascript/mozaik/tpls/default/thumbs/headline.png',NULL,1),('1f25bbc8-b4bb-ff71-76ad-6463a8d5decf','Content','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<h2>Title</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</p>',0,'include/javascript/mozaik/tpls/default/thumbs/content1.png',NULL,2),('27c015d6-baff-6f0c-425d-6463a829b9e2','Content with two columns','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><h2>Title</h2></td><td><h2>Title</h2></td></tr><tr><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/content2.png',NULL,3),('2af28f51-39be-57f5-5bdf-6463a8b71eee','Content with three columns','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><h2>Title</h2></td><td><h2>Title</h2></td><td><h2>Title</h2></td></tr><tr><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/content3.png',NULL,4),('2ecfcc3e-bf1d-5864-9b43-6463a8d55b88','Content with left image','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" width=\"130\" alt=\"sample.jpg\" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/image1left.png',NULL,5),('31d22927-9630-187b-867f-6463a8a1a6f8','Content with right image','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" width=\"130\" alt=\"sample.jpg\" /></td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/image1right.png',NULL,6),('34bbff06-649e-18bd-736f-6463a8f626b1','Content with two image','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" width=\"130\" alt=\"sample.jpg\" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" width=\"130\" alt=\"sample.jpg\" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/image2.png',NULL,7),('38795804-55bd-c670-f068-6463a8dcd5b6','Content with three image','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<table style=\"width:100%;\"><tbody><tr><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" alt=\"sample.jpg\" /></td><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" alt=\"sample.jpg\" /></td><td><img src=\"http://162.55.57.5/include/javascript/mozaik/tpls/default/images/sample.jpg\" alt=\"sample.jpg\" /></td></tr><tr><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>',0,'include/javascript/mozaik/tpls/default/thumbs/image3.png',NULL,8),('3adf89dd-f5e5-fb10-fb97-6463a800f1ac','Footer','2023-05-16 16:00:40','2023-05-16 16:00:40','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','<p class=\"footer\">Take your footer contents and information here..</p>',0,'include/javascript/mozaik/tpls/default/thumbs/footer.png',NULL,9);
/*!40000 ALTER TABLE `templatesectionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_summary` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (1,'f14e896d-e3e5-0ade-ab12-64637c8cf60b','1','Users','a9073e6e-08a7-f63b-2e4e-64637c6dc2d0','Kovalov','2023-05-16 12:54:12','detailview','1s29t6qc2ue27ckk69he29bu1r',1,0),(4,'4fab6fb4-b4de-a7c9-3116-64637e7256f4','1','Users','1cfb5d64-05b5-0167-275e-64637d811e9d','Tung B','2023-05-16 12:58:49','detailview','1s29t6qc2ue27ckk69he29bu1r',1,0),(5,'9bdad710-f1c8-216a-7243-64638436b1b8','1','ACLRoles','99059629-c3c9-f60e-1886-6463848ed01a','Marketing','2023-05-16 13:27:39','save','1s29t6qc2ue27ckk69he29bu1r',1,0),(7,'a296d21a-5934-b3f7-bb08-646384910b22','1','ACLRoles','9e92646e-9a36-efb1-0031-646384eba694','Producers','2023-05-16 13:28:02','save','1s29t6qc2ue27ckk69he29bu1r',1,0),(9,'cbfe8ea5-0b46-e39d-dec6-646384b864ef','1','ACLRoles','c8d3aa12-e018-0d5f-bb4d-646384da0a66','C level','2023-05-16 13:28:16','save','1s29t6qc2ue27ckk69he29bu1r',1,0),(11,'cd7b8a9f-974d-e18e-226e-6463850e65fa','1','ACLRoles','ca199c29-5be9-030c-06d5-6463859d0018','Sales mgr','2023-05-16 13:28:36','save','1s29t6qc2ue27ckk69he29bu1r',1,0),(15,'d87f48bf-3a18-ba36-3247-64638534eb14','1','ACLRoles','9442f9e6-ad82-5d05-b410-646385bd5a31','Sales','2023-05-16 13:29:17','detailview','1s29t6qc2ue27ckk69he29bu1r',1,0),(18,'2b514c54-3d29-b1c9-2a69-646387b96860','1cfb5d64-05b5-0167-275e-64637d811e9d','Currencies','32f6b6af-e6f3-357e-c546-646387db5561','Base Implementation.  Should be overridden.','2023-05-16 13:38:37','save','4ti99io559ic8u7is6n66gt4gf',1,0),(19,'cfc8a35d-6b85-beb7-f1fe-64638765c60b','1cfb5d64-05b5-0167-275e-64637d811e9d','Currencies','d5a10887-17b4-3209-bca8-646387c5a162','Base Implementation.  Should be overridden.','2023-05-16 13:39:18','save','4ti99io559ic8u7is6n66gt4gf',1,0),(20,'e8b8c30c-29e0-37f4-8852-646387c92b5a','1cfb5d64-05b5-0167-275e-64637d811e9d','Currencies','ed85bec6-3712-da8e-bbd3-64638797d688','Base Implementation.  Should be overridden.','2023-05-16 13:39:54','save','4ti99io559ic8u7is6n66gt4gf',1,0),(22,'3c709662-a1cc-7604-d3ed-6463933b180c','1cfb5d64-05b5-0167-275e-64637d811e9d','Users','1cfb5d64-05b5-0167-275e-64637d811e9d','Tung B','2023-05-16 14:28:25','detailview','mbe2ubnu929dpbt20kc012sgkh',1,0),(23,'c3712932-7da2-dbb8-7cae-6463986bd7f5','1cfb5d64-05b5-0167-275e-64637d811e9d','SecurityGroups','abee2ca1-b9cd-bb79-4900-6463980b8e25','Security Group test','2023-05-16 14:50:02','detailview','mbe2ubnu929dpbt20kc012sgkh',1,0),(25,'59d60e74-8ea8-a274-cf92-6463995ef6fe','1cfb5d64-05b5-0167-275e-64637d811e9d','Users','ae816cc0-77b4-1967-ec23-646399769bfc','Kira Test','2023-05-16 14:54:16','editview','mbe2ubnu929dpbt20kc012sgkh',1,0),(26,'b0d90f1c-704a-a552-7d30-64639a2aa4bb','1cfb5d64-05b5-0167-275e-64637d811e9d','Users','bf6995cc-1a50-0a14-f507-64639aac50fd','Thanh Nguyen Long','2023-05-16 14:58:40','detailview','mbe2ubnu929dpbt20kc012sgkh',1,0),(29,'f3f35ad7-4bbb-5132-3a32-6463a847ebb2','1cfb5d64-05b5-0167-275e-64637d811e9d','TemplateSectionLine','3adf89dd-f5e5-fb10-fb97-6463a800f1ac','Footer','2023-05-16 16:00:40','save','vifu99mgo8f05glojock8u9u4b',1,0),(38,'bddad629-3c97-481f-7297-6463aaedcf20','1cfb5d64-05b5-0167-275e-64637d811e9d','EmailTemplates','5b1e1bff-a964-eca2-e98c-6463a995f9b0','Task status changed','2023-05-16 16:06:39','editview','vifu99mgo8f05glojock8u9u4b',1,0),(39,'5dd0b471-81c5-c7b8-f2b3-6463aa67b68a','1cfb5d64-05b5-0167-275e-64637d811e9d','EmailTemplates','51ad0ce5-542f-6a2e-6a33-6463a90a570e','Email notification on user assignment to tasks','2023-05-16 16:06:52','editview','vifu99mgo8f05glojock8u9u4b',1,0),(46,'6d4d014f-87f4-51cc-2f83-6463be4314f8','1cfb5d64-05b5-0167-275e-64637d811e9d','AOW_WorkFlow','6128a86c-f21c-1fe5-5606-6463ac49ffab','Send notification when user change status on tasks','2023-05-16 17:33:56','detailview','vifu99mgo8f05glojock8u9u4b',1,0),(47,'d99c7fbb-2b34-984d-8dcb-6463be5bf2c5','1cfb5d64-05b5-0167-275e-64637d811e9d','Users','37f516c7-8bab-bd9f-b1f9-64639e43000e','lam Mai Hai','2023-05-16 17:33:58','detailview','vifu99mgo8f05glojock8u9u4b',1,0),(59,'16f41b64-daf7-771e-5296-6463c69d9e66','1cfb5d64-05b5-0167-275e-64637d811e9d','Tasks','72fe0258-5f74-744a-9b3d-6463bef8c04b','test','2023-05-16 18:09:31','detailview','vifu99mgo8f05glojock8u9u4b',1,0),(61,'b4a54d64-9372-e954-15fc-6465b8933754','1cfb5d64-05b5-0167-275e-64637d811e9d','AOW_WorkFlow','713af385-8bf3-b273-e6c1-6463a835d3ca','[1.2] Email notification on user assignment to tasks','2023-05-18 05:34:36','detailview','n41dmeu1d9vgb9l8k528f66n4r',1,0);
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `id_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manifest` longtext COLLATE utf8mb4_general_ci,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
INSERT INTO `upgrade_history` VALUES ('cfb0d13e-fb35-c682-fd24-646389ff1c6e','upload/upgrades/module/flavorhub2023_05_16_134600.zip','be0ae7c440c2b4676464ca86b20aa8ce','module','installed','1684244760','flavorhub','','flavorhub','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MToiZiI7czo2OiJhdXRob3IiO3M6MToidCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjk6ImZsYXZvcmh1YiI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMjMtMDUtMTYgMTM6NDY6MDAiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNjg0MjQ0NzYwO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czo5OiJmbGF2b3JodWIiO3M6NToiYmVhbnMiO2E6Mzp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6ODoiZl9PcmRlcnMiO3M6NToiY2xhc3MiO3M6ODoiZl9PcmRlcnMiO3M6NDoicGF0aCI7czoyOToibW9kdWxlcy9mX09yZGVycy9mX09yZGVycy5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJmX1ByaWNlbGlzdCI7czo1OiJjbGFzcyI7czoxMToiZl9QcmljZWxpc3QiO3M6NDoicGF0aCI7czozNToibW9kdWxlcy9mX1ByaWNlbGlzdC9mX1ByaWNlbGlzdC5waHAiO3M6MzoidGFiIjtiOjE7fWk6MjthOjQ6e3M6NjoibW9kdWxlIjtzOjExOiJmX0N1c3RvbWVycyI7czo1OiJjbGFzcyI7czoxMToiZl9DdXN0b21lcnMiO3M6NDoicGF0aCI7czozNToibW9kdWxlcy9mX0N1c3RvbWVycy9mX0N1c3RvbWVycy5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjA6e31zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjA6e31zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjM6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9mX09yZGVycyI7czoyOiJ0byI7czoxNjoibW9kdWxlcy9mX09yZGVycyI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czo0MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9mX1ByaWNlbGlzdCI7czoyOiJ0byI7czoxOToibW9kdWxlcy9mX1ByaWNlbGlzdCI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo0MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9mX0N1c3RvbWVycyI7czoyOiJ0byI7czoxOToibW9kdWxlcy9mX0N1c3RvbWVycyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=','2023-05-16 13:46:00',1);
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contents` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('11385b16-8450-18e7-42e7-646385cc830a','SecurityGroups2_SECURITYGROUP',0,'2023-05-16 13:29:57','2023-05-16 13:29:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('122df583-0816-48ff-7539-645e56a44028','Home2_CALL',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('15aed5b7-be6e-3bd2-4cba-645e5653727f','Home2_MEETING',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('188c54c8-6ea1-37c3-52e3-645e56721a58','Home2_OPPORTUNITY',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1ad5100d-98de-1d8d-2f15-645e5692ca4e','Home2_ACCOUNT',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1d81c688-4e89-e9c0-8a39-645e562d6779','Home2_LEAD',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1fb0c318-0de4-f3b5-9dd4-6465a4df0c70','Accounts2_ACCOUNT',0,'2023-05-18 04:08:15','2023-05-18 04:08:15','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('206e48ad-38d7-9712-2464-645e5641c85e','Home2_SUGARFEED',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('216f6f66-16ae-3037-757c-646388b32ddb','Schedulers2_SCHEDULER',0,'2023-05-16 13:41:46','2023-05-16 13:41:46','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('274902f2-8511-deda-ca4f-6463991fd504','Emails',0,'2023-05-16 14:54:17','2023-05-16 14:54:17','ae816cc0-77b4-1967-ec23-646399769bfc','YTowOnt9'),('2c930f4d-88e5-06e1-a987-646384d6bbc1','ACLRoles2_ACLROLE',0,'2023-05-16 13:27:27','2023-05-16 13:27:27','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2d4ccac9-88b3-4653-db24-64637d2d2b08','global',0,'2023-05-16 12:55:00','2023-05-18 05:35:34','1cfb5d64-05b5-0167-275e-64637d811e9d','YTo1Mjp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6MTY6InN3YXBfbGFzdF92aWV3ZWQiO3M6MDoiIjtzOjE0OiJzd2FwX3Nob3J0Y3V0cyI7czowOiIiO3M6MTk6Im5hdmlnYXRpb25fcGFyYWRpZ20iO3M6MjoiZ20iO3M6MjA6InNvcnRfbW9kdWxlc19ieV9uYW1lIjtzOjA6IiI7czoxMzoic3VicGFuZWxfdGFicyI7czowOiIiO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7czo0OiIxODAwIjtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtzOjQ6IjM2MDAiO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvV2Fyc2F3IjtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzY6IjMyZjZiNmFmLWU2ZjMtMzU3ZS1jNTQ2LTY0NjM4N2RiNTU2MSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIxIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTU6ImVtYWlsX2xpbmtfdHlwZSI7czo1OiJzdWdhciI7czoxMToiZWRpdG9yX3R5cGUiO3M6NjoibW96YWlrIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6ODoic3VidGhlbWUiO3M6NDoiRGF3biI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjEwOiJkYXRlZm9ybWF0IjtzOjU6Im0vZC9ZIjtzOjEwOiJ0aW1lZm9ybWF0IjtzOjQ6Img6aWEiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjY6IlVzZXJzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjExOiJTY2hlZHVsZXJzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjE1OiJTZWN1cml0eUdyb3Vwc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czoxMDoiRW1wbG95ZWVzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjEzOiJBT1dfV29ya0Zsb3dRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6MTU6IkVtYWlsVGVtcGxhdGVzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjY6IlRhc2tzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO31zOjk6IkFjY291bnRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjY6IkxlYWRzUSI7YToxOntzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO31zOjc6IkVtYWlsc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9fQ=='),('317d8bd9-86f8-e7cb-9a7c-64637d5e4115','GoogleSync',0,'2023-05-16 12:55:00','2023-05-16 12:58:49','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('33767cde-9313-03b0-7016-64637eb0f5e7','Emails',0,'2023-05-16 12:58:49','2023-05-16 12:58:49','1cfb5d64-05b5-0167-275e-64637d811e9d','YTowOnt9'),('4553720d-7862-f355-d891-64639eb0975c','global',0,'2023-05-16 15:19:17','2023-05-16 15:19:17','37f516c7-8bab-bd9f-b1f9-64639e43000e','YTozODp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mzoib2ZmIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6Mjoib24iO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjAiO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjI6InV0IjtzOjE6IjAiO3M6ODoiY3VycmVuY3kiO3M6MzY6IjMyZjZiNmFmLWU2ZjMtMzU3ZS1jNTQ2LTY0NjM4N2RiNTU2MSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjM6Ikg6aSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7fQ=='),('464bff61-c3a5-e636-3ae0-645e56c012a9','Contacts2_CONTACT',0,'2023-05-12 15:10:15','2023-05-12 15:10:15','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('490cd0a9-ab53-19ad-cf29-64639e833113','GoogleSync',0,'2023-05-16 15:19:17','2023-05-16 15:19:17','37f516c7-8bab-bd9f-b1f9-64639e43000e','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('4bf7594a-2d77-5492-f93e-6465a4be2e46','Leads2_LEAD',0,'2023-05-18 04:08:32','2023-05-18 04:08:32','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('58747874-9533-aed5-0125-645e57c0ae9d','Documents2_DOCUMENT',0,'2023-05-12 15:11:05','2023-05-12 15:11:05','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('58814ec3-87a0-9fad-13f6-646386c78a0e','Home2_LEAD_63c1d4ab-a091-ebb8-fc72-6463866aa9dc',0,'2023-05-16 13:33:18','2023-05-16 13:33:18','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('73d6a70e-7b21-7aeb-69e6-6463a86badcc','AOW_WorkFlow2_AOW_WORKFLOW',0,'2023-05-16 15:58:03','2023-05-16 15:58:03','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('75ecc23f-ea62-d97d-30b9-646386d5cbd5','Home',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjYzODVkOGVlLWVkZjAtNTUxNS1hNWVlLTY0NjM4NmQyZWI4ZSI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjYzOTQwOTc4LTY2ZWUtMjE0Yi02NGU5LTY0NjM4NjZhZDllYSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjYzOWY5NWY1LWJkMTQtM2Q3Yi1hMjgwLTY0NjM4NjQ4MDg5NSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjYzYTg5NTc4LTNjNzMtNzE1ZS1mNTIzLTY0NjM4NmIyYTA2ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNjNiNjc4MGItNTI5ZC01NmQyLTIwZWMtNjQ2Mzg2MmRmNDllIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiNjNjMWQ0YWItYTA5MS1lYmI4LWZjNzItNjQ2Mzg2NmFhOWRjIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI2Mzk0MDk3OC02NmVlLTIxNGItNjRlOS02NDYzODY2YWQ5ZWEiO2k6MTtzOjM2OiI2MzlmOTVmNS1iZDE0LTNkN2ItYTI4MC02NDYzODY0ODA4OTUiO2k6MjtzOjM2OiI2M2E4OTU3OC0zYzczLTcxNWUtZjUyMy02NDYzODZiMmEwNmUiO2k6MztzOjM2OiI2M2I2NzgwYi01MjlkLTU2ZDItMjBlYy02NDYzODYyZGY0OWUiO2k6NDtzOjM2OiI2M2MxZDRhYi1hMDkxLWViYjgtZmM3Mi02NDYzODY2YWE5ZGMiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjYzODVkOGVlLWVkZjAtNTUxNS1hNWVlLTY0NjM4NmQyZWI4ZSI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('78aec804-aa27-2034-6dae-646386193de0','Home2_CALL',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('7b198cc6-6e36-ab47-e58c-646386a27e40','Home2_MEETING',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('7e5267bd-e1ef-d14d-4a07-6463866fbd8f','Home2_OPPORTUNITY',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('81f1a4b8-a0c6-2cba-3e4a-646386f9f7e3','Home2_ACCOUNT',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('843c8f26-d9ba-ecaa-f830-64638652c00e','Home2_LEAD',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8689cf16-adc6-cf03-b557-6463868b06f8','Home2_SUGARFEED',0,'2023-05-16 13:33:17','2023-05-16 13:33:17','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8d72dfb6-bd19-9d06-66dd-645e567b0f3a','Accounts2_ACCOUNT',0,'2023-05-12 15:10:10','2023-05-12 15:10:10','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('92b7b391-a8e3-9c8c-ad8d-646372d6909e','Users2_USER',0,'2023-05-16 12:07:48','2023-05-16 12:07:48','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b349b0a2-030e-b1d0-c65d-646392028841','SecurityGroups2_SECURITYGROUP',0,'2023-05-16 14:26:01','2023-05-16 14:26:01','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b8ae92c3-3432-abad-40f0-64637cc8f422','global',0,'2023-05-16 12:54:12','2023-05-16 14:25:09','a9073e6e-08a7-f63b-2e4e-64637c6dc2d0','YTozODp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mzoib2ZmIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6Mjoib24iO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjAiO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjI6InV0IjtzOjE6IjAiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO2k6MTt9'),('ba03ac98-eb6a-4051-b8da-646399ffdbf6','global',0,'2023-05-16 14:54:07','2023-05-16 14:54:17','ae816cc0-77b4-1967-ec23-646399769bfc','YTozODp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mzoib2ZmIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6Mjoib24iO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjAiO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzY6IjMyZjZiNmFmLWU2ZjMtMzU3ZS1jNTQ2LTY0NjM4N2RiNTU2MSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NDoiZmRvdyI7czoxOiIwIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE2OiJleHBvcnRfZGVsaW1pdGVyIjtzOjE6IiwiO3M6MjI6ImRlZmF1bHRfZXhwb3J0X2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjM6Im9mZiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjg6InN1YnRoZW1lIjtzOjQ6IkRhd24iO3M6MTU6ImxvZ2luZXhwaXJhdGlvbiI7czoxOiIwIjtzOjc6ImxvY2tvdXQiO3M6MDoiIjtzOjExOiJsb2dpbmZhaWxlZCI7czoxOiIwIjt9'),('bc34682f-15df-fde2-ab08-64637c0a8df2','GoogleSync',0,'2023-05-16 12:54:12','2023-05-16 12:54:12','a9073e6e-08a7-f63b-2e4e-64637c6dc2d0','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('beb7657b-3171-e8a7-be7e-64639939c57a','GoogleSync',0,'2023-05-16 14:54:07','2023-05-16 14:54:17','ae816cc0-77b4-1967-ec23-646399769bfc','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('c1918bd1-e9fd-69ea-a781-645e56c6eb8c','global',0,'2023-05-12 15:08:06','2023-05-16 13:29:57','1','YTozMDp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImMwMjRmYjY0LWI2YWUtNmI4NC0yM2Y2LTY0NWU1NjU3ZGU3MSI7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoyNToiY291bnRfY29sbGFwc2VkX3N1YnBhbmVscyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjg6InRpbWV6b25lIjtzOjM6IlVUQyI7czoyOiJ1dCI7czoxOiIxIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MDoiIjtzOjEzOiJtYWlsX3NtdHBwb3J0IjtzOjI6IjI1IjtzOjEzOiJtYWlsX3NtdHB1c2VyIjtzOjA6IiI7czoxMzoibWFpbF9zbXRwcGFzcyI7czowOiIiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjM6Im9mZiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MToiMSI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjE7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjEwOiJ1c2VyX3RoZW1lIjtzOjY6IlN1aXRlUCI7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czozOiJBbGwiO3M6OToiQWNjb3VudHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6OToiQ29udGFjdHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fXM6MTA6IkRvY3VtZW50c1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czo2OiJVc2Vyc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czo5OiJBQ0xSb2xlc1EiO2E6MTp7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjt9czoxNToiU2VjdXJpdHlHcm91cHNRIjthOjE6e3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7fX0='),('c3acf995-efe8-a096-8d13-645e5658b8ad','GoogleSync',0,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('c83321b2-e172-9164-553d-645e56aa5ba5','Home2_LEAD_d4a55a68-0e55-3393-42aa-645e56c559ec',0,'2023-05-12 15:09:55','2023-05-12 15:09:55','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ca6871aa-786b-0302-3056-6463a831b557','EmailTemplates2_EMAILTEMPLATE',0,'2023-05-16 15:59:59','2023-05-16 15:59:59','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cbc40444-e160-dd91-f497-64639a45fd74','global',0,'2023-05-16 14:58:39','2023-05-16 14:58:39','bf6995cc-1a50-0a14-f507-64639aac50fd','YTozODp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MDoiIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mzoib2ZmIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6Mjoib24iO3M6MjU6ImNvdW50X2NvbGxhcHNlZF9zdWJwYW5lbHMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxMzoicmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7czoyOiI2MCI7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIwIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtzOjE6IjAiO3M6ODoidGltZXpvbmUiO3M6MTY6IkFzaWEvSG9fQ2hpX01pbmgiO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozNjoiMzJmNmI2YWYtZTZmMy0zNTdlLWM1NDYtNjQ2Mzg3ZGI1NTYxIjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjExOiJlZGl0b3JfdHlwZSI7czo2OiJtb3phaWsiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czo4OiJzdWJ0aGVtZSI7czo0OiJEYXduIjtzOjE1OiJsb2dpbmV4cGlyYXRpb24iO3M6MToiMCI7czo3OiJsb2Nrb3V0IjtzOjA6IiI7czoxMToibG9naW5mYWlsZWQiO3M6MToiMCI7fQ=='),('cf61ec15-e43b-06be-ee24-64639a72e6b1','GoogleSync',0,'2023-05-16 14:58:39','2023-05-16 14:58:39','bf6995cc-1a50-0a14-f507-64639aac50fd','YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),('d92eb942-4f5c-03ef-79ba-6463899fa635','ETag',0,'2023-05-16 13:46:00','2023-05-16 13:46:00','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),('e2cad920-eeec-b43e-3ecc-646398d447cf','Employees2_EMPLOYEE',0,'2023-05-16 14:50:31','2023-05-16 14:50:31','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e36b3be8-637d-ba2d-ed4d-646386bed87e','Users2_USER',0,'2023-05-16 13:33:22','2023-05-16 13:33:22','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e64d051b-0972-ebe1-d512-645e56509a4f','Home',0,'2023-05-12 15:09:53','2023-05-12 15:09:53','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImQ0NGIxNzlkLWQ5NWYtYjc5Yy0yZDA0LTY0NWU1NjMwOGMwMyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImQ0NWQ0MDc0LWY5YzYtNmM0YS1kNmMwLTY0NWU1NmI5NzRiZiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImQ0NmI5ZTQzLWFhMjQtZTFkYy1jNTdlLTY0NWU1NmQ1Mzg2MiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImQ0Nzk0M2I0LTg4YWMtNWNjOS0wYzc4LTY0NWU1Njk0Y2E3MSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDQ5MjA0YzAtZTMxZC1kMjk2LWQ4MjItNjQ1ZTU2ZTU2YWFkIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDRhNTVhNjgtMGU1NS0zMzkzLTQyYWEtNjQ1ZTU2YzU1OWVjIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJkNDVkNDA3NC1mOWM2LTZjNGEtZDZjMC02NDVlNTZiOTc0YmYiO2k6MTtzOjM2OiJkNDZiOWU0My1hYTI0LWUxZGMtYzU3ZS02NDVlNTZkNTM4NjIiO2k6MjtzOjM2OiJkNDc5NDNiNC04OGFjLTVjYzktMGM3OC02NDVlNTY5NGNhNzEiO2k6MztzOjM2OiJkNDkyMDRjMC1lMzFkLWQyOTYtZDgyMi02NDVlNTZlNTZhYWQiO2k6NDtzOjM2OiJkNGE1NWE2OC0wZTU1LTMzOTMtNDJhYS02NDVlNTZjNTU5ZWMiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImQ0NGIxNzlkLWQ5NWYtYjc5Yy0yZDA0LTY0NWU1NjMwOGMwMyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('efae0791-9794-4912-7fb1-6463be4eef72','Tasks2_TASK',0,'2023-05-16 17:33:01','2023-05-16 17:33:01','1cfb5d64-05b5-0167-275e-64637d811e9d','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_hash` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text COLLATE utf8mb4_general_ci,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_home` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_mobile` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_work` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_other` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_fax` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_street` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_country` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address_postalcode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `messenger_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `messenger_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reports_to_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`(30),`first_name`(30),`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$2y$10$7DiQsya6sZVtRlvi.hb0u.59LpUcKvQwx6TzSAfct/73667izbNmS',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2023-05-12 15:08:06','2023-05-12 15:08:06','1','1','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,NULL,0,NULL,NULL),('1cfb5d64-05b5-0167-275e-64637d811e9d','t','$2y$10$At0PSnTlIr33lSsdruvUfONvufUCwFMsjVFbVYB2Sfere8Rts315i',0,'2023-05-16 12:55:00',NULL,1,'Tung','B',1,0,1,NULL,'2023-05-16 12:55:00','2023-05-16 14:28:25','1cfb5d64-05b5-0167-275e-64637d811e9d','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,'Poland',NULL,0,0,1,'Active',NULL,NULL,'',0,0,NULL),('37f516c7-8bab-bd9f-b1f9-64639e43000e','lam','$2y$10$CzW3vile0qmOblolkS9VXOQQ4MrLHkO0mARuCWGN8A4wve7FMmjWa',0,'2023-05-16 15:19:17',NULL,1,'lam','Mai Hai',0,0,1,'','2023-05-16 15:19:17','2023-05-16 15:19:17','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','','','Sales','','','','','','Active','','','','Poland','',0,0,1,'Active','','','',0,0,NULL),('a9073e6e-08a7-f63b-2e4e-64637c6dc2d0','c','$2y$10$ZV05hM.HGZP8ARX69MOibus1HeS5sHxoYOMh7IUpYZZI07KC6uRmK',0,'2023-05-16 12:54:12',NULL,1,'','Kovalov',1,0,1,'','2023-05-16 12:54:12','2023-05-16 12:54:12','1','1','','','','','','','','','Active','','','','','',0,0,1,'Active','','','',0,0,NULL),('ae816cc0-77b4-1967-ec23-646399769bfc','Kira','$2y$10$EgKbUx8AkVOtoC4L0IS8G.580i.EOhGS3sxqQ8Fte/rb0EH1PmjPi',0,'2023-05-16 14:54:07',NULL,1,'Kira','Test',0,0,1,'','2023-05-16 14:54:07','2023-05-16 14:54:07','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','Designer','','','','','','','','Active','','','','','',0,0,1,'Active','','','1cfb5d64-05b5-0167-275e-64637d811e9d',0,0,NULL),('bf6995cc-1a50-0a14-f507-64639aac50fd','Thanh','$2y$10$AnhRN6hzV3lDeEmmzsoONOTqcuA/2iAw5nO0xxyH1RHsGmGI3lcCS',0,'2023-05-16 14:58:39',NULL,1,'Thanh','Nguyen Long ',0,0,1,'','2023-05-16 14:58:39','2023-05-16 14:58:39','1cfb5d64-05b5-0167-275e-64637d811e9d','1cfb5d64-05b5-0167-275e-64637d811e9d','Producer ','','Export','','','','','','Active','','SGN','','VN','',0,0,1,'Active','','','',0,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `feed_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_last_import` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_user_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `import_module` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bean_type` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bean_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_password_link` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `keyhash` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_signatures` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_general_ci,
  `signature_html` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vcals` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 11:04:25
