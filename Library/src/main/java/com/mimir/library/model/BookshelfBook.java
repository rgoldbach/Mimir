package com.mimir.library.model;

import java.util.Date;

import com.mimir.library.exceptions.NotImplementedException;

public class BookshelfBook {

	private Date dateExpires;
	private Object key;
	private UserRating userRating;
	private String bookId;
	
	public BookshelfBook(String bookId){
		this.dateExpires = createExpirationDate();
		this.key = generateKey();
		this.userRating = null;
		this.bookId = bookId;
	}
	public Date getDateExpires() {
		return dateExpires;
	}
	public void setDateExpires(Date dateExpires){
		throw new NotImplementedException();
	}
	public Date createExpirationDate(){
		throw new NotImplementedException();
	}
	public Object getKey() {
		return key;
	}
	public Object generateKey(){
		throw new NotImplementedException();
	}
	public UserRating getUserRating() {
		return userRating;
	}
	public void setUserRating(UserRating userRating) {
		this.userRating = userRating;
	}
	public String getBookId() {
		return bookId;
	}
	
}
