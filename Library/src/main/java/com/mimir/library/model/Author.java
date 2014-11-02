package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class Author {

	private String name;
	private String description;
	private Collection<Award> awards;
	
	public Author(){
		
	}
	public Author(String name, String description){
		this.name = name;
		this.description = description;
		this.awards = new LinkedList<Award>();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Collection<Award> getAwards() {
		return awards;
	}
	public void setAwards(Collection<Award> awards) {
		this.awards = awards;
	}
}
