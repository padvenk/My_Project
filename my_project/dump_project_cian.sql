-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cian
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `about_building`
--

DROP TABLE IF EXISTS `about_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_building` (
  `flat_id` int unsigned NOT NULL COMMENT 'Ссылка на квартиру',
  `material_h` enum('кирпич','монолит','дерево','щит','каркас','газобетон','газосиликат','пенобетон') DEFAULT NULL COMMENT 'Материал дома',
  `passenger_elevators` enum('Нет','1','2','3','4') NOT NULL COMMENT 'Пассажирских лифтов',
  `freight_elevators` enum('Нет','1','2','3','4') NOT NULL COMMENT 'Грузовых лифтов',
  `name_building` varchar(255) DEFAULT NULL COMMENT 'Название ЖК',
  `year_building` date DEFAULT NULL COMMENT 'Год постройки',
  `сeiling_height` int unsigned DEFAULT NULL COMMENT 'Высота потолков',
  `ramp` tinyint(1) DEFAULT NULL COMMENT 'Пандус',
  `parking` enum('Наземная','Многоуровневая','Подземная','На крыше') DEFAULT NULL,
  PRIMARY KEY (`flat_id`),
  CONSTRAINT `about_flat_id` FOREIGN KEY (`flat_id`) REFERENCES `flat` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_building`
--

LOCK TABLES `about_building` WRITE;
/*!40000 ALTER TABLE `about_building` DISABLE KEYS */;
INSERT INTO `about_building` VALUES (1,'кирпич','1','1','c5bef43b06','2008-10-16',5,0,'Наземная'),(3,'кирпич','1','1','a4eb87b105','2001-05-22',3,0,'Наземная'),(5,'кирпич','1','1','a6bb620399','1986-09-02',4,0,'Подземная'),(6,'газобетон','2','2','3978ee2182','1988-11-08',3,0,'Подземная'),(8,'газобетон','1','2','f59806a70f','2015-08-08',5,1,'Подземная'),(10,'монолит','1','1','7527f9639f','2008-02-09',2,0,'Многоуровневая');
/*!40000 ALTER TABLE `about_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additionally_type`
--

DROP TABLE IF EXISTS `additionally_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additionally_type` (
  `type_a_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `name_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additionally_type`
--

LOCK TABLES `additionally_type` WRITE;
/*!40000 ALTER TABLE `additionally_type` DISABLE KEYS */;
INSERT INTO `additionally_type` VALUES (1,'Окно во двор'),(2,'Окна на улицу'),(3,'Балкон'),(4,'Лоджия'),(5,'Раздельный санузел'),(6,'Совмещенный санузел');
/*!40000 ALTER TABLE `additionally_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `a_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `agent_name` varchar(255) NOT NULL COMMENT 'Название агенства уникально',
  `tel` varchar(12) NOT NULL COMMENT 'Телефон',
  `suite` varchar(255) DEFAULT NULL COMMENT 'Ссылка на сайт агенства',
  `logo` varchar(255) DEFAULT NULL COMMENT 'Путь к файлу',
  `about` text COMMENT 'Информацияописание агенства',
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `agent_name` (`agent_name`),
  UNIQUE KEY `tel` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'shlepai_guboi','+79992356444','WERdsf.ru','loKK-hSDSDgo','32SDS32kl'),(2,'shlepai_nogoi','+79992356333','WEjhh.ru','nhmkjkjkSDgo','32SDS32klskcj bvhcbjkmlfjvhgcf'),(3,'shlepai_golovoi','+79992778444','Wdfsdf.ru','loKKjhjhsdhjs77ks','nnuhncfiunns78uiwm893rm8buyb346bb6c3miwmsm'),(4,'shlepai_rukoi','+79392333454','mlunxgjb.ru','mlakscnvdf','3,lisuyjdrueiowka,sm'),(5,'shlepai_borodoi','+79992378424','inyun.ru','lkjhghbnjksd','inybcf4n7f84sofhuxgmrmvbao'),(6,'shlepai_knigoi','+79999953344','WER23423.ru','lxnhjcbhsmc','kmxwsetbvcnygf43wtcfhmx4igfwnlvtcfbgbnxvmc'),(7,'hlupai_guboi','+79998475614','WEkjhjcghcgncybf.ru','237ui2iughunnhnhxd','lkaxnwbaghbdynumwescyn8w7m8O9QUCFH4YUBVC'),(8,'pupai_guboi','+79912516334','Wces8mughcgmixm4owg.ru','jfenscbytf849tmucw,fc','3ybby7ny7wingyfcnyocnhyc'),(9,'mupai_guboi','+79900351444','Wv565f7g87i.ru','l.,iknujbvhy','cmlgensghrc9wm'),(10,'rupai_guboi','+79910355489','Wngy7ny8inhnhulf.ru','loKK-gncsrjcfko','mnvhdxbgvsehybsueyvt987ruabr3aw8');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_agent` AFTER INSERT ON `agent` FOR EACH ROW BEGIN
   INSERT INTO users Set type_ac = 'Agent', agent_id = NEW.a_id, person_id = 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `document_agency`
--

DROP TABLE IF EXISTS `document_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_agency` (
  `d_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `from_ag_id` int unsigned NOT NULL COMMENT 'Ссылка на аккаунт для которого были предоставлены документы',
  `name_doc` varchar(255) NOT NULL COMMENT 'Название документа',
  `path_doc` varchar(255) NOT NULL COMMENT 'Путь к файлу',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время пердоставления документа',
  `approved` tinyint(1) DEFAULT NULL COMMENT 'Одобренне одобрен',
  PRIMARY KEY (`d_id`),
  KEY `doc_id_from_agent` (`from_ag_id`),
  CONSTRAINT `doc_id_from_agent` FOREIGN KEY (`from_ag_id`) REFERENCES `agent` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_agency`
--

LOCK TABLES `document_agency` WRITE;
/*!40000 ALTER TABLE `document_agency` DISABLE KEYS */;
INSERT INTO `document_agency` VALUES (1,4,'KJSHDFBHS','HGHHBDSHB','2021-10-13 15:44:35',0),(2,5,'YWEUIORUJWW','KMFDHCKMZC','2021-10-13 15:44:35',1),(3,4,'2KL3JH4GJ2','9MS8F','2021-10-13 15:44:35',0),(4,3,'78W6E7OMWHN7','L,AKMUHDA7','2021-10-13 15:44:35',0),(5,6,'M8WNFYXBE86C7TR','LKSNCFIBF','2021-10-13 15:44:35',1),(6,4,'MIOCNYRB74','SLKCNHFBGUYS','2021-10-13 15:44:35',0),(7,3,'M09W8E9NY7','XMOSNEHFC','2021-10-13 15:44:35',0),(8,7,'DNHWQEWN7WNW8',',09EF,9,9','2021-10-13 15:44:35',0),(9,1,'NDCB88SX','BXHJNGDUY','2021-10-13 15:44:35',0),(10,9,'BWX67FB7S','COSNEF7B7','2021-10-13 15:44:35',1);
/*!40000 ALTER TABLE `document_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `find_plot`
--

DROP TABLE IF EXISTS `find_plot`;
/*!50001 DROP VIEW IF EXISTS `find_plot`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `find_plot` AS SELECT 
 1 AS `p_id`,
 1 AS `user_id`,
 1 AS `gas`,
 1 AS `water_supply`,
 1 AS `status_plot`,
 1 AS `type_ac`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `flat`
--

DROP TABLE IF EXISTS `flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flat` (
  `f_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который разместил обьявление',
  `type_f` tinyint(1) NOT NULL COMMENT 'Тип: квартираапартаменты',
  `number_of_rooms` enum('1','2','3','4','5','6','6 и более','свободная планировка','студия') DEFAULT NULL COMMENT 'Количество квартир',
  `square` int unsigned NOT NULL COMMENT 'Общая площадь',
  `layout` varchar(255) DEFAULT NULL COMMENT 'Путь к файлу(планировка)',
  `floor_` int NOT NULL COMMENT 'Этаж',
  `floors_in_the_house` int unsigned NOT NULL COMMENT 'Этажей в доме',
  `area_living` int unsigned DEFAULT NULL COMMENT 'Жилая площадь',
  `kitchen_square` int unsigned DEFAULT NULL COMMENT 'Кухня площадь',
  `repair_f` enum('Косметический','Евро','Дизайнерский','Без ремонта') DEFAULT NULL COMMENT 'Ремонт',
  `additionally` int unsigned DEFAULT NULL COMMENT 'Дополнительно',
  `photo_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на фото обьекта',
  `video_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на видео обьекта',
  `about_h` text COMMENT 'Описание обьекта',
  `tel` varchar(12) NOT NULL COMMENT 'Телефон',
  `tel_2` varchar(12) DEFAULT NULL COMMENT 'Телефон_2',
  `type_id` int unsigned NOT NULL COMMENT 'Тип объявления',
  `type_of_transaction` enum('sale','rent') DEFAULT NULL COMMENT 'Тип сделки',
  `price` double unsigned NOT NULL COMMENT 'Стоимость обьекта',
  `created_ad_price` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время внесения цены',
  PRIMARY KEY (`f_id`),
  KEY `type_advers_id_name_f` (`type_id`),
  KEY `user_id_who_posted_f` (`user_id`),
  KEY `additionally_type_id` (`additionally`),
  CONSTRAINT `additionally_type_id` FOREIGN KEY (`additionally`) REFERENCES `additionally_type` (`type_a_id`),
  CONSTRAINT `type_advers_id_name_f` FOREIGN KEY (`type_id`) REFERENCES `type_adv` (`type_adv_id`),
  CONSTRAINT `user_id_who_posted_f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat`
--

LOCK TABLES `flat` WRITE;
/*!40000 ALTER TABLE `flat` DISABLE KEYS */;
INSERT INTO `flat` VALUES (1,17,1,'1',34,'cd0ffd8fc2',11,8,29,50,'Без ремонта',1,'a64879d65c','cd7cb16e32','3cabb7f64f66f7f73117','+79837682264',NULL,1,'sale',2049934.87,'2021-10-13 21:06:05'),(2,1,1,'2',41,'f777de34c4',7,12,69,45,'Без ремонта',2,'1775bef2ee','08e9601176','08139584625736abc0f4','+79837683964',NULL,3,'sale',1794781.11,'2021-10-13 18:36:59'),(3,10,1,'3',79,'e08bef2877',8,8,59,40,'Без ремонта',2,'31721678fe','8f0f7f4185','78c270c2324a45f06aed','+79827683964',NULL,1,'sale',1640281.83,'2021-10-13 21:06:09'),(4,11,0,'1',66,'2fd9c2a3da',15,4,50,47,'Дизайнерский',1,'4f763e127d','e23cf5089b','5e7208028b1d536dea6e','+79827683954',NULL,2,'rent',30854.59,'2021-10-13 18:37:43'),(5,18,0,'2',44,'6f0ca16ae6',13,1,22,18,'Дизайнерский',2,'16a10db369','c556009d2c','0c825a9d0c15d6cc7a0a','+79823283954',NULL,5,'rent',11557.17,'2021-10-13 18:37:55'),(6,13,1,'3',75,'9f54118651',3,7,17,4,'Дизайнерский',4,'fb350fea83','a9655882b8','26260855f3907592adba','+79823283998',NULL,2,'rent',2731075.09,'2021-10-13 21:06:22'),(7,19,0,'3',42,'1984472bc6',7,9,80,59,'Дизайнерский',5,'2e95be7bbb','2eda412c24','0628e3f5aa7f614e9c1a','+79003283998',NULL,4,'rent',1951604.64,'2021-10-13 21:06:12'),(8,3,1,'студия',77,'dfd5ba3670',16,12,42,71,'Косметический',5,'6da9dd39ab','9f13265cc1','25c6a4c7d4830e1a22d4','+79003244998','+79233244998',4,'sale',3064785.71,'2021-10-13 18:40:45'),(9,11,1,'студия',13,'7645b95c3d',3,4,27,16,'Косметический',6,'c69119cc30','eb11a7e8c9','46fc63a652dc463df242','+79003247398','+79243209898',4,'sale',1737177.78,'2021-10-13 21:06:16'),(10,2,0,'студия',40,'362ae96437',19,9,30,42,'Косметический',4,'888837527d','c7247acb11','1cf4568b901947d3b55a','+79003240098','+79241103898',5,'rent',19862.09,'2021-10-13 18:41:41'),(11,16,1,'студия',52,'83b94a9278',9,10,11,17,'Косметический',4,'ff16782b8e','a84a833113','8a5b3bd954c59bca6c08','+79017243898','+79041503898',4,'rent',25042.8,'2021-10-13 18:41:59');
/*!40000 ALTER TABLE `flat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_price_f` AFTER UPDATE ON `flat` FOR EACH ROW BEGIN
   INSERT INTO history_price_f Set advertisement_id = NEW.f_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price = NEW.price - old_price;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `history_price_f`
--

DROP TABLE IF EXISTS `history_price_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_price_f` (
  `h_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `advertisement_id` int unsigned NOT NULL COMMENT 'Ссылка на объявление',
  `date_at` datetime DEFAULT NULL COMMENT 'Дата и время указания предыдущей стоимости',
  `old_price` double unsigned NOT NULL COMMENT 'Предыдущая стоимость обьекта',
  `mod_price` double unsigned NOT NULL COMMENT 'Изменение стоимости обьекта',
  PRIMARY KEY (`h_id`),
  KEY `avd_id_from_h_price_f` (`advertisement_id`),
  CONSTRAINT `avd_id_from_h_price_f` FOREIGN KEY (`advertisement_id`) REFERENCES `flat` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_price_f`
--

LOCK TABLES `history_price_f` WRITE;
/*!40000 ALTER TABLE `history_price_f` DISABLE KEYS */;
INSERT INTO `history_price_f` VALUES (1,1,'2021-10-13 18:34:09',1581007.37,468927.5),(2,3,'2021-10-13 18:37:10',639594.33,1000687.5000000001),(3,7,'2021-10-13 18:38:12',28250.72,1923353.92),(4,9,'2021-10-13 18:40:59',266714.28,1470463.5),(5,6,'2021-10-13 18:38:04',34110.42,2696964.67);
/*!40000 ALTER TABLE `history_price_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_price_h`
--

DROP TABLE IF EXISTS `history_price_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_price_h` (
  `h_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `advertisement_id` int unsigned NOT NULL COMMENT 'Ссылка на объявление',
  `date_at` datetime DEFAULT NULL COMMENT 'Дата и время указания предыдущей стоимости',
  `old_price` double unsigned NOT NULL COMMENT 'Предыдущая стоимость обьекта',
  `mod_price` double NOT NULL COMMENT 'Изменение стоимости обьекта',
  PRIMARY KEY (`h_id`),
  KEY `avd_id_from_h_price` (`advertisement_id`),
  CONSTRAINT `avd_id_from_h_price` FOREIGN KEY (`advertisement_id`) REFERENCES `house` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_price_h`
--

LOCK TABLES `history_price_h` WRITE;
/*!40000 ALTER TABLE `history_price_h` DISABLE KEYS */;
INSERT INTO `history_price_h` VALUES (1,3,'2021-10-13 20:51:51',1973744.71,-725736.45),(2,4,'2021-10-13 16:52:47',1791234.49,-1572427.21),(3,10,'2021-10-13 16:55:14',2481196.73,-2231185.02);
/*!40000 ALTER TABLE `history_price_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_price_p`
--

DROP TABLE IF EXISTS `history_price_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_price_p` (
  `h_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `advertisement_id` int unsigned NOT NULL COMMENT 'Ссылка на объявление',
  `date_at` datetime DEFAULT NULL COMMENT 'Дата и время указания предыдущей стоимости',
  `old_price` double unsigned NOT NULL COMMENT 'Предыдущая стоимость обьекта',
  `mod_price` double unsigned NOT NULL COMMENT 'Изменение стоимости обьекта',
  PRIMARY KEY (`h_id`),
  KEY `avd_id_from_h_price_p` (`advertisement_id`),
  CONSTRAINT `avd_id_from_h_price_p` FOREIGN KEY (`advertisement_id`) REFERENCES `plot` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_price_p`
--

LOCK TABLES `history_price_p` WRITE;
/*!40000 ALTER TABLE `history_price_p` DISABLE KEYS */;
INSERT INTO `history_price_p` VALUES (1,10,'2021-10-13 17:48:18',410918.31,82718.5),(2,2,'2021-10-13 17:44:46',181196.24,1436952.77),(3,5,'2021-10-13 17:45:34',1120326.78,223801.96999999997),(4,4,'2021-10-13 17:45:02',624317.5,1212146.71);
/*!40000 ALTER TABLE `history_price_p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `house_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Уню ин.',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который разместил обьявление',
  `address` varchar(255) NOT NULL COMMENT 'Адрес объекта',
  `name_cottage_village` varchar(255) DEFAULT NULL COMMENT 'Название коттеджного поселка',
  `year_bilt` date DEFAULT NULL COMMENT 'Год постройки',
  `material_h` enum('кирпич','монолит','дерево','щит','каркас','газобетон','газосиликат','пенобетон') DEFAULT NULL COMMENT 'Материал дома',
  `square` decimal(4,2) unsigned NOT NULL COMMENT 'Площадь дома',
  `floors_h` tinyint unsigned DEFAULT NULL COMMENT 'Количество этажей',
  `number_bedroom` tinyint unsigned DEFAULT NULL COMMENT 'Количество спален',
  `bathroom` enum('на улице','в доме') DEFAULT NULL COMMENT 'Санузел',
  `heating` enum('центральное газовое','центральное угольное','печь','камин','электрическое','автономное газовое','дизельное','твердотопливный кател','без отопления') DEFAULT NULL COMMENT 'Тип отопления',
  `square_plot` int unsigned NOT NULL COMMENT 'Площадь участка',
  `status_plot` enum('Фермерское хоз-во','Личное подсобное х-во','Садоводство','ИЖС','Земля промназначения','ДНП') DEFAULT NULL,
  `photo_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на фото обьекта',
  `video_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на видео обьекта',
  `about_h` text COMMENT 'Описание обьекта',
  `tel` varchar(12) NOT NULL COMMENT 'Телефон',
  `tel_2` varchar(12) DEFAULT NULL COMMENT 'Телефон_2',
  `type_id` int unsigned NOT NULL COMMENT 'Тип объявления',
  `type_of_transaction` enum('sale','rent') DEFAULT NULL COMMENT 'Тип сделки',
  `price` double unsigned NOT NULL COMMENT 'Стоимость обьекта',
  `created_ad_price` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время внесения цены',
  PRIMARY KEY (`house_id`),
  KEY `type_advers_id_name` (`type_id`),
  KEY `user_id_who_posted` (`user_id`),
  CONSTRAINT `type_advers_id_name` FOREIGN KEY (`type_id`) REFERENCES `type_adv` (`type_adv_id`),
  CONSTRAINT `user_id_who_posted` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,18,'7f693c56f80fb32314fe','4515d7272f','2008-06-01','каркас',85.11,3,4,'на улице','без отопления',7,'Личное подсобное х-во','7b74025da0','fec11bf74807774','2b9ce8c2c0b53f65d052','+79996672783',NULL,5,'sale',1688378.08,'2021-10-13 16:35:32'),(2,6,'c795cf67bc1922b8e54a','5da788a9e7','1990-09-20','кирпич',43.21,4,5,'в доме','центральное угольное',2,'Личное подсобное х-во','7b67c316a8','fea6e45ad73c275','1a1558070303a400fd24','+79996672783',NULL,5,'rent',473178.05,'2021-10-13 16:38:27'),(3,8,'dc20ba17604bf7654276','2c08daeaff','2010-02-05','кирпич',39.78,4,2,'в доме','автономное газовое',7,'ИЖС','7fc8eb7a6c','58ffb377b592d3b','d611b157479c677b1ff7','+79996672783',NULL,6,'sale',1248008.26,'2021-10-13 20:53:12'),(4,4,'0d86d96fe448f667aa3a','c3eb549a7b','2002-07-04','кирпич',68.67,1,3,'в доме','автономное газовое',9,'ИЖС','fc6d71d0a1','188ab9c432eac1e','32782caf43f18602c95a','+79996672783',NULL,5,'sale',218807.28,'2021-10-13 20:53:21'),(5,12,'5d5825e2de0efbb7e694','b2ba50a34c','1998-02-09','кирпич',36.12,1,3,'в доме','автономное газовое',10,'ИЖС','290b4831f6','fcf7777f656e887','19debf46aa02509c4277','+79996672783',NULL,3,'sale',2261250.6,'2021-10-13 16:52:49'),(6,18,'c6e1b3a5ab5548b15942','0041d4738a','2014-08-05','газобетон',91.12,1,1,'в доме','печь',9,'ДНП','c214fea74c','74e677bfccc1acb','e80a88b1cbe93d307a88','+79996672783',NULL,1,'sale',860374.91,'2021-10-13 16:54:25'),(7,18,'9ef19887c51854b6a714','1ab5c3fb19','2011-02-17','газобетон',89.17,4,5,'в доме','печь',7,'ДНП','0bd8f15c68','41c5fcf00d0b884','a5cf47d4b8839b4076cb','+79996672783',NULL,4,'sale',2244670.33,'2021-10-13 16:54:29'),(9,3,'6aba57655dfa44f30f6e','01d1f24333','2000-08-26','газобетон',52.42,3,4,'в доме','электрическое',4,'Садоводство','af3aec879b','3763bdb9666da03','eaeb662c91c8e4e773e0','+79996672783',NULL,4,'sale',1649143.49,'2021-10-13 16:55:02'),(10,17,'25a51eb30c4253ab4472','7ecdebf306','1998-02-19','пенобетон',67.91,4,2,'в доме','электрическое',11,'Садоводство','7451bbb7c9','9e394711222593f','0e589278c68b91ca06cd','+79996672783',NULL,5,'sale',250011.71,'2021-10-13 20:53:25'),(11,1,'f3c0b311569ab1093a04','9a3be81ece','1973-12-09','дерево',18.34,2,5,'в доме','центральное газовое',4,'Фермерское хоз-во','6d1b1eff06','c8247a510c4fad6','b9e67ed829c07031b9fe','+79996634783',NULL,5,'sale',2166712.7,'2021-10-13 16:57:31'),(12,5,'b9680c3fcdcd0bc6d505','52ec750564','2006-05-05','дерево',87.65,3,2,'в доме','центральное газовое',11,'Фермерское хоз-во','1a3b52d757','ad00afe4aee8b64','f5160fca024f46d34a33','+79994634783',NULL,6,'sale',1907509.45,'2021-10-13 16:57:36'),(13,15,'f6e151afacc3ab94239e','aa1343365a','1978-01-27','дерево',49.13,2,4,'на улице','центральное газовое',4,'Фермерское хоз-во','9fdfbe196f','38be885f1d3f5d9','89462c340c3a96ce2cb5','+79994634783',NULL,2,'sale',288532.70999999996,'2021-10-13 16:57:56'),(14,7,'5af7fdbf32bd0daadca4','d02b2dc443','1993-01-26','дерево',15.66,2,1,'на улице','дизельное',8,'Личное подсобное х-во','bb1fefe6b4','fa29728526fb7f0','bc12928475aa6dd3f17c','+79944634783',NULL,3,'sale',2461265.8,'2021-10-13 16:58:28'),(15,15,'66325d72e95dfe0f8933','0d855c7c02','2017-05-20','щит',56.73,3,5,'на улице','дизельное',4,'Земля промназначения','d683648859','2a446b4cacafe7d','e6dc0deef7a8e54d443c','+79944634783',NULL,1,'sale',841032.27,'2021-10-13 16:59:20'),(16,19,'ec3ac2700e16ad0475fb','f0caf5a363','1979-12-11','щит',92.65,1,1,'на улице','дизельное',3,'Земля промназначения','46b24e2443','335f42d5cb376c7','def3e8320bcc16fff4d0','+79944634783',NULL,5,'sale',809904.66,'2021-10-13 16:59:22'),(17,9,'92e08add62307294e810','d3551643ec','1995-09-02','газосиликат',93.28,1,4,'в доме','камин',6,'ИЖС','dcd8a23694','89611ffcf28ee6d','0793066e609fa1d7458e','+79944634783',NULL,4,'rent',1400490.72,'2021-10-13 17:00:46'),(18,14,'2395e7853ffb8e0f1dce','f153f623fd','1985-02-17','газосиликат',48.64,3,4,'в доме','камин',12,'ИЖС','bf3ea1b53e','35d32afed51fa78','7b341bdf640da4af676a','+79944634783',NULL,6,'rent',1627576.4,'2021-10-13 17:00:49'),(19,5,'480fae62531fa1421e49','9e405ee38d','1981-07-14','кирпич',72.10,4,5,'в доме','камин',5,'ИЖС','62cad6eea1','c13992e8fd59234','d2badafbac5a2a64709e','+79944634783',NULL,6,'sale',2782443.86,'2021-10-13 17:01:55'),(20,5,'47a4b59c0259dfefdcc1','e490f24b4c','1990-06-04','кирпич',16.29,2,3,'в доме','камин',6,'ИЖС','9fe85b599c','107b46ceee896a6','05bfeba3bdd272e8473a','+79944634783',NULL,4,'sale',1145398.53,'2021-10-13 17:01:57'),(21,3,'52449ea38073649099da','753513511b','1977-08-25','кирпич',89.83,1,2,'в доме','камин',3,'ИЖС','83f1facc1b','9e1b9d815a102e3','51dfb586ad8b7b2d6188','+79944634783',NULL,1,'sale',754832.96,'2021-10-13 17:01:58');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_price` AFTER UPDATE ON `house` FOR EACH ROW BEGIN
   INSERT INTO history_price_h Set advertisement_id=NEW.house_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price =  NEW.price - old_price;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `messages_to_user_id` (`to_user_id`),
  KEY `messages_from_user_id` (`from_user_id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,7,14,'bee08cf55b',0,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(2,10,17,'61c0702253',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(3,10,11,'2d73c9121c',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(4,15,10,'f1cad2e997',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(5,15,11,'e36c38c845',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(6,5,7,'d55fc83839',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(7,5,9,'0867fd3b95',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(8,9,19,'bbfdc05089',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(9,9,5,'0bc56e8ee5',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(10,8,4,'cd7cdfceb0',1,'2021-10-13 16:05:01','2021-10-13 16:05:01'),(11,14,9,'add02240b6',1,'2021-10-13 16:05:01','2021-10-13 16:05:01');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `p_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `first_name` varchar(255) NOT NULL COMMENT 'Имя',
  `last_name` varchar(255) NOT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL COMMENT 'Дата раждения(не обязательный атрибут)',
  `email` varchar(255) NOT NULL COMMENT 'Почта',
  `tel` varchar(12) NOT NULL COMMENT 'Телефон',
  `photo` varchar(255) DEFAULT NULL COMMENT 'Путь к изображению',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tel` (`tel`),
  CONSTRAINT `сheck_tel` CHECK (regexp_like(`tel`,_utf8mb4'^\\+7[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'petya','seledkin','1998-02-03','qwed@mail.ru','+79122334392','sdfssdf'),(2,'sema','voloskov','1991-12-23','oijo923@mail.ru','+79122214322','kldfjglsd;'),(3,'iliya','vetrov','2000-04-11','11jdjda@mail.ru','+79134367302',',lk,,kasa'),(4,'igor','shmelov','1981-07-30','njscnjhs@mail.ru','+79189345323','knnkllsknl'),(5,'fedor','percev','1978-10-13','lskls765@mail.ru','+79402594360','lsd;l8sdl'),(6,'ana','volodina','1990-06-28','slsliihh@mail.ru','+79620930092','skjkjkjshhdgye'),(7,'maria','sebova','1988-09-20','ldldxx@mail.ru','+79110300395','slpopomk08097'),(8,'petya','seledkin','1998-02-03','qmlsks6767@mail.ru','+79992365301','lkslksdjccjms'),(9,'natalia','lozhkina','1983-05-09','0sksjd@mail.ru','+79832044398','89iugu67td'),(10,'petya','seledkin','1979-04-16','innygvnfv@mail.ru','+79926634897','jhnjalkk8787');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_person` AFTER INSERT ON `person` FOR EACH ROW BEGIN
   INSERT INTO users Set type_ac = 'Person', person_id = NEW.p_id, agent_id = 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plot`
--

DROP TABLE IF EXISTS `plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot` (
  `p_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который разместил обьявление',
  `square_p` int unsigned NOT NULL COMMENT 'Площадь участка',
  `name_cottage_village` varchar(255) DEFAULT NULL COMMENT 'Название коттеджного поселка',
  `status_plot` enum('Фермерское хоз-во','Личное подсобное х-во','Садоводство','ИЖС','Земля промназначения','ДНП') DEFAULT NULL,
  `elect` tinyint(1) NOT NULL COMMENT 'Эликтричество',
  `gas` tinyint(1) NOT NULL COMMENT 'Газ',
  `sewerage` tinyint(1) NOT NULL COMMENT 'Канализация',
  `water_supply` tinyint(1) NOT NULL COMMENT 'Водоснабжение',
  `photo_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на фото обьекта',
  `video_h` varchar(255) DEFAULT NULL COMMENT 'Ссылка на видео обьекта',
  `about_h` text COMMENT 'Описание обьекта',
  `tel` varchar(12) NOT NULL COMMENT 'Телефон',
  `tel_2` varchar(12) DEFAULT NULL COMMENT 'Телефон_2',
  `type_id` int unsigned NOT NULL COMMENT 'Тип объявления',
  `type_of_transaction` enum('sale','rent') DEFAULT NULL COMMENT 'Тип сделки',
  `price` double unsigned NOT NULL COMMENT 'Стоимость обьекта',
  `created_ad_price` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время внесения цены',
  PRIMARY KEY (`p_id`),
  KEY `type_advers_id_name_p` (`type_id`),
  KEY `user_id_who_posted_p` (`user_id`),
  CONSTRAINT `type_advers_id_name_p` FOREIGN KEY (`type_id`) REFERENCES `type_adv` (`type_adv_id`),
  CONSTRAINT `user_id_who_posted_p` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot`
--

LOCK TABLES `plot` WRITE;
/*!40000 ALTER TABLE `plot` DISABLE KEYS */;
INSERT INTO `plot` VALUES (1,17,12,'5c20e1e711','ИЖС',1,1,0,1,'724cf7e570','332720ee48','2e78ce09a424d3d40d94','+79918856789',NULL,3,'sale',2015487.77,'2021-10-13 17:44:19'),(2,18,13,'4d04f03971','Садоводство',1,0,1,0,'1a39643896','11a1848803','84801d4e10b22832a082','+79918396789',NULL,2,'sale',1618149.01,'2021-10-13 21:00:55'),(3,9,4,'7d7f8e24de','Садоводство',0,1,1,0,'11e97e0508','c6f09cc42c','a066c1db1c9deb060e80','+79900396789',NULL,5,'sale',1535489.14,'2021-10-13 17:44:54'),(4,15,6,'3fdef4bca7','Садоводство',1,1,1,0,'dba02eca72','07d52b2dd4','2f7eff6c7ddfba637d55','+79900396789',NULL,5,'sale',1836464.21,'2021-10-13 21:01:40'),(5,19,6,'56675335e4','Личное подсобное х-во',1,1,1,1,'6606e11fc8','9783fec204','2a6b90dacb2afc441a2b','+79900392899',NULL,5,'rent',1344128.75,'2021-10-13 21:01:38'),(6,15,15,'9180bc3558','Личное подсобное х-во',1,0,1,1,'bf05466057','8f1dfcab3a','e6b386b5798166706443','+79900392899',NULL,5,'rent',740037.1,'2021-10-13 17:45:36'),(7,13,9,'10bee630fc','Фермерское хоз-во',0,0,1,1,'cc79bbdaf7','21dddef390','dda0cfbab5fbe14a1b43','+79900112899',NULL,2,'sale',2554365.05,'2021-10-13 17:46:14'),(8,4,8,'1db4efd24b','Фермерское хоз-во',1,0,1,0,'c360987891','d33a0804f9','9e59af62c09b1a058322','+79900117729',NULL,5,'sale',2516913.23,'2021-10-13 17:46:21'),(9,2,21,'6b766a0747','Земля промназначения',1,1,1,1,'5bbc4687c4','ed6f42a808','51004b368f442ea7e829','+79880117729',NULL,5,'sale',1861177.93,'2021-10-13 17:48:10'),(10,20,5,'d94086c865','Земля промназначения',1,1,0,0,'9bd24433c3','40299c9dea','f53751cb55955b900992','+79880117919',NULL,3,'sale',493636.81,'2021-10-13 21:00:49');
/*!40000 ALTER TABLE `plot` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_price_p` AFTER UPDATE ON `plot` FOR EACH ROW BEGIN
   INSERT INTO history_price_p Set advertisement_id = NEW.p_id, date_at = OLD.created_ad_price, old_price = OLD.price, mod_price = NEW.price - old_price;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sort_price_h`
--

DROP TABLE IF EXISTS `sort_price_h`;
/*!50001 DROP VIEW IF EXISTS `sort_price_h`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sort_price_h` AS SELECT 
 1 AS `house_id`,
 1 AS `user_id`,
 1 AS `address`,
 1 AS `year_bilt`,
 1 AS `square`,
 1 AS `tel`,
 1 AS `type_ac`,
 1 AS `price`,
 1 AS `type_of_transaction`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `type_adv`
--

DROP TABLE IF EXISTS `type_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_adv` (
  `type_adv_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин.',
  `name_type_adv` varchar(255) NOT NULL COMMENT 'Название типа обьявления',
  PRIMARY KEY (`type_adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_adv`
--

LOCK TABLES `type_adv` WRITE;
/*!40000 ALTER TABLE `type_adv` DISABLE KEYS */;
INSERT INTO `type_adv` VALUES (1,'FREE'),(2,'PREMIUM+COLOR'),(3,'TOP'),(4,'PREMIUM'),(5,'PAID'),(6,'COLOR');
/*!40000 ALTER TABLE `type_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ун. ин. и id пользователя',
  `person_id` int unsigned DEFAULT NULL,
  `agent_id` int unsigned DEFAULT NULL,
  `type_ac` enum('Agent','Person') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания пользователя',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,0,'Person','2021-10-11 23:21:48'),(2,2,0,'Person','2021-10-11 23:21:48'),(3,3,0,'Person','2021-10-11 23:21:48'),(4,4,0,'Person','2021-10-11 23:21:48'),(5,5,0,'Person','2021-10-11 23:21:48'),(6,6,0,'Person','2021-10-11 23:21:48'),(7,7,0,'Person','2021-10-11 23:21:48'),(8,8,0,'Person','2021-10-11 23:21:48'),(9,9,0,'Person','2021-10-11 23:21:48'),(10,10,0,'Person','2021-10-11 23:21:48'),(11,0,1,'Agent','2021-10-11 23:21:52'),(12,0,2,'Agent','2021-10-11 23:21:52'),(13,0,3,'Agent','2021-10-11 23:21:52'),(14,0,4,'Agent','2021-10-11 23:21:52'),(15,0,5,'Agent','2021-10-11 23:21:52'),(16,0,6,'Agent','2021-10-11 23:21:52'),(17,0,7,'Agent','2021-10-11 23:21:52'),(18,0,8,'Agent','2021-10-11 23:21:52'),(19,0,9,'Agent','2021-10-11 23:21:52'),(20,0,10,'Agent','2021-10-11 23:21:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `find_plot`
--

/*!50001 DROP VIEW IF EXISTS `find_plot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `find_plot` AS select `p`.`p_id` AS `p_id`,`p`.`user_id` AS `user_id`,`p`.`gas` AS `gas`,`p`.`water_supply` AS `water_supply`,`p`.`status_plot` AS `status_plot`,`u`.`type_ac` AS `type_ac` from (`plot` `p` join `users` `u` on(((`p`.`user_id` = `u`.`id`) and `p`.`p_id` in (select `history_price_p`.`advertisement_id` from `history_price_p`) and (`p`.`gas` = true) and (`p`.`water_supply` = true) and (`p`.`status_plot` = 'Личное подсобное х-во')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sort_price_h`
--

/*!50001 DROP VIEW IF EXISTS `sort_price_h`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sort_price_h` AS select `house`.`house_id` AS `house_id`,`house`.`user_id` AS `user_id`,`house`.`address` AS `address`,`house`.`year_bilt` AS `year_bilt`,`house`.`square` AS `square`,`house`.`tel` AS `tel`,`u`.`type_ac` AS `type_ac`,`house`.`price` AS `price`,`house`.`type_of_transaction` AS `type_of_transaction` from (`house` join `users` `u` on(((`house`.`user_id` = `u`.`id`) and (`house`.`type_of_transaction` = 'rent')))) order by `house`.`price` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 23:30:00
