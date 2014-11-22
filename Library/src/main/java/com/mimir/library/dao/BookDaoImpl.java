package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mimir.library.model.AudioBook;
import com.mimir.library.model.Author;
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
	public void deleteBook(int bookId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Book getSpecificBook(int bookId) {
		Book book = (Book) getSession().get(Book.class, bookId);
		Hibernate.initialize(book.getAuthors());
		return book;
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
	@Override
	public AudioBook getSpecificAudioBook(int audioBookId) {
		Criteria specificBook = getSession().createCriteria(AudioBook.class, "audioBook");
		specificBook.add(Restrictions.eq("book.bookId", audioBookId));
		return (AudioBook) specificBook.uniqueResult();
	}
}
