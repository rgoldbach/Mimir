package com.mimir.library.beans;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBook;

public class BasicBookInfo {

	public static final int MAX_TITLE_LENGTH = 14;
	public static final int MAX_AUTHOR_LENGTH = 16;
	
	private int bookFormatId;
	
	private String bookTitle;
	
	private String imageFilePath;
	
	private String author;
	
	private String format;

	public BasicBookInfo(){
		
	}
	
	public BasicBookInfo(AudioBook audioBook) {
		this.bookFormatId = audioBook.getAudioBookId();
		this.bookTitle = audioBook.getBook().getBookDisplay().getTitle();
		if(this.bookTitle.length() > MAX_TITLE_LENGTH){
			this.bookTitle = this.bookTitle.substring(0, MAX_TITLE_LENGTH) + "..";
		}
		this.imageFilePath = audioBook.getBook().getBookDisplay().getImageFilePath();
		this.author = audioBook.getBook().getAuthors().iterator().next().getName();
		if(this.author.length() > MAX_AUTHOR_LENGTH){
			this.author = this.author.substring(0, MAX_AUTHOR_LENGTH) + "..";
		}
		this.format = GlobalConstants.AUDIOBOOK;
	}
	
	public BasicBookInfo(EBook eBook){
		this.bookFormatId = eBook.getEBookId();
		this.bookTitle = eBook.getBook().getBookDisplay().getTitle();
		if(this.bookTitle.length() > MAX_TITLE_LENGTH){
			this.bookTitle = this.bookTitle.substring(0, MAX_TITLE_LENGTH) + "..";
		}
		this.imageFilePath = eBook.getBook().getBookDisplay().getImageFilePath();
		this.author = eBook.getBook().getAuthors().iterator().next().getName();
		if(this.author.length() > MAX_AUTHOR_LENGTH){
			this.author = this.author.substring(0, MAX_AUTHOR_LENGTH) + "..";
		}
		this.format = GlobalConstants.EBOOK;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
		if(this.bookTitle.length() > MAX_TITLE_LENGTH){
			this.bookTitle = this.bookTitle.substring(0, MAX_TITLE_LENGTH) + "..";
		}
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
		if(this.author.length() > MAX_AUTHOR_LENGTH){
			this.author = this.author.substring(0, MAX_AUTHOR_LENGTH) + "..";
		}
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public int getBookFormatId() {
		return bookFormatId;
	}

	public void setBookFormatId(int bookFormatId) {
		this.bookFormatId = bookFormatId;
	}
	
}
