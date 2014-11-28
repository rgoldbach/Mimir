CREATE DATABASE  IF NOT EXISTS `mimir` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mimir`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mimir
-- ------------------------------------------------------
-- Server version	5.6.17

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
INSERT INTO `audiobookformats` VALUES (1,1,1,'2011-05-04',NULL,2,4002),(2,1,2,'2011-05-04',4210,3,4001),(3,2,1,'2011-05-05',NULL,4,4003),(4,2,2,'1993-04-26',1204,3,4004),(5,3,2,'2006-10-31',954419,4,4005),(6,4,2,'2012-03-29',237016,1,4006),(7,5,1,'2012-05-04',NULL,2,4007),(8,6,1,'2005-05-05',NULL,3,4008),(9,7,1,'2008-10-31',NULL,7,4009),(10,9,2,'2012-03-29',1324,3,4000),(11,10,2,'2012-03-29',1324,3,4000),(12,11,2,'2012-03-29',1324,3,4000),(13,12,2,'2012-03-29',1324,3,4000),(14,13,2,'2012-03-29',1324,3,4000),(15,14,2,'2012-03-29',1324,3,4000),(16,15,2,'2012-03-29',1324,3,4000),(17,16,2,'2012-03-29',1324,3,4000),(19,8,1,'2002-03-29',NULL,6,4009);
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
  CONSTRAINT `audioBookLicense_audioBook` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `audioBookHold_downloadSite` FOREIGN KEY (`downloadSiteId`) REFERENCES `downloadsites` (`downloadSiteId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobooklicenses`
--

LOCK TABLES `audiobooklicenses` WRITE;
/*!40000 ALTER TABLE `audiobooklicenses` DISABLE KEYS */;
INSERT INTO `audiobooklicenses` VALUES (1,1,1,5),(2,2,1,10),(3,3,1,15),(4,4,1,-1),(5,5,1,5),(6,6,1,10),(7,7,1,15),(8,8,1,-1);
/*!40000 ALTER TABLE `audiobooklicenses` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobookratings`
--

LOCK TABLES `audiobookratings` WRITE;
/*!40000 ALTER TABLE `audiobookratings` DISABLE KEYS */;
INSERT INTO `audiobookratings` VALUES (1,1,5,20),(2,2,4,15),(3,3,3,10),(4,4,5,20),(5,5,5,20),(6,6,4,15),(7,7,3,10),(8,8,5,20),(9,9,5,10),(10,10,5,10),(11,11,5,10),(12,12,5,10),(13,13,5,10),(14,14,5,10),(15,15,5,10),(16,16,5,10);
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
  `publisherId` int(11) NOT NULL,
  `remainingCopies` int(11) NOT NULL,
  PRIMARY KEY (`audioBookId`),
  UNIQUE KEY `bookId` (`bookId`),
  KEY `audioBook_Publisher` (`publisherId`),
  CONSTRAINT `audioBook_Publisher` FOREIGN KEY (`publisherId`) REFERENCES `publishers` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiobooks`
--

LOCK TABLES `audiobooks` WRITE;
/*!40000 ALTER TABLE `audiobooks` DISABLE KEYS */;
INSERT INTO `audiobooks` VALUES (1,1,1,4),(2,2,1,9),(3,3,1,14),(4,4,1,-1),(5,5,1,5),(6,6,1,10),(7,7,1,15),(8,8,1,-1),(9,9,1,10),(10,10,1,10),(11,11,1,10),(12,12,1,10),(13,13,1,10),(14,14,1,10),(15,15,1,10),(16,16,1,10);
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
  CONSTRAINT `awardToAward` FOREIGN KEY (`awardId`) REFERENCES `awardinfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authorToAuthor` FOREIGN KEY (`authorId`) REFERENCES `bauthors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorawards`
--

LOCK TABLES `authorawards` WRITE;
/*!40000 ALTER TABLE `authorawards` DISABLE KEYS */;
INSERT INTO `authorawards` VALUES (1,1,4);
/*!40000 ALTER TABLE `authorawards` ENABLE KEYS */;
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
  CONSTRAINT `author_book_map` FOREIGN KEY (`authorId`) REFERENCES `bauthors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_author_map` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_books`
--

