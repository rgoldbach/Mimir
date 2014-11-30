package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Publishers")
public class Publisher{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int publisherId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "information")
	private String information;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public int getPublisherId() {
		return publisherId;
	}
	
}
