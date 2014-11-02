package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class Book {

	private BookDisplayableInformation bookDisplay;
	private Collection<Award> awards;
	private TypeInformation typeInformation;
	private TitleInformation titleInformation;
	
	public Book(BookDisplayableInformation bookDisplay, TypeInformation typeInfo, TitleInformation titleInfo){
		this.bookDisplay = bookDisplay;
		this.awards = new LinkedList<Award>();
		this.typeInformation = typeInfo;
		this.titleInformation = titleInfo;
	}
	public BookDisplayableInformation getBookDisplay() {
		return bookDisplay;
	}
	public void setBookDisplay(BookDisplayableInformation bookDisplay) {
		this.bookDisplay = bookDisplay;
	}
	public Collection<Award> getAwards() {
		return awards;
	}
	public void setAwards(Collection<Award> awards) {
		this.awards = awards;
	}
	public TypeInformation getTypeInformation() {
		return typeInformation;
	}
	public void setTypeInformation(TypeInformation typeInformation) {
		this.typeInformation = typeInformation;
	}
	public TitleInformation getTitleInformation() {
		return titleInformation;
	}
	public void setTitleInformation(TitleInformation titleInformation) {
		this.titleInformation = titleInformation;
	}
	
}
