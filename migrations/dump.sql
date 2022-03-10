
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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `widgets` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `widgets`;
DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (9,'','Trans','tman@test.com','2022-02-26 04:36:15','2022-02-26 04:36:15'),(10,'','Bruce ','bwayne@example.com','2022-03-04 01:28:25','2022-03-04 01:28:25'),(11,'','Weil','wwang@gmail.com','2022-03-04 01:58:40','2022-03-04 01:58:40'),(12,'','Daniel','djane@exam.com','2022-03-04 02:25:40','2022-03-04 02:25:40'),(13,'','weilyuwang','sss@test.com','2022-03-04 02:29:03','2022-03-04 02:29:03'),(14,'','weilyu','weilyu@test.com','2022-03-08 19:01:05','2022-03-08 19:01:05'),(15,'Weilyu','Brozne ','bronzew@test.com','2022-03-08 21:30:51','2022-03-08 21:30:51'),(16,'Weilyu Bronze','Brozne ','bronzew@test.com','2022-03-08 21:43:34','2022-03-08 21:43:34'),(17,'W T','T','wt@test.com','2022-03-08 21:43:56','2022-03-08 21:43:56'),(18,'ww','www','www@test.com','2022-03-09 02:48:34','2022-03-09 02:48:34');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_widgets_id_fk` (`widget_id`),
  KEY `orders_transactions_id_fk` (`transaction_id`),
  KEY `orders_statuses_id_fk` (`status_id`),
  KEY `orders_customers_id_fk` (`customer_id`),
  CONSTRAINT `orders_customers_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_statuses_id_fk` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_transactions_id_fk` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_widgets_id_fk` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,1,8,1,1,1000,'2022-02-26 04:36:15','2022-02-26 04:36:15',9),(3,1,9,1,1,1000,'2022-03-04 01:28:25','2022-03-04 01:28:25',10),(4,1,10,1,1,1000,'2022-03-04 01:58:40','2022-03-04 01:58:40',11),(5,1,11,1,1,1000,'2022-03-04 02:25:41','2022-03-04 02:25:41',12),(6,1,12,1,1,1000,'2022-03-04 02:29:03','2022-03-04 02:29:03',13),(7,1,16,1,1,1000,'2022-03-08 19:01:05','2022-03-08 19:01:05',14),(8,2,17,1,1,2000,'2022-03-08 21:30:51','2022-03-08 21:30:51',15),(9,2,18,1,1,2000,'2022-03-08 21:43:34','2022-03-08 21:43:34',16),(10,2,19,1,1,2000,'2022-03-08 21:43:56','2022-03-08 21:43:56',17),(11,1,20,1,1,1000,'2022-03-09 02:48:34','2022-03-09 02:48:34',18);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `schema_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migration` (
  `version` varchar(14) NOT NULL,
  UNIQUE KEY `schema_migration_version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `schema_migration` WRITE;
