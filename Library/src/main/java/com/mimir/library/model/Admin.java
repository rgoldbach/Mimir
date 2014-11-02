package com.mimir.library.model;

import com.mimir.library.enums.AccountType;

public class Admin extends User{

	private Library library;
	
	public Admin(String id, String firstName, String lastName, Library library) {
		super(id, firstName, lastName, AccountType.Admin);
		this.library = library;
	}

	public Library getLibrary() {
		return library;
	}
	public void setLibrary(Library library) {
		this.library = library;
	}

}
