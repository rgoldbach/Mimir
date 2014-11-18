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
@Table(name="BorrowedAudioBooks")
public class BorrowedAudioBook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@NotNull
    @DateTimeFormat(pattern="dd/MM/yyyy") 
    @Column(name = "dateExpires")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateExpires;
	
	@Column(name = "bookRating")
	private Double bookRating;

	public BorrowedAudioBook(){}
	
	public BorrowedAudioBook(AudioBook audioBook, RegisteredUser user){
		this.user = user;
		this.audioBook = audioBook;	
		this.dateExpires = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
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
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof BorrowedAudioBook)){
            return false;
        }
        BorrowedAudioBook temp = (BorrowedAudioBook)obj;
        return (temp.getAudioBook().getAudioBookId() == this.getAudioBook().getAudioBookId());
    }
	
}
