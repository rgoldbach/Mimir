package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="EBookRatings")
public class EBookRating extends BookRating{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookRatingId;
	
	@OneToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@Column(name = "numberOfRatings")
	private int numberOfRatings;
	
	@Column(name = "sumOfRatings")
	private double sumOfRatings;
	
	@Transient
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
	public EBook geteBook() {
		return eBook;
	}
	public void seteBook(EBook eBook) {
		this.eBook = eBook;
	}
	public int geteBookRatingId() {
		return eBookRatingId;
	}
	public void seteBookRatingId(int eBookRatingId) {
		this.eBookRatingId = eBookRatingId;
	}
	
}
