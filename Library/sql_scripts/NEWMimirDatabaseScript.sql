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
DROP TABLE IF EXISTS `AudioBookPublishers`;
DROP TABLE IF EXISTS `EBookPublishers`;

DROP TABLE IF EXISTS `AccountInfo`;
CREATE TABLE `AccountInfo` (
    `accountInfoId` INT NOT NULL AUTO_INCREMENT,
    `accountType` VARCHAR(50) NOT NULL,
	`firstName` VARCHAR(50) NOT NULL,
	`lastName` VARCHAR(50) NOT NULL,
    PRIMARY KEY (accountInfoId)
);

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

DROP TABLE IF EXISTS `RegisteredUsers`;
CREATE TABLE `RegisteredUsers` (
    `regUserId` INT NOT NULL AUTO_INCREMENT,
	`accountInfoId` INT NOT NULL,
    `libraryCard` VARCHAR(50) NOT NULL,
	`userCode` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (regUserId),
	CONSTRAINT `user_account_info_map` FOREIGN KEY (`accountInfoId`)
        REFERENCES `AccountInfo` (`accountInfoId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);



DROP TABLE IF EXISTS `Admins`;
CREATE TABLE `Admins` (
    `adminId` INT NOT NULL AUTO_INCREMENT,
	`accountInfoId` INT NOT NULL,
    PRIMARY KEY (adminId),
	CONSTRAINT `admin_account_info` FOREIGN KEY (`accountInfoId`)
        REFERENCES `AccountInfo` (`accountInfoId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `UserAccountInfo`;
/* Changed to AccountInfo */


/***************************************************************/
/*BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `Authors`;
DROP TABLE IF EXISTS `BAuthors`;
CREATE TABLE `BAuthors` (
    `authorId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `description` VARCHAR(50) NOT NULL,
    PRIMARY KEY (authorId)
);



DROP TABLE IF EXISTS `AwardInfo`;
CREATE TABLE `AwardInfo` (
    `awardId` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(50) NOT NULL,
    `year` VARCHAR(4),
    PRIMARY KEY (awardId)
);

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
        REFERENCES `BAuthors` (`authorId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);



DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books` (
    `bookId` INT NOT NULL AUTO_INCREMENT,
    `isbn` VARCHAR(50) NOT NULL,
    `seriesName` VARCHAR(50),
    PRIMARY KEY (bookId)
);

DROP TABLE IF EXISTS `Authors_Books`;
CREATE TABLE `Authors_Books` (
    `bookId` INT NOT NULL AUTO_INCREMENT,
    `authorId` INT NOT NULL,
    PRIMARY KEY (bookId, authorId),
    CONSTRAINT `author_book_map` FOREIGN KEY (`authorId`)
        REFERENCES `BAuthors` (`authorId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `book_author_map` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

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
    `imageFilePath` VARCHAR(500) NOT NULL,
    PRIMARY KEY (bookDisplayId),
    CONSTRAINT `bookDisplayDeterminedBy` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `Genres`;
CREATE TABLE `Genres` (
    `genreId` INT NOT NULL AUTO_INCREMENT,
    `genre` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (genreId)
);

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

DROP TABLE IF EXISTS `InterestLevels`;
CREATE TABLE `InterestLevels` (
    `interestLevelId` INT NOT NULL,
    `interestLevel` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (interestLevelId)
);

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

DROP TABLE IF EXISTS `Publishers`;
CREATE TABLE `Publishers` (
    `publisherId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
	`information` VARCHAR(300),
    PRIMARY KEY (publisherId)
);

/**  OLD TABLE  **/
DROP TABLE IF EXISTS `BookEBookFormats`;


DROP TABLE IF EXISTS `EBooks`;
CREATE TABLE `EBooks` (
	`eBookId` INT NOT NULL AUTO_INCREMENT,
    `bookId` INT NOT NULL,
    `publisherId` INT NOT NULL,
	`remainingCopies` INT NOT NULL,
    PRIMARY KEY (eBookId),
    CONSTRAINT `book_text` FOREIGN KEY (`bookId`)
        REFERENCES `Books` (`bookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `publisher_text` FOREIGN KEY (`publisherId`)
        REFERENCES `Publishers` (`publisherId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `Formats`;
CREATE TABLE `Formats` (
    `formatId` INT NOT NULL,
    `format` VARCHAR(50) NOT NULL,
    PRIMARY KEY (formatId)
);

DROP TABLE IF EXISTS `EBookFormats`;
CREATE TABLE `EBookFormats` (
    `ebookFormatId` INT NOT NULL AUTO_INCREMENT,
	`eBookId` INT NOT NULL,
    `formatId` INT NOT NULL,
    `releaseDate` DATE,
    `fileSize` INT,
    PRIMARY KEY (ebookFormatId),
    CONSTRAINT `ebook_format_type` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `format_type` FOREIGN KEY (`formatId`)
        REFERENCES `Formats` (`formatId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
    `languageId` INT NOT NULL AUTO_INCREMENT,
    `language` VARCHAR(100) NOT NULL,
    PRIMARY KEY (languageId)
);

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

DROP TABLE IF EXISTS `DownloadSites`;
CREATE TABLE `DownloadSites` (
    `downloadSiteId` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (downloadSiteId)
);

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
	`eBookKey` VARCHAR(80) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `user_current_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `ebook_current_books` FOREIGN KEY (`eBookId`)
        REFERENCES `EBooks` (`eBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `PastBookshelfEBooks`;
DROP TABLE IF EXISTS `PastBorrowedEBooks`;
CREATE TABLE `PastBorrowedEBooks` (
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

/***************************************************************/
/*AUDIO BOOK INFORMATION */
/***************************************************************/

DROP TABLE IF EXISTS `AudioBooks`;
CREATE TABLE `AudioBooks` (
    `audioBookId` INT NOT NULL AUTO_INCREMENT,
	`bookId` INT NOT NULL UNIQUE,
    `publisherId` INT NOT NULL,
	`remainingCopies` INT NOT NULL,
    PRIMARY KEY (audioBookId),
	CONSTRAINT `audioBook_Publisher` FOREIGN KEY (`publisherId`)
        REFERENCES `Publishers` (`publisherId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `AudioBookFormats`;
CREATE TABLE `AudioBookFormats` (
    `audioBookFormatId` INT NOT NULL AUTO_INCREMENT,
	`audioBookId` INT NOT NULL,
    `formatId` INT NOT NULL,
	`releaseDate` DATE,
	`fileSize` INT,
	`numOfParts` INT, 
	`duration` INT,
    PRIMARY KEY (audioBookFormatId),
	CONSTRAINT `audioBookFormat_audioBook` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `audioBookFormat_format` FOREIGN KEY (`formatId`)
        REFERENCES `Formats` (`formatId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `AudioBookLanguages`;
CREATE TABLE `AudioBookLanguages` (
    `audioBookLanguageId` INT NOT NULL AUTO_INCREMENT,
	`audioBookId` INT NOT NULL,
    `languageId` INT NOT NULL,
    PRIMARY KEY (audioBookLanguageId),
	CONSTRAINT `audioBookLanguage_audioBook` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `audioBookLanguage_language` FOREIGN KEY (`languageId`)
        REFERENCES `Languages` (`languageId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `AudioBookRatings`;
CREATE TABLE `AudioBookRatings` (
    `audioBookRatingId` INT NOT NULL AUTO_INCREMENT,
	`audioBookId` INT NOT NULL,
    `numberOfRatings` INT NOT NULL,
	`sumOfRatings` INT NOT NULL,
    PRIMARY KEY (audioBookRatingId),
	CONSTRAINT `audioBookRating_audioBook` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `AudioBookHolds`;
CREATE TABLE `AudioBookHolds` (
    `audioBookHoldId` INT NOT NULL AUTO_INCREMENT,
	`audioBookId` INT NOT NULL,
    `regUserId` INT NOT NULL,
	`positionInQueue` INT NOT NULL,
    PRIMARY KEY (audioBookHoldId),
	CONSTRAINT `audioBookHold_audioBook` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `audioBookHold_regUser` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `AudioBookLicenses`;
CREATE TABLE `AudioBookLicenses` (
    `audioBookLicenseId` INT NOT NULL AUTO_INCREMENT,
	`audioBookId` INT NOT NULL,
    `downloadSiteId` INT NOT NULL,
	`positionInQueue` INT NOT NULL,
    PRIMARY KEY (audioBookLicenseId),
	CONSTRAINT `audioBookLicense_audioBook` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `audioBookHold_downloadSite` FOREIGN KEY (`downloadSiteId`)
        REFERENCES `DownloadSites` (`downloadSiteId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `BorrowedAudioBooks`;
CREATE TABLE `BorrowedAudioBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `audioBookId` INT NOT NULL,
    `regUserId` INT NOT NULL,
    `dateExpires` DATE NOT NULL,
    `bookRating` DECIMAL,
	`audioBookKey` VARCHAR(80) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `AudioBooks_user_current_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `AudioBooks_current_books` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `PastBookshelfAudioBooks`;
CREATE TABLE `PastBookshelfAudioBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `audioBookId` INT NOT NULL,
    `regUserId` INT NOT NULL,
    `dateExpired` DATE NOT NULL,
    `bookRating` DECIMAL,
    PRIMARY KEY (id),
    CONSTRAINT `AudioBooks_user_past_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `AudioBooks_past_books` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `WishlistAudioBooks`;
CREATE TABLE `WishlistAudioBooks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `audioBookId` INT NOT NULL,
    `regUserId` INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT `AudioBooks_user_wishlist_books` FOREIGN KEY (`regUserId`)
        REFERENCES `RegisteredUsers` (`regUserId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `AudioBooks_wishlist_books` FOREIGN KEY (`audioBookId`)
        REFERENCES `AudioBooks` (`audioBookId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/***********************************************************************************************************************************
** FAKE DATA **
***********************************************************************************************************************************/

LOCK TABLES `AccountInfo` WRITE;/* Id, acctountType, FirstName, LastName */
INSERT INTO `AccountInfo` VALUES (1, 'RegUser', 'Hodir', 'Smith'), 
							     (2, 'RegUser', 'Odin', 'Johnson'), 
								 (3, 'Admin', 'Freya', 'Jones');
UNLOCK TABLES;

LOCK TABLES `LoginCreds` WRITE;/* Id. AccountInfoId(FK), Email, Password*/
INSERT INTO `LoginCreds` VALUES (1, 1, 'Test1', 'password'), 
								(2, 2, 'Test2', 'password'), 
								(3, 3, 'Test3', 'password');
UNLOCK TABLES;

LOCK TABLES `RegisteredUsers` WRITE;/* Id, AccountInfoId(FK), libraryCard */
INSERT INTO `RegisteredUsers` VALUES (1, 1,'1234567890', '037ef4c1-7ed9-4c06-8a43-366d56f948d4'), 
									 (2, 2,'0987654321', '14fddd55-c887-476b-a727-2ea716d02b13');
UNLOCK TABLES;

LOCK TABLES `Admins` WRITE;/* Id, AccountInfoId(FK) */
INSERT INTO `Admins` VALUES (1, 3);
UNLOCK TABLES;

LOCK TABLES `BAuthors` WRITE;/* Id, Name, Description */
INSERT INTO `BAuthors` VALUES (1, 'Stephen Hawking', 'Description would be here.'), 
							 (2, 'Lois Lowry', 'Description would go here.'), 
							 (3, 'George R.R. Martin', 'Description would go here.'), 
							 (4, 'J.K. Rowling', 'Description would go here.'),
							 (5, 'Gillian Flynn', 'Description would be here.'), 
							 (6, 'John Green', 'Description would go here.'), 
							 (7, 'Veronica Roth', 'Description would go here.'), 
							 (8, 'James Patterson', 'Description would go here.');
UNLOCK TABLES;

LOCK TABLES `AwardInfo` WRITE;/* Id, Title, Description, Year */
INSERT INTO `AwardInfo` VALUES (1, 'Good Author Award', 'Description would be here.', '2014'), 
							   (2, 'Good Book Award', 'Description would be here.', '2014');
UNLOCK TABLES;

LOCK TABLES `AuthorAwards` WRITE;/* Id, AwardInfoId(FK), AuthorId(FK) */
INSERT INTO `AuthorAwards` VALUES (1, 1, 4);
UNLOCK TABLES;

LOCK TABLES `Books` WRITE;/* Id, Isbn, SeriesName */
INSERT INTO `Books` VALUES (1, '9780553896923', null), 
						   (2, '9780547345901', null), 
						   (3, '9780739353370', 'A Song of Ice and Fire'), 
						   (4, '9781781102527', 'Harry Potter'),
						   (5, '9781299008069', null),
						   (6, '9780307588364', null), 
						   (7, '9781410450951', null), 
						   (8, '9780297859390', null);
UNLOCK TABLES;

LOCK TABLES `Authors_Books` WRITE;/* BookId(FK), AuthorId(FK)*/
INSERT INTO `Authors_Books` VALUES (1, 1), 
								   (2, 2), 
								   (3, 3), 
								   (4, 4),
								   (5, 5), 
								   (6, 6), 
								   (7, 7), 
								   (8, 8);
UNLOCK TABLES;

LOCK TABLES `BookAwards` WRITE; /* AwardId(FK), BookId(FK)*/
INSERT INTO `BookAwards` VALUES (2, 4);
UNLOCK TABLES;

LOCK TABLES `BookDisplayInfo` WRITE;/* Id, BookId(FK), Title, Description, DateAdded, ImageFilePath */
INSERT INTO `BookDisplayInfo` VALUES (1, 1, 'A Brief History Of Time', 'Description.', '2015-11-07', 'resources/img/TestImg1.jpg'), 
									 (2, 2, 'The Giver', 'Description.', '2015-11-07', 'resources/img/TestImg2.jpg'),
									 (3, 3, 'Game Of Thrones', 'Description.', '2015-11-07', 'resources/img/TestImg3.jpg'),
									 (4, 4, 'Harry Potter And The Sorcerers Stone', 'Description.', '2015-11-07', 'resources/img/TestImg4.jpg'),
									 (5, 5, 'Gone Girl', 'Marriage can be a real killer. One of the most critically acclaimed suspense writers of our time, New York Times bestseller Gillian Flynn takes that statement to its darkest place in this unputdownable masterpiece about a marriage gone terribly, terribly wrong. The Chicago Tribune proclaimed that her work “draws you in and keeps you reading with the force of a pure but nasty addiction.” Gone Girl’s toxic mix of sharp-edged wit and deliciously chilling prose creates a nerve-fraying thriller that confounds you at every turn. On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being m.', '2015-11-07', 'resources/img/TestImg8.jpg'), 
									 (6, 6, 'The Fault In Our Stars', 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.', '2015-11-07', 'resources/img/TestImg7.jpg'),
									 (7, 7, 'Divergent', 'This first book in Veronica Roths #1 New York Times bestselling Divergent trilogy is the novel that inspired the major motion picture starring Shailene Woodley, Theo James, and Kate Winslet. This dystopian series set in a futuristic Chicago has captured the hearts of millions of teen and adult readers. Perfect for fans of the Hunger Games and Maze Runner series, Divergent and its sequels, Insurgent and Allegiant—plus Four: A Divergent Collection, four stories told from the perspective of the character Tobias—are the gripping story of a dystopian world transformed by courage, self-sacrifice, and love. Fans of the Divergent movie will find the book packed with just as much emotional depth and exhilarating action as the film, all told in beautiful, rich language.', '2015-11-07', 'resources/img/TestImg9.jpg'),
									 (8, 8, 'Unlucky 13', 'San Francisco Detective Lindsay Boxer is loving her life as a new mother. With an attentive husband, a job she loves, plus best friends who can talk about anything from sex to murder, things couldnt be better. Then the FBI sends Lindsay a photo of a killer from her past, and her happy world is shattered. The picture captures a beautiful woman at a stoplight. But all Lindsay sees is the psychopath behind those seductive eyes: Mackie Morales, the most deranged and dangerous mind the Womens Murder Club has ever encountered..', '2015-11-07', 'resources/img/TestAudioImg4.jpg');
UNLOCK TABLES;

LOCK TABLES `Genres` WRITE;/* Id, Genre*/
INSERT INTO `Genres` VALUES (1, 'History'), 
							(2, 'Science'), 
							(3, 'Fiction'), 
							(4, 'Sci-Fi'), 
							(5, 'Fantasy'), 
							(6, 'Violence'),
							(7, 'Mystery'), 
							(8, 'Romance'), 
							(9, 'Action'), 
							(10, 'Comedy');
UNLOCK TABLES;

LOCK TABLES `GenreInterests` WRITE;/* Id, GenreId(FK), RegUserId(FK)*/
INSERT INTO `GenreInterests` VALUES (1, 1, 1), 
									(2, 2, 2), 
								    (3, 3, 3), 
								    (4, 4, 4);
UNLOCK TABLES;

LOCK TABLES `BookGenres` WRITE;/* Id, BookId(FK), GenreId(FK) */
INSERT INTO `BookGenres` VALUES (1, 1, 1), 
								(2, 1, 2), 
								(3, 2, 3), 
								(4, 2, 4), 
								(5, 3, 5), 
							    (6, 3, 6), 
								(7, 4, 5),
								(8, 5, 7), 
								(9, 6, 8), 
								(10, 7, 9), 
								(11, 8, 10);
UNLOCK TABLES;

LOCK TABLES `InterestLevels` WRITE;/* Id, InterestLevel */
INSERT INTO `InterestLevels` VALUES (1, 'Kindergarten'), 
									(2, 'Elementary'), 
									(3, 'MiddleSchool'),
								    (4, 'HighSchool'), 
									(5, 'College'), 
									(6, 'YoungAdult'),
									(7, 'Adult'); 

UNLOCK TABLES;

LOCK TABLES `InterestLevelInterests` WRITE;/* Id, InterestLevelId(FK), RegUserId(FK)*/
INSERT INTO `InterestLevelInterests` VALUES (1, 1, 1), 
											(2, 2, 2), 
											(3, 3, 3), 
											(4, 4, 1);
UNLOCK TABLES;

LOCK TABLES `BookInterestLevels` WRITE;/* Id,  BookId(FK), InterestLevelId(FK)*/
INSERT INTO `BookInterestLevels` VALUES (1, 1, 1), 
										(2, 2, 2), 
										(3, 3, 1), 
										(4, 4, 3),
										(5, 5, 1), 
										(6, 6, 2), 
										(7, 7, 3), 
										(8, 8, 1);
UNLOCK TABLES;

LOCK TABLES `Publishers` WRITE;/* Id,  Name, Info*/
INSERT INTO `Publishers` VALUES (1, 'Random House Publishing Group', null), 
									 (2, 'Houghton Mifflin Harcourt', null), 
									 (3, 'Publisher 3', null), 
									 (4, 'Mimir Books', null);
UNLOCK TABLES;


LOCK TABLES `EBooks` WRITE;/* Id, BookId, PublisherId */
INSERT INTO `EBooks` VALUES (1, 1, 1, 4), 
							(2, 2, 2, 9), 
							(3, 3, 3, 14),
							(4, 4, 4, -1),
							(5, 5, 3, 5), 
							(6, 6, 3, 10), 
							(7, 7, 3, 15),
							(8, 8, 3, -1);
UNLOCK TABLES;

LOCK TABLES `Formats` WRITE;/* Id,  Format*/
INSERT INTO `Formats` VALUES (1, 'Kindle'), 
						     (2, 'EPub'), 
							 (3, 'MP3'),
							 (4, 'WMA'),
							 (5, 'Html'),
							 (6, 'Pdf');
UNLOCK TABLES;

LOCK TABLES `EBookFormats` WRITE;/* Id, EBookId(FK), FormatId(FK), ReleaseDate, FileSize*/
INSERT INTO `EBookFormats` VALUES (1, 1, 1, '2011-05-04', null), 
								  (2, 1, 2, '2011-05-04', 4210),
								  (3, 2, 1, '2011-05-05', null), 
								  (4, 2, 2, '1993-04-26', 1204),
								  (5, 3, 2, '2006-10-31', 954419),
								  (6, 4, 2, '2012-03-29', 237016),
								  (7, 5, 1, '2012-05-04', null),
								  (8, 6, 1, '2005-05-05', null),
								  (9, 7, 1, '2008-10-31', null),
								  (10, 8, 1, '2002-03-29', null);
UNLOCK TABLES;


LOCK TABLES `Languages` WRITE;/* Id,  Language*/
INSERT INTO `Languages` VALUES (1, 'English'), 
							   (2, 'Spanish'), 
							   (3, 'French'), 
							   (4, 'Chinese');
UNLOCK TABLES;


LOCK TABLES `LanguageInterests` WRITE;/* Id, LanguageId(FK), RegUserId(FK) */
INSERT INTO `LanguageInterests` VALUES (1, 1, 1), 
									   (2, 2, 2), 
                                       (3, 3, 3), 
									   (4, 4, 4);
UNLOCK TABLES;

LOCK TABLES `EBookLanguages` WRITE;/* Id,  EBookId(FK), LanguageId(FK)*/
INSERT INTO `EBookLanguages` VALUES (1, 1, 1), 
                                    (2, 1, 2),
								    (3, 2, 1), 
									(4, 2, 3),
								    (5, 3, 1), 
									(6, 3, 2), 
									(7, 3, 3),
								    (8, 4, 1),
									(9, 5, 1),
								    (10, 6, 1),
									(11, 7, 1), 
								    (12, 8, 1);
UNLOCK TABLES;


LOCK TABLES `EBookRatings` WRITE;/* Id, EBookId(FK), NumOfRatings, SumOfRatings */
INSERT INTO `EBookRatings` VALUES (1, 1, 5, 20),
								  (2, 2, 4, 15), 
								  (3, 3, 3, 10), 
							      (4, 4, 5, 20),
								  (5, 5, 5, 20),
								  (6, 6, 4, 15), 
								  (7, 7, 3, 10), 
							      (8, 8, 5, 20);
UNLOCK TABLES;


LOCK TABLES `EBookHolds` WRITE;/* Id, EBookId(FK), RegUserId(FK), PositionInQueue */
INSERT INTO `EBookHolds` VALUES   (1, 3, 2, 2),
								  (2, 3, 1, 1);
UNLOCK TABLES;


LOCK TABLES `DownloadSites` WRITE;/* Id, Name, Baseurl, DownloadUrl, BookKeyUrl, PublicKey */
INSERT INTO `DownloadSites` VALUES   (1, 'Lamazon');
UNLOCK TABLES;


LOCK TABLES `EBookLicenses` WRITE;/* Id, EBookId(FK), DownloadSiteId(FK), NumberOfCopiesForDownload */
INSERT INTO `EBookLicenses` VALUES   (1, 1, 1, 5),
									 (2, 2, 1, 10), 
									 (3, 3, 1, 15), 
									 (4, 4, 1, -1),
								     (5, 5, 1, 5),
									 (6, 6, 1, 10), 
									 (7, 7, 1, 15), 
									 (8, 8, 1, -1);
UNLOCK TABLES;

LOCK TABLES `BorrowedEBooks` WRITE;/* Id, EBookId(FK), RegUserId(FK), DateExpires, BookRating */
INSERT INTO `BorrowedEBooks` VALUES (1, 1, 1, '2015-09-09', null , '285323a6-8cac-4b3d-9e2d-4f5db06b960c'), 
									(2, 2, 1, '2015-09-09', null, '7ed4070e-c57c-433e-9997-46b8d9a65327'), 
									(3, 3, 1, '2015-09-09', 4, '9f0fdde7-32f2-41e9-89d3-e6cdb172b777'), 
									(4, 4, 2, '2015-09-09', null, '9bb70be6-fbeb-492c-98bf-7620a738ed24');
UNLOCK TABLES;

LOCK TABLES `PastBorrowedEBooks` WRITE;/* Id, EBookId(FK), RegUserId(FK), BookRating */
INSERT INTO `PastBorrowedEBooks` VALUES (1, 4, 1, '2015-09-09', null), 
										 (2, 3, 1, '2015-09-09', null), 
										 (3, 2, 1, '2015-09-09', 4), 
										 (4, 1, 2, '2015-09-09', null);
UNLOCK TABLES;

LOCK TABLES `WishlistEBooks` WRITE;/* Id, EBookId(FK), RegUserId(FK), */
INSERT INTO `WishlistEBooks` VALUES (1, 2, 1), 
									(2, 1, 1), 
									(3, 4, 1), 
									(4, 3, 2);
UNLOCK TABLES;


LOCK TABLES `AudioBooks` WRITE;/* Id, AudioBookId(FK), PublisherId(FK), numOfRemainingCopies*/
INSERT INTO `AudioBooks` VALUES     (1, 1, 1, 4), 
									(2, 2, 1, 9), 
									(3, 3, 1, 14), 
									(4, 4, 1, -1), 
									(5, 5, 1, 5), 
									(6, 6, 1, 10), 
									(7, 7, 1, 15), 
									(8, 8, 1, -1);
UNLOCK TABLES;

LOCK TABLES `AudioBookFormats` WRITE;/* Id, AudioBookId(FK), FormatId(FK), ReleaseDate, FileSize, NumOfParts, Duration*/
INSERT INTO `AudioBookFormats` VALUES (1, 1, 3, '2011-05-04', null, 2, 4002), 
								  (2, 1, 4, '2011-05-04', 4210, 3, 4001),
								  (3, 2, 3, '2011-05-05', null, 4, 4003), 
								  (4, 2, 4, '1993-04-26', 1204, 3, 4004),
								  (5, 3, 3, '2006-10-31', 954419, 4, 4005),
								  (6, 4, 4, '2012-03-29', 237016, 1, 4006),
								  (7, 5, 4, '2012-05-04', null, 2, 4007),
								  (8, 6, 3, '2005-05-05', null, 3, 4008),
								  (9, 7, 4, '2008-10-31', null, 7, 4009),
								  (19, 8, 3, '2002-03-29', null, 6, 4009);
UNLOCK TABLES;

LOCK TABLES `AudioBookLanguages` WRITE;/* Id,  AudioBookId(FK), LanguageId(FK)*/
INSERT INTO `AudioBookLanguages` VALUES (1, 1, 1), 
										(2, 1, 2),
										(3, 2, 1), 
										(4, 2, 3),
										(5, 3, 1), 
										(6, 3, 2), 
										(7, 3, 3),
										(8, 4, 1),
										(9, 5, 1),
										(10, 6, 1),
										(11, 7, 1), 
										(12, 8, 1);
UNLOCK TABLES;


LOCK TABLES `AudioBookRatings` WRITE;/* Id, AudioBookId(FK), NumOfRatings, SumOfRatings */
INSERT INTO `AudioBookRatings` VALUES (1, 1, 5, 20),
									  (2, 2, 4, 15), 
									  (3, 3, 3, 10), 
									  (4, 4, 5, 20),
									  (5, 5, 5, 20),
									  (6, 6, 4, 15), 
									  (7, 7, 3, 10), 
									  (8, 8, 5, 20);
UNLOCK TABLES;


LOCK TABLES `AudioBookHolds` WRITE;/* Id, AudioBookId(FK), RegUserId(FK), PositionInQueue */
INSERT INTO `AudioBookHolds` VALUES   (1, 3, 2, 2),
								      (2, 3, 1, 1);
UNLOCK TABLES;

LOCK TABLES `AudioBookLicenses` WRITE;/* Id, AudioBookId(FK), DownloadSiteId(FK), NumberOfCopiesForDownload */
INSERT INTO `AudioBookLicenses` VALUES   (1, 1, 1, 5),
										 (2, 2, 1, 10), 
										 (3, 3, 1, 15), 
										 (4, 4, 1, -1),
										 (5, 5, 1, 5),
										 (6, 6, 1, 10), 
										 (7, 7, 1, 15), 
										 (8, 8, 1, -1);
UNLOCK TABLES;

LOCK TABLES `BorrowedAudioBooks` WRITE;/* Id, AudioBookId(FK), RegUserId(FK), DateExpires, BookRating */
INSERT INTO `BorrowedAudioBooks` VALUES (1, 1, 1, '2015-09-09', null, 'b0b98b0a-88e8-48cb-9b76-cfb2861de666'), 
										(2, 2, 1, '2015-09-09', null , '239630d0-c87d-4ee5-b6b1-9fbf53c049dc'), 
										(3, 3, 1, '2015-09-09', 4 , '156e26d9-23dc-4a87-b533-36ff06350996'), 
										(4, 4, 2, '2015-09-09', null, 'c263603e-b815-435e-8a4f-a1df16db755e');
UNLOCK TABLES;

LOCK TABLES `PastBookshelfAudioBooks` WRITE;/* Id, AudioBookId(FK), RegUserId(FK), BookRating */
INSERT INTO `PastBookshelfAudioBooks` VALUES (1, 4, 1, '2015-09-09', null), 
											 (2, 3, 1, '2015-09-09', null), 
											 (3, 2, 1, '2015-09-09', 4), 
											 (4, 1, 2, '2015-09-09', null);
UNLOCK TABLES;

LOCK TABLES `WishlistAudioBooks` WRITE;/* Id, AudioBookId(FK), RegUserId(FK), */
INSERT INTO `WishlistAudioBooks` VALUES (1, 2, 1), 
										(2, 1, 1), 
										(3, 4, 1), 
										(4, 3, 2);
UNLOCK TABLES;











