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
@Table(name="PastBorrowedAudioBooks")
public class PastBorrowedAudioBook {

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
    @Column(name = "dateExpired")
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate dateExpired;
	
	@Column(name = "bookRating")
	private Double bookRating;
	
	public PastBorrowedAudioBook(){}
	
	public PastBorrowedAudioBook(AudioBook audioBook, RegisteredUser user){
		this.user = user;
		this.audioBook = audioBook;	
		this.dateExpired = new LocalDate();
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
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof PastBorrowedAudioBook)){
            return false;
        }
        PastBorrowedAudioBook temp = (PastBorrowedAudioBook)obj;
        return (temp.getAudioBook().getAudioBookId() == this.getAudioBook().getAudioBookId());
    }
	
}
