package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="EBookLanguages")
public class EBookLanguage {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookLanguageId;
	
	@ManyToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@OneToOne
	@JoinColumn(name = "languageId")
	private Language language;
	
}