LOCK TABLES `authors_books` WRITE;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
INSERT INTO `authors_books` VALUES (1,1),(2,2),(3,3),(4,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(5,5),(6,6),(7,7),(8,8);
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
-- Table structure for table `bauthors`
--

DROP TABLE IF EXISTS `bauthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bauthors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bauthors`
--

LOCK TABLES `bauthors` WRITE;
/*!40000 ALTER TABLE `bauthors` DISABLE KEYS */;
INSERT INTO `bauthors` VALUES (1,'Stephen Hawking','Description would be here.'),(2,'Lois Lowry','Description would go here.'),(3,'George R.R. Martin','Description would go here.'),(4,'J.K. Rowling','Description would go here.'),(5,'Gillian Flynn','Description would be here.'),(6,'John Green','Description would go here.'),(7,'Veronica Roth','Description would go here.'),(8,'James Patterson','Description would go here.');
/*!40000 ALTER TABLE `bauthors` ENABLE KEYS */;
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
  CONSTRAINT `bookawardToAward` FOREIGN KEY (`awardId`) REFERENCES `awardinfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookToBook` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookawards`
--

LOCK TABLES `bookawards` WRITE;
/*!40000 ALTER TABLE `bookawards` DISABLE KEYS */;
INSERT INTO `bookawards` VALUES (2,4);
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
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `dateAdded` date NOT NULL,
  `imageFilePath` varchar(50) NOT NULL,
  PRIMARY KEY (`bookDisplayId`),
  KEY `bookDisplayDeterminedBy` (`bookId`),
  CONSTRAINT `bookDisplayDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookdisplayinfo`
--

LOCK TABLES `bookdisplayinfo` WRITE;
/*!40000 ALTER TABLE `bookdisplayinfo` DISABLE KEYS */;
INSERT INTO `bookdisplayinfo` VALUES (1,1,'A Brief History Of Time','Description.','2015-11-07','resources/img/TestImg1.jpg'),(2,2,'The Giver','Description.','2015-11-07','resources/img/TestImg2.jpg'),(3,3,'Game Of Thrones','Description.','2015-11-07','resources/img/TestImg3.jpg'),(4,4,'Harry Potter And The Sorcerers Stone','Description.','2015-11-07','resources/img/TestImg4.jpg'),(5,5,'Gone Girl','Marriage can be a real killer. One of the most critically acclaimed suspense writers of our time, New York Times bestseller Gillianc','2015-11-07','resources/img/TestImg8.jpg'),(6,6,'The Fault In Our Stars','Despite the tumor-shrinking medical miracle that has bought her a few years,r Kid Support Group, Hs story is about to be compl','2015-11-07','resources/img/TestImg7.jpg'),(7,7,'Divergent','This first book in Veronica Roths #1 New York Times bestselling Divergent trilogy is the novel that inspired the major motion picture starring Shailene Woodley, Theo James, and Kate Winslet. This dystopian series set in a futuristic Chicago has captured the hearts of millions of teen and adult reade','2015-11-07','resources/img/TestImg9.jpg'),(8,8,'Unlucky 13','San Francisco Detective Lindsay Boxer is loving her life as a new mother. With an attentive husband, a job she loves, plus best friends who can talk about anything from sex to murder, things couldnt be better. Then the FBI sends Lindsay a photo of a killer from her past, and her happy world is shatt','2015-11-07','resources/img/TestAudioImg4.jpg'),(9,9,'1HARRY POTTER YOLO1','Doge is a slang term for “dog” that is primarily associated with pictures of Shiba Inus (nicknamed “Shibe”) and internal monologue captions on Tumblr. These photos may be photoshopped to change the dog’s face or captioned with interior monologues in Comic Sans font.','2015-11-07','resources/img/TestImg4.jpg'),(10,10,'2HARRY POTTER YOLO1','Barack Hussein Obama II (US there, we two. and i said, \'how i wish we had something to do!\' too wet to go out 61) is the 44th and currnd Harvard Law School, where het the University of Chicago Law School fro','2015-11-07','resources/img/TestImg4.jpg'),(11,11,'aHARRY POTTER YOLO2','But as amazing as that was, I couldn’t help but recreate this at home. I was a bit skeptical because I was unsure if the homemade version could actually top the original but surely enough, it tasted a millio','2015-11-07','resources/img/TestImg4.jpg'),(12,12,'bHARRY POTTER YOLO3','the sun did not shine. it was too wet to play. so we sat in the house all that cold, cold, wet day. i sat there with sally. we sat there, we two. and i said, \'how i wish we had something to do!\' too wet to go out and too cold to play ball. so we sat in the house. we did nothing at all. s','2015-11-07','resources/img/TestImg4.jpg'),(13,13,'cHARRY POTTER YOLO4','and then something went BUMP! how thae should not be about. he should not be here when your mother is out!\' \'nothere, we two. and i said, \'how i wish we had something to do!\' too wet to go out w! now! have no fear. a fish!\'','2015-11-07','resources/img/TestImg4.jpg'),(14,14,'xHARRY POTTER YOLO5','\'put me down!\' said the fish. \'this is no fun at all! put me down!\' said the fish. \'i do NOT wishn hold up these books! and the fish on a rake! i cn! and look! with my tail i can hold a red fan! i can fan with the fan as i hop on the ball! but that is not all. oh, no. that is not all...\'','2015-11-07','resources/img/TestImg4.jpg'),(15,15,'yHARRY POTTER YOLO6','that is what the cat said... then he fell on his head! he came down with a bump from up there on the ball. and sally and i, we saw ALL the things fall! and our fisha hook. \'now look','2015-11-07','resources/img/TestImg4.jpg'),(16,16,'zHARRY POTTER YOLO7','then he got up on top with a tip of his hat. \'i call this game fun-in-a-boy have come here to play. they will give you some fun on this wet, wet, wet day.\'there, we two. and i said, \'how i wish we had something to do!\' too wet to go out ','2015-11-07','resources/img/TestImg4.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookgenres`
--

LOCK TABLES `bookgenres` WRITE;
/*!40000 ALTER TABLE `bookgenres` DISABLE KEYS */;
INSERT INTO `bookgenres` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,3,6),(7,4,5),(8,5,7),(9,6,8),(10,7,9),(11,8,10),(12,9,5),(13,10,5),(14,11,5),(15,12,5),(16,13,5),(17,14,5),(18,15,5),(19,16,5);
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
  CONSTRAINT `bookILDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ILDeterminedBy` FOREIGN KEY (`interestLevelId`) REFERENCES `interestlevels` (`interestLevelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinterestlevels`
--

LOCK TABLES `bookinterestlevels` WRITE;
/*!40000 ALTER TABLE `bookinterestlevels` DISABLE KEYS */;
INSERT INTO `bookinterestlevels` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,3),(5,5,1),(6,6,2),(7,7,3),(8,8,1),(9,9,3),(10,10,3),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,3),(16,16,3);
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
  `seriesName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'9780553896923',NULL),(2,'9780547345901',NULL),(3,'9780739353370','A Song of Ice and Fire'),(4,'9781781102527','Harry Potter'),(5,'9781299008069',NULL),(6,'9780307588364',NULL),(7,'9781410450951',NULL),(8,'9780297859390',NULL),(9,'9780297859391','Harry Potter'),(10,'9780297859392','Harry Potter'),(11,'9780297859393','Harry Potter'),(12,'9780297859394','Harry Potter'),(13,'9780297859395','Harry Potter'),(14,'9780297859396','Harry Potter'),(15,'9780297859397','Harry Potter'),(16,'9780297859398','Harry Potter');
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
  `audioBookKey` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AudioBooks_user_current_books` (`regUserId`),
  KEY `AudioBooks_current_books` (`audioBookId`),
  CONSTRAINT `AudioBooks_user_current_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AudioBooks_current_books` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedaudiobooks`
--

LOCK TABLES `borrowedaudiobooks` WRITE;
/*!40000 ALTER TABLE `borrowedaudiobooks` DISABLE KEYS */;
INSERT INTO `borrowedaudiobooks` VALUES (1,1,1,'2015-09-09',NULL,'b0b98b0a-88e8-48cb-9b76-cfb2861de666'),(2,2,1,'2015-09-09',NULL,'239630d0-c87d-4ee5-b6b1-9fbf53c049dc'),(3,3,1,'2015-09-09',4,'156e26d9-23dc-4a87-b533-36ff06350996'),(4,4,2,'2015-09-09',NULL,'c263603e-b815-435e-8a4f-a1df16db755e');
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
  `eBookKey` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_current_books` (`regUserId`),
  KEY `ebook_current_books` (`eBookId`),
  CONSTRAINT `user_current_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ebook_current_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedebooks`
