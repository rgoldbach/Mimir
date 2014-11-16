package com.mimir.library.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.EBook;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.RegisteredUser;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao  implements BookDao{

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
		Criteria specificBook = getSession().createCriteria(Book.class, "book");
		specificBook.setFetchMode("authors", FetchMode.JOIN);
		specificBook.add(Restrictions.eq("bookId", bookId));
		return (Book) specificBook.uniqueResult();
	}

	@Override
	public BookDisplayableInformation getBookDisplay(int bookId) {
		Criteria getBookDisplay = getSession().createCriteria(BookDisplayableInformation.class, "bookDisplayableInformation");
		getBookDisplay.add(Restrictions.eq("bookDisplayId", bookId));
		return (BookDisplayableInformation) getBookDisplay.uniqueResult();
	}

	@Override
	public EBook getSpecificEBook(int bookId) {
		Criteria specificBook = getSession().createCriteria(EBook.class, "eBook");
		specificBook.add(Restrictions.eq("book.bookId", bookId));
		return (EBook) specificBook.uniqueResult();
	}

}
