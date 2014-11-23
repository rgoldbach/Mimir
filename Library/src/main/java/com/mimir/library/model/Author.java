package com.mimir.library.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Store;

@Entity
@Table(name="BAuthors")
public class Author {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int authorId;
	
	@Field(index=Index.YES, analyze=Analyze.NO, store=Store.NO)
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
		this.setBooks(new HashSet<Book>());
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
