package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Authors")
public class Author {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int authorId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@OneToMany(mappedBy = "author")
	private Collection<AuthorAward> awards;
	
	@ManyToMany(mappedBy = "authors")	
	private Collection<Book> books;
	
	public Author(){
		
	}
	
	public Author(String name, String description){
		this.name = name;
		this.description = description;
		this.setBooks(new LinkedList<Book>());
	}

	public int getAuthorId() {
		return authorId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Collection<AuthorAward> getAwards() {
		return awards;
	}

	public void setAwards(Collection<AuthorAward> awards) {
		this.awards = awards;
	}

	public Collection<Book> getBooks() {
		return books;
	}

	public void setBooks(Collection<Book> books) {
		this.books = books;
	}

	
}
