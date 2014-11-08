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
	`loginId` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (loginId),
    CONSTRAINT `loginToUser` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `LoginCreds` WRITE;
/*!40000 ALTER TABLE `LoginCreds` DISABLE KEYS */;
INSERT INTO `LoginCreds` VALUES (1, 1, 'Test1', 'password'), (2, 2, 'Test2', 'password'), (3, 3, 'Test3', 'password');
/*!40000 ALTER TABLE `LoginCreds` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `UserAccountInfo`;
CREATE TABLE `UserAccountInfo` (
	`accountInfoId` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    PRIMARY KEY (accountInfoId),
    CONSTRAINT `user_account_info` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `UserAccountInfo` WRITE;
/*!40000 ALTER TABLE `UserAccountInfo` DISABLE KEYS */;
INSERT INTO `UserAccountInfo` VALUES (1, 1, 'Hodir', 'Smith'), (2, 2, 'Odin', 'Johnson'), (3, 3, 'Freya', 'Jones');
/*!40000 ALTER TABLE `UserAccountInfo` ENABLE KEYS */;
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
    `year` VARCHAR(4),
    PRIMARY KEY (awardId)
);

LOCK TABLES `AwardInfo` WRITE;
/*!40000 ALTER TABLE `AwardInfo` DISABLE KEYS */;
INSERT INTO `AwardInfo` VALUES (1, 'Good Author Award', 'Description would be here.', '2014'), (2, 'Good Book Award', 'Description would be here.', '2014');
/*!40000 ALTER TABLE `AwardInfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `AuthorAwards`;
CREATE TABLE `AuthorAwards` (
	`authorAwardId` INT NOT NULL AUTO_INCREMENT,
    `awardId` INT NOT NULL,
    `authorId` INT NOT NULL,
    PRIMARY KEY (authorAwardId),
    CONSTRAINT `awardToAward` FOREIGN KEY (`awardId`)
        REFERENCES `AwardInfo` (`awardId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `authorToAuthor` FOREIGN KEY (`authorId`)
        REFERENCES `Authors` (`authorId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `AuthorAwards` WRITE;
/*!40000 ALTER TABLE `AuthorAwards` DISABLE KEYS */;
INSERT INTO `AuthorAwards` VALUES (1, 1, 4);
/*!40000 ALTER TABLE `AuthorAwards` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
    `bookId` INT NOT NULL AUTO_INCREMENT,
    `authorId` INT NOT NULL,
    `isbn` VARCHAR(50) NOT NULL,
    `seriesName` VARCHAR(50),
    PRIMARY KEY (bookId),
    CONSTRAINT `bookToAuthor` FOREIGN KEY (`authorId`)
        REFERENCES `Authors` (`authorId`)
        ON DELETE CASCADE ON UPDATE CASCADE
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
    PRIMARY KEY (awardId , bookId),
    CONSTRAINT `bookawardToAward` FOREIGN KEY (`awardId`)
        REFERENCES `AwardInfo` (`awardId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `bookToBook` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookAwards` WRITE;
/*!40000 ALTER TABLE `BookAwards` DISABLE KEYS */;
INSERT INTO `BookAwards` VALUES (2, 4);
/*!40000 ALTER TABLE `BookAwards` ENABLE KEYS */;
UNLOCK TABLES;

