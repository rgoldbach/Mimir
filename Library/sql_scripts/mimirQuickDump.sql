CREATE DATABASE  IF NOT EXISTS `mimir` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mimir`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mimir
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `accountinfo`
--

DROP TABLE IF EXISTS `accountinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountinfo` (
  `accountInfoId` int(11) NOT NULL AUTO_INCREMENT,
  `accountType` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  PRIMARY KEY (`accountInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountinfo`
--

LOCK TABLES `accountinfo` WRITE;
/*!40000 ALTER TABLE `accountinfo` DISABLE KEYS */;
INSERT INTO `accountinfo` VALUES (1,'RegUser','Hodir','Smith'),(2,'RegUser','Odin','Johnson'),(3,'Admin','Freya','Jones');
/*!40000 ALTER TABLE `accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `accountInfoId` int(11) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `admin_account_info` (`accountInfoId`),
  CONSTRAINT `admin_account_info` FOREIGN KEY (`accountInfoId`) REFERENCES `accountinfo` (`accountInfoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,3);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobookformats`
--

DROP TABLE IF EXISTS `audiobookformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobookformats` (
  `audioBookFormatId` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `formatId` int(11) NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `numOfParts` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`audioBookFormatId`),
  KEY `audioBookFormat_audioBook` (`audioBookId`),
  KEY `audioBookFormat_format` (`formatId`),
  CONSTRAINT `audioBookFormat_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audioBookFormat_format` FOREIGN KEY (`formatId`) REFERENCES `formats` (`formatId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobookformats`
--

LOCK TABLES `audiobookformats` WRITE;
/*!40000 ALTER TABLE `audiobookformats` DISABLE KEYS */;
INSERT INTO `audiobookformats` VALUES (1,1,1,'2011-05-04',NULL,2,4002),(2,1,2,'2011-05-04',4210,3,4001),(3,2,1,'2011-05-05',NULL,4,4003),(4,2,2,'1993-04-26',1204,3,4004),(5,3,2,'2006-10-31',954419,4,4005),(6,4,2,'2012-03-29',237016,1,4006),(7,5,1,'2012-05-04',NULL,2,4007),(8,6,1,'2005-05-05',NULL,3,4008),(9,7,1,'2008-10-31',NULL,7,4009),(19,8,1,'2002-03-29',NULL,6,4009);
/*!40000 ALTER TABLE `audiobookformats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobookholds`
--

DROP TABLE IF EXISTS `audiobookholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobookholds` (
  `audioBookHoldId` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `positionInQueue` int(11) NOT NULL,
  PRIMARY KEY (`audioBookHoldId`),
  KEY `audioBookHold_audioBook` (`audioBookId`),
  KEY `audioBookHold_regUser` (`regUserId`),
  CONSTRAINT `audioBookHold_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audioBookHold_regUser` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobookholds`
--

LOCK TABLES `audiobookholds` WRITE;
/*!40000 ALTER TABLE `audiobookholds` DISABLE KEYS */;
INSERT INTO `audiobookholds` VALUES (1,3,2,2),(2,3,1,1);
/*!40000 ALTER TABLE `audiobookholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobooklanguages`
--

DROP TABLE IF EXISTS `audiobooklanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobooklanguages` (
  `audioBookLanguageId` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`audioBookLanguageId`),
  KEY `audioBookLanguage_audioBook` (`audioBookId`),
  KEY `audioBookLanguage_language` (`languageId`),
  CONSTRAINT `audioBookLanguage_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audioBookLanguage_language` FOREIGN KEY (`languageId`) REFERENCES `languages` (`languageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobooklanguages`
--

LOCK TABLES `audiobooklanguages` WRITE;
/*!40000 ALTER TABLE `audiobooklanguages` DISABLE KEYS */;
INSERT INTO `audiobooklanguages` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,1),(6,3,2),(7,3,3),(8,4,1),(9,5,1),(10,6,1),(11,7,1),(12,8,1);
/*!40000 ALTER TABLE `audiobooklanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobooklicenses`
--

DROP TABLE IF EXISTS `audiobooklicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobooklicenses` (
  `audioBookLicenseId` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `downloadSiteId` int(11) NOT NULL,
  `positionInQueue` int(11) NOT NULL,
  PRIMARY KEY (`audioBookLicenseId`),
  KEY `audioBookLicense_audioBook` (`audioBookId`),
  KEY `audioBookHold_downloadSite` (`downloadSiteId`),
  CONSTRAINT `audioBookHold_downloadSite` FOREIGN KEY (`downloadSiteId`) REFERENCES `downloadsites` (`downloadSiteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audioBookLicense_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobooklicenses`
--

LOCK TABLES `audiobooklicenses` WRITE;
/*!40000 ALTER TABLE `audiobooklicenses` DISABLE KEYS */;
INSERT INTO `audiobooklicenses` VALUES (1,1,1,5),(2,2,1,10),(3,3,1,15),(4,4,1,-1);
/*!40000 ALTER TABLE `audiobooklicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobookpublishers`
--

DROP TABLE IF EXISTS `audiobookpublishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobookpublishers` (
  `audioBookPublisherId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `info` varchar(400) NOT NULL,
  PRIMARY KEY (`audioBookPublisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobookpublishers`
--

LOCK TABLES `audiobookpublishers` WRITE;
/*!40000 ALTER TABLE `audiobookpublishers` DISABLE KEYS */;
INSERT INTO `audiobookpublishers` VALUES (1,'Mimir Audio Books','Info Would Go Here');
/*!40000 ALTER TABLE `audiobookpublishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobookratings`
--

DROP TABLE IF EXISTS `audiobookratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobookratings` (
  `audioBookRatingId` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `numberOfRatings` int(11) NOT NULL,
  `sumOfRatings` int(11) NOT NULL,
  PRIMARY KEY (`audioBookRatingId`),
  KEY `audioBookRating_audioBook` (`audioBookId`),
  CONSTRAINT `audioBookRating_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobookratings`
--

LOCK TABLES `audiobookratings` WRITE;
/*!40000 ALTER TABLE `audiobookratings` DISABLE KEYS */;
INSERT INTO `audiobookratings` VALUES (1,1,5,20),(2,2,4,15),(3,3,3,10),(4,4,5,20),(5,5,5,20),(6,6,4,15),(7,7,3,10),(8,8,5,20);
/*!40000 ALTER TABLE `audiobookratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiobooks`
--

DROP TABLE IF EXISTS `audiobooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiobooks` (
  `audioBookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `audioBookPublisherId` int(11) NOT NULL,
  PRIMARY KEY (`audioBookId`),
  UNIQUE KEY `bookId` (`bookId`),
  KEY `audioBook_Publisher` (`audioBookPublisherId`),
  CONSTRAINT `audioBook_Publisher` FOREIGN KEY (`audioBookPublisherId`) REFERENCES `audiobookpublishers` (`audioBookPublisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobooks`
--

LOCK TABLES `audiobooks` WRITE;
/*!40000 ALTER TABLE `audiobooks` DISABLE KEYS */;
INSERT INTO `audiobooks` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1);
/*!40000 ALTER TABLE `audiobooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorawards`
--

DROP TABLE IF EXISTS `authorawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorawards` (
  `authorAwardId` int(11) NOT NULL AUTO_INCREMENT,
  `awardId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`authorAwardId`),
  KEY `awardToAward` (`awardId`),
  KEY `authorToAuthor` (`authorId`),
  CONSTRAINT `authorToAuthor` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `awardToAward` FOREIGN KEY (`awardId`) REFERENCES `awardinfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorawards`
--

LOCK TABLES `authorawards` WRITE;
/*!40000 ALTER TABLE `authorawards` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorawards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Danielle Steel','Description Two'),(2,'James Patterson','Description Two'),(5,'Clive Cussler','Description Three'),(7,'Michael Connelly','Description Two'),(9,'Robert K. Tanenbaum','Description one'),(11,'Steve Martini','Description one'),(13,'John Lutz','Description Three'),(15,'David Gibbins','Description Two'),(16,'Thomas Greanias','Description one'),(17,'Michael Byrnes','Description Two'),(18,'Will Adams','Description Two'),(19,'Andy McDermott','Description Two'),(21,'Stephen Hunter','Description Three'),(25,'Paul Christopher','Description one'),(27,'Lee Child','Description one'),(31,'Patricia Cornwell','Description Three'),(32,'Dean Koontz','Description Two'),(33,'Mary Higgins Clark','Description Two'),(34,'Iris Johansen','Description Three'),(35,'James Rollins','Description one'),(36,'Jack Coughlin','Description Three'),(37,'Craig Johnson','Description one'),(39,'Steve Hamilton','Description one'),(41,'Larry Bond','Description Two'),(48,'John Sandford','Description one'),(49,'Stuart Woods','Description Three'),(56,'Raymond Khoury','Description Three'),(58,'David Ellis','Description Three'),(59,'James Becker','Description one'),(60,'Brad Thor','Description Three'),(61,'J. A. Jance','Description Two'),(62,'Karen Sandler','Description Two'),(63,'Ethan Cross','Description one'),(64,'Carey Baldwin','Description one'),(65,'Leslie Gould','Description Two'),(66,'Suzanne Woods Fisher','Description Two'),(68,'Mindy Starns Clark','Description Three'),(70,'Kathleen Fuller','Description one'),(71,'Mary Ellis','Description Three'),(72,'Jerry S. Eicher','Description Three'),(73,'Marianne Ellis','Description one'),(77,'Jeffery Deaver','Description one'),(78,'Ridley Pearson','Description one'),(79,'Gillian Flynn','Description Three'),(80,'Maria Semple','Description Two'),(81,'Kate Atkinson','Description one'),(84,'Robert Wilson','Description Two'),(85,'Eliot Pattison','Description Two'),(87,'Andrea Camilleri','Description Three'),(88,'Michael Dibdin','Description Two'),(90,'Pierre Magnan','Description Two'),(92,'Ian  Sansom','Description one'),(93,'Alexander McCall Smith','Description one'),(98,'Sara Paretsky','Description Three'),(99,'Margaret Maron','Description Three'),(101,'Aaron Elkins','Description one'),(103,'Nevada Barr','Description one'),(105,'Diane Mott Davidson','Description Two'),(106,'Jill Churchill','Description Three'),(107,'Katherine Hall Page','Description Three'),(108,'Earlene Fowler','Description Three'),(109,'Sue Henry','Description Three'),(111,'Carolyn G. Hart','Description Two'),(113,'Mary Daheim','Description Two'),(118,'Susan Wittig Albert','Description Three');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_books`
--

DROP TABLE IF EXISTS `authors_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors_books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`authorId`),
  KEY `author_book_map` (`authorId`),
  CONSTRAINT `author_book_map` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_author_map` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books`
--

LOCK TABLES `authors_books` WRITE;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awardinfo`
--

DROP TABLE IF EXISTS `awardinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awardinfo` (
  `awardId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`awardId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awardinfo`
--

LOCK TABLES `awardinfo` WRITE;
/*!40000 ALTER TABLE `awardinfo` DISABLE KEYS */;
INSERT INTO `awardinfo` VALUES (1,'Good Author Award','Description would be here.','2014'),(2,'Good Book Award','Description would be here.','2014');
/*!40000 ALTER TABLE `awardinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookawards`
--

DROP TABLE IF EXISTS `bookawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookawards` (
  `awardId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`awardId`,`bookId`),
  KEY `bookToBook` (`bookId`),
  CONSTRAINT `bookToBook` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookawardToAward` FOREIGN KEY (`awardId`) REFERENCES `awardinfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookawards`
--

LOCK TABLES `bookawards` WRITE;
/*!40000 ALTER TABLE `bookawards` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookawards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookdisplayinfo`
--

DROP TABLE IF EXISTS `bookdisplayinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookdisplayinfo` (
  `bookDisplayId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `dateAdded` date NOT NULL,
  `imageFilePath` varchar(50) NOT NULL,
  PRIMARY KEY (`bookDisplayId`),
  KEY `bookDisplayDeterminedBy` (`bookId`),
  CONSTRAINT `bookDisplayDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookdisplayinfo`
--

LOCK TABLES `bookdisplayinfo` WRITE;
/*!40000 ALTER TABLE `bookdisplayinfo` DISABLE KEYS */;
INSERT INTO `bookdisplayinfo` VALUES (1,1,'Pegasus','PEGASUS\n \n Nicolas von Bingen and Alex von Hemmerle, titled members of the German aristocracy, have been best friends since childhood. Both widowers, they are raising their children—Nick’s two lively boys and Alex’s adored teenage daughter—in peace and luxury on the vast Bavarian estates that have belonged to their families for generations. While Nick indulges in more glamorous pursuits, Alex devotes himself to breeding the renowned white Lipizzaner horses that enthrall audiences throughout Europe with their ability to dance and spin on command, majestic creatures whose bloodlines are rare and priceless. But it is Nicolas’s bloodline that changes everything, when his father receives a warning from a high-ranking contact inside the Wehrmacht. A secret from the past has left the family vulnerable to the rising tide of Nazism: Nick’s mother, whom he never knew, was of Jewish descent.\n \n Suddenly Nicolas must flee Germany, wrenching his sons away from the only home they have known, sailing across the Atlantic for a new life in America. Their survival will depend on a precious gift from Alex, their only stake for the future: eight purebred horses, two of them stunning Lipizzaners. In Florida, where Nicolas joins the Ringling Brothers Circus, he becomes Nick Bing, with Alex’s prize white stallion—now named Pegasus—the centerpiece of the show.\n \n In this extraordinary book, Danielle Steel tells the story of a family reinventing itself in America, while the country they left behind is engulfed in flames and madness, and men like Alex von Hemmerle are forced to make unbearable choices. Alex’s daughter will find sanctuary in England. In America, Nick will find love, his sons will find a future, and their left-behind world will eventually find them. A novel of hope and sacrifice, of tragedy, challenge, and rebirth, Pegasus is a brilliant family chronicle that unfolds across half a century—a masterwork from one of our most beloved writers.\nFrom the Hardcover edition.','2014-11-25','img/9780345530974.jpg'),(2,2,'Private India: City on Fire','When Jack Morgan opens the Mumbai branch of Private, the world\'s most elite detective agency, he hands the reins to top agent Santosh Wagh. Now, in this teeming metropolis of over thirteen million people where the guilty have everywhere to hide, Santosh goes on the hunt for one elusive killer. A killer who is targeting seemingly unconnected women and placing strange objects at their death scenes in a series of chilling rituals.\nAs the Private team races to find a link that will lead them to the next victim, an unseen menace threatens to destroy the agency from within-and plunge the city into chaos. With countless lives hanging in the balance, Santosh must confront the demons of his past . . . before Private India meets an explosive end.','2014-11-25','img/9781455560820.jpg'),(3,3,'Private Vegas','Las Vegas is a city of contradictions: seedy and glamorous, secretive and wild, Vegas attracts people of all kinds--especially those with a secret to hide, or a life to leave behind. It\'s the perfect location for Lester Olsen\'s lucrative business. He gets to treat gorgeous, young women to five-star restaurants, splashy shows, and limo rides--and then he teaches them how to kill.\nPrivate Jack Morgan spends most of his time in Los Angeles, where his top investigation firm has its headquarters. But a hunt for two criminals leads him to the city of sin--and to a murder ring that is more seductively threatening than anything he\'s witnessed before. PRIVATE VEGAS brings James Patterson\'s Private series to a sensational new level.','2014-11-25','img/9780316211154.jpg'),(4,4,'Burn (Michael Bennett Series #7)','Detective Michael Bennett finally returns to New York City—and to the most unsettling, horrific case of his career.\nAt last, Detective Michael Bennett and his family are coming home to New York City. Thanks to Bennett, the ruthless crime lord whose vengeful mission forced the Bennett family into hiding has been brought down for good.\nBack in the city that never sleeps, Bennett takes over a chaotic Outreach Squad in Harlem, where he receives an unusual call: a man claims to have seen a group of well-dressed men holding a bizarre party in a condemend building. With no clear crime or evidence, Bennett dismisses the report. But when a charred body is found in that very same building, he is forced to take the demented caller seriously—and is drawn into an underground criminal world of terrifying depravity.','2014-11-25','img/9780316211048.jpg'),(5,5,'The Eye of Heaven (Fargo Adventure Series #6)','The outstanding new Fargo adventure from the #1 New York Timesbestselling author.\n \n Baffin Island: Husband-and-wife team Sami and Remi Fargo are on a climate-control expedition in the Arctic, when to their astonishment they discover a Viking ship in the ice, perfectly preserved—and filled with preColumbian artifacts from Mexico.\nHow can that be? As they plunge into their research, tantalizing clues about a link between the Vikings and the legendary Toltec feathered serpent god Quetzalcoatl—and a fabled object known as the Eye of Heaven—begin to emerge. But so do many dangerous people. Soon the Fargos find themselves on the run through jungles, temples, and secret tombs, caught between treasure hunters, crime cartels, and those with a far more personal motivation for stopping them. At the end of the road will be the solution to a thousand-year-old mystery—or death.','2014-11-25','img/9780399167300.jpg'),(6,6,'Hope to Die (Alex Cross Series #22)','Detective Alex Cross is being stalked by a psychotic genius, forced to play the deadliest game of his career. Cross\'s family—his loving wife Bree, the wise and lively Nana Mama, and his precious children—have been ripped away. Terrified and desperate, Cross must give this mad man what he wants if he has any chance of saving the most important people in his life. The stakes have never been higher: What will Cross sacrifice to save the ones he loves?\nWidely praised by the greatest crime and thriller writers of our time, Cross My Heart set a jaw-dropping story in motion. Hope to Die propels Alex Cross\'s greatest challenge to its astonishing finish, proving why Jeffery Deaver says \"nobody does it better\" than James Patterson.','2014-11-25','img/9780316210966.jpg'),(7,7,'The Burning Room (Harry Bosch Series #19)','In the new thriller from #1 New York Times bestselling author Michael Connelly, Detective Harry Bosch and his rookie partner investigate a cold case that gets very hot... very fast.\nIn the LAPD\'s Open-Unsolved Unit, not many murder victims die a decade after the crime. So when a man succumbs to complications from being shot by a stray bullet ten years earlier, Bosch catches a case in which the body is still fresh, but any other clues are virtually nonexistent. Even a veteran cop would find this one tough going, but Bosch\'s new partner, Detective Lucia Soto, has no homicide experience. A young star in the department, Soto has been assigned to Bosch so that he can pass on to her his hard-won expertise.\nNow Bosch and Soto are tasked with solving a murder that turns out to be highly charged and politically sensitive. Beginning with the bullet that has been lodged for years in the victim\'s spine, they must pull new leads from years-old evidence, and these soon reveal that the shooting was anything but random.\nAs their investigation picks up speed, it leads to another unsolved case with even greater stakes: the deaths of several children in a fire that occurred twenty years ago. But when their work starts to threaten careers and lives, Bosch and Soto must decide whether it is worth risking everything to find the truth, or if it\'s safer to let some secrets stay buried.\nIn a swiftly-moving novel as relentless and compelling as its hero, Michael Connelly shows once again why Harry Bosch is \"one of the most popular and enduring figures in American crime fiction\" (Chicago Tribune).','2014-11-25','img/9780316225939.jpg'),(8,8,'Havana Storm (Dirk Pitt Series #23)','Dirk Pitt returns, in the thrilling new novel from the grand master of adventure and #1 New York Timesbestselling author.\n \n While investigating a toxic outbreak in the Caribbean Sea that may ultimately threaten the United States, Pitt unwittingly becomes involved in something even more dangerous—a post-Castro power struggle for the control of Cuba. Meanwhile, Pitt’s children, marine engineer Dirk and oceanographer Summer, are on an investigation of their own, chasing an Aztec stone that may reveal the whereabouts of a vast historical Aztec treasure. The problem is, that stone was believed to have been destroyed on the battleship Maine in Havana Harbor in 1898, which brings them both to Cuba as well—and squarely into harm’s way. The three of them have been in desperate situations before . . . but perhaps never quite as dire as the one facing them now.','2014-11-25','img/9780399172922.jpg'),(9,9,'Fatal Conceit (Butch Karp Series #26)','A CIA chief dies under suspicious circumstances before he is about to testify about a controversial government cover-up involving a terrorist attack on the US mission in Chechnya. Butch Karp is on the case in this exciting installment to Robert K. Tanenbaum’s bestselling series.\nWhen the CIA director is murdered, Butch Karp finds himself battling a heavyweight opponent: the US government. The national presidential election campaign’s foreign policy mantra has been that the terrorists are on the run and Bin Laden is dead. There are rumors that the CIA chief was going to deviate from the administration version of events, and that the government may have had something to do with his death. Can Karp expose the cover-up and find the Chechnyan separatists who aided the Americans at the mission and who have firsthand knowledge of the terrorist attack? Karp must also find his missing daughter, who has been taken hostage by the terrorists.\nAfter the New York grand jury indicts the national presidential campaign chairman and the NSA spymaster for the murder of the CIA chief, Karp engages in an unforgettable courtroom confrontation with the defendants who have the full weight of the US administration, a hostile judge, and a compliant media supporting them. These sinister forces will stop at nothing to prevent Karp from bringing out the truth, even if they have to resort to murder.','2014-11-25','img/9781451635577.jpg'),(10,10,'Tragic (Butch Karp Series #25)','New York Times bestselling author Robert K. Tanenbaum ’s hero , District Attorney Butch Karp , goes up against a ruthless union leader with too much power , too many secrets , and too many enemies to silence . . . or kill .\nPrizefighter tough. Street-hustler smart. Pit-bull vicious. Longshoremen’s union boss Charlie Vitteli clawed his way to the top—and no one’s going to take him down now. Not if they value their lives. Like Vince Carlotta. He accused Vitteli of embezzlement and election rigging. Now Carlotta is just another corpse on the waterfront—allegedly gunned down by an armed robber. Connecting Vitteli to the murder could be the death of anyone who tries . . . unless District Attorney Butch Karp can uncover the one tragic flaw that could bring down the curtain on the cold-blooded villain once and for all. Packed with ingenious twists, diabolical turns, and shocking revelations, Tragic is Robert K. Tanenbaum at his page-turning best.','2014-11-25','img/9781451635560.jpg'),(11,11,'Trader of Secrets (Paul Madriani Series #12)','In California, two men argue in aparked car . . . as the plot unfoldsto profitably transfer secret tech-nology into malevolent hands.\nIn Ohio, a young woman slipsaway from her protectors for amorning run—unaware that thekiller she’s being protected from waits in thedarkness. The woman is Sarah, daughter ofdefense attorney Paul Madriani. Her assailantis the vengeful assassin named Liquida.\nNow Paul Madriani—along with hiscompanion, Joselyn Cole, and his lawpartner, Harry Hinds—must venture into the vortex of international terror in search of an ice-cold killer and a trader of secrets beforethe ultimate weapon of mass destructionsets the world ablaze.','2014-11-25','img/9780594480532.jpg'),(12,12,'Lost Empire (Fargo Adventure Series #2)','Husband and wife team Sam and Remi Fargo return in this extraordinary new adventure following their New York Times bestselling debut, Spartan Gold.','2014-11-25','img/9780594546467.jpg'),(13,13,'Serial (Frank Quinn Series #6)','The Killer Becomes The Hunted\nShe was gagged. Violated. Tortured. Nailing the killer is priority number one and only the best will do—that means Frank Quinn. And Quinn wouldn’t want it any other way. Because he recognizes the victim. Years ago, as a homicide detective, he saved her young life. Now the hunt is on, and deep in his gut, Quinn welcomes it. He knows he’s seeing the work of a truly twisted serial killer. Except it’s not the ritual weapon that makes this killer so disturbing. It’s who he kills—and how he makes them suffer…\n“A Heart-Pounding Roller Coaster Of A Tale.” --Jeffery Deaver on Night Victims\n“A Page-Turner…Twisty, Creepy.”--Publishers Weekly (starred review) on Mister X\n“Lutz Is In Rare Form.” —The New York Times Book Review on Chill of Night','2014-11-25','img/9780786020270.jpg'),(14,14,'Night Kills (Frank Quinn Series #3)','On The Trail Of A Bloody Killer...\nFrank Quinn is sure he is hunting for a madman: someone who is shooting young women in the heart, defiling their bodies, leaving only the torsos to be found. Quinn, a former NYPD detective, is called into the case by an ambitious chief of police and mobilizes his team of brilliant law-enforcement misfits. But in the concrete canyons of New York, this shocking serial murder case is turning into something very different...\nA Cop And A Victim Fight Back....\nJill Clark came to the city with too many hopes and too little cash. Now a seemingly deranged woman is telling her an extraordinary story. New to an exclusive dating service, Jill is warned that other women have died on their dates-and that she could be next. Struggling against a death trap closing in around her, Jill has a powerful ally in Frank Quinn. But no one knows the true motives behind a rampage of cold-blooded murder-or how much more terrifying this is going to get...\n\"Lutz is one of the masters.\"--Ridley Pearson\n\"A major talent.\"--John Lescroart','2014-11-25','img/9780786018444.jpg'),(15,15,'The Lost Tomb','For centuries, people have speculated about the fabled lost libraries of antiquity. If one were found, what marvels would it contain? Now a fearless team of adventurers is about to unearth that long-hidden secret, and it will lead them to the most astonishing discovery ever made.\nIn the treacherous waters off the rugged Sicilian coast, marine archaeologist Jack Howard and his team of scientific experts and ex-Special Forces commandos make a shocking find while searching for the legendary shipwreck of the apostle Paul. And when a second artifact is uncovered in the ruins of a buried city, Jack is on the verge of a discovery that could shake the world to its foundations: the handwritten words of Jesus Christ himself.\nAs he follows a hunch from the dying confession of an emperor to the burial crypt of a medieval pagan queen, Jack is chasing a conspiracy whose web stretches to the highest levels of international power�and he will have to risk everything to stop the controversial document from falling into the hands of a shadowy brotherhood determined to fulfill their murderous vows.','2014-11-25','img/9780553591194.jpg'),(16,16,'Atlantis Prophecy','An ancient organization more powerful than the federal government has targeted Washington. They\'ll stop at nothing to destroy the republic and raise an empire.\nThe adventure begins with a mysterious military burial at Arlington National Cemetery and a shocking legacy that has explosive implications for America\'s existence. Archaeologist Conrad Yeats discovers in his father\'s tombstone the key to a centuries-old warning built into the very design of Washington, D.C. Major monuments along the National Mall are astronomically aligned and are about to \"lock\" with the stars at a date foreseen by the Founding Fathers. Along with Serena Serghetti, a beautiful Vatican linguist with secrets of her own, Yeats explores the hidden world beneath the capital in a deadly race to save it. America has a date with destiny, and the fate of the world hangs in the balance.','2014-11-25','img/9780743491921.jpg'),(17,17,'Sacred Bones','A brazen and violent crime occurs at the crossroads of the Christian, Islamic, and Jewish faiths—the shocking theft of ancient artifacts hidden for many centuries in a secret vault beneath Jerusalem\'s Temple Mount. In its wake, thirteen Israeli policemen and soldiers are dead—and the fuse is lit on a volatile Mideast powder keg, threatening an explosion that could devastate the world.\nIn Italy, American forensic scientist Charlotte Hennesey has answered a Vatican summons asking for help. Joining with Italian anthropologist Giovanni Bersei, she embarks upon a perilous journey down a twisted path of revelations prowled by sinister zealots and relentless cold killers. For they must expose the astonishing secrets locked in the ancient bones resting in a newly unearthed burial box—the skeleton of a man who lived and died in the first century; a man who was scourged and stabbed . . . and crucified.','2014-11-25','img/9780061233906.jpg'),(18,18,'The Alexander Cipher','An unconquerable warrior king, Alexander was the single most powerful man on the planet and thought to be a god. Now, nearly 2,500 years later, the discovery of his tomb, seemingly lost forever, is within reach, triggering a deadly hunt for one of the greatest treasures of all time. Knox is not the only seeker; others are after the prize, and they would kill to win it . . .\n In the spirit of the great adventure-thrillers by Douglas Preston and Lincoln Child, Clive Cussler, Raymond Khoury, and Steve Berry, THE ALEXANDER CIPHER keeps the pages turning with a rip-roaring ride through history, archaeology, and the great deserts of Egypt.','2014-11-25','img/9780446404709.jpg'),(19,19,'The Secret of Excalibur (Nina Wilde/Eddie Chase Series #3)','A LEGENDARY WEAPON.\nA RUTHLESS ASSASSIN.\nA PERILOUS HUNT.\nExcalibur. Legend has it that he who carries King Arthur\'s mighty sword into battle will be invincible. But for more than a thousand years, the secret to the whereabouts of this powerful weapon has been lost...until now.\nArchaeologist Nina Wilde is hoping for a little R&R with her fiancé, former SAS bodyguard Eddie Chase. But the couple\'s plans are dashed when a meeting with an old acquaintance propels Nina and Eddie into a razor\'s-edge hunt across the globe—battling a team of elite mercenaries who will stop at nothing in order to claim a prize every treasure hunter has coveted since the final days of Camelot. Nina and Eddie must do everything they can to keep the legendary blade from falling into the wrong hands. Because the truth behind the sword\'s power—and those who seek it—will not only shock the world but plunge it into a new and more devastating era of war.','2014-11-25','img/9780553592955.jpg'),(20,20,'The Pyramid of Doom (Nina Wilde/Eddie Chase Series #5)','A BURIED EGYPTIAN TEMPLE.\nA SECRET KEPT FOR SIX THOUSAND YEARS.\nA RACE FOR LIFE WORTH KILLING FOR.\nAn international TV audience waits breathlessly as archaeologists prepare to break into a long-hidden vault beneath the Great Sphinx. But archaeology student Macy Sharif has already made her own shocking discovery: a religious cult raiding the site. Their prize? A map that will lead to something far more astounding: the lost pyramid of Osiris. Framed by corrupt officials, Macy goes on the run, trying to reach the only people who can save her before she is silenced—permanently.\nAmerican archaeologist Nina Wilde—once a renowned scientific explorer, now all but blacklisted by her colleagues—is trying to rebuild her reputation. But Macy\'s plea for help will send Nina and ex-SAS bodyguard Eddie Chase on the ultimate treasure hunt. From the streets of Manhattan to a yacht off Monaco to a buried desert site, they\'ll follow an elusive trail stalked by a killer determined to uncover a six-thousand-year-old secret. And beneath the forbidding desert, they\'ll enter a forgotten world both wondrous and horrifying, where the ancient God of Death has kept his secrets—until now.','2014-11-25','img/9780553593631.jpg'),(21,21,'I, Sniper (Bob Lee Swagger Series #6)','The explosive New York Times bestseller by Stephen Hunter that sends ex-Marine sniper Bob Lee Swagger into the thick of an FBI investigation and features some of the greatest gunfights ever to grace the page.\nIt takes a seasoned killer…\nFour famed ‘60s radicals are gunned down at long range by a sniper. All the evidence—timeline, ballistics, forensics, motive, means, and opportunity—points to Marine war hero Carl Hitchcock. Even his suicide. The case is almost too perfect.\n…to hunt one.\nRecruited by the FBI to examine the data, retired Marine sharpshooter Bob Lee Swagger penetrates the new technology of the secretive sniper world to unravel a sophisticated conspiracy run by his most ruthless adversary yet—a marksman whose keen intellect and pinpoint accuracy rival his own. But when the enemy and his deadly henchmen mistake Bob for the hunted, it’s clear that some situations call for a good man with a gun…and the guts to use it.','2014-11-25','img/9781416565178.jpg'),(22,22,'Mister X (Frank Quinn Series #5)','Fear Leaves A Mark\nHe mutilates his victims. Slices their throats. And carves an X into their flesh. Five years ago, he claimed the lives of six women. Then the killings abruptly stopped—no one knows why. Ex-homicide detective Frank Quinn remembers. Which is why he’s shocked to see one of the dead women in his office. Actually, she’s the identical twin of the last victim, and she wants Quinn to find her sister’s murderer. But when the cold case heats up, it attracts the media spotlight—and suddenly the killings start again…\n“A Heart-Pounding Roller Coaster Of A Tale.” --Jeffery Deaver on Night Victims\n“Lutz Is Among The Best.” --San Diego Union\n“Lutz Is In Rare Form.” —The New York Times Book Review on Chill of Night\n “Lutz knows how to make you shiver.”—Harlan Coben','2014-11-25','img/9780786020263.jpg'),(23,23,'Urge to Kill (Frank Quinn Series #4)','For A Killer, Once Is Never Enough\nHomicide detective Frank Quinn can’t stay retired when a new breed of murdering madman is on the prowl. In a city terrorized by bloody brutality, Quinn and his team hunt a psychopath who lures beautiful women into a night of unbridled passion, then wakes them to a vicious, drawn-out death. Stumbling over a trail of horribly defiled bodies, Quinn can’t seem to catch up to the killer—because the killer is about to catch up to him…\n“Lutz is in rare form.”—The New York Times Book Review on Chill of Night\n“Gritty…Surprising…. Enthralling.”—Publishers Weekly on In For the Kill\n“A dazzling tour de force.”—St. Louis Post Dispatch on Chill of Night\n“Lutz knows how to make you shiver.” —Harlan Coben','2014-11-25','img/9780786018451.jpg'),(24,24,'Pulse (Frank Quinn Series #7)','JOHN LUTZ IS . . .\n“AMONG THE BEST.” –San Diego Union\n“A MAJOR TALENT.” –John Lescroart\n“ONE OF THE MASTERS.” –Ridley Pearson\n“IN RARE FORM.” –The New York Times Book Review\nSome Killers Come Back For More\nThe killer’s depravity is insatiable. What he does to his victims is unthinkable. Homicide detective turned P.I. Frank Quinn has seen this M.O. before. A demented ritual, it’s the work of Daniel Danielle—a notorious serial killer who blurs the line between male and female, human and monster. Danielle disappeared ten years ago. Is a copy cat repeating the crimes? Or has Danielle made a deadly return? Either way, this time the killing won’t stop…\n“LUTZ OFFERS UP A HEART-POUNDING ROLLER COASTER OF A TALE.” –Jeffery Deaver\n “Lutz knows how to make you shiver.” —Harlan Coben','2014-11-25','img/9780786020287.jpg'),(25,25,'Valley of the Templars','From New York Times bestselling author Paul Christopher comes an international thriller delving into a Templar threat right at America’s doorstep.\nRetired Army Ranger John Holliday and his friend Eddie travel to Cuba in search of Eddie’s mysteriously vanished brother—and find themselves desperately trying to stop a shocking plot of a secret Templar cabal that has been growing for five hundred years. As the conspiracy tightens the corrupt and dying Castro regime in an iron grip, Holliday must find Eddie’s brother before it is too late…and the secret horror of what lies in the Valley of Death is revealed.','2014-11-25','img/9780451237156.jpg'),(26,26,'Empire of Gold (Nina Wilde/Eddie Chase Series #7)','Nina Wilde and Eddie Chase possess extraordinary pieces of an ancient puzzle that leads them from Singapore to the jungles of South America. Inside a storm of political and drug warfare, Nina is getting close to one of history’s greatest secrets: the mythical golden city of El Dorado. As one discovery unveils another, Nina realizes that a legendary Incan leader made a deal with his Spanish captors—and hid forever the real El Dorado. Now, Nina and Eddie face a maze of death traps and betrayals, including one that reaches into Eddie’s past in Afghanistan, even into his own family in England. Behind a waterfall in Peru is an unfound wonder of the world. And to get there, Nina and Eddie may have to sacrifice everything: their friends, their love for one another, even their lives.','2014-11-25','img/9780553593655.jpg'),(27,27,'One Shot (Jack Reacher Series #9) (Movie Tie-in Edition)','“Electrifying . . . This series [is] utterly addictive.”—Janet Maslin, The New York Times \n \n Six shots. Five dead. One heartland city thrown into a state of terror. But within hours the cops have it solved: a slam-dunk case. Except for one thing. The accused man says: You got the wrong guy. Then he says: Get Reacher for me.\n \n And sure enough, ex–military investigator Jack Reacher is coming. He knows this shooter—a trained military sniper who never should have missed a shot. Reacher is certain something is not right—and soon the slam-dunk case explodes.\n \n Now Reacher is teamed with a beautiful young defense lawyer, moving closer to the unseen enemy who is pulling the strings. Reacher knows that no two opponents are created equal. This one has come to the heartland from his own kind of hell. And Reacher knows that the only way to take him down is to match his ruthlessness and cunning—and then beat him shot for shot.\n \n “Pulse-pounding action.”—Chicago Sun-Times\n \n “Compelling, furiously paced.”—Los Angeles Times\n \n “Crackles with excitement.”—St. Petersburg Times\n \n “Pure adrenaline, from its well-constructed setup to its explosive, unforgettable finale.”—The Miami Herald','2014-11-25','img/9780345538192.jpg'),(28,28,'Alex Cross: Also published as CROSS','ALSO PUBLISHED AS CROSS\nNOW A MAJOR MOTION PICTURE STARRING TYLER PERRY\nAlex Cross was a rising star in the Washington, DC, Police Department when an unknown shooter gunned down his wife, Maria, in front of him. Alex\'s need for vengeance was placed on hold as he faced another huge challenge-raising his children without their mother.\nYears later Alex is making a bold move in his life. He has left the FBI and set up practice as a psychologist once again. His life with Nana Mama, Damon, Jannie, and little Alex finally feels like it\'s in order. He even has a chance at a new love.\nThen Cross\'s former partner, John Sampson, calls in a favor. Now Cross must go on the hunt for the most cunning, psychotic killer he has ever faced...and it pushes him dangerously close to the breaking point.','2014-11-25','img/9781455523535.jpg'),(29,29,'The Affair (Jack Reacher Series #16)','Everything starts somewhere. . . .\nFor elite military cop Jack Reacher, that somewhere was Carter Crossing, Mississippi, way back in 1997. A lonely railroad track. A crime scene. A coverup.\nA young woman is dead, and solid evidence points to a soldier at a nearby military base. But that soldier has powerful friends in Washington.\nReacher is ordered undercover—to find out everything he can, to control the local police, and then to vanish. Reacher is a good soldier. But when he gets to Carter Crossing, he finds layers no one saw coming, and the investigation spins out of control.\nLocal sheriff Elizabeth Deveraux has a thirst for justice—and an appetite for secrets. Uncertain they can trust one another, Reacher and Deveraux reluctantly join forces. Reacher works to uncover the truth, while others try to bury it forever. The conspiracy threatens to shatter his faith in his mission, and turn him into a man to be feared.\nA novel of unrelenting suspense that could only come from the pen of #1 New York Times bestselling author Lee Child, The Affair is the start of the Reacher saga, a thriller that takes Reacher—and his readers—right to the edge . . . and beyond.\nFrom the Hardcover edition.','2014-11-25','img/9780385344326.jpg'),(30,30,'The Drop (Harry Bosch Series #17)','Harry Bosch has been given three years before he must retire from the LAPD, and he wants cases more fiercely than ever. In one morning, he gets two.\nDNA from a 1989 rape and murder matches a 29-year-old convicted rapist. Was he an eight-year-old killer or has something gone terribly wrong in the new Regional Crime Lab? The latter possibility could compromise all of the lab\'s DNA cases currently in court.\nThen Bosch and his partner are called to a death scene fraught with internal politics. Councilman Irvin Irving\'s son jumped or was pushed from a window at the Chateau Marmont. Irving, Bosch\'s longtime nemesis, has demanded that Harry handle the investigation.\nRelentlessly pursuing both cases, Bosch makes two chilling discoveries: a killer operating unknown in the city for as many as three decades, and a political conspiracy that goes back into the dark history of the police department.','2014-11-25','img/9780316069410.jpg'),(31,31,'Red Mist (Kay Scarpetta Series #19)','The new Kay Scarpetta novel from the world\'s #1 bestselling crime writer.\nDetermined to find out what happened to her former deputy chief, Jack Fielding, murdered six months earlier, Kay Scarpetta travels to the Georgia Prison for Women, where an inmate has information not only on Fielding, but also on a string of grisly killings. The murder of an Atlanta family years ago, a young woman on death row, and the inexplicable deaths of homeless people as far away as California seem unrelated. But Scarpetta discovers connections that compel her to conclude that what she thought ended with Fielding\'s death and an attempt on her own life is only the beginning of something far more destructive: a terrifying terrain of conspiracy and potential terrorism on an international scale. And she is the only one who can stop it.','2014-11-25','img/9780399158025.jpg'),(32,32,'The City','There are millions of stories in the city—some magical, some tragic, others terror-filled or triumphant. Jonah Kirk’s story is all of those things as he draws readers into his life in the city as a young boy, introducing his indomitable grandfather, also a “piano man”; his single mother, a struggling singer; and the heroes, villains, and everyday saints and sinners who make up the fabric of the metropolis in which they live—and who will change the course of Jonah’s life forever. Welcome to The City, a place of evergreen dreams where enchantment and malice entwine, where courage and honor are found in the most unexpected corners and the way forward lies buried deep inside the heart.','2014-11-25','img/9780345545930.jpg'),(33,33,'I\'ve Got You Under My Skin','When Laurie Moran’s husband was brutally murdered, only three-year-old Timmy saw the face of his father’s killer. Five years later his piercing blue eyes still haunt Timmy’s dreams. Laurie is haunted by more—the killer’s threat to her son as he fled the scene: “Tell your mother she’s next, then it’s your turn . . .”\nNow Laurie is dealing with murder again, this time as the producer of a true-crime, cold-case television show. The series will launch with the twenty-year-old unsolved murder of Betsy Powell. Betsy, a socialite, was found suffocated in her bed after a gala celebrating the graduation of her daughter and three friends. The sensational murder was news nationwide. Reopening the case in its lavish setting and with the cooperation of the surviving guests that night, Laurie is sure to have a hit on her hands. But when the estranged friends begin filming, it becomes clear each is hiding secrets . . . small and large.\nAnd a pair of blue eyes is watching events unfold, too . . .','2014-11-25','img/9781476749068.jpg'),(34,34,'Live to See Tomorrow','Catherine Ling is one of the CIA’s most prized operatives. Raised on the unforgiving streets of Hong Kong, she was pulled into the agency at the age of fourteen, already having accumulated more insight and secrets than the most seasoned professionals in her world. If life has taught her anything, it is not to get attached, but there are two exceptions to that rule: her son Luke and her mentor Hu Chang. When Luke was kidnapped at the age of two, it nearly broke her. Now, nine years later, her son has astonishingly been returned to her and Catherine vows never to fail him again. But when her job pulls her away from home, she relies on the brilliant and deadly Hu Chang to safeguard Luke in her absence. Now Erin Sullivan, an American journalist with mysterious ties to Hu Chang, has been kidnapped in Tibet. If Catherine doesn’t agree to spearhead the CIA rescue mission, she knows that Hu Chang himself will go, a possibility she can’t risk. But she will be facing a monster whose crimes stretch back forty years, always eluding the CIA. And the job grows even more complicated when Catherine meets Richard Cameron, a supposed ally who’s clearly not telling all he knows. Their attraction is immediate, but Catherine isn\'t at all sure that he can be trusted. If she’s going to rescue this journalist with a story worth killing for, she’ll need to keep Cameron very close. From the treacherous landscape of the Himalayas to the twisting back alleys of San Francisco, the clock is ticking for Catherine and those she loves most. At every turn she faces a ruthless enemy who is determined to keep the truth buried, even if it means that none of them live to see tomorrow, in this novel from bestseller Iris Johansen.','2014-11-25','img/9781250020048.jpg'),(35,35,'The Kill Switch (Tucker Wayne Series #1)','From James Rollins and Grant Blackwood comes the first in an exciting new series featuring Captain Tucker Wayne and his military dog, Kane, ripped from the pages of Sigma Force for their first solo adventure.\nThe mission seems simple: extract a pharmaceutical magnate with the secret to a deadly bioweapon from Russia. But nothing is as it appears to be. A desperate call from Painter Crowe, director of Sigma Force, thrusts Tucker and Kane into a race to rescue Abram Bukolov from assassins backed by a shadowy Russian general.\nHunted and betrayed at every turn, Tucker and Kane must discover the truth behind a horror out of the past that can be weaponized to terrorize the modern world. It will take all of their skill, talent, and trust in each other to discover the key to stopping an ancient peril with the power to destroy the world.','2014-11-25','img/9780062135254.jpg'),(36,36,'On Scope (Kyle Swanson Sniper Series #7)','Spain is on the brink of economic collapse and European banks demand that any bailout be linked to harsh domestic changes. An alliance of Islamic bankers counters with a rescue package containing no conditions at all. The underlying goal: to break the unity of Europe and put Madrid on the path back to Islamic rule.\nWhen the United States stridently opposes that deal, terrorists storm the American consulate in Barcelona and slaughter an entire six-man U.S. Marine security guard. Washington decides the time has come to change the rules of counter-terrorism response, and instead of going after the individual hired gunmen, it unleashes black operations team Task Force Trident to take down the high-ranking financiers known as the Group of Six who were really responsible for the slaughter. Gunnery Sergeant Kyle Swanson, one of the world’s best snipers, and his beautiful sidekick Beth Ledford, go on the attack, and bodies fall from Mallorca to Madrid.\nMeanwhile, Algerian mastermind Yanis Rebiane puts pressure on Spain to decide before the Group of Six cracks, while his killing-machine son, Djahid roams the United States, murdering anyone his father deems a threat to the radical Islamic takeover scheme. Once Swanson’s name is unearthed from secret files, Kyle and Djahid become hunter and prey. In On Scope by Jack Coughlin and Donald A. Davis, one shot will decide the future of Spain, NATO, and the European Union.','2014-11-25','img/9781250037930.jpg'),(37,37,'Any Other Name (Walt Longmire Series #10)','A thrilling story of deception and betrayal, packed with twists and turns and featuring the unforgettable characters of the New York Times bestselling Longmire series, Any Other Name is Craig Johnson’s best yet.','2014-11-25','img/9780670026463.jpg'),(38,38,'Hell Is Empty (Walt Longmire Series #7)','This New York Times bestseller deserves the attention of more than just mystery readers (Wyoming Tribune Eagle)\nWell-read and world-weary, Sheriff Walt Longmire has been maintaining order in Wyoming\'s Absaroka County for more than thirty years, but in this riveting seventh outing, he is pushed to his limits.\nRaynaud Shade, an adopted Crow Indian rumored to be one of the country\'s most dangerous sociopaths, has just confessed to murdering a boy ten years ago and burying him deep within the Bighorn Mountains. Walt is asked to transport Shade through a blizzard to the site, but what begins as a typical criminal transport turns personal when the veteran lawman learns that he knows the dead boy\'s family. Guided only by Indian mysticism and a battered paperback of Dante\'s Inferno, Walt braves the icy hell of the Cloud Peak Wilderness Area, cheating death to ensure that justice—both civil and spiritual—is served.','2014-11-25','img/9780143120988.jpg'),(39,39,'Misery Bay (Alex McKnight Series #8)','Alex McKnight does not know this young man, and he won’t even hear about the suicide until another cold night, two months later and 250 miles away, when the door to the Glasgow Inn opens and the last person Alex would ever expect to see comes walking in to ask for his help.\n What seems like a simple quest to find a few answers will turn into a nightmare of sudden violence and bloody revenge, and a race against time to catch a ruthless killer.McKnight knows all about evil, of course, having faced down a madman who killed his partner and left a bullet next to his heart.Mobsters, drug dealers, hit men—he’s seen them all, and they’ve taken away almost everything he’s ever loved.But none of them could have ever prepared him for the darkness he’s about to face.','2014-11-25','img/9781250008527.jpg'),(40,40,'Ice Run (Alex McKnight Series #6)','\"Alex McKnight is in love. Even though he met Natalie Reynaud, an officer from the Ontario Provincial Police, under difficult circumstances, they share a common bond of solitude, as well as the same nightmare - they\'re both cops who buried their partners. It\'s Alex\'s first real relationship in years, which in some ways is terrifying. But Natalie has her own fears to deal with - and her own secrets.\" \"They brave a violent snowstorm to spend the night together in a historic hotel in Sault Ste. Marie, Michigan. There, they meet a mysterious old man who seems to know a lot about Natalie - and about her family. But they won\'t be getting any answers from him - he\'ll be found frozen to death in a snowbank the very next morning. From this single incident, an old blood feud will be reignited, one going back decades to an event buried in her family\'s past - an event that even now can still drive men to kill each other.\" \"As much as Natalie doesn\'t want Alex to come entangled in this web of lies and hatred, there\'s no way he can let her face this danger alone. This is a man who has gotten beaten up, shot at, and even dragged behind a snowmobile, all because he\'s a sucker for a friend in need.\" How much further will he go for love?','2014-11-25','img/9780312932961.jpg'),(41,41,'Larry Bond\'s First Team: Fires of War','Larry Bond, New York Times bestselling author of Dangerous Ground, and Jim DeFelice have earned widespread acclaim for the gritty authenticity and spellbinding suspense of their military-political adventures involving the First Team. \"The Team\" lead by top CIA officer Bob Ferguson, and supported by Special Forces commando Stephen Rankin and Marine Jack Young, is authorized to take immediate action, beyond the bureaucratic restraints of US intelligence or the military establishment, in the ever-surprising War on Terror.\nAfter years of exhaustive negotiations, North Korea\'s Kim Jong Il abruptly agrees to surrender all of his nuclear weapons. This sudden change in policy has the US suspicious, and the Team is dispatched to uncover the truth. Newest Team operative, the young and beautiful Thera Majed, goes undercover during the preliminary inspections of the entire Korean peninsula, on a mission so sensitive that she will be disavowed if discovered. But when she discovers hidden weapons in South Korea, a firestorm of debate is set off in Washington. A public announcement of their suspicions could derail the North Korean agreement, and the South Korean government may not even be aware of the weapons\' existence. Ferg and the rest of the Team jump in to investigate, and the closer they get to the truth, the harder mysterious forces work to keep them away. Someone is planning for a full-scale nuclear attack that would throw the civilized world into political and economic upheaval, and Ferg and the Team are the only ones in the position to stop them.','2014-11-25','img/9780765346407.jpg'),(42,42,'Cat &amp; Mouse (Alex Cross Series #4)','Alex Cross is back, and so is his nemesis, mass murderer Gary Soneji -- and he\'s out for revenge. But first, Gary wants to play, and it\'s up to Alex to figure out the game. The lives of thousands of innocent commuters hang in the balance. From D.C. to Delaware, New York to Paris, Cat & Mouse will take you on a heart-pounding adventure. It\'s James Patterson at the top of his game.','2014-11-25','img/9780446606189.jpg'),(43,43,'Jack and Jill (Alex Cross Series #3)','In the middle of the night, a controversial U.S. senator is found murdered in bed in his Georgetown pied-a-terre. The police turn up only one clue: a mysterious rhyme signed \"Jack and Jill\" promising that this is just the beginning. Jack and Jill are out to get the rich and famous, and they will stop at nothing until their fiendish plan is carried out. Meanwhile, Washington, D.C., homicide detective Alex Cross is called to a murder scene only blocks from his house, far from the corridors of power where he spends his days. The victim: a beautiful little girl, savagely beaten - and deposited in front of the elementary school Cross\'s son, Damon, attends. Could there be a connection between the two murders? As Cross tries to put the pieces together, the killer - or killers - strike again. And again. No one in Washington is safe - not children, not politicians, not even the President of the United States. Only Alex Cross has the skills and the courage to crack the case - but will he discover the truth in time?','2014-11-25','img/9780446604802.jpg'),(44,44,'The Body Farm (Kay Scarpetta Series #5)','When aneleven-year-old girl is found murdered, Kay Scarpetta, Chief Medical Examiner for the Commonwealth of Virginia, gets another chance at stopping one of the most heartless and horrifying serial killers of her career: the demented Temple Gault.\n\n\n                        Dr. Kay Scarpetta, consulting pathologist for the FBI Forensic Science Unit, must deal with the truly horrific as she seeks to understand the murder of an eleven-year-old girl in rural North Carolina. The details remind her of a serial killer who has eluded the unit for years. What is required is a series of grisly experiments at a little known facility called the Body Farm. Scarpetta must re-interpret some badly botched evidence and interpret the forensic hieroglyphics to reveal an answer that is as stunning as it is horrifying. \"Cornwell seems to get better and better.\"- -Los Angeles Times. 320pp.','2014-11-25','img/9780425201442.jpg'),(45,45,'Cruel and Unusual (Kay Scarpetta Series #4)','When convicted killer Ronnie Joe Waddell is executed in Virginia\'s electric chair, he becomes what should be a routine postmortem case for Chief Medical Examiner Kay Scarpetta. But the murders continue, as everyone connected to Waddell begins to die—including a member of Scarpetta\'s staff....With some help from her seventeen-year-old niece, computer whiz Lucy, as well as from her loyal friend Lieutenant Marino and FBI agent Benton Wesley, Scarpetta musters all her forensic expertise and investigative skills to uncover shocking secrets that will have vast repercussions. \"Cruel and Unusual\" moves bestselling author Patricia D. Cornwell in dramatic new directions, confirming the extraordinary range and power of this prize-winning writer.\n\n                        When Dr. Kay Scarpetta and Police Lieutenant Pete Marino find the brutally wounded body of a 13-year-old boy carefully propped against a dumpster, and the only fingerprint that of an already executed criminal, their investigation takes a \"cruel and unusual\" turn. An 11-week NYT hardcover bestseller. Cornwell\'s previous novels All That Remains, Body of Evidence, and Postmortem have over 3 million copies in print.','2014-11-25','img/9781416505402.jpg'),(46,46,'From Potter\'s Field (Kay Scarpetta Series #6)','In From Potter\'s Field, #1 New York Times bestselling author Patricia Cornwell enters the chilling world of Virginia\'s Chief Medical Examiner Dr. Kay Scarpetta—and a bold, brilliant killer from her past.\nUpon examining a dead woman found in snowbound Central Park, Scarpetta immediately recognizes the grisly work of Temple Brooks Gault. She soon realizes that Gault\'s murders are but a violent chain leading up to one ultimate kill—Scarpetta herself.\n\n\n                        The sixth suspenseful thriller starring forensic pathologist Dr. Kay Scapetta, by the award-winning author of The Body Farm. While Scarpetta searches for clues to the identity of a young woman murdered by serial killer Temple Brooks Gault, the fiend claims his next victim--and manages to infiltrate the FBI\'s top secret artificial intelligence system.','2014-11-25','img/9780425204696.jpg'),(47,47,'The Big Bad Wolf (Alex Cross Series #9)','Alex Cross battles the most ruthless and powerful killer he has ever encountered - a predator known only as \"the Wolf. \"Alex Cross\'s first case since joining the FBI has his new colleagues stymied. Across the country, men and women are being kidnapped in broad daylight and then disappearing completely. These people are not being taken for ransom, Alex realizes. They are being bought and sold. And it looks as if a shadowy figure called the Wolf - a master criminal who has brought a new reign of terror to organize crime - is behind this business in which ordinary men and women are sold as slaves. Even as he admires the FBI\'s vast resources, Alex grows impatient with the Bureau\'s clumsiness and caution when it is time to move. A lone wolf himself, he has to go out on his own in order to track the Wolf and try to rescue some of the victims while they are still alive. As the case boils over, Alex is in hot water at home too. His ex-fiancee, Christine Johnson, comes back into his life - and not for the reasons Alex might have hoped.','2014-11-25','img/9780446610223.jpg'),(48,48,'The Hanged Man\'s Song (Kidd Series #4)','John Sandford author of the phenomenal Prey novels returns with The Hanged Man\'s Song.','2014-11-25','img/9780425199107.jpg'),(49,49,'Reckless Abandon (Stone Barrington Series #10)','Cop-turned-lawyer Stone Barrington tracks a mobster hiding deep within the witness protection program in this new thriller in the New York Times bestselling series-with a little help from beautiful Florida police chief Holly Barker.','2014-11-25','img/9780451213174.jpg'),(50,50,'Dirty Work (Stone Barrington Series #9)','Hired to prove infidelity in an heiress\'s marriage, Stone Barrington goes undercover. But the work turns dirty-and catastrophic-when the errant husband is found dead and the other woman disappears without a trace. Now, Stone must clear his own good name and find a killer hiding among the glitterati of New York\'s high society. Enter Carpenter-the beautiful British intelligence agent first encountered in The Short Forever-who has arrived in New York to begin an investigation of her own. Stone suspects that her case is strangely connected to the dead husband. And he and Dino, his former NYPD partner, are set to face the most bizarre and challenging assignment of their very colorful careers.','2014-11-25','img/9780451210159.jpg'),(51,51,'Certain Prey (Lucas Davenport Series #10)','When a wealthy socialite is murdered, the brilliant killer sets her sights on the one man who can solve the case--Lucas Davenport.','2014-11-25','img/9780425174272.jpg'),(52,52,'Lost Light (Harry Bosch Series #9)','\"Only the money was real. Four years ago, LAPD detective Harry Bosch was on a movie set asking questions about the murder of a young production assistant when an armored car arrived with two million dollars cash for use in a heist scene. In a life-imitates-art firestorm, a gang of masked men converged on the delivery and robbed the armored car with guns blazing. Bosch got off a shot that struck one of the robbers as their van sped away, but the money was never recovered. And the young woman\'s murder was in the stack of unsolved-case files Bosch carried home the night he left the LAPD.\" Now Bosch moves full bore back into that case, determined to find justice for the young woman. Without a badge to open doors and strike fear into the guilty, he learns afresh how brutally indifferent the world can be. But something draws him on, past humiliation and harassment. It\'s not just that the dead woman had no discernible link to the robbery. Nor is it his sympathy for the cops who took over the case, one of them killed on duty and the other paralyzed by a bullet in the same attack. With every conversation and every thread of evidence, Bosch senses a larger presence, an organization bigger than the movie studios and more ruthless than even the LAPD. The part of Bosch that will never back down finds as fatal an opponent as he\'s ever encountered - and there\'s no guarantee that Bosch will survive the showdown ahead.','2014-11-25','img/9780446611633.jpg'),(53,53,'Naked Prey (Lucas Davenport Series #14)','In Naked Prey, John Sandford puts Lucas Davenport through some changes. His old boss, Rose Marie Roux, has moved up to the state level and taken Lucas with her, creating a special troubleshooter job for him for the cases that are too complicated or politically touchy for others to handle. In addition, Lucas is now married and a new father, both of which are fine with him: he doesn\'t mind being a family man. But he is a little worried. For every bit of peace you get, you have to pay—and he\'s waiting for the bill.\nIt comes in the form of two people found hanging from a tree in the woods of northern Minnesota. What makes it particularly sensitive is that the bodies are of a black man and a white woman, and they\'re naked. \"Lynching\" is the word that everybody\'s trying not to say—but, as Lucas begins to discover, in fact the murders are not what they appear to be, and they are not the end of the story. There is worse to come—much, much worse.\nFilled with the rich characterization and exceptional drama that are his hallmarks, this is Sandford\'s most suspenseful novel yet.','2014-11-25','img/9780425195444.jpg'),(54,54,'Chosen Prey (Lucas Davenport Series #12)','A New York Times bestseller!\nLucas Davenport returns in the most harrowing and unexpected Prey novel yet—the story of a congenial man, and his most uncongenial obsession...\nArt history professor James Qatar’s hobby was taking secret photographs of women. At night when he was all alone he’d dream about them and indulge his fantasies. Then one day his fantasy went too far. Now it’s Qatar’s turn to become an obsession—of Davenport’s. And for both men there’s no turning back.','2014-11-25','img/9780425182871.jpg'),(55,55,'Dark Watch (Oregon Files Series #3)','The author of the bestselling NUMA(r) and Dirk Pitt(r) series returns with an all- new novel of adventure and intrigue featuring his unbeatable hero of the high seas-Juan Cabrillo...','2014-11-25','img/9780425205594.jpg'),(56,56,'The Last Templar (Sean Reilly and Tess Chaykin Series #1)','Pope Leo X, 16th Century\nIn a hail of fire and flashing sword, as the burning city of Acre falls from the hands of the West in 1291, The Last Templar opens with a young Templar knight, his mentor, and a handful of others escaping to the sea carrying a mysterious chest entrusted to them by the Order\'s dying Grand Master. The ship vanishes without a trace.\nIn present day Manhattan, four masked horsemen dressed as Templar Knights emerge from Central Park and ride up the Fifth Avenue steps of the Metropolitan Museum of Art during the blacktie opening of a Treasures of the Vatican exhibit. Storming through the crowds, the horsemen brutally attack anyone standing between them and their prize. Attending the gala, archaeologist Tess Chaykin watches in silent terror as the leader of the horsemen hones in on one piece in particular, a strange geared device. He utters a few cryptic Latin words as he takes hold of it with reverence before leading the horsemen out and disappearing into the night.\nIn the aftermath, an FBI investigation is led by anti-terrorist specialist Sean Reilly. Soon, he and Tess are drawn into the dark, hidden history of the crusading Knights, plunging them into a deadly game of cat and mouse with ruthless killers as they race across three continents to recover the lost secret of the Templars.','2014-11-25','img/9780451219954.jpg'),(57,57,'The Templar Conspiracy','In Rome, the assassination of the Pope on Christmas Day sets off a massive investigation that stretches across the globe. But behind the veil of Rex Deus-the Templar cabal that silently wields power in the twenty-first century-the plot has only just begun.\nWhen retired Army Ranger Lt. Col. John Holliday uncovers the true motive behind the pontiff\'s murder, he must unravel a deadly design to extend the Templar influence to the highest levels of power.','2014-11-25','img/9780451231901.jpg'),(58,58,'The Hidden Man (Jason Kolarich Series #1)','Jason Kolarich is a Chicago attorney with a lineman\'s build, a razor- sharp intellect-and the grief of a tragic personal loss. When an estranged childhood friend is charged with murder, Kolarich must create a solid defense-even while doubting his client\'s innocence. But it soon becomes clear that Kolarich will have to uncover long-forgotten events from their shared childhoods to save his friend-and bring a relentless killer to justice before he strikes again.','2014-11-25','img/9780425237410.jpg'),(59,59,'The Messiah Secret (Chris Bronson Series #3)','Assessing the contents of a lavish English estate, museum conservator Angela Lewis discovers a crate full of sealed pottery jars-one of which holds a parchment which describes the life and times of Jesus of Nazareth.\nFor Angela, the find is a miracle-a written reference to Jesus outside of the New Testament. But her discovery draws her and her husband, Chris, into a centuries-old race for the truth that they may not win...or survive.','2014-11-25','img/9780451412980.jpg'),(60,60,'The Apostle (Scot Harvath Series #8)','Every politician has a secret. And when the daughter of a politically connected family is kidnapped abroad, America’s new president will agree to anything—even a deadly and ill-advised rescue plan—in order to keep his secret hidden. \nBut when covert counterterrorism operative Scot Harvath is assigned to infiltrate one of the world’s most notorious prisons and free the man the kidnappers demand as ransom, he quickly learns that there is much more to the operation than anyone dares to admit.\nAs the subterfuge is laid bare, Harvath must examine his own career of ruthlessly hunting down and killing terrorists and decide if he has what it takes to help one of the world’s worst go free.','2014-11-25','img/9781416586586.jpg'),(61,61,'Judgment Call (Joanna Brady Series #15)','New York Times bestselling authorJ.A. Jance\'s acclaimed sheriff Joanna Bradyreturns in a twisting mystery set against the beauty and isolation of the Arizona desert.\nWhen Joanna Brady\'s daughter, Jenny, stumbles across the body of her high-school principal, Debra Highsmith, in the desert, the search for justice leads straight to her own door. Now Joanna is forced to face the possibility that her beloved daughter may be less than perfect—especially when a photo from the crime scene ends up on Facebook. A photo only one person close to the crime scene could have taken.\nNavigating her way through the unfamiliar world of social media, Joanna discovers shocking—and incriminating—information. She also discovers that the quiet, upstanding principal had a hidden past, full of mysterious secrets. As the seasoned sheriff juggles professional constraints and personal demands, she finds herself walking a fine line between justice and family that has never been so blurred.','2014-11-25','img/9780061732805.jpg'),(62,62,'Clean Burn: Introducing Detective Janelle Watkins','Private investigator Janelle Watkins swore off investigating child abductions four years ago, when she left the San Francisco PD.\nBut when two clients beg for her help, one to find her missing 11-year-old son and the other to find a toddler who’s vanished, Janelle can’t say no. Even though it means returning to the scene of her nightmares – her hometown of Greenville.\nJanelle enlists the aid of her ex-partner and ex-lover, Greenville County Sheriff Ken Heinz – but in the midst of their investigation, two other children are discovered missing and connected to Greenville.\nThen Ken’s niece disappears on her way to school.\nJanelle and Ken find themselves in a race against the clock. Will they find the missing children in time, or will history repeat itself?','2014-11-25','img/9781909223318.jpg'),(63,63,'The Shepherd (Shepherd Series #1)','Marcus Williams and Francis Ackerman Jr. both have a talent for hurting people. Marcus, a former New York City homicide detective, uses his abilities to protect others, while Ackerman uses his gifts to inflict pain and suffering. When both men become unwi','2014-11-25','img/9781611880557.jpg'),(64,64,'Confession','For fans of Allison Brennan and Karen Rose comes Carey Baldwin, a daring new name in suspense, with the story of a serial killer out for blood—and the only woman who can stop his reign of terror.\nThey say the Santa Fe Saint comes to save your soul—by taking your life.\nNewly minted psychiatrist Faith Clancy gets the shock of her life when her first patient confesses to the grisly Saint murders. By law Faith\'s compelled to notify the authorities, but is her patient really the Saint? Or will she contribute to more death by turning the wrong man over to the police?\nFaith is going to need all her wits and the help of a powerful adversary, Luke Jericho, if she\'s to unravel the truth. But she doesn\'t realize she\'s about to become an unwitting pawn in a serial killer\'s diabolical game. For once he\'s finished with Faith, she\'ll become his next victim.','2014-11-25','img/9780062314116.jpg'),(65,65,'Courting Cate (Courtships of Lancaster County Series #1)','When This Couple Gets to Courting, Sparks Will Fly!\nIn Paradise, Pennsylvania, Cate Miller is known more for her sharp tongue and fiery temper than her striking appearance. Her sweet and flirty sister, Betsy, on the other hand, seems to have attracted most of the bachelors in Lancaster County!\nBut the sisters\' wealthy father has made one hard-and-fast rule: older Cate must marry first, before younger Betsy can even start courting. Unfortunately, untamable Cate has driven away every suitor--until Pete Treger comes to town, that is.\nProdded by the men of the area, Pete turns his attention to winning Cate\'s hand. But is his interest true or is there a scheme at play?\nLeslie Gould is the coauthor of the #1 bestselling The Amish Midwife, winner of the 2012 Christy Award for Contemporary Series. She holds an MFA in creative writing from Portland State University and resides with her husband and four children in Portland, Oregon. Visit her online on Facebook or at LeslieGould.com.\n\"Gould creates a delightful story, offering engaging characters and a page-turning plot. Gould\'s Courting Cate--the first book in the series titled \'The Courtships of Lancaster County\' --is a standout read in Amish fiction.\" --CBA Retailers & Resources\n\"[A] clever take on Shakespeare\'s The Taming of the Shrew ... Gould is a fabulous writer in her own right. This charming series debut should appeal to fans of Beverly Lewis and Marta Perry.\" -Library Journal','2014-11-25','img/9780764210310.jpg'),(66,66,'The Choice (Lancaster County Secrets Series #1)','Lancaster County has always been her home--but where does her heart belong?\nOne moment Carrie Weaver was looking forward to running away with Lancaster Barnstormers pitcher Solomon Riehl--plans that included leaving the Amish community where they grew up. The next moment she was staring into a future as broken as her heart. Now, Carrie is faced with a choice. But will this opportunity be all she hoped? Or will this decision, this moment in time, change her life forever?\nA tender story of love, forgiveness, and looking below the surface, The Choice uncovers the sweet simplicity of the Amish world--and shows that it\'s never too late to find your way back to God.\n\"Fisher\'s writing brings that Amish sense of peace into your own world. The Choice brings an entirely new perspective to the Amish way of life. You will love it!\"--Kristin Billerbeck, author of What a Girl Wants\n\"A story of endearing characters. . . . Fisher writes with a fresh mix of humor and depth, splashing raw emotion onto the pages. I guarantee your heart will be touched.\"--Ginger Kolbaba, founding editor of Kyria.com, former editor of Today\'s Christian Woman, and author of Desperate Pastors\' Wives\nSuzanne Woods Fisher\'s interest in the Anabaptist culture can be directly traced to her grandfather, W. D. Benedict, who was raised in the Old Order German Baptist Brethren Church in Franklin County, Pennsylvania. Suzanne is the author of Amish Peace and lives with her family in California.','2014-11-25','img/9780800733858.jpg'),(67,67,'Adoring Addie (Courtships of Lancaster County Series #2)','Not Since Romeo and Juliet Has a Couple Faced Odds This Long\nThe Cramers and Mosiers have been angry with each other for as long as anyone can remember. Things had cooled to a simmer...until Addie Cramer and Jonathan Mosier fell head over heels for each other. Now old tensions are renewed, and Addie\'s parents insist she marry stolid and uninspiring Phillip Eicher.\nDistraught at a future apart, the two decide their best hope is to reconcile the two families...but that means digging into the past to see what tore them apart. Will their love be enough to keep them together or will long-held secrets ruin their chance at happiness?\n\"Leslie Gould has written a wonderful Amish story depicting a very unique perspective of modern day Amish culture. She gives a very human quality to her characters.\" --Fresh Fiction\n\"Gould\'s latest novel in the Courtships of Lancaster County series touches on love and family loyalty and the bonds that result from both. Her strong, crisp language and genuine characters draw you in.\" --RT Book Reviews','2014-11-25','img/9780764210327.jpg'),(68,68,'The Amish Bride (Women of Lancaster County Series #3)','Bestselling authors Mindy Starns Clark and Leslie Gould offer readers The Amish Bride, Book 3 in the Women of Lancaster County series, which tells the stories of young Plain women as they explore their roots, connect with family, and discover true love.\nElla Bayer and Ezra Gundy are in love and hope to marry someday, but she is a young Mennonite woman while he is an Amish man. Though both Plain, one of them will have to forsake what they believe to embrace another way of life.\nHoping some distance will cool the relationship, Ezra\'s family sends him to work at an Amish dairy farm in Indiana. But Ella disregards what her family wants and follows Ezra. In short order she finds a place to live, a job in a bakery, and an unexpected but budding friendship with a handsome Amish farmhand, Luke. When a family tragedy forces Ella back to Pennsylvania, she must face all she\'s been running away from. And once she has made peace with those around her, she has an important decision to make: Whose Amish bride will she become--Ezra\'s or Luke\'s?','2014-11-25','img/9780736938624.jpg'),(69,69,'The Haven (Stoney Ridge Seasons Series #2)','On a warm spring day, Sadie Lapp returns home to her quiet, unassertive life in Stoney Ridge after spending the winter in Ohio.\nGideon Smucker, an awkward schoolteacher, has been in love with Sadie since childhood and eagerly awaits her return. But does Sadie feel the same about him?\nWill Stoltz, a charming and impetuous college student, has been banished for a semester and sent to babysit endangered peregrine falcons nesting at the Lapp farm. He\'d rather be anywhere else . . . until he befriends Sadie.\nAs the hopes and ambitions of these three young people converge, life in Stoney Ridge may never be the same.\nOnce again, bestselling author Suzanne Woods Fisher intrigues and delights with a story that explores the bonds of friendship, family, and true love in this captivating series.\n\"A heartwarming story of faith, family, and renewal filled with characters that come alive on the page like old friends, The Haven will captivate fans of Amish fiction and readers who love an endearing romance.\"--Amy Clipston, bestselling author of the Kauffman Amish Bakery Series\n\"The Haven is a warm, touching novel about the power of familial bonds. Once you dip into this novel set in the charming town created by Suzanne Woods Fisher, you\'ll be hooked.\"--Beth Wiseman, bestselling author of the Daughters of the Promise series\n\"Suzanne Woods Fisher\'s novels are always such a joy to read! I found The Haven charming, humorous, and compelling--so much so that I had to remind myself to put the book down and get back to work! I\'ll be joining her many fans by the calendar, anxiously awaiting her next book to be released.\"--Shelley Shepard Gray, New York Times and USA Today bestselling author\nSuzanne Woods Fisher is the bestselling author of The Choice, The Waiting, The Search, and The Keeper, as well as nonfiction books about the Amish, including Amish Peace. She is also the coauthor of a new Amish children\'s series, The Adventures of Lily Lapp. Suzanne is the host of internet radio show Amish Wisdom and a columnist for Christian Post and Cooking & Such magazines. She lives in California.','2014-11-25','img/9780800719883.jpg'),(70,70,'Faithful to Laura (Middlefield Family Series #2)','Laura’s Amish faith requires her to forgive, but she can only think of revenge.\nLaura Stutzman leaves her Kentucky community for Middlefield, Ohio, with one purpose:to find Mark King, the man who pledged his love to her, then left. She can’t move on with her life until he explains why.\nSawyer Thompson wasn\'t born Amish, but has lived in their community for years. Now he must commit to the Amish church or return to the Yankee world. Having suffered loss at a young age, he understands Laura’s anger, but is determinedto follow God’s will and forgive. As their friendship grows, Laura begins to let her guard down.\nBut new information surfacesabout Sawyer’s past andthreatens the couple’s budding relationship. Both Laura and Sawyer will need to release the anger in their hearts and forgive the people who’ve harmed them. As Laura struggles to trust God, can Sawyer remain faithful to Laura?','2014-11-25','img/9781595547767.jpg'),(71,71,'Living in Harmony','Living in Harmony is the first book in bestselling author Mary Ellis\'s New Beginnings series. It\'s about fresh starts and love...and how faith in God and His perfect plan for our lives provides us with the peace and joy we desire.\nAmy King--young, engaged, and Amish--faces difficult challenges in her life when she suddenly loses both of her parents in a house fire. Her fiancé, John Detweiler, persuades her and her sister Nora to leave Lancaster County and make a new beginning with him in Harmony, Maine, where he has relatives who can help the women in their time of need.\nJohn\'s brother Thomas and sister-in-law Sally readily open their home to the three newcomers. Wise beyond his years, Thomas, a minister in the district, refuses to marry Amy and John upon their arrival, suggesting instead a period of adjustment and counseling. During this time Amy discovers an aunt who was shunned. She wishes to reconnect with her, but this puts a strain on her relationship with John.\nCan John and Amy find a way to live in happily in Harmony before making a lifetime commitment to one another?','2014-11-25','img/9780736938662.jpg'),(72,72,'Katie\'s Forever Promise (Emma Raber\'s Daughter Series #3)','In book 3 of the Emma Raber\'s Daughter series, Amish fiction author Jerry Eicher brings the faith-filled journey of Katie Raber to its happy conclusion.\nKatie Raber is trying to put her life back together after Ben Stoll\'s devastating betrayal of her love. When she is baptized into the church, she receives a surprising offer that will keep her close to her Amish community--much to her mother\'s delight.\nBut soon Ben is back in her life again--and at the same time she finds interest from another young man, though his bumbling efforts at winning her heart show him to be a far less desirable suitor than the more polished Ben Stoll.\nReaders who have followed the saga of Katie and her attempts to escape the stigma of being just \"Emma Raber\'s daughter\" will be charmed by her new look at life as a young woman with important decisions to make.\nBook 3 in the Emma Raber\'s Daughter series','2014-11-25','img/9780736952552.jpg'),(73,73,'Autumn Grace','With the change of seasons comes a change of heart—and an unexpected journey of love, compassion, and discovery . . .\nThe oldest of seven daughters, Ruth Schrock has grown up believing that her uncompromising father has never really approved of her independent nature. Though devoted to her community and her faith, she’s always found it difficult to follow the straight and narrow path of a deacon’s daughter. When Ruth is asked to teach in a nearby community, she jumps at the opportunity—feeling that God has given her a chance at a life of meaning.\nRuth never could have guessed that her new path would lead to Levi Yoder. Handsome Levi is a shy and quiet man. He lives alone and seems most comfortable spending time with the injured animals he rescues and cares for. Ruth and her all-embracing love of life confuse yet captivate Levi. With her school across the road from his farm, the attraction grows—but so do the conflicts. Can these two opposites find a path they can walk together into the future?','2014-11-25','img/9780425264263.jpg'),(74,74,'Summer Promise','With the heat of summer comes the warmth of sunlight, shadows of the past, and Miriam’s chance to win the heart of the only man she’s ever loved—her husband.\nThe death of Jakob Lapp, a beloved member of the Amish community and the builder of the Stonyfield Farm Stand, is difficult for all. On the day of Jakob’s funeral, his beloved daughter Miriam must deal with her grief as well as mounting apprehension, knowing that she will soon see her sister Sarah who left the Amish community to live the Englisch life several years ago.\nSarah’s arrival forces Miriam to face the problems in her marriage. She has been unable to give her husband, Daniel, a child and fears he is not happy. Miriam has always suspected that Daniels’s heart truly lies with her sister, and she worries about the effect Sarah’s return will have on their already strained marriage. But when a disaster threatens the farm stand, everyone must come together, allowing new hope to grow not only for the community, but for Miriam as well . . .\nFIRST IN A NEW SERIES!','2014-11-25','img/9780425264225.jpg'),(75,75,'Deadline (Virgil Flowers Series #8)','The thrilling new novel in the #1 New York Timesbestselling series.\n \n In Southeast Minnesota, down on the Mississippi, a school board meeting is coming to an end. The board chairman announces that the rest of the meeting will be closed, due to personnel issues. “Issues” is correct. The proposal up for a vote before them is whether to authorize the killing of a local reporter. The vote is four to one in favor.\nMeanwhile, not far away, Virgil Flowers is helping out a friend by looking into a dognapping, which seems to be turning into something much bigger and uglier—a team of dognappers supplying medical labs—when he gets a call from Lucas Davenport. A murdered body has been found—and the victim is a local reporter. . . .','2014-11-25','img/9780399162374.jpg'),(76,76,'Act of War (Scot Harvath Series #13)','#1 New York Times bestselling author Brad Thor delivers his most frightening and pulse-pounding thriller ever!\nAfter a CIA agent mysteriously dies overseas, his top asset surfaces with a startling and terrifying claim. There’s just one problem—no one knows if she can be trusted.\nBut when six exchange students go missing, two airplane passengers trade places, and one political-asylum seeker is arrested, a deadly chain of events is set in motion.\nWith the United States facing an imminent and devastating attack, America’s new president must turn to covert counterterrorism operative Scot Harvath to help carry out two of the most dangerous operations in the country’s history.\nCode-named \"Gold Dust\" and \"Blackbird,\" they are shrouded in absolute secrecy as either of them, if discovered, will constitute an act of war.','2014-11-25','img/9781476717128.jpg'),(77,77,'The Skin Collector (Lincoln Rhyme Series #11)','In his classic thriller The Bone Collector, Jeffery Deaver introduced readers to Lincoln Rhyme-the nation\'s most renowned investigator and forensic detective.\nNow, a new killer is on the loose: a criminal inspired by the Bone Collector. And Rhyme must untangle the twisted web of clues before the killer targets more victims-or Rhyme himself.\nTHE SKIN COLLECTOR\nThe killer\'s methods are terrifying. He stalks the basements and underground passageways of New York City. He tattoos his victims\' flesh with cryptic messages, using a tattoo gun loaded with poison, resulting in an agonizing, painful death.\nWhen a connection is made to the Bone Collector-the serial killer who terrorized New York more than a decade ago-Lincoln Rhyme and Amelia Sachs are immediately drawn into the case.\nRhyme, Sachs, and the NYPD must race against time to answer the many questions the investigation uncovers: Whom will the killer attack next? What is the message behind the victims\' tattoos? Does the killer\'s own inking—a fanged centipede sporting a woman\'s face—hold any significance? And what is his ultimate mission?\nAs time runs out, Rhyme discovers that the past has returned to haunt him in the most troubling way imaginable...','2014-11-25','img/9781455517138.jpg'),(78,78,'The Red Room (Risk Agent Series #3)','“This installment is all about impossible escapes and elusive spycraft.Another hit in this knockout thriller series featuring nonstop danger, casually clever descriptions of exotic locales, evolving characterization, and evenhanded sociopolitical commentary. Recommended for every beach bag.” —Booklist\nIn the newest international thrill ride fromNew York Times-bestselling author Ridley Pearson, John Knox and Grace Chu, the incomparable and often incompatible duo, team up again, this time in the exotic “city between two worlds,” Istanbul.\nWhat’s it like to see yourself in a picture you never knew was taken?\nJohn Knox is an expert at surveillance and delicate, international dealings. So he is understandably thrown when David “Sarge” Dulwich, his contact at Rutherford Risk, hands him a photo of a transaction he recently facilitated in the Middle East. More curious to him, he’s shown that photo while in the Red Room, the private security company’s highly secure underground bunker, where eavesdropping is impossible and privacy ensured. Why all the cloak-and-dagger?\nKnox is pressured into accepting a job as an art broker in the mysterious Istanbul, a city situated on two continents where East meets West and Islam meets Christianity. It is a melting pot of spies, terrorists, and conflicting interests.\nTeamed with smart, quick, and fearless Grace Chu, Knox must navigate a murky operation, the only goal of which is to spend five minutes in the proximity of a man they’ve never met. Why? What can it possibly matter? And why are so many others bound and determined to see it never happens—at any cost?','2014-11-25','img/9780399163746.jpg'),(79,79,'Gone Girl','One of the most critically acclaimed suspense writers of our time, New York Times bestseller Gillian Flynn takes that statement to its darkest place in this unputdownable masterpiece about a marriage gone terribly, terribly wrong. The Chicago Tribune proclaimed thather work “draws you in and keeps you reading with the force of a pure but nasty addiction.” Gone Girl’s toxic mix of sharp-edged wit and deliciously chilling prose creates a nerve-fraying thriller that confounds you at every turn.\nOn a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being made when Nick’s clever and beautiful wife disappears from their rented McMansion on the Mississippi River. Husband-of-the-Year Nick isn’t doing himself any favors with cringe-worthy daydreams about the slope and shape of his wife’s head, but passages from Amy\'s diary reveal the alpha-girl perfectionist could have put anyone dangerously on edge. Under mounting pressure from the police and the media—as well as Amy’s fiercely doting parents—the town golden boy parades an endless series of lies, deceits, and inappropriate behavior. Nick is oddly evasive, and he’s definitely bitter—but is he really a killer?\nAs the cops close in, every couple in town is soon wondering how well they know the one that they love. With his twin sister, Margo, at his side, Nick stands by his innocence. Trouble is, if Nick didn’t do it, where is that beautiful wife? And what was in that silvery gift box hidden in the back of her bedroom closet?\nWith herrazor-sharp writing and trademark psychological insight, Gillian Flynn delivers a fast-paced, devilishly dark, and ingeniously plotted thriller that confirms her status as one of the hottest writers around.','2014-11-25','img/9780307588364.jpg'),(80,80,'Where\'d You Go, Bernadette','Bernadette Fox is notorious. To her Microsoft-guru husband, she\'s a fearlessly opinionated partner; to fellow private-school mothers in Seattle, she\'s a disgrace; to design mavens, she\'s a revolutionary architect, and to 15-year-old Bee, she is a best friend and, simply, Mom.\nThen Bernadette disappears. It began when Bee aced her report card and claimed her promised reward: a family trip to Antarctica. But Bernadette\'s intensifying allergy to Seattle—and people in general—has made her so agoraphobic that a virtual assistant in India now runs her most basic errands. A trip to the end of the earth is problematic.\nTo find her mother, Bee compiles email messages, official documents, secret correspondence—creating a compulsively readable and touching novel about misplaced genius and a mother and daughter\'s role in an absurd world.','2014-11-25','img/9780316333603.jpg'),(81,81,'Case Histories (Jackson Brodie Series #1)','Case one: A little girl goes missing in the night. \nCase two: A beautiful young office worker falls victim to a maniac\'s apparently random attack.\nCase three: A new mother finds herself trapped in a hell of her own making - with a very needy baby and a very demanding husband - until a fit of rage creates a grisly, bloody escape.\nThirty years after the first incident, as private investigator Jackson Brodie begins investigating all three cases, startling connections and discoveries emerge . . .','2014-11-25','img/9780316033480.jpg'),(82,82,'Started Early, Took My Dog (Jackson Brodie Series #4)','Tracy Waterhouse leads a quiet, ordered life as a retired police detective-a life that takes a surprising turn when she encounters Kelly Cross, a habitual offender, dragging a young child through town. Both appear miserable and better off without each other-or so decides Tracy, in a snap decision that surprises herself as much as Kelly. Suddenly burdened with a small child, Tracy soon learns her parental inexperience is actually the least of her problems, as much larger ones loom for her and her young charge.\nMeanwhile, Jackson Brodie, the beloved detective of novels such as Case Histories, is embarking on a different sort of rescue-that of an abused dog. Dog in tow, Jackson is about to learn, along with Tracy, that no good deed goes unpunished.','2014-11-25','img/9780316066747.jpg'),(83,83,'One Good Turn (Jackson Brodie Series #2)','\"Compelling and always entertaining.\" -USA Today\n\"One Good Turn crackles with energy and imagination.\" -Chicago Tribune\n\"Atkinson\'s tart prose sparkles.\" -Entertainment Weekly\n\"Entertaining both as a murder mystery and as a sprawling multi-character study in the best post-Nashville tradition.\" -The Onion\n\"A remarkable feat of storytelling bravado.\" -Washington Post','2014-11-25','img/9780316012829.jpg'),(84,84,'The Ignorance of Blood (Javier Falcon Series #4)','As a sweltering Seville recovers from the shock of a terrorist attack, Inspector Jefe Javier Falcón is struggling to find the bombers.The death of a gangster in a spectacular car crash offers vital evidence implicating the Russian mafia in his investigation, but pitches Falcón into the heart of a turf war over prostitution and drugs.Now the target of vicious hoods, Falcón finds those closest to him are also coming under intolerable pressure: his best friend, who’s spying for the Spanish government, reveals that he is being blackmailed by Islamist extremists; and Falcón’s own lover suffers a mother’s worst nightmare.He might be able to bring the perpetrators of the bombing to justice, but there will be a devastating price to pay.','2014-11-25','img/9780151012459.jpg'),(85,85,'The Lord of Death (Inspector Shan Tao Yun Series #6)','The Chinese minister of tourism has been assassinated on the slope of Everest. Shan, a former investigator from Beijing, must solve the mystery of the assassination to save the accused man, the only person who can help his imprisoned son.','2014-11-25','img/9781569476420.jpg'),(86,86,'Beautiful Ghosts (Inspector Shan Tao Yun Series #4)','In an earlier time, Shan Tao Yun was an Inspector stationed in Beijing. But he lost his position, his family and his freedom when he ran afoul of a powerful figure high in the Chinese government. Released unofficially from the work camp to which he\'d been sentenced, Shan has been living in remote mountains of Tibet with a group of outlawed Buddhist monks. Without status, official identity, or the freedom to return to his former home in Beijing, Shan finds himself in the midst of a baffling series of events. During a ceremony meant to rededicate an ancient and long destroyed monastery, Shan stumbles across evidence of a recent murder in the ruins. Now Shan is being torn between some officials who want his help to search the ruins while others want him to disappear back into the mountains - with one group holding out the tantalizing prospect of once again seeing the son from whom Shan has been separated for many years.\nIn a baffling situation where nothing is what it appears to be, where the FBI, high ranking Beijing officials, the long hidden monks, and the almost forgotten history of the region all pull him in different directions, Shan finds his devotion to the truth sorely tested. Traveling from Tibet to Beijing to the U.S., he must find the links between murder on two continents, a high profile art theft, and an enigmatic, long-missing figure from history.','2014-11-25','img/9780312335090.jpg'),(87,87,'Excursion to Tindari (Inspector Montalbano Series #5)','Following the long-running success he has enjoyed on bestseller lists in Europe, Inspector Salvo Montalbano is now winning over American readers and critics alike as “one of the most engaging protagonists in detective fiction” (USA Today). Now, in Excursion to Tindari, Andrea Camilleri’s savvy and darkly comic take on Sicilian life leads Montalbano into his most bone-chilling case yet.\nIn two seemingly unrelated crimes, a young Don Juan is found murdered and an elderly couple is reported missing after an excursion to the ancient site of Tindari. As Montalbano works to solve both cases, he stumbles onto Sicily’s ghastly “new age” of brutal and anonymous criminality.','2014-11-25','img/9780143034605.jpg'),(88,88,'Medusa (Aurelio Zen Series #9)','After a decomposed body is discovered in an abandoned military tunnel, Inspector Aurelio Zen travels north to the Italian Alps to investigate. At first glance, the death appears to have been an accident. But when Zen takes a closer look, a mysterious tattoo begins to tell a much more sinister tale, especially after the body is snatched from the morgue. As Zen races to discover the inner workings of a clandestine military organization named Medusa, he is reminded of just how lethal Italian history can be. \nMedusa takes us on an exploration of the dark history of post-war Italy and a modern-day sightseeing tour of what Zen calls Italia Lite. In the urbane and pragmatic Zen, world-class mystery novelist Michael Dibdin has given us a detective unlike any other. And in this latest installment of this critically acclaimed series, we are treated to a mystery that drips with intrigue and a thriller so satisfying the pages cannot be turned fast enough.','2014-11-25','img/9781400076086.jpg'),(89,89,'End Games (Aurelio Zen Series #11)','When an advance scout for an American film company disappears, Aurelio Zen\'s most recent assignment in remote Calabria becomes anything but routine. Despite a savage attack that has scared the locals silent, Zen is determined to expose the truth. To make matters more complicated, a group of dangerous strangers, led by a rich, single-minded American have arrived to uncover another local mystery—buried treasure—and they will stop at nothing to achieve their goal. What ensues is a fiendishly suspenseful case that only Aurelio Zen could stumble into and only Michael Dibdin could have created: a wild thriller that takes us deep into a remote region of Italy and the darkest corners of human nature.','2014-11-25','img/9780307386724.jpg'),(90,90,'Death in the Truffle Wood (Commissaire Laviolette Series #1)','Long a renowned crime writer in France, Pierre Magnan has won numerous prizes and has a huge popular following in his native country. Now, with this mouthwatering series debut, Magnan introduces the celebrated Commissaire Laviolette to U.S. readers.\nIn a small, peaceful village in Provence, the principal source of income is the cultivation and sale of truffles. When Commissaire Laviolette arrives to investigate why several of the town’s citizens are missing, it isn’t long before their bodies turn up. It takes all of the detective’s ingenuity to unravel crimes whose origins are as old as the truffle woods.','2014-11-25','img/9780312367190.jpg'),(91,91,'The Messengers of Death (Commissaire Laviolette Series #2)','“Stylish . . . Magnan blends elegant clue laying and deft characterizations that strike to the core of human frailties, all within a detective tale with a theme as old as Cain and Abel, as new as tomorrow\'s headlines and as eternal as the Greek myths that inspire Magnan\'s fiction.”\n—-Publishers Weekly (starred review), Best Mysteries of 2008\nLast year Death in the Truffle Wood introduced renowned French crime writer Pierre Magnan to rave American reviews. Now the celebrated Commissaire Laviolette is back in a second delectable mystery set in Provence.\nEmile Pencenat is in a cemetery, designing his own ornate tomb. In a disused postbox by the gate he discovers an envelope addressed to a Mlle Veronique Champourcieux. He is puzzled, but being a former postman, he dutifully purchases a stamp and posts the letter. When the body of this same Mlle Veronique is later discovered—-pinned to her own piano by a bayonet attached to an ancient rifie—-Commissaire Laviolette is coaxed out of retirement to solve one of the most bizarre crimes imaginable.\nTautly plotted and brimming with suspense, The Messengers of Death is a story of dark vengeance and avarice that will thrill and intrigue Magnan’s ever-growing audience in the English-speaking world.','2014-11-25','img/9780312387570.jpg'),(92,92,'The Bad Book Affair (Mobile Library Series #4)','Israel Armstrong—the hapless duffle coat wearing, navel-gazing librarian who solves crimes and domestic problems whilst driving a mobile library around the north coast of Ireland—finds himself on the brink of thirty. But any celebration, planned or otherwise, must be put on hold when a troubled teenager—the daughter of a local politician—mysteriously vanishes. Israel suspects the girl\'s disappearance has something to do with his lending her American Pastoral from the library\'s special \"Unshelved\" category. Now he has to find the lost teen before he\'s run out of town—while he attempts to recover from his recent breakup with his girlfriend, Gloria, and tries to figure out where in Tumdrum a Jewish vegetarian might celebrate his thirtieth birthday.','2014-11-25','img/9780061452017.jpg'),(93,93,'The Unbearable Lightness of Scones (44 Scotland Street Series #5)','The residents and neighbors of 44 Scotland Street and the city of Edinburgh come to vivid life in these gently satirical, wonderfully perceptive serial novels, featuring six-year-old Bertie, a remarkably precocious boy—just ask his mother.\nFeaturing all the quirky characters we have come to know and love, The Unbearable Lightness of Scones, finds Bertie, the precocious six-year-old, still troubled by his rather overbearing mother, Irene, but seeking his escape in the Cub Scouts. Matthew is rising to the challenge of married life with newfound strength and resolve, while Domenica epitomizes the loneliness of the long-distance intellectual. Cyril, the gold-toothed star of the whole show, succumbs to the kind of romantic temptation that no dog can resist and creates a small problem, or rather six of them, for his friend and owner Angus Lordie.\n\nWith his customary deftness, Alexander McCall Smith once again brings us an absorbing and entertaining tale of some of Scotland\'s most quirky and beloved characters--all set in the beautiful, stoic city of Edinburgh.','2014-11-25','img/9780307454706.jpg'),(94,94,'The Charming Quirks of Others (Isabel Dalhousie Series #7)','Isabel has been asked to discreetly investigate the candidates for the position of headmaster at a local boys’ school. The board has three final candidates but has received an anonymous letter alleging that one of them is not suitable.What she discovers about the candidates is surprising, but what she discovers about herself and about Jamie, the father of her young son, turns out to be equally revealing. Isabel’s investigation will have her exploring issues of ambition, as well as of charity, forgiveness, and humility, as she moves nearer and nearer to some of the most hidden precincts of the human heart.','2014-11-25','img/9780307739391.jpg'),(95,95,'The Saturday Big Tent Wedding Party (No. 1 Ladies\' Detective Agency Series #12)','Fans around the world adore the bestselling No. 1 Ladies’ Detective Agency series, the basis of the HBO TV show, and its proprietor Precious Ramotswe, Botswana’s premier lady detective. In this charming series, Mma Ramotswe navigates her cases and her personal life with wisdom, and good humor—not to mention help from her loyal assistant, Grace Makutsi, and the occasional cup of tea.\nIn this latest installment in the charming, bestselling series, Precious Ramotswe faces two confounding cases: the mysterious fate of some cows, and the ghost-like reappearance of her dear old white van.\n\nAs Mma Ramotswe investigates the deaths of cows at a cattle post outside Gaborone, she finds herself also pursuing other mysteries closer to home. One of Mr. J.L.B. Matekoni’s apprentices appears to have gotten a girl pregnant, and has run away to avoid marrying her. Meanwhile, Precious sees her beloved old van—sent to the junkyard long ago—trundling around the city again. Has the van been miraculously revived, or is she hallucinating? Further complicating matters are Violet Sephotho’s newly launched campaign for a seat in Botswana’s parliament, and Grace Makutsi’s growing fears that she’ll never be able to marry her fiancé Phuti Radiphuti if she can’t find the perfect pair of wedding shoes. As ever, Precious will draw on her trademark grace and wisdom as she helps unravel all these tangled threads.','2014-11-25','img/9780307472984.jpg'),(96,96,'The Limpopo Academy of Private Detection (No. 1 Ladies\' Detective Agency Series #13)','Fans around the world adore the bestselling No. 1 Ladies’ Detective Agency series, the basis of the HBO TV show, and its proprietor Precious Ramotswe, Botswana’s premier lady detective. In this charming series, Mma Ramotswe navigates her cases and her personal life with wisdom, and good humor—not to mention help from her loyal assistant, Grace Makutsi, and the occasional cup of tea.\n\nAlexander McCall Smith’s beloved, bestselling No. 1 Ladies’ Detective Agency series continues as Botswana’s best and kindest detective finds her personal and professional lives have become entangled.\n\nPrecious Ramotswe is very busy these days. The best apprentice at Tlokweng Road Speedy Motors is in trouble with the law and stuck with the worst lawyer in Gaborone. Grace Makutsi and Phuti Radiphuti are building the house of their dreams, but their builder is not completely on the up and up. Most shockingly, Mma Potokwane, the orphan farm’s respected matron, has been dismissed from her post. Mma Ramotswe is not about to rest when her friends are mistreated. Helparrives from an unexpected visitor. He is none other than the estimable Mr. Clovis Andersen, author ofThe Principles of Private Detection, the No. 1 Ladies’ prized manual. Together, Mma Ramotswe, Mma Makutsi, and their colleague help right injustices that occur even in their beloved Botswana, and in the process discover something new about being a good detective.','2014-11-25','img/9780307472991.jpg'),(97,97,'The Minor Adjustment Beauty Salon (No. 1 Ladies\' Detective Agency Series #14)','Fans around the world adore the bestselling No. 1 Ladies’ Detective Agency series and the basis of the HBO TV show, and its proprietor Precious Ramotswe, Botswana’s premier lady detective. In this charming series, Mma Ramotswe navigates her cases and her personal life with wisdom, and good humor—not to mention help from her loyal associate, Grace Makutsi, and the occasional cup of tea.\n\nPrecious Ramotswe has her hands full with two puzzling cases. The first concerns a young man hoping to claim his inheritance at his uncle’s farm. The farmer’s lawyer fears that this self-professed nephew may be falsely impersonating the real heir, and asks Mma Ramotswe to look into his identity. The second involves the just-opened Minor Adjustment Beauty Salon, which has been shadowed by misfortune, from bad omens in the mail to swirling rumors that its products are dangerous. The salon’s proprietor fears that someone is trying to put her out of business—but who? Meanwhile, Mma Ramotswe has come to suspect that her intrepid associate Grace Makutsi is pregnant—though Mma Makutsi has mentioned nothing.\n \n With genuine warmth, sympathy, and wit, Alexander McCall Smith explores marriage, parenthood, and the importance of the traditions that shape and guide our lives.','2014-11-25','img/9780307473004.jpg'),(98,98,'Breakdown (V. I. Warshawski Series #15)','V.I. Warshawski returns in the spectacular new novel from the New York Times bestselling author.\nCarmilla, Queen of the Night, is a shape-shifting raven whose fictional exploits thrill girls all over the world. When tweens in Chicago\'s Carmilla Club hold an initiation ritual in an abandoned cemetery, they stumble on an actual corpse, a man stabbed through the heart in a vampire-style slaying.\nThe girls include daughters of some of Chicago\'s most powerful families: the grandfather of one, Chaim Salanter, is among the world\'s wealthiest men; the mother of another, Sophy Durango, is the running for United States Senate.\nFor V. I. Warshawski, the questions multiply faster than the answers. Is the killing linked to a hostile media campaign against Sophy Durango? Or to Chaim Salanter\'s childhood in Nazi-occupied Lithuania? As V.I. struggles for answers, she finds herself fighting enemies who are no less terrifying for being all to human.','2014-11-25','img/9780451238801.jpg'),(99,99,'Three-Day Town (Deborah Knott Series #17)','Three-Day Town is the winner of the Agatha award for best novel.\nAfter a year of marriage, Judge Deborah Knott and Sheriff\'s Deputy Dwight Bryant are off to New York City for a long-delayed honeymoon. January might not be the perfect time to take a bite of the Big Apple, but Dwight\'s sister-in-law has arranged for them to stay in her Upper West Side apartment for a week.\nDeborah had been asked to deliver a package to Lieutenant Sigrid Harald of the NYPD from Sigrid\'s Colleton County grandmother. But when the homicide detective comes to pick it up, the package is missing and the building\'s super is found murdered. Now despite their desire to enjoy a blissful winter getaway, Deborah and Dwight must team up with Lt. Harald to catch the killer before he strikes again.\n\n\n                        Winner of the 2011 Agatha Award for Best Novel','2014-11-25','img/9780446555777.jpg'),(100,100,'Hard Row (Deborah Knott Series #13)','As Judge Deborah Knott presides over a case involving a barroom brawl, it becomes clear that deep resentments over race, class, and illegal immigration are simmering just below the surface in the countryside. An early spring sun has begun to shine like a blessing on the fertile fields of North Carolina, but along with the seeds sprouting in the thawing soil, violence is growing as well. Mutilated body parts have appeared along the back roads of Colleton County, and the search for the victim\'s identity and for that of his killer will lead Deborah and her new husband, Sheriff\'s Deputy Dwight Bryant, into the desperate realm of undocumented farm workers exploited for cheap labor.\nIn the meantime, Deborah and Dwight continue to adjust to married life and to having Dwight\'s eight-year-old son, Cal, live with them full time. When another body is found, these newlyweds will discover dark truths that threaten to permanently alter the serenity of their rural surroundings and their new life together.','2014-11-25','img/9780446618076.jpg'),(101,101,'Little Tiny Teeth (Gideon Oliver Series #14)','From the Edgar® Award winning author of Uneasy Relations. Starring Professor Gideon Oliver... \"a likable, down-to-earth, cerebral sleuth.\" (CHICAGO TRIBUNE)\nSailing the Amazon with a group of botanists, \'Skeleton Detective\' Gideon Oliver is on his dream vacation. But it turns nightmarish when fierce head-hunters narrowly miss killing the group leader, then a deranged passenger kills a botanist and flees. Long-past enmities and resentments-and new ones as well-might explain things. And when a fresh skeleton turns up in the river, Gideon is sure that, in this jungle full of predators, humans may be the deadliest of all.','2014-11-25','img/9780425222508.jpg'),(102,102,'Where There\'s a Will (Gideon Oliver Series #12)','Alex Torkelsson has just gotten word: after going missing ten years ago, Alex\'s late uncle Magnus\'s plane has been found south of Hawaii\'s Big Island. So too have Magnus\'s few skeletal remains, now handed over to the only man who can fit together the pieces of this mystery. But what forensic detective Gideon Oliver discovers could shake the Torkelsson family tree.','2014-11-25','img/9780425208526.jpg'),(103,103,'Hard Truth (Anna Pigeon Series #13)','Just days after marrying Sheriff Paul Davidson, Anna Pigeon moves to Colorado to assume her new post as district ranger at Rocky Mountain National Park. When two of three children who\'d gone missing from a religious retreat reappear, Anna\'s investigation brings her face-to-face with a paranoid sect—and with a villain so evil, he\'ll make the hairs on the back of your neck stand on end','2014-11-25','img/9780425208410.jpg'),(104,104,'Blood Lure (Anna Pigeon Series #9)','Straddling the border between Montana and Canada lies the Waterton-Glacier International Peace Park—Anna’s home away from home when she is sent on a cross-training assignment to study grizzly bears. Along with bear researcher Joan Rand and a volatile, unpredictable teenage boy, Anna hikes the back country, seeking signs of bear. But the tables are turned on their second night out, when one of the beasts comes looking for them. Daybreak finds the boy missing, a camper mutilated, and Anna caught in a grip of fear, painfully aware that her lifelong bond with nature has inexplicably snapped…','2014-11-25','img/9780425183755.jpg'),(105,105,'Chopping Spree (Culinary Mystery Series #11)','Her inventive recipe for mixing first-class suspense and five-star fare has made Diane Mott Davidson a favorite of mystery lovers and a mainstay on major bestseller lists across the country. Now she has prepared another irresistibly tempting tale spiced with mystery and mayhem…\nFor Colorado caterer Goldy Schulz, business isn’t just booming—it’s skyrocketing. Her friend Marla is constantly warning her, “Success can kill you.” But Goldy doesn’t take the warning literally until her next booking: a cocktail party for the Westside Mall’s Elite Shoppers Club.\nWhile setting up, Goldy is nearly run down by a truck with no intention of stopping. Then she finds an old friend in a pile of sale shoes—stabbed with one of Goldy’s new knives. Goldy must catch the real killer between whipping up Sweethearts’ Swedish Meatballs, Quiche Me Quick, and Diamond Lovers’ Hot Crab Dip. Why was the victim carrying a powerful narcotic? Who hired a private investigator shortly before the murder? Goldy’s gourmet instincts tell her the final course in this case will be a real killer.','2014-11-25','img/9780553578355.jpg'),(106,106,'House of Seven Mabels (Jane Jeffry Series #13)','\"Homemaking\" is about to take on a whole new meaning for Jane Jeffry, now that she\'s agreed to help the prosperouslydivorced Bitsy Burnside restore and redecorate a decrepit old neighborhood mansion. Bitsy\'s decision to employ an almost all-woman crew has prompted Jane\'s quick-witted best bud Shelley Nowack to dub the project, \"the House of Seven Mabels\" — but it\'s also engendered some nasty ill will.\nAnd when what begins as a series of anonymous, mean-spirited \"pranks\" ends up leaving one of the workwomen lying dead at the foot of a staircase, Jane and Shelley decide to try and nail the assassin. But the more Jane saws away at the truth, the more it appears that she may be painting herself into a corner, leaving herself no exit if a crafty killer decides to make Jane Jeffry the next demolition project.','2014-11-25','img/9780380804924.jpg'),(107,107,'The Body in the Lighthouse (Faith Fairchild Series #13)','Something was very wrong on Sanpere this summer . . .\n\nTo escape the misery of a sweltering August in Aleford, Massachusetts, caterer and minister\'s wife Faith Fairchild and her family head for their cottage on Maine\'s peaceful Sanpere Island in Penobscot Bay. But things have changed since their last visit. An aggressive developer is moving forward on plans that will destroy the unique ambience of the island, infuriating residents. Tensions are running dangerously high, and soon murder rears its hideous head. Faith discovers a corpse while exploring the grounds of Sanpere\'s historic lighthouse. With fear running rampant and volatile emotions approaching the detonation point, the intrepid sleuth must track down a killer for the sake of a friend and the island she loves.','2014-11-25','img/9780380813865.jpg'),(108,108,'Sunshine and Shadow (Benni Harper Series #10)','Spirited ex-cowgirl, quilter, and folk-art expert Benni Harper is back, investigating the connection between her favorite author, the murder of a family friend, and a crazy quilt. And when she starts receiving strange phone calls and anonymous letters telling her she\'ll be the next victim, her interest in the case becomes even more urgent.','2014-11-25','img/9780425195284.jpg'),(109,109,'Death Trap (Jessie Arnold Series #10)','the summers are brief —\nand winter, like death,\nis cold and long . . .\nRecovering from knee surgery that will cause her to miss the upcoming dogsled racing season, champion \"musher\" Jessie Arnold feels empty and bored — so she grabs an opportunity to fill her days manning the Iditarod booth at the Alaska State Fair. But murder becomes an attraction here as well — an especially brutal one — when the corpse of a small-time hoodlum slain by a double-blade axe blow to the skull turns up on the fairgrounds. Jessie shouldn\'t get involved, having already seen too much violent death in her lifetime. But strange connections are linking the killing with a child\'s kidnapping . . . and with the sudden disappearance of her own beloved lead sled dog. Soon friends old and new will be pulled in as well when the unthinkable occurs: Jessie herself vanishes without a trace.','2014-11-25','img/9780380816866.jpg'),(110,110,'High Country (Anna Pigeon Series #12)','\"It\'s fall in the Sierra Mountains, and Anna Pigeon is slinging hash in Yosemite National Park\'s historic Ahwahnee Hotel. Four young people, all seasonal park employees, have disappeared, and two weeks of work by crack search-and-rescue teams have failed to turn up a single clue; investigators are unsure as to whether the four went AWOL for reasons of their own - or died in the park. Needing an out-of-park ranger to work undercover, Anna is detailed to dining room duty; but after a week of waiting tables, she knows the missing employees are only the first indication of a sickness threatening the park.\" Her twenty-something roommates give up their party-girl ways and panic; her new restaurant colleagues regard her with suspicion and fear. Yet when Anna\'s life if threatened and her temporary supervisor turns a deaf ear, she follows the scent of evil, taking a solo hike up a snowy trial to the high country, seeking answers. What awaits her is a nightmare of death and greed - and perhaps her final adventure.','2014-11-25','img/9780425199565.jpg'),(111,111,'Death of the Party (Death on Demand Series #16)','Britt Barlow is certain her media mogul brother-in-law Jeremiah Addison\'s fatal tumble a year ago was no accident — especially since she herself discovered, and disposed of, the trip wire someone had strung across the stairs. Now she\'s bringing all who were in attendance that weekend back to Golden Silk — Addison\'s luxurious secluded island estate — and inviting two extra guests, Annie and Max Darling, to help uncover a killer.\nAnnie Darling wouldn\'t miss this party for the world! And there certainly is no lack of suspects among the guests, each of whom had a substantial motive for doing in the insufferable tycoon. But the party turns deadly when a houseman mysteriously vanishes, along with the boats which are the only escape off Addison\'s island — leaving the Darlings stranded on a floating rock in the middle of nowhere, too close to a solution for comfort, and stalked by a crafty murderer.','2014-11-25','img/9780060004774.jpg'),(112,112,'The Body in the Snowdrift (Faith Fairchild Series #15)','Caterer Faith Fairchild has a bad feeling about her father-in-law\'s decision to celebrate his seventieth birthday with a family reunion ski week at the Pine Slopes resort in Vermont — the Fairchilds\' favorite getaway since Faith\'s husband, the Reverend Thomas Fairchild, was a toddler. At first her unease seems unfounded — until Faith comes across a corpse on one of the cross-country trails, the apparent victim of a heart attack.\nThen one catastrophe follows another: the mysterious disappearance of the Pine Slopes\' master chef, a malicious prank at the sports center, a break-in at the Fairchild condo, the sabotage of a chairlift. And when a fatal \"accident\" with the snow-making machines stains the slopes blood red, Faith realizes she\'ll have to work fast to solve a murderous puzzle — because suddenly not only are the reunion and the beloved resort\'s future in jeopardy . . . but Faith\'s life is as well.','2014-11-25','img/9780060525323.jpg'),(113,113,'Dead Man Docking (Bed-and-Breakfast Series #21)','B&B hostess Judith McMonigle Flynn and her closer-than-a-sibling cousin Renie would be crazy to turn down a free, 1930s-themed South Pacific islands cruise aboard the magnificent San Rafael, the pride of the Cruz Cruises fleet. Unfortunately, the fabulous pre-launch party is as far out to sea as the passengers are likely to get, after the body of their VIP host, Magglio Cruz, is discovered stuffed in the piano and the cruise is cancelled.\nSuddenly free to gad about San Francisco with their marooned shipmates — at least one of whom is possibly homicidal — the cousins decide to join glamorous, martini-quaffing Rick and Rhoda St. George and their wheezy white pooch, Asthma, for a bit of amateur sleuthing. But the route to Magglio\'s murderer may not be such smooth sailing. And if Judith, Renie, and the St. Georges aren\'t careful, they may all end up leaving their hearts in San Francisco . . . and the rest of their mortal remains as well!','2014-11-25','img/9780060566500.jpg'),(114,114,'This Old Souse (Bed-and-Breakfast Series #20)','USA Today bestselling mystery maven Mary Daheim brings us another intriguing tale in her cherished Bed-and-Breakfast mystery series in which a trip down memory lane brings Judith and Renie back to their old neighbourhood, and they are drawn to a seemingly deserted house that is much more than meets the eye.\nOn a trip to Renie\'s old neighbourhood, the cousins\' curiosity is piqued by a mysterious brick Tudor house that always looked deserted during Renie\'s junior high school days. Surprised that the house still looks abandoned after all these years, Judith and Renie, of course, cannot resist an opportunity to snoop around. They discover that Mr. and Mrs. Bland have lived in the house since 1947, and after cornering the mailman and milkman, Judith and Renie also learn that the Blands receive regular mail and food deliveries, but no one has ever seen the occupants who simply pay the bills with cash they leave in the milk box. Although intrigued by these strange, but definitely not sinister, occurrences, Judith is ready to focus her attention once more on her neglected husband Joe and the busy B&B business. Until one day Judith finds a dead body in the trunk of her car. And it\'s the Blands\' milkman...','2014-11-25','img/9780380815654.jpg'),(115,115,'Hocus Croakus (Bed-and-Breakfast Series #19)','With major renovations going on at Seattle\'s favourite B\\′9126B, Mary Daheim moves Judith, Renie and the rest of the unforgettable clan to temporary lodgings at a casino resort. But when a magic show results in murder, Judith and Joe are on the job.\nMystery maven Mary Daheim serves up murder and mayhem in this tale of a vacation gone awry at the Stillasnowamish Resort Casino. After being forced out of the B\\′9126B by post-fire renovations, Judith and Renie pack up the family and settle in for the duration. As if bickering from the two mothers wasn\'t enough hassle, the group discovers Salome, the resort magician\'s beautiful assistant they\'d seen perform only hours earlier, dead from multiple stab wounds. While Judith can\'t help but snoop around, her husband Joe is officially recruited to investigate by the casino manager. The chase is on as suspect after suspect emerges leaving Judith and Joe to answer the crucial, yet baffling question\'s the real casino killer?','2014-11-25','img/9780380815647.jpg'),(116,116,'Murder Walks the Plank (Death on Demand Series #15)','Annie Darling\'s murder mystery cruise in the waters off her not-always-idyllic isle of Broward\'s Rock is going swimmingly — until one of the revelers plunges overboard. And despite hubby Max\'s courageous rescue attempt, faux murder turns all too quickly into real-life death. As the body count rises over the next few days, the popular proprietress of the Death on Demand bookstore begins to suspect that all the victims were murdered most foully, and that they are all connected in some unknown way. But what intrepid crime solver Annie does not realize is that the killer she seeks is more ingeniously efficient than most — and the puzzle she wishes to unravel is, in reality, a time bomb packed with an explosive mix of arson, assault, kidnapping, robbery ... and homicide, naturally.\nOne false step and Annie, Max, and their canny cohorts will be blown off Broward\'s Rock for good.','2014-11-25','img/9780060004750.jpg'),(117,117,'It Had to Be You: A Grace &amp; Favor Mystery','Comfortably ensconced in their late great-uncle\'s \"Grace and Favor\" mansion, brother and sister Robert and Lily Brewster are riding out the Depression, penniless but in high style. Now a new day is heralded by Franklin Roosevelt\'s inauguration. Barely recovered from his trip to Washington to witness the historic event, Robert is rushed by Lily to a nearby nursing home, where the Brewsters have agreed to lend a helping hand to the staff.\nBut when an elderly resident is murdered in his bed, Robert and Lily realize the local police will need their able assistance as well — especially since the slaying isn\'t the only big trouble in tiny Voorburg. The spring thaw hasrevealed another body, and the Brewster siblings must expose acold-blooded criminal before he — or she — kills again.','2014-11-25','img/9780060528447.jpg'),(118,118,'A Dilly of a Death (China Bayles Series #12)','China Bayles is in a pickle. The daughter of her best friend, Ruby, has turned up on her doorstep, pregnant and in need of a place to live. And her otherwise sensible husband has announced that he\'s bored with teaching and ready for a career change.\" \"Say \"hello\" to P.I. Mike McQuaid and Associates. There aren\'t actually any \"associates\" - unless you count Ruby and China, of course. But the title does have a nice, official ring to it. His first client is Phoebe the Pickle Queen, owner of the biggest little pickle business in Texas. According to Phoebe, her plant manager is embezzling, and she wants McQuaid to follow the money.\" Meanwhile, Pecan Springs is hosting the annual Picklefest - and this year, China and Ruby are on the planning committee, along with Phoebe. But just days before the festival starts, the Pickle Queen disappears. Some say she sold her business and split; others think the answer may lie with her missing boyfriend. It\'s up to McQuaid and China to search for the Pickle Queen - and for clues in a case that promises to leave a very sour taste.','2014-11-25','img/9780425199541.jpg'),(119,119,'Broken Dishes (Benni Harper Series #11)','When Benni Harper\'s friend passes away, he leaves his Broken DIS ranch to his daughter Shawna and her husband. Instead of raising cattle, the couple decides to turn it into a dude ranch. And while their intentions may be good, business is not. Leave it to Benni and her family to come to the rescue. Her plan? To tempt vacationers with a quilting and western extravaganza. It works. And soon, Benni and her family are cooking, quilting, and horseback riding with a whole slew of western tenderfoots.\" But the west gets a little too wild when one of the ranch dogs discovers a human bone on the property. It\'s enough to scare any reasonable guest away. To top it off, there\'s a rumor that one of the visitors is a nationally known travel writer, secretly working on a write-up. A bad review could easily kill business. Before long, Benni\'s old nemesis, Detective Ford \"Hud\" Hudson, is on board investigating. Together they uncover the remains of a murdered man buried in a shallow grave. Now, Benni must keep the guests safe and happy while unearthing the truth behind a terrible crime.','2014-11-25','img/9780425201978.jpg'),(120,120,'Indigo Dying (China Bayles Series #11)','China Bayles heads to the tiny town of Indigo, Texas, to teach a Colors to Dye For workshop. But she quickly discovers that Indigo is a town with more than its share of dark secrets-secrets that someone thinks are worth killing to keep.','2014-11-25','img/9780425193778.jpg'),(121,121,'The Body in the Attic (Faith Fairchild Series #14)','Caterer Faith Fairchild and family are living in one of historic Cambridge, Massachusetts\', venerable Brattle Street houses while the Reverend Tom teaches a course at the Harvard Divinity School and does some soul searching — is his Aleford parish his true calling? One night in downtown Boston, Faith is startled by a face from her past. It\'s Richard Morgan, a former boyfriend from her life as a single woman in Manhattan. Their heady, whirlwind affair in the waning days of the self-indulgent 1980s ended abruptly. Now he\'s back, as exciting as ever.\nThen something occurs that turns a pleasant sabbatical into a nightmare — Faith discovers a diary, written in 1946 and hidden in the attic, that reveals an unspeakable horror. Suddenly dark secrets seem to permeate every room. And with Richard guarding strange secrets of his own, Faith is soon caught up in solving more than one troubling mystery ... with a murderer lurking a little too close to home.','2014-11-25','img/9780060525316.jpg'),(122,122,'The Alpine Pursuit (Emma Lord Series #16)','For a small town newspaper like The Alpine Advocate, a new play at the local community college is big news. Editor and publisher Emma Lord is duty-bound to attend opening night, but expects the amateur enterprise will serve only as a cure for insomnia. The play is dubbed “a black comedy,” but the only laughs Emma gets are from the bad acting and the wretched script. And while the turgid production makes Wagner’s Ring cycle seem like a vignette, the real drama begins just before the final curtain.\nHans Berenger, dean of students, wasn’t well known or well liked around Alpine, but the audience found his death scene genuinely convincing—until they realized he wasn’t acting. No one can say how or when the blanks in the prop gun were replaced with the real bullets that killed Berenger, but the list of suspects reads like a playbill of the cast and crew. They all had opportunity, access, and their own axes to grind with the thespically challenged dean.\nSeeking the assistance of Vida Runkel, the Advocate’s redoubtable House and Home editor, Emma Lord vows to unravel a mystery that spirals out into unexpected places. As Emma sets the stage for the most likely suspect, she finds herself in a two-character scene whose next cue could make the resolute editor take a final—and permanent—bow.\nFrom the Hardcover edition.','2014-11-25','img/9780345447920.jpg');
/*!40000 ALTER TABLE `bookdisplayinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookgenres`
--

DROP TABLE IF EXISTS `bookgenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookgenres` (
  `bookGenreId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `genreId` int(11) NOT NULL,
  PRIMARY KEY (`bookGenreId`),
  KEY `bookGenreDeterminedBy` (`bookId`),
  KEY `genreDeterminedBy` (`genreId`),
  CONSTRAINT `bookGenreDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genreDeterminedBy` FOREIGN KEY (`genreId`) REFERENCES `genres` (`genreId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookgenres`
--

LOCK TABLES `bookgenres` WRITE;
/*!40000 ALTER TABLE `bookgenres` DISABLE KEYS */;
INSERT INTO `bookgenres` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,2),(5,5,1),(6,6,2),(7,7,2),(8,8,1),(9,9,1),(10,10,1),(11,11,2),(12,12,1),(13,13,2),(14,14,2),(15,15,2),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,2),(22,22,2),(23,23,2),(24,24,2),(25,25,1),(26,26,1),(27,27,2),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,1),(33,33,2),(34,34,3),(35,35,1),(36,36,2),(37,37,2),(38,38,2),(39,39,2),(40,40,2),(41,41,2),(42,42,2),(43,43,2),(44,44,2),(45,45,2),(46,46,2),(47,47,2),(48,48,2),(49,49,2),(50,50,2),(51,51,2),(52,52,2),(53,53,2),(54,54,2),(55,55,1),(56,56,1),(57,57,1),(58,58,2),(59,59,1),(60,60,1),(61,61,2),(62,62,2),(63,63,2),(64,64,2),(65,65,3),(66,66,4),(67,67,3),(68,68,3),(69,69,4),(70,70,3),(71,71,3),(72,72,3),(73,73,3),(74,74,3),(75,75,2),(76,76,1),(77,77,2),(78,78,1),(79,79,1),(80,80,5),(81,81,2),(82,82,2),(83,83,2),(84,84,2),(85,85,2),(86,86,2),(87,87,2),(88,88,2),(89,89,2),(90,90,2),(91,91,2),(92,92,2),(93,93,6),(94,94,2),(95,95,2),(96,96,2),(97,97,2),(98,98,2),(99,99,2),(100,100,2),(101,101,2),(102,102,2),(103,103,2),(104,104,2),(105,105,2),(106,106,2),(107,107,2),(108,108,2),(109,109,2),(110,110,2),(111,111,2),(112,112,2),(113,113,2),(114,114,2),(115,115,2),(116,116,2),(117,117,2),(118,118,2),(119,119,2),(120,120,2),(121,121,2),(122,122,2);
/*!40000 ALTER TABLE `bookgenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinterestlevels`
--

DROP TABLE IF EXISTS `bookinterestlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookinterestlevels` (
  `bookInterestLevelId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `interestLevelId` int(11) NOT NULL,
  PRIMARY KEY (`bookInterestLevelId`),
  KEY `bookILDeterminedBy` (`bookId`),
  KEY `ILDeterminedBy` (`interestLevelId`),
  CONSTRAINT `ILDeterminedBy` FOREIGN KEY (`interestLevelId`) REFERENCES `interestlevels` (`interestLevelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookILDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinterestlevels`
--

LOCK TABLES `bookinterestlevels` WRITE;
/*!40000 ALTER TABLE `bookinterestlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookinterestlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) NOT NULL,
  `seriesName` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'9780345530974','Pegasus'),(2,'9781455560820','Private India: City on Fire'),(3,'9780316211154','Private Vegas'),(4,'9780316211048','Burn (Michael Bennett Series #7)'),(5,'9780399167300','The Eye of Heaven (Fargo Adventure Series #6)'),(6,'9780316210966','Hope to Die (Alex Cross Series #22)'),(7,'9780316225939','The Burning Room (Harry Bosch Series #19)'),(8,'9780399172922','Havana Storm (Dirk Pitt Series #23)'),(9,'9781451635577','Fatal Conceit (Butch Karp Series #26)'),(10,'9781451635560','Tragic (Butch Karp Series #25)'),(11,'9780594480532','Trader of Secrets (Paul Madriani Series #12)'),(12,'9780594546467','Lost Empire (Fargo Adventure Series #2)'),(13,'9780786020270','Serial (Frank Quinn Series #6)'),(14,'9780786018444','Night Kills (Frank Quinn Series #3)'),(15,'9780553591194','The Lost Tomb'),(16,'9780743491921','Atlantis Prophecy'),(17,'9780061233906','Sacred Bones'),(18,'9780446404709','The Alexander Cipher'),(19,'9780553592955','The Secret of Excalibur (Nina Wilde/Eddie Chase Series #3)'),(20,'9780553593631','The Pyramid of Doom (Nina Wilde/Eddie Chase Series #5)'),(21,'9781416565178','I, Sniper (Bob Lee Swagger Series #6)'),(22,'9780786020263','Mister X (Frank Quinn Series #5)'),(23,'9780786018451','Urge to Kill (Frank Quinn Series #4)'),(24,'9780786020287','Pulse (Frank Quinn Series #7)'),(25,'9780451237156','Valley of the Templars'),(26,'9780553593655','Empire of Gold (Nina Wilde/Eddie Chase Series #7)'),(27,'9780345538192','One Shot (Jack Reacher Series #9) (Movie Tie-in Edition)'),(28,'9781455523535','Alex Cross: Also published as CROSS'),(29,'9780385344326','The Affair (Jack Reacher Series #16)'),(30,'9780316069410','The Drop (Harry Bosch Series #17)'),(31,'9780399158025','Red Mist (Kay Scarpetta Series #19)'),(32,'9780345545930','The City'),(33,'9781476749068','I\'ve Got You Under My Skin'),(34,'9781250020048','Live to See Tomorrow'),(35,'9780062135254','The Kill Switch (Tucker Wayne Series #1)'),(36,'9781250037930','On Scope (Kyle Swanson Sniper Series #7)'),(37,'9780670026463','Any Other Name (Walt Longmire Series #10)'),(38,'9780143120988','Hell Is Empty (Walt Longmire Series #7)'),(39,'9781250008527','Misery Bay (Alex McKnight Series #8)'),(40,'9780312932961','Ice Run (Alex McKnight Series #6)'),(41,'9780765346407','Larry Bond\'s First Team: Fires of War'),(42,'9780446606189','Cat &amp; Mouse (Alex Cross Series #4)'),(43,'9780446604802','Jack and Jill (Alex Cross Series #3)'),(44,'9780425201442','The Body Farm (Kay Scarpetta Series #5)'),(45,'9781416505402','Cruel and Unusual (Kay Scarpetta Series #4)'),(46,'9780425204696','From Potter\'s Field (Kay Scarpetta Series #6)'),(47,'9780446610223','The Big Bad Wolf (Alex Cross Series #9)'),(48,'9780425199107','The Hanged Man\'s Song (Kidd Series #4)'),(49,'9780451213174','Reckless Abandon (Stone Barrington Series #10)'),(50,'9780451210159','Dirty Work (Stone Barrington Series #9)'),(51,'9780425174272','Certain Prey (Lucas Davenport Series #10)'),(52,'9780446611633','Lost Light (Harry Bosch Series #9)'),(53,'9780425195444','Naked Prey (Lucas Davenport Series #14)'),(54,'9780425182871','Chosen Prey (Lucas Davenport Series #12)'),(55,'9780425205594','Dark Watch (Oregon Files Series #3)'),(56,'9780451219954','The Last Templar (Sean Reilly and Tess Chaykin Series #1)'),(57,'9780451231901','The Templar Conspiracy'),(58,'9780425237410','The Hidden Man (Jason Kolarich Series #1)'),(59,'9780451412980','The Messiah Secret (Chris Bronson Series #3)'),(60,'9781416586586','The Apostle (Scot Harvath Series #8)'),(61,'9780061732805','Judgment Call (Joanna Brady Series #15)'),(62,'9781909223318','Clean Burn: Introducing Detective Janelle Watkins'),(63,'9781611880557','The Shepherd (Shepherd Series #1)'),(64,'9780062314116','Confession'),(65,'9780764210310','Courting Cate (Courtships of Lancaster County Series #1)'),(66,'9780800733858','The Choice (Lancaster County Secrets Series #1)'),(67,'9780764210327','Adoring Addie (Courtships of Lancaster County Series #2)'),(68,'9780736938624','The Amish Bride (Women of Lancaster County Series #3)'),(69,'9780800719883','The Haven (Stoney Ridge Seasons Series #2)'),(70,'9781595547767','Faithful to Laura (Middlefield Family Series #2)'),(71,'9780736938662','Living in Harmony'),(72,'9780736952552','Katie\'s Forever Promise (Emma Raber\'s Daughter Series #3)'),(73,'9780425264263','Autumn Grace'),(74,'9780425264225','Summer Promise'),(75,'9780399162374','Deadline (Virgil Flowers Series #8)'),(76,'9781476717128','Act of War (Scot Harvath Series #13)'),(77,'9781455517138','The Skin Collector (Lincoln Rhyme Series #11)'),(78,'9780399163746','The Red Room (Risk Agent Series #3)'),(79,'9780307588364','Gone Girl'),(80,'9780316333603','Where\'d You Go, Bernadette'),(81,'9780316033480','Case Histories (Jackson Brodie Series #1)'),(82,'9780316066747','Started Early, Took My Dog (Jackson Brodie Series #4)'),(83,'9780316012829','One Good Turn (Jackson Brodie Series #2)'),(84,'9780151012459','The Ignorance of Blood (Javier Falcon Series #4)'),(85,'9781569476420','The Lord of Death (Inspector Shan Tao Yun Series #6)'),(86,'9780312335090','Beautiful Ghosts (Inspector Shan Tao Yun Series #4)'),(87,'9780143034605','Excursion to Tindari (Inspector Montalbano Series #5)'),(88,'9781400076086','Medusa (Aurelio Zen Series #9)'),(89,'9780307386724','End Games (Aurelio Zen Series #11)'),(90,'9780312367190','Death in the Truffle Wood (Commissaire Laviolette Series #1)'),(91,'9780312387570','The Messengers of Death (Commissaire Laviolette Series #2)'),(92,'9780061452017','The Bad Book Affair (Mobile Library Series #4)'),(93,'9780307454706','The Unbearable Lightness of Scones (44 Scotland Street Series #5)'),(94,'9780307739391','The Charming Quirks of Others (Isabel Dalhousie Series #7)'),(95,'9780307472984','The Saturday Big Tent Wedding Party (No. 1 Ladies\' Detective Agency Series #12)'),(96,'9780307472991','The Limpopo Academy of Private Detection (No. 1 Ladies\' Detective Agency Series #13)'),(97,'9780307473004','The Minor Adjustment Beauty Salon (No. 1 Ladies\' Detective Agency Series #14)'),(98,'9780451238801','Breakdown (V. I. Warshawski Series #15)'),(99,'9780446555777','Three-Day Town (Deborah Knott Series #17)'),(100,'9780446618076','Hard Row (Deborah Knott Series #13)'),(101,'9780425222508','Little Tiny Teeth (Gideon Oliver Series #14)'),(102,'9780425208526','Where There\'s a Will (Gideon Oliver Series #12)'),(103,'9780425208410','Hard Truth (Anna Pigeon Series #13)'),(104,'9780425183755','Blood Lure (Anna Pigeon Series #9)'),(105,'9780553578355','Chopping Spree (Culinary Mystery Series #11)'),(106,'9780380804924','House of Seven Mabels (Jane Jeffry Series #13)'),(107,'9780380813865','The Body in the Lighthouse (Faith Fairchild Series #13)'),(108,'9780425195284','Sunshine and Shadow (Benni Harper Series #10)'),(109,'9780380816866','Death Trap (Jessie Arnold Series #10)'),(110,'9780425199565','High Country (Anna Pigeon Series #12)'),(111,'9780060004774','Death of the Party (Death on Demand Series #16)'),(112,'9780060525323','The Body in the Snowdrift (Faith Fairchild Series #15)'),(113,'9780060566500','Dead Man Docking (Bed-and-Breakfast Series #21)'),(114,'9780380815654','This Old Souse (Bed-and-Breakfast Series #20)'),(115,'9780380815647','Hocus Croakus (Bed-and-Breakfast Series #19)'),(116,'9780060004750','Murder Walks the Plank (Death on Demand Series #15)'),(117,'9780060528447','It Had to Be You: A Grace &amp; Favor Mystery'),(118,'9780425199541','A Dilly of a Death (China Bayles Series #12)'),(119,'9780425201978','Broken Dishes (Benni Harper Series #11)'),(120,'9780425193778','Indigo Dying (China Bayles Series #11)'),(121,'9780060525316','The Body in the Attic (Faith Fairchild Series #14)'),(122,'9780345447920','The Alpine Pursuit (Emma Lord Series #16)');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowedaudiobooks`
--

DROP TABLE IF EXISTS `borrowedaudiobooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowedaudiobooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `dateExpires` date NOT NULL,
  `bookRating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AudioBooks_user_current_books` (`regUserId`),
  KEY `AudioBooks_current_books` (`audioBookId`),
  CONSTRAINT `AudioBooks_current_books` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AudioBooks_user_current_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedaudiobooks`
--

LOCK TABLES `borrowedaudiobooks` WRITE;
/*!40000 ALTER TABLE `borrowedaudiobooks` DISABLE KEYS */;
INSERT INTO `borrowedaudiobooks` VALUES (1,1,1,'2015-09-09',NULL),(2,2,1,'2015-09-09',NULL),(3,3,1,'2015-09-09',4),(4,4,2,'2015-09-09',NULL);
/*!40000 ALTER TABLE `borrowedaudiobooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowedebooks`
--

DROP TABLE IF EXISTS `borrowedebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowedebooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `dateExpires` date NOT NULL,
  `bookRating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_current_books` (`regUserId`),
  KEY `ebook_current_books` (`eBookId`),
  CONSTRAINT `ebook_current_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_current_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedebooks`
--

LOCK TABLES `borrowedebooks` WRITE;
/*!40000 ALTER TABLE `borrowedebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowedebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadsites`
--

DROP TABLE IF EXISTS `downloadsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadsites` (
  `downloadSiteId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `baseUrl` varchar(100) NOT NULL,
  `downloadUrl` varchar(100) NOT NULL,
  `bookKeyUrl` varchar(100) NOT NULL,
  `publicKey` varchar(100) NOT NULL,
  PRIMARY KEY (`downloadSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadsites`
--

LOCK TABLES `downloadsites` WRITE;
/*!40000 ALTER TABLE `downloadsites` DISABLE KEYS */;
INSERT INTO `downloadsites` VALUES (1,'Lamazon','Not_Implemented_Yet','Not_Implemented_Yet','Not_Implemented_Yet','Not_Implemented_Yet');
/*!40000 ALTER TABLE `downloadsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebookformats`
--

DROP TABLE IF EXISTS `ebookformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebookformats` (
  `ebookFormatId` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `formatId` int(11) NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`ebookFormatId`),
  KEY `ebook_format_type` (`eBookId`),
  KEY `format_type` (`formatId`),
  CONSTRAINT `ebook_format_type` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `format_type` FOREIGN KEY (`formatId`) REFERENCES `formats` (`formatId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookformats`
--

LOCK TABLES `ebookformats` WRITE;
/*!40000 ALTER TABLE `ebookformats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebookformats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebookholds`
--

DROP TABLE IF EXISTS `ebookholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebookholds` (
  `eBookOnHoldId` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `positionInQueue` int(11) NOT NULL,
  PRIMARY KEY (`eBookOnHoldId`),
  KEY `ebook_hold` (`eBookId`),
  KEY `user_hold` (`regUserId`),
  CONSTRAINT `ebook_hold` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_hold` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookholds`
--

LOCK TABLES `ebookholds` WRITE;
/*!40000 ALTER TABLE `ebookholds` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebookholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooklanguages`
--

DROP TABLE IF EXISTS `ebooklanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebooklanguages` (
  `eBookLanguageId` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  PRIMARY KEY (`eBookLanguageId`),
  KEY `book_language_text` (`eBookId`),
  KEY `language_determined` (`languageId`),
  CONSTRAINT `book_language_text` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_determined` FOREIGN KEY (`languageId`) REFERENCES `languages` (`languageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooklanguages`
--

LOCK TABLES `ebooklanguages` WRITE;
/*!40000 ALTER TABLE `ebooklanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebooklanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooklicenses`
--

DROP TABLE IF EXISTS `ebooklicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebooklicenses` (
  `eBookLicenseId` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `downloadSiteId` int(11) NOT NULL,
  `numberOfCopiesForDownload` int(11) NOT NULL,
  PRIMARY KEY (`eBookLicenseId`),
  KEY `book_download_text` (`eBookId`),
  KEY `downloadSite_text_determined` (`downloadSiteId`),
  CONSTRAINT `book_download_text` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `downloadSite_text_determined` FOREIGN KEY (`downloadSiteId`) REFERENCES `downloadsites` (`downloadSiteId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooklicenses`
--

LOCK TABLES `ebooklicenses` WRITE;
/*!40000 ALTER TABLE `ebooklicenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebooklicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebookpublishers`
--

DROP TABLE IF EXISTS `ebookpublishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebookpublishers` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `information` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookpublishers`
--

LOCK TABLES `ebookpublishers` WRITE;
/*!40000 ALTER TABLE `ebookpublishers` DISABLE KEYS */;
INSERT INTO `ebookpublishers` VALUES (1,'Random House Publishing Group',NULL),(2,'Houghton Mifflin Harcourt',NULL),(3,'Publisher 3',NULL),(4,'Mimir Books',NULL);
/*!40000 ALTER TABLE `ebookpublishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebookratings`
--

DROP TABLE IF EXISTS `ebookratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebookratings` (
  `eBookRatingId` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `numberOfRatings` int(11) NOT NULL,
  `sumOfRatings` decimal(10,0) NOT NULL,
  PRIMARY KEY (`eBookRatingId`),
  KEY `bookFormatRatingDeterminedBy` (`eBookId`),
  CONSTRAINT `bookFormatRatingDeterminedBy` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookratings`
--

LOCK TABLES `ebookratings` WRITE;
/*!40000 ALTER TABLE `ebookratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebookratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooks`
--

DROP TABLE IF EXISTS `ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebooks` (
  `eBookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `publisherId` int(11) NOT NULL,
  PRIMARY KEY (`eBookId`),
  KEY `book_text` (`bookId`),
  KEY `publisher_text` (`publisherId`),
  CONSTRAINT `book_text` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publisher_text` FOREIGN KEY (`publisherId`) REFERENCES `ebookpublishers` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooks`
--

LOCK TABLES `ebooks` WRITE;
/*!40000 ALTER TABLE `ebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formats`
--

DROP TABLE IF EXISTS `formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formats` (
  `formatId` int(11) NOT NULL,
  `format` varchar(50) NOT NULL,
  PRIMARY KEY (`formatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formats`
--

LOCK TABLES `formats` WRITE;
/*!40000 ALTER TABLE `formats` DISABLE KEYS */;
INSERT INTO `formats` VALUES (1,'Kindle'),(2,'EPub'),(3,'MP3'),(4,'MP3'),(5,'WMA');
/*!40000 ALTER TABLE `formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genreinterests`
--

DROP TABLE IF EXISTS `genreinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genreinterests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genreId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_interest` (`genreId`),
  KEY `user_genre_interest` (`regUserId`),
  CONSTRAINT `genre_interest` FOREIGN KEY (`genreId`) REFERENCES `genres` (`genreId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_genre_interest` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genreinterests`
--

LOCK TABLES `genreinterests` WRITE;
/*!40000 ALTER TABLE `genreinterests` DISABLE KEYS */;
/*!40000 ALTER TABLE `genreinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(50) NOT NULL,
  PRIMARY KEY (`genreId`),
  UNIQUE KEY `genre` (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (5,'American Fiction'),(1,'Fiction'),(2,'Mystery & Crime'),(4,'Peoples & Cultures - Fiction'),(3,'Romance'),(6,'World Literature');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interestlevelinterests`
--

DROP TABLE IF EXISTS `interestlevelinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interestlevelinterests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interestLevelId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `interest_level_interest` (`interestLevelId`),
  KEY `user_intlevel_interest` (`regUserId`),
  CONSTRAINT `interest_level_interest` FOREIGN KEY (`interestLevelId`) REFERENCES `interestlevels` (`interestLevelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_intlevel_interest` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interestlevelinterests`
--

LOCK TABLES `interestlevelinterests` WRITE;
/*!40000 ALTER TABLE `interestlevelinterests` DISABLE KEYS */;
INSERT INTO `interestlevelinterests` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,1);
/*!40000 ALTER TABLE `interestlevelinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interestlevels`
--

DROP TABLE IF EXISTS `interestlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interestlevels` (
  `interestLevelId` int(11) NOT NULL,
  `interestLevel` varchar(50) NOT NULL,
  PRIMARY KEY (`interestLevelId`),
  UNIQUE KEY `interestLevel` (`interestLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interestlevels`
--

LOCK TABLES `interestlevels` WRITE;
/*!40000 ALTER TABLE `interestlevels` DISABLE KEYS */;
INSERT INTO `interestlevels` VALUES (1,'Adult'),(2,'High School'),(3,'Young Adults');
/*!40000 ALTER TABLE `interestlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languageinterests`
--

DROP TABLE IF EXISTS `languageinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languageinterests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languageId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_interest` (`languageId`),
  KEY `user_language_interest` (`regUserId`),
  CONSTRAINT `language_interest` FOREIGN KEY (`languageId`) REFERENCES `languages` (`languageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_language_interest` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languageinterests`
--

LOCK TABLES `languageinterests` WRITE;
/*!40000 ALTER TABLE `languageinterests` DISABLE KEYS */;
INSERT INTO `languageinterests` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `languageinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languageId` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English'),(2,'Spanish'),(3,'French'),(4,'Chinese');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logincreds`
--

