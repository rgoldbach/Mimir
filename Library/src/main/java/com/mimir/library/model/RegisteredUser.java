package com.mimir.library.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="RegisteredUsers")
public class RegisteredUser{
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column(name = "libraryCard")
	private String libraryCardNumber;
	
	@OneToOne(mappedBy = "user")
	private UserAccountInfo accountInfo;
	
	@OneToOne(mappedBy = "user")
	private LoginCredentials loginCredentials;
	
	@OneToMany(mappedBy = "user")
	private Set<GenreInterest> genreInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<InterestLevelInterest> interestLevelInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<LanguageInterest> languageInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<BorrowedEBook> currentEBooks = null;
	
	@OneToMany(mappedBy = "user")
	private Set<PastBorrowedEBook> pastEBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<EBookOnHold> onHoldEBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<WishlistEBook> wishlistEBooks;
	
	
	public RegisteredUser(){
		
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

	public UserAccountInfo getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(UserAccountInfo accountInfo) {
		this.accountInfo = accountInfo;
	}

	public Set<GenreInterest> getGenreInterests() {
		return genreInterests;
	}

	public void setGenreInterests(Set<GenreInterest> genreInterests) {
		this.genreInterests = genreInterests;
	}

	public Set<InterestLevelInterest> getInterestLevelInterests() {
		return interestLevelInterests;
	}

	public void setInterestLevelInterests(Set<InterestLevelInterest> interestLevelInterests) {
		this.interestLevelInterests = interestLevelInterests;
	}

	public Set<LanguageInterest> getLanguageInterests() {
		return languageInterests;
	}

	public void setLanguageInterests(Set<LanguageInterest> languageInterests) {
		this.languageInterests = languageInterests;
	}

	public int getUserId() {
		return userId;
	}

	public Set<BorrowedEBook> getCurrentEBooks() {
		return currentEBooks;
	}

	public void setCurrentEBooks(Set<BorrowedEBook> currentEBooks) {
		this.currentEBooks = currentEBooks;
	}

	public Set<PastBorrowedEBook> getPastEBooks() {
		return pastEBooks;
	}

	public void setPastEBooks(Set<PastBorrowedEBook> pastEBooks) {
		this.pastEBooks = pastEBooks;
	}

	public Set<EBookOnHold> getOnHoldEBooks() {
		return onHoldEBooks;
	}

	public void setOnHoldEBooks(Set<EBookOnHold> onHoldEBooks) {
		this.onHoldEBooks = onHoldEBooks;
	}

	public Set<WishlistEBook> getWishlistEBooks() {
		return wishlistEBooks;
	}

	public void setWishlistEBooks(Set<WishlistEBook> wishlistEBooks) {
		this.wishlistEBooks = wishlistEBooks;
	}
	
	public void addBookToBookshelf(BorrowedEBook bookToBorrow){
		currentEBooks.add(bookToBorrow);
	}
	
}
