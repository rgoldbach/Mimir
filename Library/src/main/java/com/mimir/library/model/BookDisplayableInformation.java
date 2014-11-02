package com.mimir.library.model;

import java.util.Date;

public class BookDisplayableInformation {

	private String bookId;
	private String title;
	private String description;
	private Date dateAdded;
	private String imageFilePath;
	private Author author;
	
	public BookDisplayableInformation(){
		
	}
	public BookDisplayableInformation(String bookId, String title, String description, Date dateAdded, String imageFilePath, Author author){
		this.bookId = bookId;
		this.title = title;
		this.description = description;
		this.dateAdded = dateAdded;
		this.imageFilePath = imageFilePath;
		this.author = author;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
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
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	
}
