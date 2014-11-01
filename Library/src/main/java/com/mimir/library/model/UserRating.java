package com.mimir.library.model;

public class UserRating {

	private double bookRating;
	
	public UserRating(double bookRating){
		this.setBookRating(bookRating);
	}

	public double getBookRating() {
		return bookRating;
	}

	public void setBookRating(double bookRating) {
		this.bookRating = bookRating;
	}
	
	
}
