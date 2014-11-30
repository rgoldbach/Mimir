package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="BookAwards")
public class BookAward {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookAwardId;
	
	@OneToOne
	@JoinColumn(name = "awardId")
	private AwardInfo awardInfo;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;

	public int getBookAwardId() {
		return bookAwardId;
	}

	public AwardInfo getAwardInfo() {
		return awardInfo;
	}

	public void setAwardInfo(AwardInfo awardInfo) {
		this.awardInfo = awardInfo;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
}
