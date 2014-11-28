package com.mimir.library.model;

import java.util.List;

public class BookModel {
	public int id;
	private String imageFilePath;
	private String type;
	private String title;
	private String description;
	private String publisher;
	private List<String> languages;
	private List<String> authors;
	private List<String> formatTypes;
	private double rating;
	private boolean available;
	private boolean inBookshelf;
	private boolean inWishlist;
	private boolean loggedIn;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImageFilePath() {
		return imageFilePath;
	}
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public List<String> getLanguages() {
		return languages;
	}
	public void setLanguages(List<String> languages) {
		this.languages = languages;
	}
	public List<String> getAuthors() {
		return authors;
	}
	public void setAuthors(List<String> authors) {
		this.authors = authors;
	}
	
	public List<String> getFormatTypes() {
		return formatTypes;
	}
	public void setFormatTypes(List<String> formatTypes) {
		this.formatTypes = formatTypes;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public boolean isInBookshelf() {
		return inBookshelf;
	}
	public void setInBookshelf(boolean inBookshelf) {
		this.inBookshelf = inBookshelf;
	}
	public boolean isInWishlist() {
		return inWishlist;
	}
	public void setInWishlist(boolean inWishlist) {
		this.inWishlist = inWishlist;
	}
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
	
	
	
}
