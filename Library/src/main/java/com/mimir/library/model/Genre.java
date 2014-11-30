package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Store;

@Entity
@Table(name = "Genres")
public class Genre {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int genreId;
	
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
	@Column(name = "genre")
	private String genre;

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getGenreId() {
		return genreId;
	}

}
