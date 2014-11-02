package com.mimir.library.model;

public class ContactInformation {

	private String address;
	private String state;
	private String city;
	private String zip;
	private String phoneNumber;
	
	public ContactInformation(){
		
	}
	public ContactInformation(String address, String state, String city, String zip, String phoneNumber){
		this.address = address;
		this.state = state;
		this.city = city;
		this.zip = zip;
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
	
}
