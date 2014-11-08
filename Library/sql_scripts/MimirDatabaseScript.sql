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
/*Old USER BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BorrowedBooks`;

DROP TABLE IF EXISTS `PastBookshelfBooks`;

DROP TABLE IF EXISTS `OnHoldBooks`;

DROP TABLE IF EXISTS `WishlistBooks`;


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

DROP TABLE IF EXISTS `EBookPublishers`;
CREATE TABLE `EBookPublishers` (
    `publisherId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
	`information` VARCHAR(300),
    PRIMARY KEY (publisherId)
);

LOCK TABLES `EBookPublishers` WRITE;
/*!40000 ALTER TABLE `EBookPublishers` DISABLE KEYS */;
INSERT INTO `EBookPublishers` VALUES (1, 'Random House Publishing Group', null), (2, 'Houghton Mifflin Harcourt', null), (3, 'Publisher 3', null), (4, 'Mimir Books', null);
/*!40000 ALTER TABLE `EBookPublishers` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookEBookFormats`;
DROP TABLE IF EXISTS `EBooks`;
CREATE TABLE `EBooks` (
	`eBookId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `publisherId` INT NOT NULL,
    PRIMARY KEY (eBookId),
    CONSTRAINT `book_text` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `publisher_text` FOREIGN KEY (`publisherId`)
        REFERENCES `EBookPublishers` (`publisherId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBooks` WRITE;
/*!40000 ALTER TABLE `EBooks` DISABLE KEYS */;
INSERT INTO `EBooks` VALUES (1, 1, 1), 
								 (2, 2, 2), 
								 (3, 3, 3),
								 (4, 4, 4);
/*!40000 ALTER TABLE `EBooks` ENABLE KEYS */;
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

