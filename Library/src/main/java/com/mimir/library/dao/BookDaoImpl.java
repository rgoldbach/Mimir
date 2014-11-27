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
		EBook eBook = (EBook) specificBook.uniqueResult();
		Hibernate.initialize(eBook.getBook().getAuthors());
		Hibernate.initialize(eBook.geteBookFormats());
		Hibernate.initialize(eBook.getLanguages());
		return eBook;
	}
	@Override
	public AudioBook getSpecificAudioBook(int audioBookId) {
		Criteria specificBook = getSession().createCriteria(AudioBook.class, "audioBook");
		specificBook.add(Restrictions.eq("book.bookId", audioBookId));
		AudioBook audioBook = (AudioBook) specificBook.uniqueResult();
		Hibernate.initialize(audioBook.getBook().getAuthors());
		Hibernate.initialize(audioBook.getAudioBookFormats());
		Hibernate.initialize(audioBook.getLanguages());
		return audioBook;
	}

	@Override
	public void decrementAudioBookAvailableCopies(AudioBook aBook) {
		if(aBook.getRemainingCopies().intValue() == -1) return;
		aBook.setRemainingCopies(new Integer(aBook.getRemainingCopies().intValue()-1));
		getSession().merge(aBook);
		System.out.println("DEBUG - AudioBook remaining copies decremented.");
	}

	@Override
	public void decrementEBookAvailableCopies(EBook eBook) {
		if(eBook.getRemainingCopies().intValue() == -1) return;
		eBook.setRemainingCopies(new Integer(eBook.getRemainingCopies().intValue()-1));
		getSession().merge(eBook);
		System.out.println("DEBUG - EBook remaining copies decremented.");
	}

	@Override
	public void incrementAudioBookAvailableCopies(AudioBook aBook) {
		if(aBook.getRemainingCopies().intValue() == -1) return;
		aBook.setRemainingCopies(new Integer(aBook.getRemainingCopies().intValue()+1));
		getSession().merge(aBook);
	}

	@Override
	public void incrementEBookAvailableCopies(EBook eBook) {
		if(eBook.getRemainingCopies().intValue() == -1) return;
		eBook.setRemainingCopies(new Integer(eBook.getRemainingCopies().intValue()+1));
		getSession().merge(eBook);
	}
}
