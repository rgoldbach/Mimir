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

import com.mimir.library.globalVariables.GlobalConstants;

@Entity
@Table(name="PastBorrowedEBooks")
public class PastBorrowedEBook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@NotNull
    @DateTimeFormat(pattern="dd/MM/yyyy") 
    @Column(name = "dateExpired")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateExpired;
	
	@Column(name = "bookRating")
	private Double bookRating;

	public PastBorrowedEBook(){}
	
	public PastBorrowedEBook(EBook eBook, RegisteredUser user){
		this.user = user;
		this.eBook = eBook;	
		this.dateExpired = new LocalDate();
	}
	
	public PastBorrowedEBook(BorrowedEBook borrowedEBook){
		this.user = borrowedEBook.getUser();
		this.eBook = borrowedEBook.getEBook();
		this.dateExpired = borrowedEBook.getDateExpires();
		this.bookRating = borrowedEBook.getBookRating();
	}

	public int getId() {
		return id;
	}
	public LocalDate getDateExpired() {
		return dateExpired;
	}
	public void setDateExpired(LocalDate dateExpired) {
		this.dateExpired = dateExpired;
	}
	public Double getBookRating() {
		return bookRating;
	}
	public void setBookRating(Double bookRating) {
		this.bookRating = bookRating;
	}
	public RegisteredUser getUser() {
		return user;
	}
	public void setUser(RegisteredUser user) {
		this.user = user;
	}
	public EBook getEBook() {
		return eBook;
	}
	public void setEBook(EBook eBook) {
		this.eBook = eBook;
	}
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof PastBorrowedEBook)){
            return false;
        }
        PastBorrowedEBook temp = (PastBorrowedEBook)obj;
        return (temp.getEBook().getEBookId() == this.getEBook().getEBookId());
    }
}
