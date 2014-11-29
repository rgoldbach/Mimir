package com.mimir.library.beans;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;

public class BasicBookInfo {

	private int bookId;
	
	private String bookTitle;
	
	private String imageFilePath;
	
	private String author;
	
	private String format;

	public BasicBookInfo(){
		
	}
	
	public BasicBookInfo(BorrowedEBook eBook) {
		this.bookId = eBook.getEBook().getBook().getBookId();
		this.bookTitle = eBook.getEBook().getBook().getBookDisplay().getTitle();
		this.imageFilePath = eBook.getEBook().getBook().getBookDisplay().getImageFilePath();
		this.author = eBook.getEBook().getBook().getAuthors().iterator().next().getName();
		this.format = GlobalConstants.EBOOK;
	}
	
	public BasicBookInfo(BorrowedAudioBook audioBook) {
		this.bookId = audioBook.getAudioBook().getBook().getBookId();
		this.bookTitle = audioBook.getAudioBook().getBook().getBookDisplay().getTitle();
		this.imageFilePath = audioBook.getAudioBook().getBook().getBookDisplay().getImageFilePath();
		this.author = audioBook.getAudioBook().getBook().getAuthors().iterator().next().getName();
		this.format = GlobalConstants.AUDIOBOOK;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}
	
}