/*!40000 ALTER TABLE `schema_migration` DISABLE KEYS */;
INSERT INTO `schema_migration` VALUES ('20210630180628'),('20210630180635'),('20210630181022'),('20210630183342'),('20210630183733'),('20210630184028'),('20220220031419'),('20220222003656'),('20220222004034'),('20220222005109'),('20220304011819'),('20220308033654'),('20220309195816'),('20220310194004');
/*!40000 ALTER TABLE `schema_migration` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Cleared','2022-02-19 03:58:57','2022-02-19 03:58:57'),(2,'Refunded','2022-02-19 03:58:57','2022-02-19 03:58:57'),(3,'Cancelled','2022-02-19 03:58:57','2022-02-19 03:58:57');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token_hash` varbinary(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expiry` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (5,1,'User','admin@example.com','Äa¨—óGÉçÁÞu´UÚ‰=/S í¾Æ$_:(`ÐŒ£','2022-03-09 21:53:22','2022-03-09 21:53:22','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `transaction_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `transaction_statuses` WRITE;
/*!40000 ALTER TABLE `transaction_statuses` DISABLE KEYS */;
INSERT INTO `transaction_statuses` VALUES (1,'Pending','2022-02-19 03:58:57','2022-02-19 03:58:57'),(2,'Cleared','2022-02-19 03:58:57','2022-02-19 03:58:57'),(3,'Declined','2022-02-19 03:58:57','2022-02-19 03:58:57'),(4,'Refunded','2022-02-19 03:58:57','2022-02-19 03:58:57'),(5,'Partially refunded','2022-02-19 03:58:57','2022-02-19 03:58:57');
/*!40000 ALTER TABLE `transaction_statuses` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `last_four` varchar(255) NOT NULL,
  `bank_return_code` varchar(255) NOT NULL,
  `transaction_status_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expiry_month` int(11) NOT NULL DEFAULT 0,
  `expiry_year` int(11) NOT NULL DEFAULT 0,
  `payment_intent` varchar(255) NOT NULL DEFAULT '',
  `payment_method` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `transactions_transaction_statuses_id_fk` (`transaction_status_id`),
  CONSTRAINT `transactions_transaction_statuses_id_fk` FOREIGN KEY (`transaction_status_id`) REFERENCES `transaction_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (8,1000,'cad','4242','ch_3KXI0uEfLuseb67n1ecak8Sn',2,'2022-02-26 04:36:15','2022-02-26 04:36:15',12,2024,'',''),(9,1000,'cad','4242','ch_3KZPwQEfLuseb67n1q83C9mo',2,'2022-03-04 01:28:25','2022-03-04 01:28:25',12,2023,'pi_3KZPwQEfLuseb67n1jS9h1DG','pm_1KZPwREfLuseb67nh24gHwQ1'),(10,1000,'cad','4242','ch_3KZQPhEfLuseb67n1Uix7OQ7',2,'2022-03-04 01:58:40','2022-03-04 01:58:40',12,2023,'pi_3KZQPhEfLuseb67n1mOz4W0Q','pm_1KZQPiEfLuseb67nQSCN3hj6'),(11,1000,'cad','4242','ch_3KZQpqEfLuseb67n1X7a4RRx',2,'2022-03-04 02:25:41','2022-03-04 02:25:41',12,2023,'pi_3KZQpqEfLuseb67n1IBXJhaG','pm_1KZQpqEfLuseb67nXL45ptRR'),(12,1000,'cad','4242','ch_3KZQt6EfLuseb67n0no8fgR9',2,'2022-03-04 02:29:03','2022-03-04 02:29:03',2,2031,'pi_3KZQt6EfLuseb67n00x6v7np','pm_1KZQt7EfLuseb67n2kdgRPOe'),(13,3245,'cad','4242','ch_3KZRAHEfLuseb67n1NK93CzE',2,'2022-03-04 02:46:48','2022-03-04 02:46:48',12,2023,'pi_3KZRAHEfLuseb67n1sMcSTgA','pm_1KZRAIEfLuseb67nVzwtOIGL'),(14,5000,'cad','4242','ch_3KZRE8EfLuseb67n1BKIx2Dr',2,'2022-03-04 02:50:47','2022-03-04 02:50:47',3,2042,'pi_3KZRE8EfLuseb67n197IZf4I','pm_1KZRE9EfLuseb67nWcmAqgu7'),(15,3245,'cad','4242','ch_3KZRGnEfLuseb67n05DhbCWL',2,'2022-03-04 02:53:32','2022-03-04 02:53:32',4,2024,'pi_3KZRGnEfLuseb67n0VBh60q4','pm_1KZRGoEfLuseb67ncS9XOEKe'),(16,1000,'cad','4242','ch_3Kb8HKEfLuseb67n1alQOXKZ',2,'2022-03-08 19:01:05','2022-03-08 19:01:05',12,2023,'pi_3Kb8HKEfLuseb67n1GnMyACE','pm_1Kb8HLEfLuseb67ny1zWI3Oa'),(17,2000,'cad','4242','',2,'2022-03-08 21:30:51','2022-03-08 21:30:51',12,2023,'',''),(18,2000,'cad','4242','',2,'2022-03-08 21:43:34','2022-03-08 21:43:34',12,2023,'',''),(19,2000,'cad','4242','',2,'2022-03-08 21:43:56','2022-03-08 21:43:56',2,2033,'',''),(20,1000,'cad','4242','ch_3KbFZjEfLuseb67n1mjXLdmp',2,'2022-03-09 02:48:34','2022-03-09 02:48:34',12,2023,'pi_3KbFZjEfLuseb67n1lrQALk3','pm_1KbFZkEfLuseb67n7utYmqto');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','User','admin@example.com','$2a$12$VR1wDmweaF3ZTVgEHiJrNOSi8VcS4j0eamr96A/7iOe8vlum3O3/q','2022-02-19 03:58:58','2022-02-19 03:58:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `inventory_level` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) NOT NULL DEFAULT '',
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `plan_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'Widget','A very nice widget.',10,1000,'2022-02-19 03:58:57','2022-02-19 03:58:57','widget.png',0,''),(2,'Bronze Plan','Get three widgets for the price of two every month',10000000,2000,'2022-03-07 22:35:55','2022-03-07 22:35:57','',1,'price_1KZSfDEfLuseb67nRbMXTZkm');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

