package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.model.AudioBook;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.EBook;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;

public interface BookDao {

	void saveBook(Book book);
	
	void deleteBook(int bookId);
	
	Book getSpecificBook(int bookId);
	EBook getSpecificEBook(int bookId);
	AudioBook getSpecificAudioBook(int audioBookId);
	
	BookDisplayableInformation getBookDisplay(int bookId);
	
	
}
