package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;

import com.mimir.library.beans.AdminBook;
import com.mimir.library.enums.FormatType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.AudioBookLanguage;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.AudioBookRating;
import com.mimir.library.model.Author;
import com.mimir.library.model.AuthorAward;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookAward;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BookGenre;
import com.mimir.library.model.BookInterestLevel;
import com.mimir.library.model.BookRating;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBook;
import com.mimir.library.model.EBookFormat;
import com.mimir.library.model.EBookLanguage;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.EBookRating;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.LlamazonBook;
import com.mimir.library.model.Publisher;

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
			saveOrUpdate(bg.getGenre());
			save(bg);
		}
		//Book Interest Levels
		for(BookInterestLevel bil : book.getInterestLevels()){
			bil.setBook(book);
			System.out.println("Saving.." + bil.getInterestLevel().getInterestLevel());
			saveOrUpdate(bil.getInterestLevel());
			System.out.println("Saved." + bil.getInterestLevel().getInterestLevel());
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
	public String deleteBook(int whichBook, String bookFormat) {
		if(bookFormat.equalsIgnoreCase(GlobalConstants.EBOOK)){
			try{
				getSession().createSQLQuery("delete from Borrowedebooks where eBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Ebookholds where eBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Pastborrowedebooks where eBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Wishlistebooks where eBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				EBook eBook = (EBook) getSession().createCriteria(EBook.class).add(Restrictions.eq("eBookId", whichBook)).uniqueResult();
				//AudioBook audioBook = (AudioBook) getSession().createCriteria(AudioBook.class).add(Restrictions.eq("bookId", eBook.getBook().getBookId())).uniqueResult();
				//delete(audioBook);
				delete(eBook);	
			}catch(Exception e){
				System.out.println(e);
				return "ERROR";
			}
		}else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			try{
				getSession().createSQLQuery("delete from Borrowedaudiobooks where audioBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Audiobookholds where audioBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Pastborrowedaudiobooks where audioBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				getSession().createSQLQuery("delete from Wishlistaudiobooks where audioBookId= :bookId").setLong("bookId", whichBook).executeUpdate();
				AudioBook audioBook = (AudioBook) getSession().createCriteria(EBook.class).add(Restrictions.eq("audioBookId", whichBook)).uniqueResult();
				//EBook eBook = (EBook) getSession().createCriteria(AudioBook.class).add(Restrictions.eq("bookId", audioBook.getBook().getBookId())).uniqueResult();
				//delete(eBook);
				delete(audioBook);	
			}catch(Exception e){
				System.out.println(e);
				return "ERROR";
			}
		}
		return GlobalConstants.DAO_SUCCESS;
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
		specificBook.add(Restrictions.eq("eBookId", bookId));
		EBook eBook = (EBook) specificBook.uniqueResult();
		Hibernate.initialize(eBook.getBook().getAuthors());
		Hibernate.initialize(eBook.getBook().getGenres());
		Hibernate.initialize(eBook.geteBookFormats());
		Hibernate.initialize(eBook.getLanguages());
		return eBook;
	}
	@Override
	public AudioBook getSpecificAudioBook(int audioBookId) {
		Criteria specificBook = getSession().createCriteria(AudioBook.class, "audioBook");
		specificBook.add(Restrictions.eq("audioBookId", audioBookId));
		AudioBook audioBook = (AudioBook) specificBook.uniqueResult();
		Hibernate.initialize(audioBook.getBook().getAuthors());
		Hibernate.initialize(audioBook.getBook().getGenres());
		Hibernate.initialize(audioBook.getAudioBookFormats());
		Hibernate.initialize(audioBook.getLanguages());
		return audioBook;
	}

	@Override
	public void decrementAudioBookAvailableCopies(AudioBook aBook) {
		if(aBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED) return;
		aBook.setRemainingCopies(new Integer(aBook.getRemainingCopies().intValue()-1));
		getSession().merge(aBook);
		System.out.println("DEBUG - AudioBook remaining copies decremented.");
	}

	@Override
	public void decrementEBookAvailableCopies(EBook eBook) {
		if(eBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED) return;
		eBook.setRemainingCopies(new Integer(eBook.getRemainingCopies().intValue()-1));
		getSession().merge(eBook);
		System.out.println("DEBUG - EBook remaining copies decremented.");
	}

	@Override
	public void incrementAudioBookAvailableCopies(AudioBook aBook) {
		if(aBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED) return;
		aBook.setRemainingCopies(new Integer(aBook.getRemainingCopies().intValue()+1));
		getSession().merge(aBook);
	}

	@Override
	public void incrementEBookAvailableCopies(EBook eBook) {
		if(eBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED) return;
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
	
	@Override
	public void updateBookRating(AudioBookRating rating){
		getSession().merge(rating);
	}
	
	@Override
	public void updateBookRating(BookRating rating){
		getSession().merge(rating);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdminBook> getAllBooksForAdmin() {
		List<AdminBook> adminBooks = new ArrayList<AdminBook>();
		List<Book> books = getSession().createCriteria(Book.class).list();
		for(Book book: books){
			//EBook
			if(book.getEBook() != null){
				adminBooks.add(new AdminBook(book.getEBook()));
			}
			//AUDIOBOOK
			if(book.getAudioBook() != null){
				adminBooks.add(new AdminBook(book.getAudioBook()));
			}
		}
		return adminBooks;
	}

	private int getTotalCopies(AudioBook audioBook) {
		int availableCopies = audioBook.getRemainingCopies();
		Criteria crit = getSession().createCriteria(BorrowedAudioBook.class);
		crit.setProjection(Projections.rowCount());
		crit.add(Restrictions.eq("audioBook.audioBookId", audioBook.getAudioBookId()));
		int totalCopies = availableCopies + ((Long) crit.uniqueResult()).intValue();
		return totalCopies;
	}
	private int getTotalCopies(EBook eBook) {
		int availableCopies = eBook.getRemainingCopies();
		Criteria crit = getSession().createCriteria(BorrowedEBook.class);
		crit.setProjection(Projections.rowCount());
		crit.add(Restrictions.eq("eBook.eBookId", eBook.getEBookId()));
		int totalCopies = availableCopies + ((Long) crit.uniqueResult()).intValue();
		return totalCopies;
	}
	private int getNumberOfHolds(AudioBook audioBook) {
		Criteria crit = getSession().createCriteria(AudioBookOnHold.class);
		crit.setProjection(Projections.rowCount());
		crit.add(Restrictions.eq("audioBook.audioBookId", audioBook.getAudioBookId()));
		return ((Long) crit.uniqueResult()).intValue();
	}
	private int getNumberOfHolds(EBook eBook) {
		Criteria crit = getSession().createCriteria(EBookOnHold.class);
		crit.setProjection(Projections.rowCount());
		crit.add(Restrictions.eq("eBook.eBookId", eBook.getEBookId()));
		return ((Long) crit.uniqueResult()).intValue();
	}

	@Override
	public int getTotalCopiesOfEBook(EBook eBook) {
		return getTotalCopies(eBook);
	}

	@Override
	public int getTotalCopiesOfAudioBook(AudioBook audioBook) {
		return getTotalCopies(audioBook);
	}

	@Override
	public boolean updateBook(AdminBook book) {
		try{
			if(book.getFormatType().equals(GlobalConstants.EBOOK)){
				EBook eBook = (EBook) getSession().createCriteria(EBook.class).add(Restrictions.eq("eBookId", book.getFormatId())).uniqueResult();
				eBook.getBook().getBookDisplay().setTitle(book.getBookTitle());
				eBook.getBook().getAuthors().iterator().next().setName(book.getAuthor());
				setEBookFormats(eBook, book.getFormats());
				int previousTotalCopies = getTotalCopiesOfEBook(eBook);
				setEBookCopies(eBook, previousTotalCopies, book.getTotalCopies());
				book.setAvailableCopies(eBook.getRemainingCopies());
				for(EBookFormat bf : eBook.geteBookFormats()){
					bf.seteBook(eBook);
					saveOrUpdate(bf);
					System.out.println("DEBUG - Format " + bf.getFormat().getFormatType());
				}
				saveOrUpdate(eBook);
			}else if(book.getFormatType().equals(GlobalConstants.AUDIOBOOK)){
				AudioBook audioBook = (AudioBook) getSession().createCriteria(AudioBook.class).add(Restrictions.eq("audioBookId", book.getFormatId())).uniqueResult();
				audioBook.getBook().getBookDisplay().setTitle(book.getBookTitle());
				audioBook.getBook().getAuthors().iterator().next().setName(book.getAuthor());
				setAudioBookFormats(audioBook, book.getFormats());
				int previousTotalCopies = getTotalCopiesOfAudioBook(audioBook);
				setAudioBookCopies(audioBook, previousTotalCopies, book.getTotalCopies());
				book.setAvailableCopies(audioBook.getRemainingCopies());
				for(AudioBookFormat bf : audioBook.getAudioBookFormats()){
					bf.setAudioBook(audioBook);
					saveOrUpdate(bf);
					System.out.println("DEBUG - Format " + bf.getFormat().getFormatType());
				}
				saveOrUpdate(audioBook);
			}
		}catch(Exception e){
			System.out.println(e);
			return false;
		}
		
		return true;
	}

	private void setEBookCopies(EBook eBook, int previousTotalCopies, int totalCopies) {
		if(previousTotalCopies > totalCopies){
			if(eBook.getRemainingCopies() - (previousTotalCopies-totalCopies) >= 0){
				eBook.setRemainingCopies(eBook.getRemainingCopies() - (previousTotalCopies-totalCopies));
			}
		}
		if(totalCopies > previousTotalCopies){
			eBook.setRemainingCopies(eBook.getRemainingCopies() + (totalCopies - previousTotalCopies));
		}		
	}
	
	private void setAudioBookCopies(AudioBook audioBook, int previousTotalCopies, int totalCopies) {
		if(previousTotalCopies > totalCopies){
			if(audioBook.getRemainingCopies() - (previousTotalCopies-totalCopies) >= 0){
				audioBook.setRemainingCopies(audioBook.getRemainingCopies() - (previousTotalCopies-totalCopies));
			}
		}
		if(totalCopies > previousTotalCopies){
			audioBook.setRemainingCopies(audioBook.getRemainingCopies() + (totalCopies - previousTotalCopies));
		}	
	}

	private void setEBookFormats(EBook eBook, String formats) {
		List<String> formatTypes = new ArrayList<String>();
		String[] split = formats.split(",");
		for(String s : split){
			formatTypes.add(s);
		}
		//Add any new formats
		boolean contained = false;
		for(String format : formatTypes){
			for(EBookFormat bf : eBook.geteBookFormats()){
				if(bf.getFormat().getFormatType().equalsIgnoreCase(format)){
					contained = true;
				}
			}
			if(!contained){
				//Add it
				EBookFormat bookFormat = new EBookFormat();
				Format f = getFormat(format);
				bookFormat.setFormat(f);
				bookFormat.setFileSize(new Integer(999));
				bookFormat.setReleaseDate(new LocalDate());
				eBook.geteBookFormats().add(bookFormat);
			}
			contained = false;
		}
		//Now delete any formats that were changed...
		contained = false;
		Iterator<EBookFormat> it = eBook.geteBookFormats().iterator();
		while(it.hasNext()){
			EBookFormat bf = it.next();
			for(String format : formatTypes){
				if(bf.getFormat().getFormatType().equalsIgnoreCase(format)){
					contained = true;
				}
			}
			if(!contained){
				it.remove();
				delete(bf);
			}
			contained = false;
		}
	}
	
	private void setAudioBookFormats(AudioBook audioBook, String formats) {
		List<String> formatTypes = new ArrayList<String>();
		String[] split = formats.split(",");
		for(String s : split){
			formatTypes.add(s);
		}
		//Add any new formats
		boolean contained = false;
		for(String format : formatTypes){
			for(AudioBookFormat bf : audioBook.getAudioBookFormats()){
				if(bf.getFormat().getFormatType().equalsIgnoreCase(format)){
					contained = true;
				}
			}
			if(!contained){
				//Add it
				AudioBookFormat bookFormat = new AudioBookFormat();
				Format f = getFormat(format);
				bookFormat.setFormat(f);
				bookFormat.setFileSize(new Integer(999));
				bookFormat.setReleaseDate(new LocalDate());
				audioBook.getAudioBookFormats().add(bookFormat);
			}
			contained = false;
		}
		//Now delete any formats that were changed...
		contained = false;
		Iterator<AudioBookFormat> it = audioBook.getAudioBookFormats().iterator();
		while(it.hasNext()){
			AudioBookFormat bf = it.next();
			for(String format : formatTypes){
				if(bf.getFormat().getFormatType().equalsIgnoreCase(format)){
					contained = true;
				}
			}
			if(!contained){
				it.remove();
				delete(bf);
			}
			contained = false;
		}
	}
}
