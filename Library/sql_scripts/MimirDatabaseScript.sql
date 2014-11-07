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
UNLOCK TABLES;

DROP TABLE IF EXISTS `RegisteredUsers`;
CREATE TABLE `RegisteredUsers` (
	`userId` INT NOT NULL AUTO_INCREMENT,
	`libraryCard` VARCHAR(50) NOT NULL,
    PRIMARY KEY (userId)
);

LOCK TABLES `RegisteredUsers` WRITE;
/*!40000 ALTER TABLE `RegisteredUsers` DISABLE KEYS */;
INSERT INTO `RegisteredUsers` VALUES (1, '1234567890'), (2, '0987654321'), (3, '5432109876');
/*!40000 ALTER TABLE `RegisteredUsers` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `LoginCreds`;
CREATE TABLE `LoginCreds` (
	`userId` INT NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (userId),
	CONSTRAINT `loginToUser` FOREIGN KEY (`userId`) REFERENCES `RegisteredUsers` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `LoginCreds` WRITE;
/*!40000 ALTER TABLE `LoginCreds` DISABLE KEYS */;
INSERT INTO `LoginCreds` VALUES (1, 'Test1', 'password'), (2, 'Test2', 'password'), (3, 'Test3', 'password');
/*!40000 ALTER TABLE `LoginCreds` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `AccountInfo`;
CREATE TABLE `AccountInfo` (
	`userId` INT NOT NULL, 
	`firstName` VARCHAR(50) NOT NULL,
	`lastName` VARCHAR(50) NOT NULL,
    PRIMARY KEY (userId),
	CONSTRAINT `userAcctDeterminedBy` FOREIGN KEY (`userId`) REFERENCES `RegisteredUsers` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `AccountInfo` WRITE;
/*!40000 ALTER TABLE `AccountInfo` DISABLE KEYS */;
INSERT INTO `AccountInfo` VALUES (1, 'Hodir', 'Smith'), (2, 'Odin', 'Johnson'), (3, 'Freya', 'Jones');
/*!40000 ALTER TABLE `AccountInfo` ENABLE KEYS */;
UNLOCK TABLES;


/***************************************************************/
/*BOOK INFORMATION */
/***************************************************************/


DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
	`authorId` INT NOT NULL AUTO_INCREMENT,
	`name` INT NOT NULL,
	`description` VARCHAR(50) NOT NULL,
    PRIMARY KEY (authorId)
);

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1, 'Stephen Hawking', 'Description would be here.'), (2, 'Lois Lowry', 'Description would go here.'), (3, 'George R.R. Martin', 'Description would go here.'), (4, 'J.K. Rowling', 'Description would go here.');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `AwardInfo`;
CREATE TABLE `AwardInfo` (
	`awardId` INT NOT NULL AUTO_INCREMENT,
	`title` INT NOT NULL,
	`description` VARCHAR(50) NOT NULL,
	`year`	VARCHAR(50),
    PRIMARY KEY (awardId)
);

LOCK TABLES `AwardInfo` WRITE;
/*!40000 ALTER TABLE `AwardInfo` DISABLE KEYS */;
INSERT INTO `AwardInfo` VALUES (1, 'Good Author Award', 'Description would be here.', '2014'), (2, 'Good Book Award', 'Description would be here.', '2014');
/*!40000 ALTER TABLE `AwardInfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `AuthorAwards`;
CREATE TABLE `AuthorAwards` (
	`awardId` INT NOT NULL,
	`authorId` INT NOT NULL,
    PRIMARY KEY (awardId, authorId),
	CONSTRAINT `awardToAward` FOREIGN KEY (`awardId`) REFERENCES `AwardInfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `authorToAuthor` FOREIGN KEY (`authorId`) REFERENCES `Authors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `AuthorAwards` WRITE;
/*!40000 ALTER TABLE `AuthorAwards` DISABLE KEYS */;
INSERT INTO `AuthorAwards` VALUES (1, 4);
/*!40000 ALTER TABLE `AuthorAwards` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
	`bookId` INT NOT NULL AUTO_INCREMENT,
	`authorId` INT NOT NULL,
	`isbn` VARCHAR(50) NOT NULL,
	`seriesName` VARCHAR(50),
    PRIMARY KEY (bookId),
	CONSTRAINT `bookToAuthor` FOREIGN KEY (`authorId`) REFERENCES `Authors` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1, 1, '9780553896923', null), (2, 2, '9780547345901', null), (3, 3, '9780739353370', 'A Song of Ice and Fire'), (4, 4, '9781781102527', 'Harry Potter');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookAwards`;
CREATE TABLE `BookAwards` (
	`awardId` INT NOT NULL,
	`bookId` INT NOT NULL,
    PRIMARY KEY (awardId, bookId),
	CONSTRAINT `bookawardToAward` FOREIGN KEY (`awardId`) REFERENCES `AwardInfo` (`awardId`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `bookToBook` FOREIGN KEY (`bookId`) REFERENCES `Books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookAwards` WRITE;
/*!40000 ALTER TABLE `BookAwards` DISABLE KEYS */;
INSERT INTO `BookAwards` VALUES (2, 4);
/*!40000 ALTER TABLE `BookAwards` ENABLE KEYS */;
UNLOCK TABLES;

