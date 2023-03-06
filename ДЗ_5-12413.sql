DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'dolor',1),(2,'soluta',2),(3,'quis',3),(4,'itaque',4),(5,'qui',5),(6,'et',6),(7,'veniam',7),(8,'officia',8),(9,'cum',9),(10,'officiis',10),(11,'qui',11),(12,'excepturi',12),(13,'aut',13),(14,'quibusdam',14),(15,'quo',15),(16,'et',16),(17,'molestias',17),(18,'necessitatibus',18),(19,'quae',19),(20,'labore',20);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`initiator_user_id` <> `target_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,11,'2015-06-03 04:04:22','2020-06-05 11:28:52','unfriended'),(1,14,'2003-10-02 23:44:08','2015-06-27 07:31:03','unfriended'),(1,15,'1983-02-22 00:48:00','2012-01-27 08:40:23','approved'),(2,11,'1984-05-28 17:20:23','1981-07-16 02:41:53','unfriended'),(2,16,'2020-12-23 10:42:52','2019-08-15 11:20:26','declined'),(2,19,'1985-08-21 11:20:05','1976-09-01 03:39:47','declined'),(3,15,'2003-10-07 07:34:43','1997-09-11 17:19:02','unfriended'),(3,20,'1986-10-22 06:18:14','2015-01-06 10:22:05','requested'),(4,13,'2020-11-05 23:05:56','1994-10-11 00:02:18','requested'),(4,16,'2009-08-03 05:18:22','2019-07-16 09:25:17','declined'),(5,14,'1981-06-21 01:28:05','1993-03-11 18:50:22','unfriended'),(5,20,'1986-12-31 10:24:55','2006-06-14 21:49:58','unfriended'),(6,20,'1982-01-14 10:28:45','2001-05-24 20:48:25','declined'),(7,13,'2020-05-23 03:16:04','1975-02-10 09:18:42','declined'),(8,11,'1986-06-22 20:59:15','1977-06-12 02:03:53','approved'),(9,20,'2010-02-05 11:09:35','1970-11-29 08:09:01','approved'),(10,15,'1981-06-12 16:44:13','2012-08-29 13:53:45','approved'),(10,20,'1977-02-14 01:02:54','2014-03-20 00:27:29','unfriended');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`media_id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1995-06-20 02:15:07'),(2,2,2,'1980-01-24 04:10:22'),(3,3,3,'1994-03-24 05:31:39'),(4,4,4,'1994-01-22 08:25:46'),(5,5,5,'2017-09-17 09:25:02'),(6,6,6,'1970-04-06 09:42:36'),(7,7,7,'2001-12-10 13:34:24'),(8,8,8,'2014-04-01 16:27:22'),(9,9,9,'1987-03-19 20:58:24'),(10,10,10,'1975-05-22 22:32:56'),(11,11,11,'2009-08-13 07:50:26'),(12,12,12,'2011-04-06 14:43:18'),(13,13,13,'2012-06-15 20:11:17'),(14,14,14,'1987-09-10 13:29:00'),(15,15,15,'1999-03-22 19:29:02'),(16,16,16,'1983-09-29 22:24:39'),(17,17,17,'1995-05-04 03:37:14'),(18,18,18,'2010-07-29 09:21:36'),(19,19,19,'2008-11-27 13:06:56'),(20,20,20,'2020-03-11 10:53:22');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Tenetur sit iure aliquid et molestias. Aut numquam autem laborum itaque nemo. Quas voluptates voluptatem porro recusandae quia similique. Sapiente sequi est ea voluptas nobis.',NULL,'1998-02-21 13:27:19','1971-07-23 17:20:33'),(2,2,2,'Rerum aut et magnam molestiae praesentium commodi vitae. Cupiditate illum inventore quos soluta qui eligendi. At unde quod qui. Quos debitis est praesentium.',NULL,'1993-11-03 15:25:59','1978-12-23 15:31:06'),(3,3,3,'Quia dolorum sed repudiandae modi quos et. Commodi quaerat autem est eius perspiciatis. Vel eligendi qui dignissimos eveniet at.',NULL,'1985-01-28 12:42:20','2017-06-26 11:44:09'),(4,4,4,'Illum esse qui possimus error et sed. Delectus perspiciatis fugiat molestiae dolores ut beatae omnis sed. Vero et esse ab et. Ut officiis sint nobis nihil.',NULL,'1996-01-18 21:27:31','1995-08-04 06:30:04'),(5,5,5,'Enim et rerum quia ut quam. Eos placeat rerum voluptatum eos vero. Rerum aut natus modi.',NULL,'1998-05-21 21:16:11','1994-11-26 23:17:03'),(6,6,6,'Qui repellat vitae distinctio aliquam totam a. Consequatur dolorem deleniti rerum ut aut possimus. Blanditiis repellat qui et blanditiis perferendis quod occaecati. Ut ab ut quidem eos sunt ut. Cum qui pariatur velit voluptates veritatis culpa sed.',NULL,'2007-11-21 02:25:46','2012-04-10 03:41:46'),(7,7,7,'Similique qui quisquam rem vel facere dolor qui. Nihil rem itaque ut repellat aspernatur error. Sit distinctio maiores est ipsam. Est in praesentium voluptates maxime et est. Nobis ut distinctio quam quo cupiditate nihil expedita.',NULL,'2001-11-23 03:10:39','1978-06-05 06:04:49'),(8,8,8,'Dolorem impedit consequuntur voluptatem dolorem sunt autem beatae. Inventore eligendi tempore dignissimos qui quasi dolorum. Quae dolor vel nam voluptates. Numquam et aut labore sapiente dignissimos perferendis maxime.',NULL,'1994-01-06 20:12:11','1986-01-02 11:00:58'),(9,9,9,'Molestiae incidunt consequuntur nostrum dolorum. Quia delectus sit enim quia est consectetur sed.',NULL,'1979-06-29 06:30:37','1985-07-14 18:38:18'),(10,10,10,'Quia autem est dolor consequatur quis nemo. Eos corporis vel blanditiis minus incidunt quos quae. Nisi sint ab consequatur aut incidunt. Ullam harum dolorum eveniet.',NULL,'2002-07-26 22:31:32','1981-10-29 01:48:04'),(11,11,11,'Sint adipisci asperiores nulla eveniet vitae qui ut. Aut ullam ea est ipsa autem. Et eum exercitationem minus voluptatem in. Ab deserunt voluptates vero consequatur vero quo.',NULL,'2012-11-21 19:55:53','2015-05-03 21:06:17'),(12,12,12,'Non sunt non animi sunt possimus aut. Dolor accusamus debitis fuga.',NULL,'2019-01-08 22:06:42','1980-02-10 13:05:58'),(13,13,13,'Soluta nostrum aspernatur rem in. Voluptatem itaque explicabo quae mollitia accusamus. Debitis sed itaque qui quam consectetur ipsa.',NULL,'1986-03-10 01:29:19','1972-12-03 17:47:23'),(14,14,14,'Fuga nihil rerum quas beatae ipsum laudantium amet. A quae quia accusantium et quia culpa iste. Beatae odio in nihil cupiditate consequuntur. Similique voluptatem a at nihil neque ducimus.',NULL,'2017-01-21 04:01:13','1970-06-18 09:11:46'),(15,15,15,'Rerum quae neque dolorem nisi delectus distinctio tempora voluptates. Velit quidem ut praesentium qui quod eveniet quia. Et eius et minus assumenda. Incidunt laudantium sequi nostrum natus.',NULL,'2015-02-14 05:03:40','1972-04-10 20:25:54'),(16,16,16,'Commodi rerum nam ipsum rerum suscipit ullam ad et. Et id excepturi ut ratione animi officia ut. Consequatur iste alias dolores nesciunt provident aut. Sunt reprehenderit alias omnis voluptas recusandae quo quia.',NULL,'2015-01-24 17:35:54','2019-06-12 03:35:56'),(17,17,17,'Reprehenderit et itaque soluta aut ut tempore. Ad voluptatum velit quae iusto rerum repellendus distinctio necessitatibus. Iste maxime aspernatur perferendis temporibus voluptas ut. Distinctio rerum aliquid repellat magni beatae officiis fugit.',NULL,'2010-06-26 04:55:44','1984-12-06 19:35:49'),(18,18,18,'Reiciendis eligendi inventore provident. Cum molestias itaque assumenda.',NULL,'1995-08-17 07:55:12','2009-02-02 12:08:42'),(19,19,19,'Et adipisci distinctio nesciunt et dolor. Voluptas et et exercitationem accusantium dignissimos et. Eos et quia molestias quo non hic.',NULL,'2015-03-17 22:01:35','1997-07-04 00:07:47'),(20,20,20,'Vel dolores dicta eligendi aspernatur facilis. Et ullam doloremque est numquam tempore. Consequatur ipsam ipsam qui. Quod rerum sunt aut autem quia officia sequi harum. Consectetur sapiente vitae inventore.',NULL,'1993-12-02 22:02:20','1992-02-07 02:35:38');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_comments`
--

DROP TABLE IF EXISTS `media_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `body` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`media_id`,`target_user_id`),
  UNIQUE KEY `id` (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `media_comments_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_comments_ibfk_2` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_comments_ibfk_3` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_comments`
--

LOCK TABLES `media_comments` WRITE;
/*!40000 ALTER TABLE `media_comments` DISABLE KEYS */;
INSERT INTO `media_comments` VALUES (1,'Magni quidem quia fuga qui officiis autem. Laboriosam quis rerum aut. Maiores porro autem dicta aut.',1,3,6,'2000-01-14 16:05:13'),(2,'Dolores quis corrupti eius in. Ab reprehenderit voluptate hic temporibus hic.',2,12,10,'2005-12-17 19:12:18'),(3,'Dolores itaque nulla eaque occaecati libero velit nobis. Culpa sit et veniam est consequatur incidunt labore. Commodi voluptatem sit saepe enim totam labore necessitatibus et. Consequatur quos amet sit et ut.',3,4,19,'1989-07-13 09:31:44'),(4,'Consequatur repellat accusantium sed aut praesentium vero deserunt quia. Nihil dolor vero enim voluptatem sit fugiat et ut. Soluta sapiente ducimus soluta quaerat nemo deleniti.',4,8,7,'1987-08-22 11:55:32'),(5,'Id error sed ratione sit pariatur sapiente. Alias veritatis numquam excepturi autem. Voluptas laborum nemo rem ut sint velit.',5,6,14,'1973-07-08 02:27:33'),(6,'Ipsum et tempore iusto quis quisquam. Ut voluptas illo excepturi labore porro. Doloremque tempore asperiores ipsam et illo itaque labore vel.',6,7,2,'1992-05-03 00:30:51'),(7,'Delectus rerum saepe dolor. Delectus sit et reiciendis asperiores. Voluptatem aspernatur eius deleniti.',7,8,15,'2011-11-11 23:57:09'),(8,'Ut et voluptate quaerat aut provident impedit. Nisi illo animi dignissimos quisquam error quisquam. Rerum aperiam quidem saepe atque illum omnis magnam.',8,2,13,'2009-06-05 17:56:39'),(9,'Similique exercitationem consequatur eligendi dolorem architecto natus. Voluptatem aut aut expedita optio. Culpa sit autem sit id quaerat assumenda vitae.',9,6,11,'2010-09-28 22:34:26'),(10,'Neque non qui maiores. Eum eius corrupti illum sit qui doloremque. Et nulla recusandae illum similique.',10,8,12,'1979-07-02 11:34:28'),(11,'Id aut harum ut aut fuga et. Aut optio et nihil expedita.',11,6,18,'2002-03-07 23:25:04'),(12,'Sint repellat consectetur corrupti autem aut cupiditate. Quia optio possimus commodi ea dignissimos sit. Illo eum est laudantium rem. Quam unde ex vel labore modi voluptates maxime.',12,2,16,'1992-02-13 17:29:40'),(13,'Eos enim aliquam vero. Perferendis et itaque incidunt quibusdam vel animi placeat. Dolores eius non sit consequatur qui. In harum ex at voluptas.',13,19,20,'1984-07-09 18:12:23'),(14,'Ut in animi eaque ut voluptate aut nobis. Placeat velit ratione deleniti id delectus.',14,10,4,'2005-02-09 11:50:06'),(15,'Odit et qui veniam quaerat. Molestiae deserunt a maiores similique. Autem amet aliquid nobis sed possimus rerum.',15,5,8,'2004-04-14 03:12:04'),(16,'Consequatur reiciendis nihil fuga aliquid iusto dolore aut est. Odio odit voluptatem optio et dolore veniam. Quam quibusdam ut voluptates praesentium minus perferendis corrupti et.',16,14,3,'2020-04-28 15:44:20'),(17,'Nemo optio nihil rerum molestiae nemo. Accusamus nihil necessitatibus ut sit eligendi natus vel.',17,11,5,'2012-08-19 01:08:14'),(18,'Aut sunt qui officiis ullam ad ea nisi consequatur. Commodi non non id sit nobis velit et. Autem omnis impedit minus quia necessitatibus. Sint autem hic et.',18,5,1,'2003-11-23 10:22:59'),(19,'Iusto consequatur molestias odit dignissimos minus porro. Id tempora eos rem earum quasi asperiores et. Optio assumenda dolorum saepe quidem natus voluptatem in corporis. Dolor et quasi eaque facilis ea illo unde.',19,17,9,'2013-10-30 06:04:49'),(20,'Cumque deserunt earum aut ipsam et. Dolores odio in veniam corporis sunt nisi ut. Unde quidem voluptatem qui sit quia temporibus.',20,18,17,'2016-04-10 03:04:52');
/*!40000 ALTER TABLE `media_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'sunt'),(2,'velit'),(3,'expedita'),(4,'molestiae'),(5,'et'),(6,'qui'),(7,'enim'),(8,'consequatur'),(9,'placeat'),(10,'et'),(11,'occaecati'),(12,'facere'),(13,'tempora'),(14,'in'),(15,'sunt'),(16,'excepturi'),(17,'optio'),(18,'dolores'),(19,'magni'),(20,'est');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,7,16,'Deserunt consequuntur sunt est non. Eos unde ratione dolorem ea amet laudantium. Et voluptatem officiis eaque quibusdam et eveniet. Aut ut aspernatur perferendis qui hic.','2006-10-16 11:29:54'),(2,10,13,'Ut magnam hic voluptas non est deleniti fugiat nisi. Ratione voluptas vero asperiores praesentium. Delectus omnis ipsa ab eaque rerum. Numquam molestias totam nihil laboriosam.','1978-03-01 21:59:04'),(3,10,15,'Officia dolores rerum enim consequatur qui quia vero. Facere animi maxime dolorum iste perferendis mollitia. Nesciunt aut occaecati voluptas.','1978-03-24 17:42:31'),(4,3,15,'Porro illo dolor ut quia occaecati delectus. Iure odio maiores qui unde rerum laboriosam.','1976-11-02 12:52:52'),(5,5,16,'Esse rerum dolor eaque maiores ullam distinctio ut. Facere amet consequatur est ex numquam repellat. Sequi dolore quis eligendi reprehenderit veritatis quibusdam. In animi numquam fugit.','1980-03-25 06:51:21'),(6,9,12,'Aspernatur a laudantium culpa laboriosam illo dolorem et. Provident molestiae dolores aspernatur quasi iure debitis sit. Eum aperiam eveniet rerum sunt eum impedit ut voluptates.','1976-11-29 15:58:04'),(7,3,14,'Quidem sint facilis molestiae voluptas dolorem repudiandae. Enim et et non blanditiis possimus omnis in.','1993-08-14 07:11:51'),(8,9,14,'Ipsa perspiciatis quia qui qui in. Distinctio repellendus consectetur eum vitae unde corporis. Ratione consectetur eum quasi exercitationem rem. Nihil consequatur deserunt repellat itaque quia laudantium.','1977-03-19 15:58:44'),(9,9,12,'Aspernatur voluptas placeat veritatis ratione. Qui et magnam repellat aut fuga. Sapiente aut maiores iure est quia natus. Magnam ut quis velit ipsa doloribus. Quidem doloribus suscipit enim ut et animi magnam.','2000-04-28 13:06:40'),(10,4,15,'Quidem iusto officiis modi cumque. Ut ea nam eveniet. Et perspiciatis et odio in pariatur.','2011-11-05 21:47:44'),(11,6,13,'Sapiente non molestiae debitis sequi labore repellendus voluptates libero. In enim tempora vero praesentium. Cumque sit culpa quia ab omnis et doloremque. Harum possimus veritatis doloremque magnam.','1978-08-08 13:41:32'),(12,3,16,'Rerum voluptatem odit quis quidem sunt inventore aut nobis. Exercitationem et et expedita et ab est voluptas. Quia sit sit voluptatibus.','2018-02-07 11:23:04'),(13,10,16,'Qui at sed quia deleniti pariatur eaque laborum nobis. Delectus quisquam ullam quos suscipit eaque amet facilis nostrum.','1985-04-11 12:14:19'),(14,9,14,'Nisi est sed ratione nesciunt. Sunt alias ut atque et tempore. Necessitatibus qui dolorem molestiae.','2003-06-09 06:36:44'),(15,4,19,'Minima distinctio ad sunt in nesciunt. Ut nihil eum explicabo quisquam reprehenderit laborum voluptatibus. Officia non dolorum ab dolor modi velit corrupti. In consequatur ad commodi consequatur.','1978-06-21 11:13:55'),(16,4,19,'Illo voluptas sed laborum maiores. Et enim ut et enim ullam voluptas nostrum. Occaecati quo aut rerum est quia. Sit qui amet delectus nihil.','2021-10-07 07:16:06'),(17,9,20,'Nesciunt et esse modi illum. Voluptatem ut aut facilis magnam iusto. Explicabo vitae et consequuntur temporibus aliquam nihil.','1976-01-30 18:49:23'),(18,1,20,'Id voluptatem nihil reprehenderit iusto reprehenderit. Quasi repudiandae ut doloremque nihil assumenda enim. Sint harum necessitatibus voluptas fugiat.','2016-02-21 12:00:41'),(19,1,16,'Et explicabo corrupti nostrum quod sit. Temporibus ut praesentium ab aperiam nostrum. Enim occaecati odit asperiores. Suscipit minus sint quis qui et.','2022-06-12 13:37:53'),(20,6,14,'Omnis eius ratione optio cupiditate minus. Repellat dolorum expedita doloribus quis fugit. Qui et autem nihil delectus doloribus. Sit voluptates veniam reprehenderit distinctio qui. Est voluptas ex architecto velit consectetur voluptatem.','1993-01-15 02:04:57');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_photo_likes`
--

DROP TABLE IF EXISTS `profile_photo_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_photo_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile_photo_id` bigint(20) unsigned NOT NULL,
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`profile_photo_id`,`target_user_id`),
  UNIQUE KEY `id` (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `profile_photo_likes_ibfk_1` FOREIGN KEY (`profile_photo_id`) REFERENCES `profile_photos` (`id`),
  CONSTRAINT `profile_photo_likes_ibfk_2` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `profile_photo_likes_ibfk_3` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_photo_likes`
--

LOCK TABLES `profile_photo_likes` WRITE;
/*!40000 ALTER TABLE `profile_photo_likes` DISABLE KEYS */;
INSERT INTO `profile_photo_likes` VALUES (1,1,4,13,'1977-03-28 02:13:45'),(2,2,9,20,'1972-01-29 04:37:44'),(3,3,7,16,'2010-11-20 13:04:45'),(4,4,6,12,'2005-09-18 16:53:40'),(5,5,5,14,'2018-07-21 00:52:03'),(6,6,2,17,'1980-06-19 03:30:29'),(7,7,3,15,'1984-03-23 01:18:16'),(8,8,6,14,'2010-11-02 02:59:47'),(9,9,2,16,'2007-06-26 12:44:24'),(10,10,5,14,'2008-11-14 13:34:29'),(11,11,5,14,'1977-09-05 22:49:49'),(12,12,9,18,'1971-08-09 10:43:33'),(13,13,6,12,'1971-10-24 21:47:58'),(14,14,5,19,'2001-08-18 21:38:35'),(15,15,10,16,'1974-04-11 20:46:21'),(16,16,4,14,'2015-01-11 17:40:00'),(17,17,10,16,'2002-08-06 17:16:32'),(18,18,7,16,'2008-07-18 19:32:34'),(19,19,4,12,'2001-08-14 09:44:10'),(20,20,5,19,'2008-10-02 22:46:33');
/*!40000 ALTER TABLE `profile_photo_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_photos`
--

DROP TABLE IF EXISTS `profile_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profile_photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_photos`
--

LOCK TABLES `profile_photos` WRITE;
/*!40000 ALTER TABLE `profile_photos` DISABLE KEYS */;
INSERT INTO `profile_photos` VALUES (1,1,'Molestiae nobis optio nihil deserunt et molestiae consequatur. Dolor numquam qui autem eveniet sit debitis dolorem eius. Deserunt ratione enim ut et. Esse ex ut et molestiae ratione repellat porro vitae.',NULL,'1988-05-13 19:22:01'),(2,2,'Eos quibusdam velit id ut officia cumque. Possimus possimus dolorem ab laudantium assumenda veniam libero distinctio. Nihil rerum atque fuga autem quaerat dolore. Iusto consequuntur eum quidem laudantium consequatur veritatis nulla.',NULL,'2009-07-03 03:02:33'),(3,3,'Et dolorem repellendus aut voluptatem. Sit nihil est optio quibusdam facilis. Est iure et ex numquam ullam. Consequatur voluptas quae molestiae ut quibusdam. Possimus maiores commodi voluptas delectus aut at.',NULL,'1988-09-08 04:55:13'),(4,4,'Ut est sunt nobis consequatur mollitia. Natus magnam dolore incidunt. Eius atque doloremque nesciunt molestias saepe ea.',NULL,'2015-05-05 16:53:45'),(5,5,'Omnis et et molestiae cum cupiditate est voluptatem. Esse magnam ipsa voluptatem ut culpa. Velit magni doloremque omnis a libero necessitatibus.',NULL,'2016-08-09 18:43:04'),(6,6,'Rerum molestiae sit rem. Aut non libero optio aut. Rem necessitatibus in laboriosam repudiandae.',NULL,'2021-01-07 10:03:41'),(7,7,'Voluptatibus sed ipsum et neque unde quia a. Aut non nemo suscipit deserunt sequi temporibus. Velit aut praesentium eum quaerat dolor dolor quia.',NULL,'2013-06-18 16:40:41'),(8,8,'Alias at facilis exercitationem maxime fuga et. Quod recusandae sequi perferendis et reprehenderit tempore perspiciatis consequatur. Qui iure est amet error. Inventore facilis voluptatem velit culpa voluptatum dolor. Iste eos suscipit minus aut maxime vol',NULL,'1978-02-01 04:49:55'),(9,9,'Doloremque rerum iure totam et reiciendis itaque quis dolores. Voluptatem sint est rerum. Quidem sequi sed sit sit temporibus facere.',NULL,'2010-12-09 12:11:11'),(10,10,'Eum aut ut maxime quia quia repudiandae fugiat. Fugit quasi dignissimos voluptatum aspernatur nihil in et magni. Qui quisquam ut tempora corrupti molestiae.',NULL,'2020-09-29 19:53:32'),(11,11,'Voluptatibus aut aut voluptatibus voluptas. Eaque autem omnis fuga enim maxime. Tempora deleniti sint quo.',NULL,'1992-03-18 05:11:25'),(12,12,'Aut in facilis eaque ducimus nemo ipsum commodi. Magni illo pariatur quia veritatis fugiat fugit ipsa. Id accusantium voluptas modi.',NULL,'1992-04-06 08:56:22'),(13,13,'Doloribus unde repellendus optio vero officiis. Non alias ea quia quas aut. Minima quos repudiandae aut voluptates sit sit. Sunt velit dolores a illo et.',NULL,'1995-10-24 22:42:54'),(14,14,'Omnis voluptatem ullam quos ipsa ipsa corrupti ex. Dolor adipisci nostrum eaque at delectus maiores est. Quisquam perspiciatis alias est. Laborum veritatis aliquam deleniti molestiae ea optio.',NULL,'2004-10-31 10:36:33'),(15,15,'Velit non esse delectus distinctio explicabo. Ullam sunt eos et at voluptatem non dolor. Natus nulla sed vero hic voluptate.',NULL,'1982-04-13 12:42:06'),(16,16,'Vitae dignissimos quisquam illo velit. Voluptate natus exercitationem et fugiat blanditiis. Repellendus enim aspernatur ut perspiciatis quaerat.',NULL,'1992-11-27 03:03:57'),(17,17,'Voluptas provident earum adipisci delectus eligendi. Consequatur alias nobis assumenda animi et velit voluptatem. Eum et dolor perferendis tempore.',NULL,'2014-12-25 12:14:22'),(18,18,'Aperiam optio sint quasi tempore autem maiores aut. Atque occaecati aut quo quasi. Perferendis sed et animi nulla.',NULL,'2002-11-14 22:06:36'),(19,19,'Ea tenetur est ipsa et tenetur. Neque voluptas dolores praesentium necessitatibus omnis. Enim quia beatae rerum ducimus unde officia. Sed reprehenderit ut est sed ratione.',NULL,'2022-07-01 14:36:03'),(20,20,'Aut dolor quae quas occaecati itaque. Vitae quod facilis incidunt blanditiis totam enim. Possimus voluptatem minus itaque corporis repellat provident. Aut ea consectetur accusamus dolores blanditiis sint repellendus maxime.',NULL,'1973-02-28 08:18:39');
/*!40000 ALTER TABLE `profile_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','East Juanaside','2015-10-06 01:17:44'),(2,'f','Malloryborough','2016-09-11 19:32:21'),(3,'f','Port Roxaneborough','1992-01-21 08:55:31'),(4,'f','Lake Randallmouth','2020-12-21 18:07:26'),(5,'m','South Aracely','1994-12-10 20:56:24'),(6,'m','Grahamfurt','1981-05-24 23:55:28'),(7,'m','Vonbury','1994-07-17 23:31:46'),(8,'m','North Gay','1988-06-12 17:48:48'),(9,'f','West Phoebeview','2017-03-14 23:21:22'),(10,'f','Hettingerstad','1981-08-29 22:49:36'),(11,'m','Vernieburgh','2006-01-05 01:19:31'),(12,'m','Port Maddison','2019-06-17 10:16:16'),(13,'m','West Antonetta','1989-11-01 19:39:35'),(14,'m','Lake Daren','2015-02-19 03:03:54'),(15,'m','Alaynamouth','1983-06-25 06:22:42'),(16,'f','Chaddchester','2010-08-22 22:24:44'),(17,'m','New Ryley','2001-07-30 01:41:55'),(18,'f','West Elinore','1979-07-31 01:53:07'),(19,'f','Port Eunaside','1974-10-16 04:59:09'),(20,'f','Labadiechester','2002-11-19 02:40:02');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `password_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_users_username` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Berniece','Conroy','donald63@example.net',89880192620,'fc82fcb146d7e4b77190c680242dc9e82e114674'),(2,'Stephany','Beahan','stroman.raheem@example.net',89590355692,'edee151c1d92b4d457cd16862f75e81168fdd95f'),(3,'Graciela','Greenfelder','candace.schuster@example.com',89074795993,'1c699699f6e6fd3c9f929acc419d52df99b6d566'),(4,'Alvera','Ernser','bode.constance@example.net',89901626675,'ff5ada491044ae4743eeda2be33bcc4f35991ac6'),(5,'Rogelio','King','jakubowski.nola@example.com',89782653771,'9a488b0360e43caff087da95b87be847d0c2f80f'),(6,'Horace','Vandervort','abshire.myah@example.net',89237011733,'f1ade11439ea11e00207642666ec281392c3ca6f'),(7,'Jerrell','Kulas','randal28@example.com',89103017279,'f9ff9e0c1e3a2d7d29ccd7ad92f0eb1c901a382c'),(8,'Katlyn','Schmidt','schuster.myriam@example.org',89823724164,'403552ced040c8b06d06d850f19f86a9d49f821a'),(9,'Hank','Kunde','zjohnston@example.org',89536172833,'652af90fd69fa1487c75a89b82f51ac9037a8956'),(10,'Alvena','Stamm','celia97@example.com',89995684630,'d99ab57cdb628a156951bb0931d1ae61faa86011'),(11,'Ernesto','Ritchie','beer.anissa@example.com',89861900850,'d5c0bb227d9b042080c630a555ccbfb7706dd868'),(12,'Milo','Reinger','kaley.gutkowski@example.com',89472288783,'fb2c7ae2eab9e1959f1824948a0576e0561e5869'),(13,'Jettie','Gislason','uschiller@example.org',89236594280,'8a0e4b04e38abb7b05b337607b7cdc5c8eacff40'),(14,'Jesus','Marquardt','reynold34@example.com',89341819328,'2e52bb5acb01065571450a1af35e0e37af57d595'),(15,'Layla','Williamson','lindgren.hulda@example.net',89188055023,'efbf66f80ff0047c12c4ae295fce530f0d0fc876'),(16,'Janick','Emard','reyna21@example.net',89672343992,'1b9eb38b6c4f0fe0cd3c5051999445d097032cfa'),(17,'Alyson','Kunde','zkassulke@example.net',89840197823,'64cf12eb6d7cd6e008196699134bb4a437fe7e5e'),(18,'Duane','Wisozk','russel.amie@example.org',89042481327,'37860961ecd51cc6e6a910abd3571c4b95798663'),(19,'Everardo','Ernser','tremblay.mikel@example.com',89231931582,'63e46cc4ef7f678db2a17fcfcee174aeae75eef3'),(20,'Emilia','O\'Keefe','wilfred.turner@example.com',89022911918,'b4ac3198f52f2ecfcf134985189e8518c8542883');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-17 11:55:14

SELECT DISTINCT firstname FROM users
ORDER BY firstname ASC;

ALTER TABLE profiles ADD COLUMN age int UNSIGNED NOT NULL;
UPDATE profiles SET age = FLOOR(10 + RAND() * 50);
ALTER TABLE profiles ADD is_active BIT DEFAULT TRUE NULL;
SELECT * FROM profiles;

UPDATE profiles 
SET is_active = FALSE 
WHERE age < 18;
SELECT * FROM profiles;

SELECT * FROM messages;
DELETE FROM messages WHERE created_at > now();

-- ДЗ_5
-- 1.1
ALTER TABLE users ADD COLUMN created_at datetime;
ALTER TABLE users ADD COLUMN updated_at datetime;
UPDATE users SET created_at = now(), updated_at = now();
SELECT * FROM users;

-- 1.2
ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users DROP COLUMN updated_at;
ALTER TABLE users ADD COLUMN created_at varchar(50);
ALTER TABLE users ADD COLUMN updated_at varchar(50);

UPDATE users SET created_at = '20.10.2017 8:10';
UPDATE users SET updated_at = '20.10.2017 8:10';
UPDATE users SET created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'), updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');
ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT NOW();
ALTER TABLE users CHANGE updated_at updated_at DATETIME ON UPDATE NOW();
SELECT * FROM users;
 

-- 1.4
ALTER TABLE users ADD COLUMN birthday varchar(50);
UPDATE users SET birthday = 'may' WHERE firstname = 'Berniece';
UPDATE users SET birthday = 'june' WHERE firstname = 'Stephany';
UPDATE users SET birthday = 'may' WHERE firstname = 'Graciela';
UPDATE users SET birthday = 'august' WHERE firstname = 'Alvera';
UPDATE users SET birthday = 'february' WHERE firstname = 'Rogelio';
UPDATE users SET birthday = 'may' WHERE firstname = 'Horace';
UPDATE users SET birthday = 'march' WHERE firstname = 'Jerrell';
UPDATE users SET birthday = 'july' WHERE firstname = 'Katlyn';
UPDATE users SET birthday = 'may' WHERE firstname = 'Hank';
UPDATE users SET birthday = 'december' WHERE firstname = 'Alvena';
UPDATE users SET birthday = 'may' WHERE firstname = 'Ernesto';
UPDATE users SET birthday = 'november' WHERE firstname = 'Milo';
UPDATE users SET birthday = 'august' WHERE firstname = 'Jettie';
SELECT * FROM users;
SELECT * FROM users WHERE birthday = 'may' OR birthday = 'august';

-- 2.1
SELECT round(AVG(age), 0) FROM profiles;

-- 2.3
SELECT exp(SUM(log(user_id))) FROM profiles;
