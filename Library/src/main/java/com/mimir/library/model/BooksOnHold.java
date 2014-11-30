package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class BooksOnHold {

	private Collection<String> booksOnHold;

	public BooksOnHold(){
		booksOnHold = new LinkedList<String>();
	}
	public Collection<String> getBooksOnHold() {
		return booksOnHold;
	}

	public void setBooksOnHold(Collection<String> booksOnHold) {
		this.booksOnHold = booksOnHold;
	}

}
