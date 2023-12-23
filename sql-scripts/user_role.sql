CREATE DATABASE  IF NOT EXISTS `employee_directory2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employee_directory2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employee_directory2
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_EMPLOYEE'),(2,'ROLE_MANAGER'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `enabled` tinyint NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1,'John','Doe','john@luv2code.com'),(2,'mary','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1,'Mary','Smith','mary@luv2code.com'),(3,'susan','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1,'Susan','Public','susan@luv2code.com'),(4,'sam','$2a$10$KfCQfs8JN2bAun6N5SQHqevUOCyBCmWPSvUtNFqSilwWD8YfiQ7x2',0,'rakam','sayi','say@gmail.com'),(5,'cephe','$2a$10$QxQdE7q3Z12IZX05hGld9OPGw2dKPCkW4daPoplr.QQLuL9dAJIFm',0,'caye','kayfe','k@faadgmail.com'),(6,'yeni','$2a$10$3rQ7wAaJtpO9QNG3aPYjqudguNWRZMQmuQzUGK753NAPS7lDCiiE6',0,'efrahim','PALEST','palesten@gmail.com'),(7,'SD','$2a$10$QdwHwHZ2/KJP3HywnDz5XucMNdIlpKc8y7iEj.5SwIUy0pLLe6azq',0,'ADF','FDASF','email@gmail.com'),(8,'mustafa','$2a$10$jVjX6fP2P3K6OBuv7GIwjOJejgBRoONTGLGUiB/Dxxx8cPPTo4.1u',0,'fx','lx','msenyuz@gmail.com'),(9,'USER','$2a$10$stPZJeKl5.oaN0xK6e8F4.UaaSH6RPWMEAbANf7.OVdg7bIDDpTqS',0,'user','root','userroot@gmail.com'),(10,'omer','$2a$10$iBQ4Z62lIId2iBjBF90d3OhznirEKhg/OE8T9AGRdoV7oz1Jf7agy',0,'omer','longleg','om@gmal.con'),(11,'sdf','$2a$10$ENVtUrfvLCyTSgs05EM.m.dynf23lMzHJa.w6NkaUyhsjyOon8YDO',0,'adf','afd','adfadf@gmail.com'),(12,'ff','$2a$10$dWriYGp3phKJcLoSTlr/3.RLdmKTyMQX0z7PNq4GXQlpEAWZRueo2',0,'fsd','sdf','email@gmail.com'),(13,'et','$2a$10$7N40wNAVob0Vml7E8uvk3.MiPVLyGsbEZDci6jx0vIAywQNhc/Xpe',0,'etkilli','etkili','email@gmail.com'),(14,'kullanici','$2a$10$rYq16whHYha3JJp81wfc5.eCU2GmLfR81.TODq6cCJap4heN08VZ6',0,'kullan','bunu','email@com.com'),(15,'boss','$2a$10$PZbnBuaIeg0pzdDJOw1PO.BWM4n2rhaPdD5NtK6ZlVDl5eqS.oTSC',0,'boss','boss','boss@gmail.com'),(16,'a','$2a$10$6uliE5OG63wAb86QaHPm.uAMOCYaN3anzoMRgkvNeM1dG3qrWMAM2',0,'a','a','adfadf@gmail.com'),(17,'f','$2a$10$22PX.7t/CoyNJhCOrIl7vukKW3PWdJl8yCfAmTSha1c9HvgohxCfO',0,'f','f','besbin@gmail.com'),(18,'c','$2a$10$DUaYOP/R8mxEqjVF0QPW3eXP733n9iNTGpiTM.230nGLWkRCtsNU.',0,'c','c','adfadf@gmail.com'),(19,'e','$2a$10$tWxwg2z4Z7lV7bmKdHF8H.MG5OjiXS3Iz6HHK0xsXo.Dxoa132LJS',0,'e','e','email@gmail.com'),(20,'w','$2a$10$OjzK.KSg9sCvgN.mHBzHG.74ozUn1Jf/e47gLYl/FUOIGF2h0339G',0,'w','w','email@gmail.com'),(21,'2','$2a$10$K80Q0eaJzV0VigWFs9ztaeKzFD11n3PIcwBGx0eYgTxjd1DA588Wm',0,'2','2','adfadf@gmail.com'),(22,'v','$2a$10$6g/hL/9VngR20Um16k.ISu7BBuXLhJnZ0QnUjw7oMxr4.EGZPrMiK',0,'v','v','besbin@gmail.com'),(23,'er','$2a$10$C1C85lqj/JKohnAB86daCemd4sDP1Qt1N7HAUveiFT5gZdQn.6TxS',0,'er','er','er@gmail.com'),(24,'m','$2a$10$8GDW84K6X2.Dd/a/Ax85juNUrRJCx4NIMLJQB32rSw4k6YTzubXPG',0,'m','m','m@gmail.com'),(25,'q','$2a$10$cfAVQTHQ22e00rmlsNq0WeBTBfxxuRGYR0B22d2nZzd3lwV8jIsfa',0,'q','q','q@gmail.com'),(26,'1','$2a$10$1i52TFgVfJYdN2q5.GlUx.7rrV6BZ5UIZTg65CbO3h3XNffDzf0x6',0,'1','1','11@gmail.com'),(27,'x','$2a$10$TFZAIkAof/PXj65Kg6JyiO3rn4M6Cz2W/1s6/U4/IE.of2KjSXb6S',0,'x','x','x@gmail.com'),(28,'fatih','$2a$10$/oTzdpV21nKCpj1WRwqJhutygZLoB4TaY0hnHKskVz7GHUKmw9WY6',0,'ter','im','cokomel@gmail.com'),(29,'555','$2a$10$OoRt5thWDLaYIV.tFTTn0OYxI3rdN9vMWl05IT2CNR3gKNTyzGn1q',0,'555','555','555@gmail.com'),(30,'777','$2a$10$KM.aZbniPbSUUz/DTjM/bOUjNQ5po2NVpklpcaAleWIq30YcmabQe',0,'777','777','777@gmail.com'),(31,'mustafanin','$2a$10$mFJ8l9IQvIhnjXBs9e6S8OoL9xr8fy3cqhUxhXHgV4yZXbzxoBG0O',0,'mustafa','senyuz','mustafasenyuz@gmail.com'),(32,'kadir','$2a$10$CFH.ol8hmNVVdh.iLS7eqeMp5rmq6.6f2dWJwIu3UreH/0AKwiibm',0,'kadir','misir','misir@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ROLE_idx` (`role_id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(17,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(2,2),(3,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(3,3),(27,3),(29,3),(30,3),(31,3),(32,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-23 13:27:32
