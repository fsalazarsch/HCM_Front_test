-- MySQL dump 10.13  Distrib 5.7.18, for osx10.12 (x86_64)
--
-- Host: localhost    Database: hcm
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add estado',7,'add_estado'),(20,'Can change estado',7,'change_estado'),(21,'Can delete estado',7,'delete_estado'),(22,'Can add sala',8,'add_sala'),(23,'Can change sala',8,'change_sala'),(24,'Can delete sala',8,'delete_sala'),(25,'Can add horario',9,'add_horario'),(26,'Can change horario',9,'change_horario'),(27,'Can delete horario',9,'delete_horario'),(28,'Can add solicitud',10,'add_solicitud'),(29,'Can change solicitud',10,'change_solicitud'),(30,'Can delete solicitud',10,'delete_solicitud');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$dOy5pxFarNVy$T8j3gfHN3hPUww1hxoPB1Fjzgx04lVQbN7k3xnFCk/k=','2017-07-30 03:30:04.344053',1,'root','','','fsalazar.sch@gmail.com',1,1,'2017-07-30 03:29:40.909652');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-30 03:40:42.724348','1','No disponible',1,'[{\"added\": {}}]',7,1),(2,'2017-07-30 03:40:53.923836','2','Disponible',2,'[{\"changed\": {\"fields\": [\"estado_id\", \"detalle\"]}}]',7,1),(3,'2017-07-30 03:41:21.900991','3','Reservada',1,'[{\"added\": {}}]',7,1),(4,'2017-07-30 03:41:26.508331','4','Confirmada',1,'[{\"added\": {}}]',7,1),(5,'2017-07-30 03:48:36.262041','1','113A',1,'[{\"added\": {}}]',8,1),(6,'2017-07-30 05:07:55.918231','2','114A',1,'[{\"added\": {}}]',8,1),(7,'2017-07-30 05:13:06.315703','0','horario object',3,'',9,1),(8,'2017-07-30 07:32:14.967092','23','horario object',3,'',9,1),(9,'2017-07-30 07:32:14.970178','22','horario object',3,'',9,1),(10,'2017-07-30 07:32:14.973951','21','horario object',3,'',9,1),(11,'2017-07-30 07:32:14.976848','20','horario object',3,'',9,1),(12,'2017-07-30 07:32:14.979788','19','horario object',3,'',9,1),(13,'2017-07-30 07:32:14.983124','18','horario object',3,'',9,1),(14,'2017-07-30 07:32:14.985859','17','horario object',3,'',9,1),(15,'2017-07-30 07:32:14.988798','16','horario object',3,'',9,1),(16,'2017-07-30 07:32:14.991740','15','horario object',3,'',9,1),(17,'2017-07-30 07:32:14.994623','14','horario object',3,'',9,1),(18,'2017-07-30 07:32:14.997609','13','horario object',3,'',9,1),(19,'2017-07-30 07:32:15.000647','12','horario object',3,'',9,1),(20,'2017-07-30 07:32:15.003508','11','horario object',3,'',9,1),(21,'2017-07-30 07:32:15.006424','10','horario object',3,'',9,1),(22,'2017-07-30 07:32:15.009267','9','horario object',3,'',9,1),(23,'2017-07-30 07:32:15.012236','8','horario object',3,'',9,1),(24,'2017-07-30 07:32:15.015029','7','horario object',3,'',9,1),(25,'2017-07-30 07:32:15.017997','6','horario object',3,'',9,1),(26,'2017-07-30 07:32:15.021018','5','horario object',3,'',9,1),(27,'2017-07-30 07:32:15.023772','4','horario object',3,'',9,1),(28,'2017-07-30 07:32:15.026792','3','horario object',3,'',9,1),(29,'2017-07-30 07:32:15.029771','2','horario object',3,'',9,1),(30,'2017-07-30 07:34:32.421748','26','horario object',3,'',9,1),(31,'2017-07-30 07:54:56.696516','25','horario object',2,'[{\"changed\": {\"fields\": [\"estado_id\"]}}]',9,1),(32,'2017-07-30 09:02:38.195002','27','horario object',3,'',9,1),(33,'2017-07-30 09:39:23.862618','29','horario object',2,'[{\"changed\": {\"fields\": [\"estado_id\"]}}]',9,1),(34,'2017-07-30 09:49:15.632668','1','2017-07-30 (09:00:00 - 19:00:00) Sala 113A',3,'',9,1),(35,'2017-07-30 09:49:15.635231','0','2017-07-30 (09:00:00 - 19:00:00) Sala 114A',3,'',9,1),(36,'2017-07-30 09:49:34.572888','24','2017-07-30 (09:00:00 - 19:00:00) Sala 113A',3,'',9,1),(37,'2017-07-30 10:00:22.724689','1','solicitud object',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'gestion','estado'),(9,'gestion','horario'),(8,'gestion','sala'),(10,'gestion','solicitud'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-30 03:09:25.470848'),(2,'auth','0001_initial','2017-07-30 03:09:25.887634'),(3,'admin','0001_initial','2017-07-30 03:09:25.972432'),(4,'admin','0002_logentry_remove_auto_add','2017-07-30 03:09:26.025069'),(5,'contenttypes','0002_remove_content_type_name','2017-07-30 03:09:26.129420'),(6,'auth','0002_alter_permission_name_max_length','2017-07-30 03:09:26.175343'),(7,'auth','0003_alter_user_email_max_length','2017-07-30 03:09:26.224106'),(8,'auth','0004_alter_user_username_opts','2017-07-30 03:09:26.241734'),(9,'auth','0005_alter_user_last_login_null','2017-07-30 03:09:26.285604'),(10,'auth','0006_require_contenttypes_0002','2017-07-30 03:09:26.289428'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-30 03:09:26.307380'),(12,'auth','0008_alter_user_username_max_length','2017-07-30 03:09:26.353451'),(13,'sessions','0001_initial','2017-07-30 03:09:26.402499'),(14,'gestion','0001_initial','2017-07-30 03:34:53.452748'),(15,'gestion','0002_auto_20170730_0945','2017-07-30 09:45:39.194983');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6lvw66d3txb4uw126ye10aibt0n4d3xd','YmQyY2UxNmY3NzI1NDU3OWIyNWFmYjc1OWZmNDYxM2Q1NWJkZTQ5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImIzMWE5OGJjODFjMjgxODhhZTdkM2I2NWE1YjBjYjhhNTVmYzEyNzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-13 03:30:04.350257');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_estado`
--

DROP TABLE IF EXISTS `gestion_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_estado` (
  `estado_id` int(11) NOT NULL,
  `detalle` varchar(50) NOT NULL,
  PRIMARY KEY (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_estado`
--

LOCK TABLES `gestion_estado` WRITE;
/*!40000 ALTER TABLE `gestion_estado` DISABLE KEYS */;
INSERT INTO `gestion_estado` VALUES (1,'No disponible'),(2,'Disponible'),(3,'Reservada'),(4,'Confirmada');
/*!40000 ALTER TABLE `gestion_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_horario`
--

DROP TABLE IF EXISTS `gestion_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_horario` (
  `horario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `inicio` time(6) NOT NULL,
  `termino` time(6) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  PRIMARY KEY (`horario_id`),
  KEY `gestion_horario_estado_id_bb2d3dd0_fk_gestion_estado_estado_id` (`estado_id`),
  KEY `gestion_horario_sala_id_4cf3013b_fk_gestion_sala_sala_id` (`sala_id`),
  CONSTRAINT `gestion_horario_estado_id_bb2d3dd0_fk_gestion_estado_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `gestion_estado` (`estado_id`),
  CONSTRAINT `gestion_horario_sala_id_4cf3013b_fk_gestion_sala_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `gestion_sala` (`sala_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_horario`
--

LOCK TABLES `gestion_horario` WRITE;
/*!40000 ALTER TABLE `gestion_horario` DISABLE KEYS */;
INSERT INTO `gestion_horario` VALUES (26,'2017-07-29','09:00:00.000000','19:00:00.000000',4,2),(29,'2017-07-29','08:00:00.000000','08:30:00.000000',3,2),(31,'2017-07-30','09:00:00.000000','10:00:00.000000',4,2);
/*!40000 ALTER TABLE `gestion_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_sala`
--

DROP TABLE IF EXISTS `gestion_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_sala` (
  `sala_id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `ubicacion` varchar(250) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `pizarron` tinyint(1) NOT NULL,
  `proyector` tinyint(1) NOT NULL,
  `insumos` int(11) NOT NULL,
  PRIMARY KEY (`sala_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_sala`
--

LOCK TABLES `gestion_sala` WRITE;
/*!40000 ALTER TABLE `gestion_sala` DISABLE KEYS */;
INSERT INTO `gestion_sala` VALUES (1,'113A','OESTE',40,1,1,4),(2,'114A','ESTE',20,1,1,4);
/*!40000 ALTER TABLE `gestion_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_solicitud`
--

DROP TABLE IF EXISTS `gestion_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestion_solicitud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` datetime(6) NOT NULL,
  `horario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gestion_solici_horario_id_58030124_fk_gestion_horario_horario_id` (`horario_id`),
  CONSTRAINT `gestion_solici_horario_id_58030124_fk_gestion_horario_horario_id` FOREIGN KEY (`horario_id`) REFERENCES `gestion_horario` (`horario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_solicitud`
--

LOCK TABLES `gestion_solicitud` WRITE;
/*!40000 ALTER TABLE `gestion_solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `gestion_solicitud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-30 18:24:43
