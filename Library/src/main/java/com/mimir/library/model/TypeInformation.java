package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class TypeInformation {

	private Collection<Genre> genres;
	private Collection<InterestLevel> interestLevels;
	
	public TypeInformation(){
		this.genres = new LinkedList<Genre>();
		this.interestLevels = new LinkedList<InterestLevel>();
	}
	public Collection<Genre> getGenres() {
		return genres;
	}
	public void setGenres(Collection<Genre> genres) {
		this.genres = genres;
	}
	public Collection<InterestLevel> getInterestLevel() {
		return interestLevels;
	}
	public void setInterestLevel(Collection<InterestLevel> interestLevels) {
		this.interestLevels = interestLevels;
	}
	
}
