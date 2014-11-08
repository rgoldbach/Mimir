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

import org.joda.time.LocalDate;

@Entity
@Table(name="EBookFormats")
public class EBookFormat {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookFormatId;
	
	@ManyToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@OneToOne
	@JoinColumn(name = "formatId")
	private Format format;
	
	@Column(name = "releaseDate")
	private LocalDate releaseDate;
	
	@Column(name = "fileSize")
	private String fileSize;
}