DROP TABLE IF EXISTS `logincreds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logincreds` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT,
  `accountInfoId` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`loginId`),
  KEY `login_to_user_account` (`accountInfoId`),
  CONSTRAINT `login_to_user_account` FOREIGN KEY (`accountInfoId`) REFERENCES `accountinfo` (`accountInfoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logincreds`
--

LOCK TABLES `logincreds` WRITE;
/*!40000 ALTER TABLE `logincreds` DISABLE KEYS */;
INSERT INTO `logincreds` VALUES (1,1,'Test1','password'),(2,2,'Test2','password'),(3,3,'Test3','password');
/*!40000 ALTER TABLE `logincreds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastbookshelfaudiobooks`
--

DROP TABLE IF EXISTS `pastbookshelfaudiobooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastbookshelfaudiobooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `dateExpired` date NOT NULL,
  `bookRating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AudioBooks_user_past_books` (`regUserId`),
  KEY `AudioBooks_past_books` (`audioBookId`),
  CONSTRAINT `AudioBooks_past_books` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AudioBooks_user_past_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastbookshelfaudiobooks`
--

LOCK TABLES `pastbookshelfaudiobooks` WRITE;
/*!40000 ALTER TABLE `pastbookshelfaudiobooks` DISABLE KEYS */;
INSERT INTO `pastbookshelfaudiobooks` VALUES (1,4,1,'2015-09-09',NULL),(2,3,1,'2015-09-09',NULL),(3,2,1,'2015-09-09',4),(4,1,2,'2015-09-09',NULL);
/*!40000 ALTER TABLE `pastbookshelfaudiobooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastborrowedebooks`
--

DROP TABLE IF EXISTS `pastborrowedebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastborrowedebooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  `dateExpired` date NOT NULL,
  `bookRating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_past_books` (`regUserId`),
  KEY `ebook_past_books` (`eBookId`),
  CONSTRAINT `ebook_past_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_past_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastborrowedebooks`
--

LOCK TABLES `pastborrowedebooks` WRITE;
/*!40000 ALTER TABLE `pastborrowedebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastborrowedebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeredusers`
--

DROP TABLE IF EXISTS `registeredusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registeredusers` (
  `regUserId` int(11) NOT NULL AUTO_INCREMENT,
  `accountInfoId` int(11) NOT NULL,
  `libraryCard` varchar(50) NOT NULL,
  PRIMARY KEY (`regUserId`),
  KEY `user_account_info_map` (`accountInfoId`),
  CONSTRAINT `user_account_info_map` FOREIGN KEY (`accountInfoId`) REFERENCES `accountinfo` (`accountInfoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredusers`
--

LOCK TABLES `registeredusers` WRITE;
/*!40000 ALTER TABLE `registeredusers` DISABLE KEYS */;
INSERT INTO `registeredusers` VALUES (1,1,'1234567890'),(2,2,'0987654321');
/*!40000 ALTER TABLE `registeredusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlistaudiobooks`
--

DROP TABLE IF EXISTS `wishlistaudiobooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlistaudiobooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audioBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AudioBooks_user_wishlist_books` (`regUserId`),
  KEY `AudioBooks_wishlist_books` (`audioBookId`),
  CONSTRAINT `AudioBooks_user_wishlist_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AudioBooks_wishlist_books` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlistaudiobooks`
--

LOCK TABLES `wishlistaudiobooks` WRITE;
/*!40000 ALTER TABLE `wishlistaudiobooks` DISABLE KEYS */;
INSERT INTO `wishlistaudiobooks` VALUES (1,2,1),(2,1,1),(3,4,1),(4,3,2);
/*!40000 ALTER TABLE `wishlistaudiobooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlistebooks`
--

DROP TABLE IF EXISTS `wishlistebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlistebooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eBookId` int(11) NOT NULL,
  `regUserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wishlist_books` (`regUserId`),
  KEY `ebook_wishlist_books` (`eBookId`),
  CONSTRAINT `ebook_wishlist_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_wishlist_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlistebooks`
--

LOCK TABLES `wishlistebooks` WRITE;
/*!40000 ALTER TABLE `wishlistebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlistebooks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-25 11:42:10
