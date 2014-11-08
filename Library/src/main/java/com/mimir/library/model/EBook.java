package com.mimir.library.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="EBooks")
public class EBook {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private String bookTextFormatId;
	
	@OneToOne
	@JoinColumn(name = "bookId")
	private Book book;
	
	@OneToOne
	@JoinColumn(name = "publisherId")
	private EBookPublisher publisher;
	
	@OneToOne(mappedBy = "eBook")
	private EBookRating bookRating;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookOnHold> booksOnHold;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookFormat> eBookFormats;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookLanguage> languages;
	
	@OneToMany(mappedBy = "eBook")
	private Collection<EBookLicense> eBookLicenses;

}
