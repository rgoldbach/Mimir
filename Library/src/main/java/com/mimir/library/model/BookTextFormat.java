package com.mimir.library.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="BookTextFormats")
public class BookTextFormat {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private String bookTextFormatId;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;
	
	@OneToOne
	@JoinColumn(name = "publisherId")
	private Publisher publisher;
	
	@OneToOne(mappedBy = "bookTextFormat")
	private BookRating bookRating;
	
	//private Collection<BooksOnHold> booksOnHold;
	
	//private Collection<TextFormat> textFormats;
	
	//private Collection<Language> languages;

	
	public String getBookTextFormatId() {
		return bookTextFormatId;
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

}
