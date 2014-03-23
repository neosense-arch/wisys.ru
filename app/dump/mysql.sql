-- MySQL dump 10.13  Distrib 5.6.10, for osx10.7 (x86_64)
--
-- Host: localhost    Database: wisys
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'admin@admin.com','admin@admin.com','admin@admin.com','admin@admin.com',1,'ntsr3nvhgxwkkksoc0o0w0cw80ggkgw','iosJN2qavL9Lopeoe2QBHNOaP56rqZWbFZiyvsJfx1zAD3swHjb7UCa6TF+JcpkBi1MI/0+JpjpVzlzdm8LgkQ==','2014-03-23 16:12:43',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_catalogs`
--

DROP TABLE IF EXISTS `ns_catalog_catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_catalogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settingsFormTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settingsModelClassName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_catalogs`
--

LOCK TABLES `ns_catalog_catalogs` WRITE;
/*!40000 ALTER TABLE `ns_catalog_catalogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_catalog_catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_categories`
--

DROP TABLE IF EXISTS `ns_catalog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `t_left` int(11) NOT NULL,
  `t_level` int(11) NOT NULL,
  `t_right` int(11) NOT NULL,
  `t_root` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_649E8DF2989D9B62` (`slug`),
  KEY `IDX_649E8DF2727ACA70` (`parent_id`),
  KEY `IDX_649E8DF2CC3C66FC` (`catalog_id`),
  CONSTRAINT `FK_649E8DF2CC3C66FC` FOREIGN KEY (`catalog_id`) REFERENCES `ns_catalog_catalogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_649E8DF2727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `ns_catalog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_categories`
--