/***************************************************************/
/*USER BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BorrowedBooks`;
CREATE TABLE `BorrowedBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `userId` INT NOT NULL,
    `dateExpires` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_current_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_current_books` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BorrowedBooks` WRITE;
/*!40000 ALTER TABLE `BorrowedBooks` DISABLE KEYS */;
INSERT INTO `BorrowedBooks` VALUES (1, 1, 1, '2015-09-09', null), (2, 2, 1, '2015-09-09', null), (3, 3, 1, '2015-09-09', 4), (4, 4, 2, '2015-09-09', null);
/*!40000 ALTER TABLE `BorrowedBooks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PastBookshelfBooks`;
CREATE TABLE `PastBookshelfBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `userId` INT NOT NULL,
    `dateExpired` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_past_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_past_books` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `PastBookshelfBooks` WRITE;
/*!40000 ALTER TABLE `PastBookshelfBooks` DISABLE KEYS */;
INSERT INTO `PastBookshelfBooks` VALUES (1, 4, 1, '2015-09-09', null), (2, 3, 1, '2015-09-09', null), (3, 2, 1, '2015-09-09', 4), (4, 1, 2, '2015-09-09', null);
/*!40000 ALTER TABLE `PastBookshelfBooks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `OnHoldBooks`;
CREATE TABLE `OnHoldBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_hold_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_hold_books` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `OnHoldBooks` WRITE;
/*!40000 ALTER TABLE `OnHoldBooks` DISABLE KEYS */;
INSERT INTO `OnHoldBooks` VALUES (1, 3, 1), (2, 4, 1), (3, 1, 1), (4, 2, 2);
/*!40000 ALTER TABLE `OnHoldBooks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `WishlistBooks`;
CREATE TABLE `WishlistBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_wishlist_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_wishlist_books` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `WishlistBooks` WRITE;
/*!40000 ALTER TABLE `WishlistBooks` DISABLE KEYS */;
INSERT INTO `WishlistBooks` VALUES (1, 2, 1), (2, 1, 1), (3, 4, 1), (4, 3, 2);
/*!40000 ALTER TABLE `WishlistBooks` ENABLE KEYS */;
UNLOCK TABLES;

/***************************************************************/
/*MORE BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BookDisplayInfo`;
CREATE TABLE `BookDisplayInfo` (
	`bookDisplayId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(300) NOT NULL,
    `dateAdded` DATE NOT NULL,
    `imageFilePath` VARCHAR(50) NOT NULL,
    PRIMARY KEY (bookDisplayId),
    CONSTRAINT `bookDisplayDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookDisplayInfo` WRITE;
/*!40000 ALTER TABLE `BookDisplayInfo` DISABLE KEYS */;
INSERT INTO `BookDisplayInfo` VALUES (1, 1, 'A Brief History Of Time', 'Description.', '2015-11-07', '/resources/img/TestImg1.jpg'), 
									 (2, 2, 'The Giver', 'Description.', '2015-11-07', '/resources/img/TestImg2.jpg'),
									 (3, 3, 'Game Of Thrones', 'Description.', '2015-11-07', '/resources/img/TestImg3.jpg'),
									 (4, 4, 'Harry Potter And The Sorcerers Stone', 'Description.', '2015-11-07', '/resources/img/TestImg4.jpg');
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

