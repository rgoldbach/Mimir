package com.mimir.library.beans;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.Book;
import com.mimir.library.model.EBook;
import com.mimir.library.model.EBookFormat;

public class AdminBook {

	private int formatId;
	private String formatType;
	private String isbn;
	private String bookTitle;
	private String author;
	private String formats;
	private int totalCopies;
	private int availableCopies;
	private int numberOfHolds;
	
	public AdminBook(){}
	
	public AdminBook(EBook eBook){
		//System.out.println("ID:" + eBook.getEBookId() + " and " + eBook + " and " + eBook.getBook() + " and " + eBook.getBook().getBookDisplay());
		this.setFormatId(eBook.getEBookId());
		this.setFormatType(GlobalConstants.EBOOK);
		this.isbn = eBook.getBook().getIsbn();
		this.bookTitle = eBook.getBook().getBookDisplay().getTitle();
		if(eBook.getBook().getAuthors().size() == 0){
			this.author = "Anonymous";
		}
		else{
			this.author = eBook.getBook().getAuthors().iterator().next().getName();
		}
		this.formats = getFormats(eBook);
		//this.setTotalCopies(totalCopies);
		this.setAvailableCopies(eBook.getRemainingCopies());
		this.numberOfHolds = eBook.getBooksOnHold().size();
	}
	private String getFormats(EBook eBook) {
		String formats = "";
		for(EBookFormat format : eBook.geteBookFormats()){
			formats += format.getFormat().getFormatType() + ", ";
		}
		formats = formats.substring(0, formats.length()-1);
		return formats;
	}

	public AdminBook(AudioBook audioBook){
		//System.out.println("ID:" + audioBook.getAudioBookId() + " and " + audioBook + " and " + audioBook.getBook() + " and " + audioBook.getBook().getBookDisplay());
		this.formatId = audioBook.getAudioBookId();
		this.formatType = GlobalConstants.AUDIOBOOK;
		this.isbn = audioBook.getBook().getIsbn();
		this.bookTitle = audioBook.getBook().getBookDisplay().getTitle();
		if(audioBook.getBook().getAuthors().size() == 0){
			this.author = "Anonymous";
		}
		else{
			this.author = audioBook.getBook().getAuthors().iterator().next().getName();
		}
		this.formats = getFormats(audioBook);
		//this.setTotalCopies(totalCopies);
		this.setAvailableCopies(audioBook.getRemainingCopies());
		this.numberOfHolds = audioBook.getBooksOnHold().size();
	}
	private String getFormats(AudioBook audioBook) {
		String formats = "";
		for(AudioBookFormat format : audioBook.getAudioBookFormats()){
			formats += format.getFormat().getFormatType() + ", ";
		}
		formats = formats.substring(0, formats.length()-1);
		return formats;
	}
	
	public AdminBook(EBook eBook, String creationType){
		if(creationType.equals("SIMPLE")){
			this.setFormatId(eBook.getEBookId());
			this.setFormatType(GlobalConstants.EBOOK);
			this.isbn = eBook.getBook().getIsbn();
			this.bookTitle = eBook.getBook().getBookDisplay().getTitle();
			if(eBook.getBook().getAuthors().size() == 0){
				this.author = "Anonymous";
			}
			else{
				this.author = eBook.getBook().getAuthors().iterator().next().getName();
			}
			this.formats = getFormats(eBook);
		}
	}
	public AdminBook(AudioBook audioBook, String creationType){
		if(creationType.equals("SIMPLE")){
			this.setFormatId(audioBook.getAudioBookId());
			this.setFormatType(GlobalConstants.EBOOK);
			this.isbn = audioBook.getBook().getIsbn();
			this.bookTitle = audioBook.getBook().getBookDisplay().getTitle();
			if(audioBook.getBook().getAuthors().size() == 0){
				this.author = "Anonymous";
			}
			else{
				this.author = audioBook.getBook().getAuthors().iterator().next().getName();
			}
			this.formats = getFormats(audioBook);
		}
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFormats() {
		return formats;
	}
	public void setFormats(String formats) {
		this.formats = formats;
	}

	public int getFormatId() {
		return formatId;
	}

	public void setFormatId(int formatId) {
		this.formatId = formatId;
	}

	public String getFormatType() {
		return formatType;
	}

	public void setFormatType(String formatType) {
		this.formatType = formatType;
	}

	public int getTotalCopies() {
		return totalCopies;
	}

	public void setTotalCopies(int totalCopies) {
		this.totalCopies = totalCopies;
	}

	public int getAvailableCopies() {
		return availableCopies;
	}

	public void setAvailableCopies(int availableCopies) {
		this.availableCopies = availableCopies;
	}

	public int getNumberOfHolds() {
		return numberOfHolds;
	}

	public void setNumberOfHolds(int numberOfHolds) {
		this.numberOfHolds = numberOfHolds;
	}

	
}
