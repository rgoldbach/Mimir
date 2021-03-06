package com.mimir.library.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;


@Entity
@Indexed
@Table(name="Books")
public class Book {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookId;
	
	//Eager because we will always want authors...
	@IndexedEmbedded
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "Authors_Books", joinColumns = { 
			@JoinColumn(name = "bookId", nullable = false, updatable = false) }, 
			inverseJoinColumns = { @JoinColumn(name = "authorId", 
					nullable = false, updatable = false) })
	private Collection<Author> authors;
	
	@OneToMany(mappedBy = "book")
	private Collection<BookAward> awards;

	@IndexedEmbedded
	@OneToMany(mappedBy = "book")
	private Collection<BookGenre> genres;
	
	@OneToMany(mappedBy = "book")
	private Collection<BookInterestLevel> interestLevels;
	
	@IndexedEmbedded
	@OneToOne(mappedBy = "book")
	private BookDisplayableInformation bookDisplay;
	
	@OneToOne(mappedBy = "book")
	private EBook eBook;
	
	@OneToOne(mappedBy = "book")
	private AudioBook audioBook;
	
	@Column(name = "isbn")
	private String isbn;
	
	@Column(name = "seriesName")
	private String seriesName;
	
	public Book(){
		this.audioBook = new AudioBook();
		this.eBook = new EBook();
		this.authors = new ArrayList<Author>();
		this.awards = new ArrayList<BookAward>();
		this.bookDisplay = new BookDisplayableInformation();
		this.genres = new ArrayList<BookGenre>();
		this.interestLevels = new ArrayList<BookInterestLevel>();
	}

	public int getBookId() {
		return bookId;
	}

	public Collection<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(Collection<Author> authors) {
		this.authors = authors;
	}

	public Collection<BookAward> getAwards() {
		return awards;
	}

	public void setAwards(Collection<BookAward> awards) {
		this.awards = awards;
	}

	public BookDisplayableInformation getBookDisplay() {
		return bookDisplay;
	}

	public void setBookDisplay(BookDisplayableInformation bookDisplay) {
		bookDisplay.setBook(this);
		this.bookDisplay = bookDisplay;
	}

	public EBook getEBook() {
		return eBook;
	}

	public void setEBook(EBook eBook) {
		this.eBook = eBook;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getSeriesName() {
		return seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}
	
	public void setBookId(int id){
		bookId = id;
	}

	@Override
	public String toString(){
		String output = "";
		if(bookDisplay != null){
			output += "Book: " + this.getBookDisplay().getTitle() + "\n";
		}
		else{
			output += "BookDisplayableInfo is null!";
		}
		if(authors != null){
			for(Author author : this.getAuthors()){			
				output += "Author: " + author.getName() + "\n";
			}	
		}
		else{
			output += "Authors are null!\n";
		}
		return output;
	}

	public Collection<BookGenre> getGenres() {
		return genres;
	}

	public void setGenres(Collection<BookGenre> genres) {
		this.genres = genres;
	}

	public Collection<BookInterestLevel> getInterestLevels() {
		return interestLevels;
	}

	public void setInterestLevels(Collection<BookInterestLevel> interestLevels) {
		this.interestLevels = interestLevels;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
	}
	
}
