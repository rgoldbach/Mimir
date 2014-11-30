package com.mimir.library.model;

public class AdvancedSearchForm {
	// Not sure if we want these values connected to the actual models?
	// this is also missing the levels & some other parts of advanced search.
	private String title;
	private String author;
	private String genre;
	private String language;
	private String publisher;
	private String award;
	private String added;
	private String format;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public String getAdded() {
		return added;
	}
	public void setAdded(String added) {
		this.added = added;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	
	@Override
	public String toString() {
		return "AdvancedSearchForm [title=" + title + ", author=" + author
				+ ", genre=" + genre + ", language=" + language
				+ ", publisher=" + publisher + ", award=" + award + ", added="
				+ added + ", format=" + format + "]";
	}
}
