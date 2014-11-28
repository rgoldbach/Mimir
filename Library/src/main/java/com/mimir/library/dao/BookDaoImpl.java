package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mimir.library.enums.FormatType;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.AudioBookLanguage;
import com.mimir.library.model.AudioBookRating;
import com.mimir.library.model.Author;
import com.mimir.library.model.AuthorAward;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookAward;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BookGenre;
import com.mimir.library.model.BookInterestLevel;
import com.mimir.library.model.EBook;
import com.mimir.library.model.EBookFormat;
import com.mimir.library.model.EBookLanguage;
import com.mimir.library.model.EBookRating;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.LlamazonBook;
import com.mimir.library.model.Publisher;
import com.mimir.library.model.RegisteredUser;

@Repository("bookDao")
public class BookDaoImpl extends AbstractDao  implements BookDao{

	@Override
	public void saveBook(Book book) {
		save(book);
		//Author Awards
		for(Author author : book.getAuthors()){
			for(AuthorAward aa : author.getAwards()){
				aa.setAuthor(author);
				saveOrUpdate(aa.getAwardInfo());
				save(aa);
			}
		}
		
		//Book Awards
		for(BookAward ba : book.getAwards()){
			ba.setBook(book);
			saveOrUpdate(ba.getAwardInfo());
			save(ba);
		}
		//Book Genres
		for(BookGenre bg : book.getGenres()){
			bg.setBook(book);
			save(bg);
		}
		//Book Interest Levels
		for(BookInterestLevel bil : book.getInterestLevels()){
			bil.setBook(book);
			save(bil);
		}
		//Book Display
		book.getBookDisplay().setBook(book);
		save(book.getBookDisplay());
		//Book eBook
		EBook eBook = book.getEBook();
			//eBook Publisher
			Publisher publisher = eBook.getPublisher();
			save(publisher);
			eBook.setPublisher(publisher);
		eBook.setBook(book);
		save(eBook);
			//eBook Rating
			EBookRating eBookRating = eBook.getBookRating();
			eBookRating.seteBook(eBook);
			save(eBookRating);
			//eBook Formats
			for(EBookFormat ebf : eBook.geteBookFormats()){
				ebf.seteBook(eBook);
				save(ebf);
			}
			//eBook Languages
			for(EBookLanguage ebl : eBook.getLanguages()){
				ebl.seteBook(eBook);
				save(ebl);
			}
		//Book Audio Book
		AudioBook audioBook = book.getAudioBook();
			//AudioBook Publisher
			Publisher publisherA = audioBook.getPublisher();
			save(publisherA);
			audioBook.setPublisher(publisherA);
		audioBook.setBook(book);
		save(audioBook);
			//AudioBook Rating
			AudioBookRating aBookRating = audioBook.getBookRating();
			aBookRating.setAudioBook(audioBook);
			save(aBookRating);
			//AudioBook Formats
			for(AudioBookFormat abf : audioBook.getAudioBookFormats()){
				abf.setAudioBook(audioBook);
				save(abf);
			}
			//AudioBook Languages
			for(AudioBookLanguage abl : audioBook.getLanguages()){
				abl.setAudioBook(audioBook);
				save(abl);
			}
		
		getSession().flush();
		
		//Add book to lamazon table - for testing purpose only...
		LlamazonBook llama = new LlamazonBook();
		llama.setAuthor(book.getAuthors().iterator().next().getName());
		llama.setBookImage(book.getBookDisplay().getImageFilePath());
		llama.setBookTitle(book.getBookDisplay().getTitle());
		llama.setDescription(book.getBookDisplay().getDescription());
		save(llama);
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

	@Override
	public Genre getGenre(String genreName) {
		Criteria crit = getSession().createCriteria(Genre.class, "genre");
		crit.add(Restrictions.eq("genre", genreName));
		return (Genre) crit.uniqueResult();
	}

	@Override
	public InterestLevel getInterestLevel(String interestLevel) {
		Criteria crit = getSession().createCriteria(InterestLevel.class, "interestLevel");
		crit.add(Restrictions.eq("interestLevel", interestLevel));
		return (InterestLevel) crit.uniqueResult();
	}

	@Override
	public Language getLanguage(String language) {
		Criteria crit = getSession().createCriteria(Language.class, "language");
		crit.add(Restrictions.eq("language", language));
		return (Language) crit.uniqueResult();
	}

	@Override
	public Publisher getPublisher(String publisherName) {
		Criteria crit = getSession().createCriteria(Publisher.class, "publisher");
		crit.add(Restrictions.eq("name", publisherName));
		return (Publisher) crit.uniqueResult();
	}

	@Override
	public Format getFormat(String format) {
		if(!(format.equalsIgnoreCase(FormatType.EPub.toString()) || format.equalsIgnoreCase(FormatType.Html.toString())
				|| format.equalsIgnoreCase(FormatType.Kindle.toString()) || format.equalsIgnoreCase(FormatType.MP3.toString())
				|| format.equalsIgnoreCase(FormatType.Pdf.toString()) || format.equalsIgnoreCase(FormatType.WMA.toString()))){
			return null;
		}
		Criteria crit = getSession().createCriteria(Format.class, "format");
		crit.add(Restrictions.eq("formatType", format));
		return (Format) crit.uniqueResult();
	}

	@Override
	public AwardInfo getAwardInfo(String awardTitle, String year) {
		Criteria crit = getSession().createCriteria(AwardInfo.class, "awardinfo");
		crit.add(Restrictions.eq("title", awardTitle));
		crit.add(Restrictions.eq("year", year));
		return (AwardInfo) crit.uniqueResult();
	}
}