--

LOCK TABLES `borrowedebooks` WRITE;
/*!40000 ALTER TABLE `borrowedebooks` DISABLE KEYS */;
INSERT INTO `borrowedebooks` VALUES (1,1,1,'2015-09-09',NULL,'285323a6-8cac-4b3d-9e2d-4f5db06b960c'),(2,2,1,'2015-09-09',NULL,'7ed4070e-c57c-433e-9997-46b8d9a65327'),(3,3,1,'2015-09-09',4,'9f0fdde7-32f2-41e9-89d3-e6cdb172b777'),(4,4,2,'2015-09-09',NULL,'9bb70be6-fbeb-492c-98bf-7620a738ed24');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookformats`
--

LOCK TABLES `ebookformats` WRITE;
/*!40000 ALTER TABLE `ebookformats` DISABLE KEYS */;
INSERT INTO `ebookformats` VALUES (1,1,1,'2011-05-04',NULL),(2,1,2,'2011-05-04',4210),(3,2,1,'2011-05-05',NULL),(4,2,2,'1993-04-26',1204),(5,3,2,'2006-10-31',954419),(6,4,2,'2012-03-29',237016),(7,5,1,'2012-05-04',NULL),(8,6,1,'2005-05-05',NULL),(9,7,1,'2008-10-31',NULL),(10,8,1,'2002-03-29',NULL),(11,9,2,'1991-04-26',1000),(12,10,2,'1992-04-26',1000),(13,11,2,'1993-04-26',1000),(14,12,2,'1994-04-26',1000),(15,13,2,'1995-04-26',1000),(16,14,2,'1996-04-26',1000),(17,15,2,'1997-04-26',1000),(18,16,2,'1998-04-26',1000);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookholds`
--

