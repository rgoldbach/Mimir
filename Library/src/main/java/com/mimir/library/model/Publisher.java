package com.mimir.library.model;

public class Publisher {

	private String name;
	private String information;
	private ContactInformation contactInformation;
	
	public Publisher(){
		
	}
	public Publisher(String name, String information, ContactInformation contactInformation){
		this.name = name;
		this.information = information;
		this.contactInformation = contactInformation;
	}
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
	public ContactInformation getContactInformation() {
		return contactInformation;
	}
	public void setContactInformation(ContactInformation contactInformation) {
		this.contactInformation = contactInformation;
	}
	
}