LOCK TABLES `ns_catalog_categories` WRITE;
/*!40000 ALTER TABLE `ns_catalog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_catalog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_items`
--

DROP TABLE IF EXISTS `ns_catalog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C4BF31B1989D9B62` (`slug`),
  KEY `IDX_C4BF31B112469DE2` (`category_id`),
  CONSTRAINT `FK_C4BF31B112469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_catalog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_items`
--

LOCK TABLES `ns_catalog_items` WRITE;
/*!40000 ALTER TABLE `ns_catalog_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_catalog_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_settings`
--

DROP TABLE IF EXISTS `ns_catalog_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B1ABF63D126F525E` (`item_id`),
  CONSTRAINT `FK_B1ABF63D126F525E` FOREIGN KEY (`item_id`) REFERENCES `ns_catalog_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_settings`
--

LOCK TABLES `ns_catalog_settings` WRITE;
/*!40000 ALTER TABLE `ns_catalog_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_catalog_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_type_elements`
--

DROP TABLE IF EXISTS `ns_catalog_type_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_type_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_623C0EB9C54C8C93` (`type_id`),
  CONSTRAINT `FK_623C0EB9C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `ns_catalog_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_type_elements`
--

LOCK TABLES `ns_catalog_type_elements` WRITE;
/*!40000 ALTER TABLE `ns_catalog_type_elements` DISABLE KEYS */;
INSERT INTO `ns_catalog_type_elements` VALUES (1,1,'Электронная почта','email','email'),(2,1,'ФИО','name','text');
/*!40000 ALTER TABLE `ns_catalog_type_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_types`
--

DROP TABLE IF EXISTS `ns_catalog_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_types`
--

LOCK TABLES `ns_catalog_types` WRITE;
/*!40000 ALTER TABLE `ns_catalog_types` DISABLE KEYS */;
INSERT INTO `ns_catalog_types` VALUES (1,'Форма обратной связи','feedback');
/*!40000 ALTER TABLE `ns_catalog_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_cms_blocks`
--

DROP TABLE IF EXISTS `ns_cms_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_cms_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `typeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `areaName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `useCache` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C6208FCC4663E4` (`page_id`),
  CONSTRAINT `FK_5C6208FCC4663E4` FOREIGN KEY (`page_id`) REFERENCES `ns_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_blocks`
--

LOCK TABLES `ns_cms_blocks` WRITE;
/*!40000 ALTER TABLE `ns_cms_blocks` DISABLE KEYS */;
INSERT INTO `ns_cms_blocks` VALUES (1,NULL,'Блок меню',NULL,NULL,'NSCmsBundle:Blocks:menuBlock','menu',0,0,0),(2,NULL,'Блок меню','NSCmsBundle:Blocks:sidebarMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','sidebar',0,0,0),(3,3,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:3490:\"<h1>О компании</h1>\r\n                <p>Наши специалисты работают в сфере разработки систем автоматизации учета не менее семи лет, сертифицированы по программным продуктам фирмы 1С и имеют большой опыт проектной работы на крупнейших предприятиях нефтяной, автомобильной промышленности, оптовой и розничной торговли, предприятиях бюджетной сферы и некоммерческих организациях. Мы хорошо знаем свое дело и предметную область.</p>\r\n                На платформе 1С мы разрабатываем и внедряем:<br>\r\n                <ul>\r\n                    <li>Системы бухгалтерского и налогового учета;</li>\r\n                    <li>Системы бюджетного управления;</li>\r\n                    <li>Системы учета и формирования отчетности по МСФО;</li>\r\n                    <li>Системы консолидации бухгалтерского учета, как по Российским стандартам, так и по МСФО;</li>\r\n                    <li>Системы управленческого (производственного) учета;</li>\r\n                    <li>Системы заработной платы и управления персоналом.</li>\r\n                </ul>\r\n                <p>Решаем вопросы, связанные с интеграцией информационных систем на базе 1С Предприятие 7.7, 8.1, 8.2 с любыми информационными системами и базами данных (в том числе SAP R/3, Axapta);</p>\r\n                Кроме этого:<br>\r\n                <ul>\r\n                    <li>Проводим обследования деятельности, бизнес-процессов, аудит используемых информационных систем;</li>\r\n                    <li>Формулируем техническую постановку задачи;</li>\r\n                    <li>Обучаем пользователей системы, разрабатываем документацию;</li>\r\n                    <li>Осуществляем поддержку внедренных информационных систем.</li>\r\n                </ul>\r\n                <p>У нас есть много собственных разработок и типовых решений по всем областям учета, что позволяет получать результат в кратчайшие сроки и с наименьшими затратами.</p>\r\n                <p>Если Вас не устраивает уже имеющийся функционал системы, то мы можем доработать ее. Доработки могут быть любой сложности. Наши методологи профессионально сформулируют техническое задание, а наши программисты не менее профессионально его реализуют.</p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(4,9,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:3102:\"<h1>Бухгалтерский и налоговый учет</h1>\r\n                <p>Наша компания предлагает автоматизировать работу вашей бухгалтерской службы. В качестве базовой программы для автоматизации бухгалтерского и налогового учета мы используем конфигурацию 1С:Предприятие 8 «Бухгалтерия предприятия». Модель, заложенная в этой системе, позволяет практически без изменений использовать ее на большинстве предприятий.</p>\r\n                <p>Однако если бизнес-процессы в вашей бухгалтерии отличаются от стандартных и вы уже используете измененную конфигурацию 1С:Предприятие 7.7 или какую-либо другую систему, то мы можем тщательно изучить изменения, которые вы используете и предложим либо перенести их в конфигурацию Бухгалтерия предприятия 8, либо изменить ваши бизнес-процессы под стандартные для того, чтобы вы не платили за внедрение лишние деньги.</p>\r\n                <p>Для крупных предприятий с филиальной структурой мы можем предложить использовать конфигурацию «Бухгалтерия предприятия КОРП», которая позволяет вести учет всех подразделений в одной информационной базе и формировать консолидированную отчетность.</p>\r\n                <p>Если ваше предприятие имеет удаленные филиалы, то мы можем настроить их работу через терминальный доступ, либо через механизм распределенных информационных баз.</p>\r\n                <p>Мы работаем комплексно. Выполняем обследование и анализ существующих бизнес – процессов «как есть», предлагаем варианты их оптимизации, формируем модель бизнес – процессов «как должно быть», разрабатываем и внедряем функции бизнес – процессов, разрабатываем техническую документацию на доработки и проводим индивидуальное обучение пользователей.</p>\r\n                <p><a href=\"#\" class=\"pdf\">Бухгалтерский и налоговый учет</a></p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(5,8,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:772:\"<h1>Контакты</h1>\r\n                Вы можете связаться с нами<br>\r\n                <ul>\r\n                    <li>По телефону: <span class=\"bold\">+7 (495) 505-51-47</span></li>\r\n                    <li>По электронной почте: <span class=\"bold\">sales@wisys.ru</span></li>\r\n                </ul>\r\n                <p>Вы можете отправить заявку и наш сотрудник приедет к вам для демонстрации программного продукта или для проведения экспресс-обследования.</p><br>\r\n                <p>Наш адрес: <span class=\"bold\">Москва, улица Часовая, дом 24 корпус 2</span></p><br>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(6,2,'Форма обратной связи',NULL,'O:59:\"NS\\FeedbackBundle\\Block\\Settings\\FeedbackBlockSettingsModel\":2:{s:67:\"\0NS\\FeedbackBundle\\Block\\Settings\\FeedbackBlockSettingsModel\0formId\";i:1;s:71:\"\0NS\\FeedbackBundle\\Block\\Settings\\FeedbackBlockSettingsModel\0ignorePost\";b:0;}','NSFeedbackBundle:Blocks:feedbackBlock','feedback',0,0,0);
/*!40000 ALTER TABLE `ns_cms_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_cms_pages`
--

DROP TABLE IF EXISTS `ns_cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `t_left` int(11) NOT NULL,
  `t_level` int(11) NOT NULL,
  `t_right` int(11) NOT NULL,
  `t_root` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templatePath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D67FAB9727ACA70` (`parent_id`),
  CONSTRAINT `FK_7D67FAB9727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `ns_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_pages`
--

LOCK TABLES `ns_cms_pages` WRITE;
/*!40000 ALTER TABLE `ns_cms_pages` DISABLE KEYS */;
INSERT INTO `ns_cms_pages` VALUES (1,NULL,1,0,28,1,'ns_cms_pages_root_page','ns_cms_pages_root_page',NULL,0,1),(2,1,2,1,3,1,'Главная','main','NSCmsBundle:Pages:page_index.html.twig',0,1),(3,1,4,1,5,1,'О компании',NULL,NULL,1,1),(4,1,6,1,19,1,'Услуги',NULL,NULL,2,1),(5,1,20,1,21,1,'Программные продукты',NULL,NULL,3,1),(6,1,22,1,23,1,'Управление проектами',NULL,NULL,4,1),(7,1,24,1,25,1,'Наши партнеры',NULL,NULL,5,1),(8,1,26,1,27,1,'Контакты',NULL,NULL,6,1),(9,4,7,2,8,1,'Бухгалтерский и налоговый учет',NULL,NULL,0,1),(10,4,9,2,10,1,'Бюджетное управление',NULL,NULL,1,1),(11,4,11,2,12,1,'Решения для строительной отрасли',NULL,NULL,2,1),(12,4,13,2,14,1,'Консолидация',NULL,NULL,3,1),(13,4,15,2,16,1,'Управленческий учет',NULL,NULL,4,1),(14,4,17,2,18,1,'Зарплата и управление персоналом',NULL,NULL,5,1);
/*!40000 ALTER TABLE `ns_cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_documents_categories`
--

DROP TABLE IF EXISTS `ns_documents_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_documents_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_documents_categories`
--

LOCK TABLES `ns_documents_categories` WRITE;
/*!40000 ALTER TABLE `ns_documents_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_documents_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_documents_documents`
--

DROP TABLE IF EXISTS `ns_documents_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_documents_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35953EC12469DE2` (`category_id`),
  CONSTRAINT `FK_C35953EC12469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_documents_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_documents_documents`
--

LOCK TABLES `ns_documents_documents` WRITE;
/*!40000 ALTER TABLE `ns_documents_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_documents_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_feedback_forms`
--

DROP TABLE IF EXISTS `ns_feedback_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_feedback_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `emails` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6FB48534C54C8C93` (`type_id`),
  CONSTRAINT `FK_6FB48534C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `ns_catalog_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_feedback_forms`
--

LOCK TABLES `ns_feedback_forms` WRITE;
/*!40000 ALTER TABLE `ns_feedback_forms` DISABLE KEYS */;
INSERT INTO `ns_feedback_forms` VALUES (1,1,'NSFeedbackBundle:Email:default.html.twig','Оставить заявку','a:1:{i:0;s:11:\"stmol@bk.ru\";}');
/*!40000 ALTER TABLE `ns_feedback_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_categories`
--

DROP TABLE IF EXISTS `ns_gallery_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BE588E2F989D9B62` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_categories`
--

LOCK TABLES `ns_gallery_categories` WRITE;
/*!40000 ALTER TABLE `ns_gallery_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_galleries`
--

DROP TABLE IF EXISTS `ns_gallery_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E287F7A4989D9B62` (`slug`),
  KEY `IDX_E287F7A412469DE2` (`category_id`),
  CONSTRAINT `FK_E287F7A412469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_gallery_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_galleries`
--

LOCK TABLES `ns_gallery_galleries` WRITE;
/*!40000 ALTER TABLE `ns_gallery_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_photos`
--

DROP TABLE IF EXISTS `ns_gallery_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ACDF0BDD4E7AF8F` (`gallery_id`),
  CONSTRAINT `FK_ACDF0BDD4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `ns_gallery_galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_photos`
--

LOCK TABLES `ns_gallery_photos` WRITE;
/*!40000 ALTER TABLE `ns_gallery_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_news_item`
--

DROP TABLE IF EXISTS `ns_news_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_news_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_news_item`
--

LOCK TABLES `ns_news_item` WRITE;
/*!40000 ALTER TABLE `ns_news_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_news_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_property`
--

DROP TABLE IF EXISTS `ns_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_property` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_property`
--

LOCK TABLES `ns_property` WRITE;
/*!40000 ALTER TABLE `ns_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_routing_routes`
--

DROP TABLE IF EXISTS `ns_routing_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_routing_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaults` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `requirements` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_32F6F7175E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_routing_routes`
--

LOCK TABLES `ns_routing_routes` WRITE;
/*!40000 ALTER TABLE `ns_routing_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_routing_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_seo_meta`
--

DROP TABLE IF EXISTS `ns_seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_97B66763F47645AE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_seo_meta`
--

LOCK TABLES `ns_seo_meta` WRITE;
/*!40000 ALTER TABLE `ns_seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_order_items`
--

DROP TABLE IF EXISTS `ns_shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  PRIMARY KEY (`id`),
  KEY `IDX_D6CEE346126F525E` (`item_id`),
  KEY `IDX_D6CEE3468D9F6D38` (`order_id`),
  CONSTRAINT `FK_D6CEE3468D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `ns_shop_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6CEE346126F525E` FOREIGN KEY (`item_id`) REFERENCES `ns_catalog_items` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_order_items`
--

LOCK TABLES `ns_shop_order_items` WRITE;
/*!40000 ALTER TABLE `ns_shop_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_orders`
--

DROP TABLE IF EXISTS `ns_shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  PRIMARY KEY (`id`),
  KEY `IDX_D4261CD9A76ED395` (`user_id`),
  CONSTRAINT `FK_D4261CD9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_orders`
--

LOCK TABLES `ns_shop_orders` WRITE;
/*!40000 ALTER TABLE `ns_shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-24  0:05:23