LOCK TABLES `ebookholds` WRITE;
/*!40000 ALTER TABLE `ebookholds` DISABLE KEYS */;
INSERT INTO `ebookholds` VALUES (1,3,2,2),(2,3,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooklanguages`
--

LOCK TABLES `ebooklanguages` WRITE;
/*!40000 ALTER TABLE `ebooklanguages` DISABLE KEYS */;
INSERT INTO `ebooklanguages` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,1),(6,3,2),(7,3,3),(8,4,1),(9,5,1),(10,6,1),(11,7,1),(12,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooklicenses`
--

LOCK TABLES `ebooklicenses` WRITE;
/*!40000 ALTER TABLE `ebooklicenses` DISABLE KEYS */;
INSERT INTO `ebooklicenses` VALUES (1,1,1,5),(2,2,1,10),(3,3,1,15),(4,4,1,-1),(5,5,1,5),(6,6,1,10),(7,7,1,15),(8,8,1,-1);
/*!40000 ALTER TABLE `ebooklicenses` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebookratings`
--

LOCK TABLES `ebookratings` WRITE;
/*!40000 ALTER TABLE `ebookratings` DISABLE KEYS */;
INSERT INTO `ebookratings` VALUES (1,1,5,20),(2,2,4,15),(3,3,3,10),(4,4,5,20),(5,5,5,20),(6,6,4,15),(7,7,3,10),(8,8,5,20),(9,9,5,20),(10,10,5,20),(11,11,5,20),(12,12,5,20),(13,13,5,20),(14,14,5,20),(15,15,5,20),(16,16,5,20);
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
  `remainingCopies` int(11) NOT NULL,
  PRIMARY KEY (`eBookId`),
  KEY `book_text` (`bookId`),
  KEY `publisher_text` (`publisherId`),
  CONSTRAINT `book_text` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publisher_text` FOREIGN KEY (`publisherId`) REFERENCES `publishers` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooks`
--

LOCK TABLES `ebooks` WRITE;
/*!40000 ALTER TABLE `ebooks` DISABLE KEYS */;
INSERT INTO `ebooks` VALUES (1,1,1,4),(2,2,2,9),(3,3,3,14),(4,4,4,-1),(5,5,3,5),(6,6,3,10),(7,7,3,15),(8,8,3,-1),(9,9,4,10),(10,10,4,10),(11,11,4,10),(12,12,4,10),(13,13,4,10),(14,14,4,10),(15,15,4,10),(16,16,4,10);
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
INSERT INTO `genreinterests` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (9,'Action'),(10,'Comedy'),(5,'Fantasy'),(3,'Fiction'),(1,'History'),(7,'Mystery'),(8,'Romance'),(4,'Sci-Fi'),(2,'Science'),(6,'Violence');
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
-- Table structure for table `llamazonbooks`
--

DROP TABLE IF EXISTS `llamazonbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llamazonbooks` (
  `llamazonBookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `bookImage` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  PRIMARY KEY (`llamazonBookId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llamazonbooks`
--

LOCK TABLES `llamazonbooks` WRITE;
/*!40000 ALTER TABLE `llamazonbooks` DISABLE KEYS */;
INSERT INTO `llamazonbooks` VALUES (1,'Test Book One','Description','imagePath','author'),(2,'Test Book Two','Description','imagePath','author'),(3,'Test Book Three','Description','imagePath','author'),(4,'Test Book Four','Description','imagePath','author'),(5,'Test Book One','Description','imagePath','author'),(6,'Test Book Two','Description','imagePath','author'),(7,'Test Book Three','Description','imagePath','author'),(8,'Test Book Four','Description','imagePath','author');
/*!40000 ALTER TABLE `llamazonbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llamazonbookstousers`
--

DROP TABLE IF EXISTS `llamazonbookstousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llamazonbookstousers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `llamazonBookId` int(11) NOT NULL,
  `bookKey` varchar(90) NOT NULL,
  `userCode` varchar(90) NOT NULL,
  `bookFormat` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookKey` (`bookKey`),
  KEY `llamazonbookiduser_llamazonbook` (`llamazonBookId`),
  CONSTRAINT `llamazonbookiduser_llamazonbook` FOREIGN KEY (`llamazonBookId`) REFERENCES `llamazonbooks` (`llamazonBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llamazonbookstousers`
--

LOCK TABLES `llamazonbookstousers` WRITE;
/*!40000 ALTER TABLE `llamazonbookstousers` DISABLE KEYS */;
/*!40000 ALTER TABLE `llamazonbookstousers` ENABLE KEYS */;
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
  CONSTRAINT `AudioBooks_user_past_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AudioBooks_past_books` FOREIGN KEY (`audioBookId`) REFERENCES `audiobooks` (`audioBookId`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `user_past_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ebook_past_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastborrowedebooks`
--

LOCK TABLES `pastborrowedebooks` WRITE;
/*!40000 ALTER TABLE `pastborrowedebooks` DISABLE KEYS */;
INSERT INTO `pastborrowedebooks` VALUES (1,4,1,'2015-09-09',NULL),(2,3,1,'2015-09-09',NULL),(3,2,1,'2015-09-09',4),(4,1,2,'2015-09-09',NULL);
/*!40000 ALTER TABLE `pastborrowedebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `information` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Random House Publishing Group',NULL),(2,'Houghton Mifflin Harcourt',NULL),(3,'Publisher 3',NULL),(4,'Mimir Books',NULL);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
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
  `userCode` varchar(50) NOT NULL,
  PRIMARY KEY (`regUserId`),
  UNIQUE KEY `userCode` (`userCode`),
  KEY `user_account_info_map` (`accountInfoId`),
  CONSTRAINT `user_account_info_map` FOREIGN KEY (`accountInfoId`) REFERENCES `accountinfo` (`accountInfoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredusers`
--

LOCK TABLES `registeredusers` WRITE;
/*!40000 ALTER TABLE `registeredusers` DISABLE KEYS */;
INSERT INTO `registeredusers` VALUES (1,1,'1234567890','037ef4c1-7ed9-4c06-8a43-366d56f948d4'),(2,2,'0987654321','14fddd55-c887-476b-a727-2ea716d02b13');
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
  CONSTRAINT `user_wishlist_books` FOREIGN KEY (`regUserId`) REFERENCES `registeredusers` (`regUserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ebook_wishlist_books` FOREIGN KEY (`eBookId`) REFERENCES `ebooks` (`eBookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlistebooks`
--

LOCK TABLES `wishlistebooks` WRITE;
/*!40000 ALTER TABLE `wishlistebooks` DISABLE KEYS */;
INSERT INTO `wishlistebooks` VALUES (1,2,1),(2,1,1),(3,4,1),(4,3,2);
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

-- Dump completed on 2014-11-28  0:32:32
