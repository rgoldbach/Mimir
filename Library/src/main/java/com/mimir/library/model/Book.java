package com.mimir.library.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Books")
public class Book {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookId;
	
	@ManyToMany(mappedBy = "books")
	private Collection<Author> authors;
	
	@OneToMany(mappedBy = "book")
	private Collection<BookAward> awards;
	
	@OneToOne(mappedBy = "book")
	private BookDisplayableInformation bookDisplay;
	
	@OneToOne(mappedBy = "book")
	private BookTextFormat bookTextFormat;
	
	
	
	//private BookDisplayableInformation bookDisplay;
	//private Collection<Award> awards;
	//private TypeInformation typeInformation;
	//private TitleInformation titleInformation;
	
}
