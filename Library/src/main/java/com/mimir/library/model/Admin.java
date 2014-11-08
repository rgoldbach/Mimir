package com.mimir.library.model;

import com.mimir.library.enums.AccountType;

public class Admin{

	private Library library;
	
	public Admin(Library library) {
		this.library = library;
	}

	public Library getLibrary() {
		return library;
	}
	public void setLibrary(Library library) {
		this.library = library;
	}

}
