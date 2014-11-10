package com.mimir.library.service;

import java.util.List;

import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;

public interface LibraryService {

	void saveBook(Book book);
	
	//Ways to search:
	List<BookDisplayableInformation> getBooksBySpecificGenre(String genre);
	List<BookDisplayableInformation> getBooksBySpecificAuthor(String authorName);
	List<BookDisplayableInformation> getBooksBySpecificAuthor(int authorId);
	List<BookDisplayableInformation> getBooksBySpecificLanguage(String language);
	List<BookDisplayableInformation> getBooksBySpecificFormat(String format);
	List<BookDisplayableInformation> getBooksBySpecificInterestLevel(String interestLevel);
	List<BookDisplayableInformation> getBooksBySpecificKeyword(String keyword);
	List<BookDisplayableInformation> getBooksByAdvancedSearch(String title, 
															  String author,
															  List<Genre> genres,
															  List<Language> languages,
															  List<InterestLevel> interestLevels);
	
	void deleteBook(int bookId);
	
	Book getSpecificBook(int bookId);
	
	BookDisplayableInformation getBookDisplay(int bookId);
	
}
