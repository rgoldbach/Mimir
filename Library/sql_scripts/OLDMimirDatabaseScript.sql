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

DROP TABLE IF EXISTS `authors_books`;
DROP TABLE IF EXISTS `borrowedebooks`;
DROP TABLE IF EXISTS `ebookholds`;
DROP TABLE IF EXISTS `ebooklanguages`;
DROP TABLE IF EXISTS `ebooklicenses`;
DROP TABLE IF EXISTS `ebookratings`;
DROP TABLE IF EXISTS `ebooks`;
DROP TABLE IF EXISTS `pastbookshelfebooks`;
DROP TABLE IF EXISTS `wishlistebooks`;
DROP TABLE IF EXISTS `RegisteredUsers`;
DROP TABLE IF EXISTS `LoginCreds`;
DROP TABLE IF EXISTS `UserAccountInfo`;
DROP TABLE IF EXISTS `AccountInfo`;
DROP TABLE IF EXISTS `Authors`;
DROP TABLE IF EXISTS `AwardInfo`;
DROP TABLE IF EXISTS `AuthorAwards`;
DROP TABLE IF EXISTS `Books`;
DROP TABLE IF EXISTS `BookAwards`;
DROP TABLE IF EXISTS `BorrowedBooks`;
DROP TABLE IF EXISTS `BookshelfBooks`;
DROP TABLE IF EXISTS `PastBookshelfBooks`;
DROP TABLE IF EXISTS `OnHoldBooks`;
DROP TABLE IF EXISTS `WishlistBooks`;
DROP TABLE IF EXISTS `BookDisplayInfo`;
DROP TABLE IF EXISTS `Genres`;
DROP TABLE IF EXISTS `GenreInterests`;
DROP TABLE IF EXISTS `BookGenres`;
DROP TABLE IF EXISTS `InterestLevels`;
DROP TABLE IF EXISTS `InterestLevelInterests`;
DROP TABLE IF EXISTS `BookInterestLevels`;
DROP TABLE IF EXISTS `Publishers`;
DROP TABLE IF EXISTS `EBookPublishers`;
DROP TABLE IF EXISTS `BookTextPublishers`;
DROP TABLE IF EXISTS `BookFormats`;
DROP TABLE IF EXISTS `BookTextFormats`;
DROP TABLE IF EXISTS `BookEBookFormats`;
DROP TABLE IF EXISTS `Formats`;
DROP TABLE IF EXISTS `TextFormats`;
DROP TABLE IF EXISTS `EBookFormats`;
DROP TABLE IF EXISTS `Languages`;
DROP TABLE IF EXISTS `LanguageInterests`;
DROP TABLE IF EXISTS `BookLanguages`;
DROP TABLE IF EXISTS `BookTextLanguages`;
DROP TABLE IF EXISTS `BookTextRatings`;
DROP TABLE IF EXISTS `BookTextHolds`;
DROP TABLE IF EXISTS `DownloadSites`;
DROP TABLE IF EXISTS `BookTextLicenses`;

DROP TABLE IF EXISTS `AccountInfo`;
CREATE TABLE `AccountInfo` (
    `accountInfoId` INT NOT NULL AUTO_INCREMENT,
    `accountType` VARCHAR(50) NOT NULL,
	`firstName` VARCHAR(50) NOT NULL,
	`lastName` VARCHAR(50) NOT NULL,
    PRIMARY KEY (accountInfoId)
);

