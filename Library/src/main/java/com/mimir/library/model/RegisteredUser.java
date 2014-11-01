package com.mimir.library.model;

import com.mimir.library.enums.AccountType;

public class RegisteredUser extends User {
	
	private String libraryCardNumber;
	private LoginCredentials loginCredentials;
	private Interests interests;
	private Wishlist wishlist;
	private BooksOnHold booksOnHold;
	private Bookshelf bookshelf;
 
	public RegisteredUser(String id, String firstName, String lastName, String email, String password,
			AccountType accountType, String libraryCardNumber) {
		super(id, firstName, lastName, accountType);
		this.libraryCardNumber = libraryCardNumber;
		this.loginCredentials = new LoginCredentials(email, password);
		this.interests = new Interests();
		this.setWishlist(new Wishlist());
		this.setBooksOnHold(new BooksOnHold());
		this.setBookshelf(new Bookshelf());
	}
 
	public String getLibraryCardNumber(){ 
		return libraryCardNumber; 
	}
	
	public void setLibraryCardNumber(String libraryCardNumber){ 
		this.libraryCardNumber = libraryCardNumber; 
	}	

	public LoginCredentials getLoginCredentials() {
		return loginCredentials;
	}

	public void setLoginCredentials(LoginCredentials loginCredentials) {
		this.loginCredentials = loginCredentials;
	}

	public Interests getInterests() {
		return interests;
	}

	public void setInterests(Interests interests) {
		this.interests = interests;
	}

	public Wishlist getWishlist() {
		return wishlist;
	}

	public void setWishlist(Wishlist wishlist) {
		this.wishlist = wishlist;
	}

	public BooksOnHold getBooksOnHold() {
		return booksOnHold;
	}

	public void setBooksOnHold(BooksOnHold booksOnHold) {
		this.booksOnHold = booksOnHold;
	}

	public Bookshelf getBookshelf() {
		return bookshelf;
	}

	public void setBookshelf(Bookshelf bookshelf) {
		this.bookshelf = bookshelf;
	}
	
}
