package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Books")
public class Book {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookId;
	
	//private BookDisplayableInformation bookDisplay;
	//private Collection<Award> awards;
	//private TypeInformation typeInformation;
	//private TitleInformation titleInformation;
	
}
