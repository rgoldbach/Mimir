package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class Wishlist {

	//Refers to a collection of book ids
	private Collection<String> wishlistBooks;

	public Wishlist(){
		wishlistBooks = new LinkedList<String>();
	}
	public Collection<String> getWishlistBooks() {
		return wishlistBooks;
	}

	public void setWishlistBooks(Collection<String> wishlistBooks) {
		this.wishlistBooks = wishlistBooks;
	}
	
}
