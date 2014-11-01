package com.mimir.library.model;

import com.mimir.library.enums.AccountType;

public abstract class User {
	
	private String id;
	private String firstName;
	private String lastName;
	private AccountType accountType;
	
	public User(String id, String firstName, String lastName, AccountType accountType){
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.accountType = accountType;
	}
	
	public String getId(){ 
		return id;
	}
	public String getFirstName(){ 
		return firstName; 
	}
	public String getLastName(){ 
		return lastName; 
	}
	public AccountType getAccountType(){ 
		return accountType; 
	}	
	public void setId(String id){ 
		this.id = id; 
	}
	public void setFirstName(String firstName){ 
		this.firstName = firstName; 
	}
	public void setLastName(String lastName){ 
		this.lastName = lastName;
	}
	public void setAccountType(AccountType accountType){ 
		this.accountType = accountType; 
	}

}
