package com.mimir.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.dao.BookDao;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.EBook;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;

@Service("libraryService")
@Transactional
public class LibraryServiceImpl implements LibraryService{

	@Autowired
	BookDao dao;

	@Override
	public void saveBook(Book book) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificGenre(String genre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificAuthor(
			String authorName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificAuthor(
			int authorId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificLanguage(
			String language) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificFormat(
			String format) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificInterestLevel(
			String interestLevel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksBySpecificKeyword(
			String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDisplayableInformation> getBooksByAdvancedSearch(
			String title, String author, List<Genre> genres,
			List<Language> languages, List<InterestLevel> interestLevels) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBook(int bookId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Book getSpecificBook(int bookId) {
		return dao.getSpecificBook(bookId);
	}

	@Override
	public BookDisplayableInformation getBookDisplay(int bookId) {
		return dao.getBookDisplay(bookId);
	}

	@Override
	public EBook getSpecificEBook(int bookId) {
		return dao.getSpecificEBook(bookId);
	}
	
}
