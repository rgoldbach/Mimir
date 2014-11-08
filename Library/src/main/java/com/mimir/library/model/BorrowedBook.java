package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="BorrowedBooks")
public class BorrowedBook {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "bookId")
	private Book book;
	
	@NotNull
    @DateTimeFormat(pattern="dd/MM/yyyy") 
    @Column(name = "dateExpires")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateExpires;
	
	@Column(name = "bookRating")
	private double bookRating;


	public int getId() {
		return id;
	}
	public RegisteredUser getUser() {
		return user;
	}
	public Book getBook() {
		return book;
	}
	public LocalDate getDateExpired() {
		return dateExpires;
	}
	public void setDateExpired(LocalDate dateExpires) {
		this.dateExpires = dateExpires;
	}
	public double getBookRating() {
		return bookRating;
	}
	public void setBookRating(double bookRating) {
		this.bookRating = bookRating;
	}
}
