package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.search.annotations.IndexedEmbedded;

@Entity
@Table(name = "BookGenres")
public class BookGenre {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookGenreId;
	
	@ManyToOne
	@JoinColumn(name="bookId")
	private Book book;
	
	@IndexedEmbedded
	@OneToOne
	@JoinColumn(name="genreId")
	private Genre genre;

	public int getBookGenreId() {
		return bookGenreId;
	}

	public void setBookGenreId(int bookGenreId) {
		this.bookGenreId = bookGenreId;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}
	
}
