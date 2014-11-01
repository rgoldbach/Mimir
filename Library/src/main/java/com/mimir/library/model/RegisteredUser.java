package com.mimir.library.model;

public class RegisteredUser {
	
	private int id;
	private String name;
	private String userName;
 
	public RegisteredUser(){
 
	}
 
	public RegisteredUser(int id, String lastName, String firstName) {
		this.id = id;
		this.name = lastName;
		this.userName = firstName;
	}
 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String lastName) {
		this.name = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String firstName) {
		this.userName = firstName;
	}
	
}