DROP TABLE IF EXISTS `GenreInterests`;
CREATE TABLE `GenreInterests` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `genreId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `genre_interest` FOREIGN KEY (`genreId`)
        REFERENCES `Genres` (`genreId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_genre_interest` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `GenreInterests` WRITE;
/*!40000 ALTER TABLE `GenreInterests` DISABLE KEYS */;
INSERT INTO `GenreInterests` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4);
/*!40000 ALTER TABLE `GenreInterests` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookGenres`;
CREATE TABLE `BookGenres` (
    `bookId` INT NOT NULL,
    `genreId` INT NOT NULL,
    PRIMARY KEY (bookId , genreId),
    CONSTRAINT `bookGenreDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `genreDeterminedBy` FOREIGN KEY (`genreId`)
        REFERENCES `Genres` (`genreId`)
        ON DELETE CASCADE ON UPDATE CASCADE
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

DROP TABLE IF EXISTS `InterestLevelInterests`;
CREATE TABLE `InterestLevelInterests` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `interestLevelId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `interest_level_interest` FOREIGN KEY (`interestLevelId`)
        REFERENCES `InterestLevels` (`interestLevelId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_intlevel_interest` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `InterestLevelInterests` WRITE;
/*!40000 ALTER TABLE `InterestLevelInterests` DISABLE KEYS */;
INSERT INTO `InterestLevelInterests` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 1);
/*!40000 ALTER TABLE `InterestLevelInterests` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookInterestLevels`;
CREATE TABLE `BookInterestLevels` (
    `bookId` INT NOT NULL,
    `interestLevelId` INT NOT NULL,
    PRIMARY KEY (bookId , interestLevelId),
    CONSTRAINT `bookILDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ILDeterminedBy` FOREIGN KEY (`interestLevelId`)
        REFERENCES `InterestLevels` (`interestLevelId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookInterestLevels` WRITE;
/*!40000 ALTER TABLE `BookInterestLevels` DISABLE KEYS */;
INSERT INTO `BookInterestLevels` VALUES (1, 1), (2, 2), (3, 1), (4, 3);
/*!40000 ALTER TABLE `BookInterestLevels` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextPublishers`;
CREATE TABLE `BookTextPublishers` (
    `publisherId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
	`information` VARCHAR(300),
    PRIMARY KEY (publisherId)
);

LOCK TABLES `BookTextPublishers` WRITE;
/*!40000 ALTER TABLE `BookTextPublishers` DISABLE KEYS */;
INSERT INTO `BookTextPublishers` VALUES (1, 'Random House Publishing Group', null), (2, 'Houghton Mifflin Harcourt', null), (3, 'Publisher 3', null), (4, 'Mimir Books', null);
/*!40000 ALTER TABLE `BookTextPublishers` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextFormats`;
CREATE TABLE `BookTextFormats` (
	`bookTextFormatId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `publisherId` INT NOT NULL,
    PRIMARY KEY (bookTextFormatId),
    CONSTRAINT `book_text` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `publisher_text` FOREIGN KEY (`publisherId`)
        REFERENCES `BookTextPublishers` (`publisherId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookTextFormats` WRITE;
/*!40000 ALTER TABLE `BookTextFormats` DISABLE KEYS */;
INSERT INTO `BookTextFormats` VALUES (1, 1, 1), 
								 (2, 2, 2), 
								 (3, 3, 3),
								 (4, 4, 4);
/*!40000 ALTER TABLE `BookTextFormats` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Formats`;
CREATE TABLE `Formats` (
    `formatId` INT NOT NULL,
    `format` VARCHAR(50) NOT NULL,
    PRIMARY KEY (formatId)
);

LOCK TABLES `Formats` WRITE;
/*!40000 ALTER TABLE `Formats` DISABLE KEYS */;
INSERT INTO `Formats` VALUES (1, 'Kindle'), 
						     (2, 'EPub'), 
							 (3, 'MP3');
/*!40000 ALTER TABLE `Formats` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `TextFormats`;
CREATE TABLE `TextFormats` (
    `textFormatId` INT NOT NULL AUTO_INCREMENT,
	`bookId` INT NOT NULL,
    `formatId` INT NOT NULL,
    `releaseDate` DATE,
    `fileSize` VARCHAR(50),
    PRIMARY KEY (textFormatId),
    CONSTRAINT `bookTextFormatDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `BookTextFormats` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `textFormatDeterminedBy` FOREIGN KEY (`formatId`)
        REFERENCES `Formats` (`formatId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `TextFormats` WRITE;
/*!40000 ALTER TABLE `TextFormats` DISABLE KEYS */;
INSERT INTO `TextFormats` VALUES (1, 1, 1, '2011-05-04', null), (2, 1, 2, '2011-05-04', '4210 KB'),
								 (3, 2, 1, '2011-05-05', null), (4, 2, 2, '1993-04-26', '1204 KB'),
								 (5, 3, 2, '2006-10-31', '954419 KB'),
								 (6, 4, 2, '2012-03-29', '237016 KB');
/*!40000 ALTER TABLE `TextFormats` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
    `languageId` INT NOT NULL AUTO_INCREMENT,
    `language` VARCHAR(100) NOT NULL,
    PRIMARY KEY (languageId)
);

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (1, 'English'), (2, 'Spanish'), (3, 'French'), (4, 'Chinese');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `LanguageInterests`;
CREATE TABLE `LanguageInterests` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `languageId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `language_interest` FOREIGN KEY (`languageId`)
        REFERENCES `Languages` (`languageId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_language_interest` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `LanguageInterests` WRITE;
/*!40000 ALTER TABLE `LanguageInterests` DISABLE KEYS */;
INSERT INTO `LanguageInterests` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4);
/*!40000 ALTER TABLE `LanguageInterests` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextLanguages`;
CREATE TABLE `BookTextLanguages` (
    `bookId` INT NOT NULL,
    `languageId` INT NOT NULL,
    PRIMARY KEY (bookId, languageId),
    CONSTRAINT `book_language_text` FOREIGN KEY (`bookId`)
        REFERENCES `BookTextFormats` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `language_determined` FOREIGN KEY (`languageId`)
        REFERENCES `Languages` (`languageId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookTextLanguages` WRITE;
/*!40000 ALTER TABLE `BookTextLanguages` DISABLE KEYS */;
INSERT INTO `BookTextLanguages` VALUES (1, 1), (1,2),
								   (2, 1), (2, 3),
								   (3, 1), (3, 2), (3, 3),
								   (4, 1);
