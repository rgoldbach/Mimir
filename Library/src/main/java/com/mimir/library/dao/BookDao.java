package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.beans.AdminBook;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookRating;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BookRating;
import com.mimir.library.model.EBook;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;

public interface BookDao {

	void saveBook(Book book);
	
	void deleteBook(int bookId);
	
	Book getSpecificBook(int bookId);
	EBook getSpecificEBook(int bookId);
	AudioBook getSpecificAudioBook(int audioBookId);
	
	BookDisplayableInformation getBookDisplay(int bookId);
	
	void decrementAudioBookAvailableCopies(AudioBook aBook);
	void decrementEBookAvailableCopies(EBook eBook);
	void incrementAudioBookAvailableCopies(AudioBook aBook);
	void incrementEBookAvailableCopies(EBook eBook);
	
	Genre getGenre(String genreName);
	InterestLevel getInterestLevel(String interestLevel);
	Language getLanguage(String language);
	Publisher getPublisher(String publisherName);
	Format getFormat(String format);
	AwardInfo getAwardInfo(String awardTitle, String year);
	
	void updateBookRating(AudioBookRating rating);
	void updateBookRating(BookRating rating);

	List<AdminBook> getAllBooksForAdmin();

	int getTotalCopiesOfEBook(EBook eBook);
	int getTotalCopiesOfAudioBook(AudioBook audioBook);

	boolean updateBook(AdminBook book);

	String deleteBook(int whichBook, String bookFormat);
}
