package com.mimir.library.model;

import com.mimir.library.enums.AccountType;

public abstract class User {
	
	private String firstName;
	private String lastName;
	private AccountType accountType;
	
	public User(){
		
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public AccountType getAccountType() {
		return accountType;
	}

	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

}
