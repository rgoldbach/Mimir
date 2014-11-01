package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class Bookshelf {
	
	private Collection<BookshelfBook> currentBooks;
	private Collection<BookshelfBook> pastBooks;
	
	public Bookshelf(){
		currentBooks = new LinkedList<BookshelfBook>();
		pastBooks = new LinkedList<BookshelfBook>();
	}
	public Collection<BookshelfBook> getCurrentBooks() {
		return currentBooks;
	}
	public void setCurrentBooks(Collection<BookshelfBook> currentBooks) {
		this.currentBooks = currentBooks;
	}
	public Collection<BookshelfBook> getPastBooks() {
		return pastBooks;
	}
	public void setPastBooks(Collection<BookshelfBook> pastBooks) {
		this.pastBooks = pastBooks;
	}
	
}
