package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BookInterestLevels")
public class BookInterestLevel {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookInterestLevelId;
	
	@ManyToOne
	@JoinColumn(name="bookId")
	private Book book;
	
	@OneToOne
	@JoinColumn(name="interestLevelId")
	private InterestLevel interestLevel;


	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public InterestLevel getInterestLevel() {
		return interestLevel;
	}

	public void setInterestLevel(InterestLevel interestLevel) {
		this.interestLevel = interestLevel;
	}

	public int getBookInterestLevelId() {
		return bookInterestLevelId;
	}

	public void setBookInterestLevelId(int bookInterestLevelId) {
		this.bookInterestLevelId = bookInterestLevelId;
	}
	
}
