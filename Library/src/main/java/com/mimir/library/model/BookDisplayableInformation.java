package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="BookDisplayableInfo")
public class BookDisplayableInformation {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookDisplayId;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
    @DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "dateAdded")
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateAdded;
	
	@Column(name = "imageFilePath")
	private String imageFilePath;
	
	//private Collection<String> authorNames;

	public int getBookDisplayId() {
		return bookDisplayId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDate dateAdded) {
		this.dateAdded = dateAdded;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	/*public Collection<String> getAuthorNames() {
		return authorNames;
	}

	public void setAuthorNames(Collection<String> authorNames) {
		this.authorNames = authorNames;
	}*/
	
	
	//TEMP CODE - ONLY TO KEEP ACCOUNTS CONTROLLER FROM ERRORING...
	/*private Author author;
	public Author getAuthor(){ return author; }
	public void setAuthor(Author author){ this.author = author; }
	private String bookId;
	public String getBookId(){ return bookId; }
	public void setBookId(String bookId){ this.bookId = bookId; }*/

	
}
