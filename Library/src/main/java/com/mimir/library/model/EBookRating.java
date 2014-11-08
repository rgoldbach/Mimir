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
@Table(name="EBookRatings")
public class EBookRating extends BookRating{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookRatingId;
	
	@OneToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@Column(name = "numberOfRatings")
	private int numberOfRatings;
	
	@Column(name = "sumOfRatings")
	private double sumOfRatings;
	
	private double rating;
	
	public EBookRating(){
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
	public int getBookRatingId() {
		return bookRatingId;
	}
	public EBook geteBook() {
		return eBook;
	}
	public void seteBook(EBook eBook) {
		this.eBook = eBook;
	}
	
}