/***************************************************************/
/*USER BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BookshelfBooks`;
CREATE TABLE `BookshelfBooks` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`bookId` INT NOT NULL, 
	`userId` INT NOT NULL,
	`dateExpires` DATE NOT NULL,
	`bookRating` DECIMAL,
    PRIMARY KEY (id),
	CONSTRAINT `userDeterminedBy` FOREIGN KEY (`userId`) REFERENCES `RegisteredUsers` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookshelfBooks` WRITE;
/*!40000 ALTER TABLE `BookshelfBooks` DISABLE KEYS */;
INSERT INTO `BookshelfBooks` VALUES (1, 1, 1, '2015-09-09', null), (2, 2, 1, '2015-09-09', null), (3, 3, 1, '2015-09-09', 4), (4, 4, 2, '2015-09-09', null);
/*!40000 ALTER TABLE `BookshelfBooks` ENABLE KEYS */;
UNLOCK TABLES;

/***************************************************************/
/*MORE BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BookDisplayInfo`;
CREATE TABLE `BookDisplayInfo` (
	`bookId` INT NOT NULL,
	`title` VARCHAR(50) NOT NULL, 
	`description` VARCHAR(300) NOT NULL,
	`dateAdded` DATE NOT NULL,
	`imageFilePath` VARCHAR(50) NOT NULL,
    PRIMARY KEY (bookId),
	CONSTRAINT `bookDisplayDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `Books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookDisplayInfo` WRITE;
/*!40000 ALTER TABLE `BookDisplayInfo` DISABLE KEYS */;
INSERT INTO `BookDisplayInfo` VALUES (1, 'A Brief History Of Time', 'Description.', '2015-11-07', '/resources/img/TestImg1.jpg'), 
									 (2, 'The Giver', 'Description.', '2015-11-07', '/resources/img/TestImg2.jpg'),
									 (3, 'Game Of Thrones', 'Description.', '2015-11-07', '/resources/img/TestImg3.jpg'),
									 (4, 'Harry Potter And The Sorcerers Stone', 'Description.', '2015-11-07', '/resources/img/TestImg4.jpg');
/*!40000 ALTER TABLE `BookDisplayInfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Genres`;
CREATE TABLE `Genres` (
	`genreId` INT NOT NULL AUTO_INCREMENT,
	`genre` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (genreId)
);

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (1, 'History'), (2, 'Science'), (3, 'Fiction'), (4, 'Sci-Fi'), (5, 'Fantasy'), (6, 'Violence');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookGenres`;
CREATE TABLE `BookGenres` (
	`bookId` INT NOT NULL,
	`genreId` INT NOT NULL, 
    PRIMARY KEY (bookId, genreId),
	CONSTRAINT `bookGenreDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `Books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `genreDeterminedBy` FOREIGN KEY (`genreId`) REFERENCES `Genres` (`genreId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookGenres` WRITE;
/*!40000 ALTER TABLE `BookGenres` DISABLE KEYS */;
INSERT INTO `BookGenres` VALUES (1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 5);
/*!40000 ALTER TABLE `BookGenres` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `InterestLevels`;
CREATE TABLE `InterestLevels` (
	`interestLevelId` INT NOT NULL,
	`interestLevel` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (interestLevelId)
);

LOCK TABLES `InterestLevels` WRITE;
/*!40000 ALTER TABLE `InterestLevels` DISABLE KEYS */;
INSERT INTO `InterestLevels` VALUES (1, 'Adult'), (2, 'High School'), (3, 'Young Adults');
/*!40000 ALTER TABLE `InterestLevels` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookInterestLevels`;
CREATE TABLE `BookInterestLevels` (
	`bookId` INT NOT NULL,
	`interestLevelId` INT NOT NULL,
    PRIMARY KEY (bookId, interestLevelId),
	CONSTRAINT `bookILDeterminedBy` FOREIGN KEY (`bookId`) REFERENCES `Books` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ILDeterminedBy` FOREIGN KEY (`interestLevelId`) REFERENCES `InterestLevels` (`interestLevelId`) ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookInterestLevels` WRITE;
/*!40000 ALTER TABLE `BookInterestLevels` DISABLE KEYS */;
INSERT INTO `BookInterestLevels` VALUES (1, 1), (2, 2), (3, 1), (4, 3);
/*!40000 ALTER TABLE `BookInterestLevels` ENABLE KEYS */;
UNLOCK TABLES;

