package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="BookTextRatings")
public class BookRating {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookRatingId;
	
	@OneToOne
	@JoinColumn(name = "bookTextFormatId")
	private BookTextFormat bookTextFormat;
	
	@Column(name = "numberOfRatings")
	private int numberOfRatings;
	
	@Column(name = "sumOfRatings")
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
		rating = sumOfRatings / numberOfRatings;
	}
	public BookTextFormat getBookTextFormat() {
		return bookTextFormat;
	}
	public void setBookTextFormat(BookTextFormat bookTextFormat) {
		this.bookTextFormat = bookTextFormat;
	}
	public int getBookRatingId() {
		return bookRatingId;
	}
}
