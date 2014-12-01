package com.mimir.library.model;

public abstract class BookRating {

	private int bookRatingId;

	private EBook bookTextFormat;

	private int numberOfRatings;

	private double sumOfRatings;
	
	private double rating;
	
	public BookRating(){
		numberOfRatings = 0;
		sumOfRatings = 0;
		rating = 0;
	}
	public int getNumberOfRatings() {
		return numberOfRatings;
	}
	public void incrementNumberOfRatings(){
		numberOfRatings++;
	}
	public double getSumOfRatings() {
		return sumOfRatings;
	}
	public void addToSumOfRatings(double rating){
		incrementNumberOfRatings();
		sumOfRatings += rating;
	}
	public double getRating() {
		return rating;
	}
	public void addRating(double rating){
		addToSumOfRatings(rating);
		this.rating = (sumOfRatings/numberOfRatings);
	}
	public EBook getBookTextFormat() {
		return bookTextFormat;
	}
	public void setBookTextFormat(EBook bookTextFormat) {
		this.bookTextFormat = bookTextFormat;
	}
	public int getBookRatingId() {
		return bookRatingId;
	}
	public void updateRating(double newRating, double oldRating){
		// System.out.println("oldRAte" + oldRating);
		// System.out.println("newRating" + newRating);
		// System.out.println("oldSum"+ this.sumOfRatings);
		this.sumOfRatings = this.sumOfRatings - oldRating; 
		this.sumOfRatings = this.sumOfRatings + newRating;
		// System.out.println("newSum"+sumOfRatings);
		this.rating = (sumOfRatings/numberOfRatings);
	}
}
