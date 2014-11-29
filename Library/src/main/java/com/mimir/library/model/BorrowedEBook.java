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
@Table(name="BorrowedEBooks")
public class BorrowedEBook {
	
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
    @Column(name = "dateExpires")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateExpires;
	
	@Column(name = "bookRating")
	private Double bookRating;
	
	@Column(name = "eBookKey")
	private String eBookCode;


	public BorrowedEBook(){}
	
	public BorrowedEBook(EBook eBook, RegisteredUser user){
		this.user = user;
		this.eBook = eBook;	
		this.dateExpires = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
	}
	
	public int getId() {
		return id;
	}
	public RegisteredUser getUser() {
		return user;
	}
	public LocalDate getDateExpires() {
		return dateExpires;
	}
	public void setDateExpires(LocalDate dateExpires) {
		this.dateExpires = dateExpires;
	}
	public Double getBookRating() {
		return bookRating;
	}
	public void setBookRating(Double bookRating) {
		this.bookRating = bookRating;
	}
	public EBook getEBook() {
		return eBook;
	}
	public void setEBook(EBook eBook) {
		this.eBook = eBook;
	}
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof BorrowedEBook)){
            return false;
        }
        BorrowedEBook temp = (BorrowedEBook)obj;
        return (temp.getEBook().getEBookId() == this.getEBook().getEBookId());
    }

	public String getEBookCode() {
		return eBookCode;
	}

	public void setEBookCode(String eBookCode) {
		this.eBookCode = eBookCode;
	}
}
