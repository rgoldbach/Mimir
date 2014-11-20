package com.mimir.library.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="AudioBooks")
public class AudioBook {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int audioBookId;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;
	
	@OneToOne
	@JoinColumn(name = "publisherId")
	private Publisher publisher;
	
	@OneToOne(mappedBy = "audioBook")
	private AudioBookRating bookRating;
	
	@OneToMany(mappedBy = "audioBook")
	private Collection<AudioBookOnHold> booksOnHold;
	
	@OneToMany(mappedBy = "audioBook")
	private Collection<AudioBookFormat> eBookFormats;
	
	@OneToMany(mappedBy = "audioBook")
	private Collection<AudioBookLanguage> languages;
	
	@OneToMany(mappedBy = "audioBook")
	private Collection<AudioBookLicense> eBookLicenses;
	
	@Column(name = "remainingCopies")
	private Integer remainingCopies;

	public int getAudioBookId() {
		return audioBookId;
	}

	public void setAudioBookId(int audioBookId) {
		this.audioBookId = audioBookId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public AudioBookRating getBookRating() {
		return bookRating;
	}

	public void setBookRating(AudioBookRating bookRating) {
		this.bookRating = bookRating;
	}

	public Collection<AudioBookOnHold> getBooksOnHold() {
		return booksOnHold;
	}

	public void setBooksOnHold(Collection<AudioBookOnHold> booksOnHold) {
		this.booksOnHold = booksOnHold;
	}

	public Collection<AudioBookFormat> geteBookFormats() {
		return eBookFormats;
	}

	public void seteBookFormats(Collection<AudioBookFormat> eBookFormats) {
		this.eBookFormats = eBookFormats;
	}

	public Collection<AudioBookLanguage> getLanguages() {
		return languages;
	}

	public void setLanguages(Collection<AudioBookLanguage> languages) {
		this.languages = languages;
	}

	public Collection<AudioBookLicense> geteBookLicenses() {
		return eBookLicenses;
	}

	public void seteBookLicenses(Collection<AudioBookLicense> eBookLicenses) {
		this.eBookLicenses = eBookLicenses;
	}

	public Integer getRemainingCopies() {
		return remainingCopies;
	}

	public void setRemainingCopies(Integer remainingCopies) {
		this.remainingCopies = remainingCopies;
	}
	
}