LOCK TABLES `AccountInfo` WRITE;
/*!40000 ALTER TABLE `AccountInfo` DISABLE KEYS */;
INSERT INTO `AccountInfo` VALUES (1, 'RegUser', 'Hodir', 'Smith'), (2, 'RegUser', 'Odin', 'Johnson'), (3, 'Admin', 'Freya', 'Jones');
/*!40000 ALTER TABLE `AccountInfo` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `LoginCreds`;
CREATE TABLE `LoginCreds` (
	`loginId` INT NOT NULL AUTO_INCREMENT,
    `accountInfoId` INT NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (loginId),
    CONSTRAINT `login_to_user_account` FOREIGN KEY (`accountInfoId`)
        REFERENCES `AccountInfo` (`accountInfoId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `LoginCreds` WRITE;
/*!40000 ALTER TABLE `LoginCreds` DISABLE KEYS */;
INSERT INTO `LoginCreds` VALUES (1, 1, 'Test1', 'password'), (2, 2, 'Test2', 'password'), (3, 3, 'Test3', 'password');
/*!40000 ALTER TABLE `LoginCreds` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `RegisteredUsers`;
CREATE TABLE `RegisteredUsers` (
    `regUserId` INT NOT NULL AUTO_INCREMENT,
	`accountInfoId` INT NOT NULL,
    `libraryCard` VARCHAR(50) NOT NULL,
    PRIMARY KEY (regUserId),
	CONSTRAINT `user_account_info_map` FOREIGN KEY (`accountInfoId`)
        REFERENCES `AccountInfo` (`accountInfoId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `RegisteredUsers` WRITE;
/*!40000 ALTER TABLE `RegisteredUsers` DISABLE KEYS */;
INSERT INTO `RegisteredUsers` VALUES (1, 1,'1234567890'), (2, 2,'0987654321');
/*!40000 ALTER TABLE `RegisteredUsers` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Admins`;
CREATE TABLE `Admins` (
    `adminId` INT NOT NULL AUTO_INCREMENT,
	`accountInfoId` INT NOT NULL,
    PRIMARY KEY (adminId),
	CONSTRAINT `admin_account_info` FOREIGN KEY (`accountInfoId`)
        REFERENCES `AccountInfo` (`accountInfoId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `Admins` WRITE;
/*!40000 ALTER TABLE `Admins` DISABLE KEYS */;
INSERT INTO `Admins` VALUES (1, 3);
/*!40000 ALTER TABLE `Admins` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `UserAccountInfo`;
/* Changed to AccountInfo */


/***************************************************************/
/*BOOK INFORMATION */
/***************************************************************/


DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
    `authorId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
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
    `title` VARCHAR(50) NOT NULL,
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
    `isbn` VARCHAR(50) NOT NULL,
    `seriesName` VARCHAR(50),
    PRIMARY KEY (bookId)
);

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1, '9780553896923', null), (2, '9780547345901', null), (3,'9780739353370', 'A Song of Ice and Fire'), (4, '9781781102527', 'Harry Potter');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Authors_Books`;
CREATE TABLE `Authors_Books` (
    `bookId` INT NOT NULL AUTO_INCREMENT,
    `authorId` INT NOT NULL,
    PRIMARY KEY (bookId, authorId),
    CONSTRAINT `author_book_map` FOREIGN KEY (`authorId`)
        REFERENCES `Authors` (`authorId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_author_map` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `Authors_Books` WRITE;
/*!40000 ALTER TABLE `Authors_Books` DISABLE KEYS */;
INSERT INTO `Authors_Books` VALUES (1, 1), (2, 2), (3, 3), (4, 4);
/*!40000 ALTER TABLE `Authors_Books` ENABLE KEYS */;
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
INSERT INTO `BookDisplayInfo` VALUES (1, 1, 'A Brief History Of Time', 'Description.', '2015-11-07', 'resources/img/TestImg1.jpg'), 
									 (2, 2, 'The Giver', 'Description.', '2015-11-07', 'resources/img/TestImg2.jpg'),
									 (3, 3, 'Game Of Thrones', 'Description.', '2015-11-07', 'resources/img/TestImg3.jpg'),
									 (4, 4, 'Harry Potter And The Sorcerers Stone', 'Description.', '2015-11-07', 'resources/img/TestImg4.jpg');
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
    `regUserId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `genre_interest` FOREIGN KEY (`genreId`)
        REFERENCES `Genres` (`genreId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_genre_interest` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `GenreInterests` WRITE;
/*!40000 ALTER TABLE `GenreInterests` DISABLE KEYS */;
INSERT INTO `GenreInterests` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4);
/*!40000 ALTER TABLE `GenreInterests` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookGenres`;
CREATE TABLE `BookGenres` (
	`bookGenreId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `genreId` INT NOT NULL,
    PRIMARY KEY (bookGenreId),
    CONSTRAINT `bookGenreDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `genreDeterminedBy` FOREIGN KEY (`genreId`)
        REFERENCES `Genres` (`genreId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookGenres` WRITE;
/*!40000 ALTER TABLE `BookGenres` DISABLE KEYS */;
INSERT INTO `BookGenres` VALUES (1, 1, 1), (2, 1, 2), (3, 2, 3), (4, 2, 4), (5, 3, 5), (6, 3, 6), (7, 4, 5);
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
    `regUserId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `interest_level_interest` FOREIGN KEY (`interestLevelId`)
        REFERENCES `InterestLevels` (`interestLevelId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_intlevel_interest` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `InterestLevelInterests` WRITE;
/*!40000 ALTER TABLE `InterestLevelInterests` DISABLE KEYS */;
INSERT INTO `InterestLevelInterests` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 1);
/*!40000 ALTER TABLE `InterestLevelInterests` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `BookInterestLevels`;
CREATE TABLE `BookInterestLevels` (
	`bookInterestLevelId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `interestLevelId` INT NOT NULL,
    PRIMARY KEY (bookInterestLevelId),
    CONSTRAINT `bookILDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `ILDeterminedBy` FOREIGN KEY (`interestLevelId`)
        REFERENCES `InterestLevels` (`interestLevelId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

LOCK TABLES `BookInterestLevels` WRITE;
/*!40000 ALTER TABLE `BookInterestLevels` DISABLE KEYS */;
INSERT INTO `BookInterestLevels` VALUES (1, 1, 1), (2, 2, 2), (3, 3, 1), (4, 4, 3);
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
    `regUserId` INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT `language_interest` FOREIGN KEY (`languageId`)
        REFERENCES `Languages` (`languageId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_language_interest` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
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
	`eBookRatingId` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `numberOfRatings` INT NOT NULL,
	`sumOfRatings` DECIMAL NOT NULL,
    PRIMARY KEY (eBookRatingId),
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
    `regUserId` INT NOT NULL,
	`positionInQueue` INT NOT NULL,
    PRIMARY KEY (eBookOnHoldId),
    CONSTRAINT `ebook_hold` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `user_hold` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
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
    `regUserId` INT NOT NULL,
    `dateExpires` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_current_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
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
    `regUserId` INT NOT NULL,
    `dateExpired` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `user_past_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
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

DROP TABLE IF EXISTS `WishlistEBooks`;
CREATE TABLE `WishlistEBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `eBookId` INT NOT NULL,
    `regUserId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_wishlist_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
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

/* MORE DATA ************************************************************************************************************************************* */

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (5, 'Gillian Flynn', 'Description would be here.'), (6, 'John Green', 'Description would go here.'), (7, 'Veronica Roth', 'Description would go here.'), (8, 'James Patterson', 'Description would go here.');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (5, '9781299008069', null), (6, '9780307588364', null), (7, '9781410450951', null), (8, '9780297859390', null);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Authors_Books` WRITE;
/*!40000 ALTER TABLE `Authors_Books` DISABLE KEYS */;
INSERT INTO `Authors_Books` VALUES (5, 5), (6, 6), (7, 7), (8, 8);
/*!40000 ALTER TABLE `Authors_Books` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `BookDisplayInfo` WRITE;
/*!40000 ALTER TABLE `BookDisplayInfo` DISABLE KEYS */;
INSERT INTO `BookDisplayInfo` VALUES (5, 5, 'Gone Girl', 'Marriage can be a real killer. One of the most critically acclaimed suspense writers of our time, New York Times bestseller Gillian Flynn takes that statement to its darkest place in this unputdownable masterpiece about a marriage gone terribly, terribly wrong. The Chicago Tribune proclaimed that her work “draws you in and keeps you reading with the force of a pure but nasty addiction.” Gone Girl’s toxic mix of sharp-edged wit and deliciously chilling prose creates a nerve-fraying thriller that confounds you at every turn. On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being m.', '2015-11-07', 'resources/img/TestImg8.jpg'), 
									 (6, 6, 'The Fault In Our Stars', 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.', '2015-11-07', 'resources/img/TestImg7.jpg'),
									 (7, 7, 'Divergent', 'This first book in Veronica Roths #1 New York Times bestselling Divergent trilogy is the novel that inspired the major motion picture starring Shailene Woodley, Theo James, and Kate Winslet. This dystopian series set in a futuristic Chicago has captured the hearts of millions of teen and adult readers. Perfect for fans of the Hunger Games and Maze Runner series, Divergent and its sequels, Insurgent and Allegiant—plus Four: A Divergent Collection, four stories told from the perspective of the character Tobias—are the gripping story of a dystopian world transformed by courage, self-sacrifice, and love. Fans of the Divergent movie will find the book packed with just as much emotional depth and exhilarating action as the film, all told in beautiful, rich language.', '2015-11-07', 'resources/img/TestImg9.jpg'),
									 (8, 8, 'Unlucky 13', 'San Francisco Detective Lindsay Boxer is loving her life as a new mother. With an attentive husband, a job she loves, plus best friends who can talk about anything from sex to murder, things couldnt be better. Then the FBI sends Lindsay a photo of a killer from her past, and her happy world is shattered. The picture captures a beautiful woman at a stoplight. But all Lindsay sees is the psychopath behind those seductive eyes: Mackie Morales, the most deranged and dangerous mind the Womens Murder Club has ever encountered..', '2015-11-07', 'resources/img/TestAudioImg4.jpg');
/*!40000 ALTER TABLE `BookDisplayInfo` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (7, 'Mystery'), (8, 'Romance'), (9, 'Action'), (10, 'Comedy');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `BookGenres` WRITE;
/*!40000 ALTER TABLE `BookGenres` DISABLE KEYS */;
INSERT INTO `BookGenres` VALUES (8, 5, 7), (9, 6, 8), (10, 7, 9), (11, 8, 10);
/*!40000 ALTER TABLE `BookGenres` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `BookInterestLevels` WRITE;
/*!40000 ALTER TABLE `BookInterestLevels` DISABLE KEYS */;
INSERT INTO `BookInterestLevels` VALUES (5, 5, 1), (6, 6, 2), (7, 7, 3), (8, 8, 1);
/*!40000 ALTER TABLE `BookInterestLevels` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `EBooks` WRITE;
/*!40000 ALTER TABLE `EBooks` DISABLE KEYS */;
INSERT INTO `EBooks` VALUES (5, 5, 3), 
								 (6, 6, 3), 
								 (7, 7, 3),
								 (8, 8, 3);
/*!40000 ALTER TABLE `EBooks` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `EBookFormats` WRITE;
/*!40000 ALTER TABLE `EBookFormats` DISABLE KEYS */;
INSERT INTO `EBookFormats` VALUES (7, 5, 1, '2012-05-04', null),
								 (8, 6, 1, '2005-05-05', null),
								 (9, 7, 1, '2008-10-31', null),
								 (10, 8, 1, '2002-03-29', null);
/*!40000 ALTER TABLE `EBookFormats` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `EBookLanguages` WRITE;
/*!40000 ALTER TABLE `EBookLanguages` DISABLE KEYS */;
INSERT INTO `EBookLanguages` VALUES (9, 5, 1),
								   (10, 6, 1),
								   (11, 7, 1), 
								   (12, 8, 1);
/*!40000 ALTER TABLE `EBookLanguages` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `EBookRatings` WRITE;
/*!40000 ALTER TABLE `EBookRatings` DISABLE KEYS */;
INSERT INTO `EBookRatings` VALUES (5, 5, 5, 20),
								     (6, 6, 4, 15), 
							 	     (7, 7, 3, 10), 
								     (8, 8, 5, 20);
/*!40000 ALTER TABLE `EBookRatings` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `EBookLicenses` WRITE;
/*!40000 ALTER TABLE `EBookLicenses` DISABLE KEYS */;
INSERT INTO `EBookLicenses` VALUES   (5, 5, 1, 5),
										(6, 6, 1, 10), 
										(7, 7, 1, 15), 
										(8, 8, 1, -1);
/*!40000 ALTER TABLE `EBookLicenses` ENABLE KEYS */;
UNLOCK TABLES;


