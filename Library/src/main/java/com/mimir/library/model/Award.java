package com.mimir.library.model;

public class Award {

	private String title;
	private String description;
	private String year;
	
	public Award(){
		
	}
	public Award(String title, String description, String year){
		this.title = title;
		this.description = description;
		this.year = year;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
}
