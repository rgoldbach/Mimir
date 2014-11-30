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
@Table(name="AudioBookRatings")
public class AudioBookRating {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int audioBookRatingId;
	
	@OneToOne
	@JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@Column(name = "numberOfRatings")
	private int numberOfRatings;
	
	@Column(name = "sumOfRatings")
	private double sumOfRatings;
	
	@Transient
	private double rating;
	
	public AudioBookRating(){
		setNumberOfRatings(0);
		setSumOfRatings(0);
		setRating(0);
	}

	public int getAudioBookRatingId() {
		return audioBookRatingId;
	}

	public void setAudioBookRatingId(int audioBookRatingId) {
		this.audioBookRatingId = audioBookRatingId;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
	}

	public int getNumberOfRatings() {
		return numberOfRatings;
	}

	public void setNumberOfRatings(int numberOfRatings) {
		this.numberOfRatings = numberOfRatings;
	}

	public double getSumOfRatings() {
		return sumOfRatings;
	}

	public void setSumOfRatings(double sumOfRatings) {
		this.sumOfRatings = sumOfRatings;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public void incrementNumberOfRatings(){
		numberOfRatings++;
	}
	public void addToSumOfRatings(double rating){
		incrementNumberOfRatings();
		sumOfRatings += rating;
	}
	
	public void addRating(double rating){
		addToSumOfRatings(rating);
		this.rating = sumOfRatings/numberOfRatings;
	}
	
}
