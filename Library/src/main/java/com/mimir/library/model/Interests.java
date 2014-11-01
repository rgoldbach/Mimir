package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class Interests {

	private Collection<Genre> genres;
	private Collection<InterestLevel> interestLevels;
	private Collection<Language> languages;
	
	public Interests(){
		this.genres = new LinkedList<Genre>();
		this.interestLevels	= new LinkedList<InterestLevel>();
		this.languages = new LinkedList<Language>();
	}
	
	public Interests(Collection<Genre> genres, Collection<InterestLevel> interestLevels, Collection<Language> languages){
		this.genres = genres;
		this.interestLevels	= interestLevels;
		this.languages = languages;
	}
	
	public Collection<Genre> getGenres() {
		return genres;
	}
	public void setGenres(Collection<Genre> genres) {
		this.genres = genres;
	}
	public Collection<InterestLevel> getInterestLevels() {
		return interestLevels;
	}
	public void setInterestLevels(Collection<InterestLevel> interestLevels) {
		this.interestLevels = interestLevels;
	}
	public Collection<Language> getLanguages() {
		return languages;
	}
	public void setLanguages(Collection<Language> languages) {
		this.languages = languages;
	}
}