DROP TABLE IF EXISTS `EBookFormats`;
CREATE TABLE `EBookFormats` (
    `ebookFormatId` INT NOT NULL AUTO_INCREMENT,
	`eBookId` INT NOT NULL,
    `formatId` INT NOT NULL,
    `releaseDate` DATE,
    `fileSize` VARCHAR(50),
    PRIMARY KEY (ebookFormatId),
    CONSTRAINT `ebook_format_type` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `format_type` FOREIGN KEY (`formatId`)
        REFERENCES `Formats` (`formatId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBookFormats` WRITE;
/*!40000 ALTER TABLE `EBookFormats` DISABLE KEYS */;
INSERT INTO `EBookFormats` VALUES (1, 1, 1, '2011-05-04', null), (2, 1, 2, '2011-05-04', '4210 KB'),
								 (3, 2, 1, '2011-05-05', null), (4, 2, 2, '1993-04-26', '1204 KB'),
								 (5, 3, 2, '2006-10-31', '954419 KB'),
								 (6, 4, 2, '2012-03-29', '237016 KB');
/*!40000 ALTER TABLE `EBookFormats` ENABLE KEYS */;
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

DROP TABLE IF EXISTS `EBookLanguages`;
CREATE TABLE `EBookLanguages` (
	`eBookLanguageId` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `languageId` INT NOT NULL,
    PRIMARY KEY (eBookLanguageId),
    CONSTRAINT `book_language_text` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `language_determined` FOREIGN KEY (`languageId`)
        REFERENCES `Languages` (`languageId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBookLanguages` WRITE;
/*!40000 ALTER TABLE `EBookLanguages` DISABLE KEYS */;
INSERT INTO `EBookLanguages` VALUES (1, 1, 1), (2, 1,2),
								   (3, 2, 1), (4, 2, 3),
								   (5, 3, 1), (6, 3, 2), (7, 3, 3),
								   (8, 4, 1);
/*!40000 ALTER TABLE `EBookLanguages` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `EBookRatings`;
CREATE TABLE `EBookRatings` (
	`bookRatingId` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `numberOfRatings` INT NOT NULL,
	`sumOfRatings` DECIMAL NOT NULL,
    PRIMARY KEY (bookRatingId),
    CONSTRAINT `bookFormatRatingDeterminedBy` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBookRatings` WRITE;
/*!40000 ALTER TABLE `EBookRatings` DISABLE KEYS */;
INSERT INTO `EBookRatings` VALUES (1, 1, 5, 20),
								     (2, 2, 4, 15), 
							 	     (3, 3, 3, 10), 
								     (4, 4, 5, 20);
/*!40000 ALTER TABLE `EBookRatings` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `EBookHolds`;
CREATE TABLE `EBookHolds` (
	`eBookOnHoldId` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `userId` INT NOT NULL,
	`positionInQueue` INT NOT NULL,
    PRIMARY KEY (eBookOnHoldId),
    CONSTRAINT `ebook_hold` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `user_hold` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBookHolds` WRITE;
/*!40000 ALTER TABLE `EBookHolds` DISABLE KEYS */;
INSERT INTO `EBookHolds` VALUES   (1, 3, 5, 20),
								   (2, 4, 4, 15), 
								   (3, 1, 3, 10), 
								   (4, 2, 5, 20);
/*!40000 ALTER TABLE `EBookHolds` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `DownloadSites`;
CREATE TABLE `DownloadSites` (
    `downloadSiteId` INT NOT NULL AUTO_INCREMENT,
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

DROP TABLE IF EXISTS `EBookLicenses`;
CREATE TABLE `EBookLicenses` (
    `eBookLicenseId` INT NOT NULL AUTO_INCREMENT,
	`eBookId` INT NOT NULL,
    `downloadSiteId` INT NOT NULL,
	`numberOfCopiesForDownload` INT NOT NULL,
    PRIMARY KEY (eBookLicenseId),
    CONSTRAINT `book_download_text` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `downloadSite_text_determined` FOREIGN KEY (`downloadSiteId`)
        REFERENCES `DownloadSites` (`downloadSiteId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `EBookLicenses` WRITE;
/*!40000 ALTER TABLE `EBookLicenses` DISABLE KEYS */;
INSERT INTO `EBookLicenses` VALUES   (1, 1, 1, 5),
										(2, 2, 1, 10), 
										(3, 3, 1, 15), 
										(4, 4, 1, -1);
/*!40000 ALTER TABLE `EBookLicenses` ENABLE KEYS */;
UNLOCK TABLES;

/***************************************************************/
/*USER BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `BorrowedEBooks`;
CREATE TABLE `BorrowedEBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `userId` INT NOT NULL,
    `dateExpires` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_current_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ebook_current_books` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BorrowedEBooks` WRITE;
/*!40000 ALTER TABLE `BorrowedEBooks` DISABLE KEYS */;
INSERT INTO `BorrowedEBooks` VALUES (1, 1, 1, '2015-09-09', null), (2, 2, 1, '2015-09-09', null), (3, 3, 1, '2015-09-09', 4), (4, 4, 2, '2015-09-09', null);
/*!40000 ALTER TABLE `BorrowedEBooks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PastBookshelfEBooks`;
CREATE TABLE `PastBookshelfEBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `userId` INT NOT NULL,
    `dateExpired` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_past_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ebook_past_books` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `PastBookshelfEBooks` WRITE;
/*!40000 ALTER TABLE `PastBookshelfEBooks` DISABLE KEYS */;
INSERT INTO `PastBookshelfEBooks` VALUES (1, 4, 1, '2015-09-09', null), (2, 3, 1, '2015-09-09', null), (3, 2, 1, '2015-09-09', 4), (4, 1, 2, '2015-09-09', null);
/*!40000 ALTER TABLE `PastBookshelfEBooks` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `OnHoldEBooks`;
/*CREATE TABLE `OnHoldEBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_hold_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ebook_hold_books` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `OnHoldEBooks` WRITE;
/*!40000 ALTER TABLE `OnHoldEBooks` DISABLE KEYS */;
/*INSERT INTO `OnHoldEBooks` VALUES (1, 3, 1), (2, 4, 1), (3, 1, 1), (4, 2, 2);
/*!40000 ALTER TABLE `OnHoldEBooks` ENABLE KEYS */;
/*UNLOCK TABLES;*/

DROP TABLE IF EXISTS `WishlistEBooks`;
CREATE TABLE `WishlistEBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_wishlist_books` FOREIGN KEY (`userId`)
        REFERENCES `RegisteredUsers` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ebook_wishlist_books` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `WishlistEBooks` WRITE;
/*!40000 ALTER TABLE `WishlistEBooks` DISABLE KEYS */;
INSERT INTO `WishlistEBooks` VALUES (1, 2, 1), (2, 1, 1), (3, 4, 1), (4, 3, 2);
/*!40000 ALTER TABLE `WishlistEBooks` ENABLE KEYS */;
UNLOCK TABLES;


