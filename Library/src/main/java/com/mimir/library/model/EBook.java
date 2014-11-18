package com.mimir.library.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="EBooks")
public class EBook {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookId;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;
	
	@OneToOne
	@JoinColumn(name = "publisherId")
	private Publisher publisher;
	
	@OneToOne(mappedBy = "eBook")
	private EBookRating bookRating;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookOnHold> booksOnHold;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookFormat> eBookFormats;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookLanguage> languages;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookLicense> eBookLicenses;
	
	public EBook(){
		
	}
	
	public EBook(Book book){
		this.setBook(book);
	}

	public int getEBookId() {
		return eBookId;
	}

	public void setEBookId(int eBookId) {
		this.eBookId = eBookId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public EBookRating getBookRating() {
		return bookRating;
	}

	public void setBookRating(EBookRating bookRating) {
		this.bookRating = bookRating;
	}

	public Collection<EBookOnHold> getBooksOnHold() {
		return booksOnHold;
	}

	public void setBooksOnHold(Collection<EBookOnHold> booksOnHold) {
		this.booksOnHold = booksOnHold;
	}

	public Collection<EBookFormat> geteBookFormats() {
		return eBookFormats;
	}

	public void seteBookFormats(Collection<EBookFormat> eBookFormats) {
		this.eBookFormats = eBookFormats;
	}

	public Collection<EBookLanguage> getLanguages() {
		return languages;
	}

	public void setLanguages(Collection<EBookLanguage> languages) {
		this.languages = languages;
	}

	public Collection<EBookLicense> geteBookLicenses() {
		return eBookLicenses;
	}

	public void seteBookLicenses(Collection<EBookLicense> eBookLicenses) {
		this.eBookLicenses = eBookLicenses;
	}

}
