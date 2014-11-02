package com.mimir.library.model;

public class Library {

	private String name;
	private ContactInformation contactInformation;
	
	public Library(){
		
	}
	public Library(String name, ContactInformation contactInformation){
		this.name = name; 
		this.contactInformation = contactInformation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ContactInformation getContactInformation() {
		return contactInformation;
	}
	public void setContactInformation(ContactInformation contactInformation) {
		this.contactInformation = contactInformation;
	}
	
}