/*!40000 ALTER TABLE `BookTextLanguages` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextRatings`;
CREATE TABLE `BookTextRatings` (
	`bookRatingId` INT NOT NULL AUTO_INCREMENT,
    `bookTextFormatId` INT NOT NULL,
    `numberOfRatings` INT NOT NULL,
	`sumOfRatings` DECIMAL NOT NULL,
    PRIMARY KEY (bookRatingId),
    CONSTRAINT `bookFormatRatingDeterminedBy` FOREIGN KEY (`bookTextFormatId`)
        REFERENCES `BookTextFormats` (`bookTextFormatId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookTextRatings` WRITE;
/*!40000 ALTER TABLE `BookTextRatings` DISABLE KEYS */;
INSERT INTO `BookTextRatings` VALUES (1, 1, 5, 20),
								     (2, 2, 4, 15), 
							 	     (3, 3, 3, 10), 
								     (4, 4, 5, 20);
/*!40000 ALTER TABLE `BookTextRatings` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextHolds`;
CREATE TABLE `BookTextHolds` (
    `bookId` INT NOT NULL,
    `userId` INT NOT NULL,
	`positionInQueue` INT NOT NULL,
    PRIMARY KEY (bookId, userId),
    CONSTRAINT `bookFormatHoldDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `BookTextFormats` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `userHoldDeterminedBy` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookTextHolds` WRITE;
/*!40000 ALTER TABLE `BookTextHolds` DISABLE KEYS */;
INSERT INTO `BookTextHolds` VALUES   (1, 5, 20),
								   (2, 4, 15), 
								   (3, 3, 10), 
								   (4, 5, 20),
								   (5, 2, 10),
								   (6, 1, 4);
/*!40000 ALTER TABLE `BookTextHolds` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `DownloadSites`;
CREATE TABLE `DownloadSites` (
    `downloadSiteId` INT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
	`baseUrl` VARCHAR(100) NOT NULL,
	`downloadUrl` VARCHAR(100) NOT NULL,
	`bookKeyUrl` VARCHAR(100) NOT NULL,
	`publicKey` VARCHAR(100) NOT NULL,
    PRIMARY KEY (downloadSiteId)
);

LOCK TABLES `DownloadSites` WRITE;
/*!40000 ALTER TABLE `DownloadSites` DISABLE KEYS */;
INSERT INTO `DownloadSites` VALUES   (1, 'Lamazon', 'Not_Implemented_Yet', 'Not_Implemented_Yet', 'Not_Implemented_Yet', 'Not_Implemented_Yet');
/*!40000 ALTER TABLE `DownloadSites` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookTextLicenses`;
CREATE TABLE `BookTextLicenses` (
    `textLicenseId` INT NOT NULL AUTO_INCREMENT,
	`bookId` INT NOT NULL,
    `downloadSiteId` INT NOT NULL,
	`availableCopies` INT NOT NULL,
    PRIMARY KEY (textLicenseId),
    CONSTRAINT `book_download_text` FOREIGN KEY (`bookId`)
        REFERENCES `BookTextFormats` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `downloadSite_text_determined` FOREIGN KEY (`downloadSiteId`)
        REFERENCES `DownloadSites` (`downloadSiteId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookTextLicenses` WRITE;
/*!40000 ALTER TABLE `BookTextLicenses` DISABLE KEYS */;
INSERT INTO `BookTextLicenses` VALUES   (1, 1, 1, 5),
										(2, 2, 1, 10), 
										(3, 3, 1, 15), 
										(4, 4, 1, -1);
/*!40000 ALTER TABLE `BookTextLicenses` ENABLE KEYS */;
UNLOCK TABLES;



