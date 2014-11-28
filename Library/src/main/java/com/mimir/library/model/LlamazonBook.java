package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LlamazonBooks")
public class LlamazonBook {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int llamazonBookId;
	
	@Column(name = "title")
	private String bookTitle;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "bookImage")
	private String bookImage;
	
	@Column(name = "author")
	private String author;
	
	public LlamazonBook(){}
	
	public LlamazonBook(int bookId){
		this.llamazonBookId = bookId;
	}
	
	public int getLlamazonBookId() {
		return llamazonBookId;
	}
	public void setLlamazonBookId(int bookId) {
		this.llamazonBookId = bookId;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}

