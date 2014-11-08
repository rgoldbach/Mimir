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
	private Set<BorrowedBook> currentBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<PastBorrowedBook> pastBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<OnHoldBook> onHoldBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<WishlistBook> wishlistBooks;
	
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

	public Set<BorrowedBook> getCurrentBooks() {
		return currentBooks;
	}

	public void setCurrentBooks(Set<BorrowedBook> currentBooks) {
		this.currentBooks = currentBooks;
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

	public Set<PastBorrowedBook> getPastBooks() {
		return pastBooks;
	}

	public void setPastBooks(Set<PastBorrowedBook> pastBooks) {
		this.pastBooks = pastBooks;
	}

	public Set<OnHoldBook> getOnHoldBooks() {
		return onHoldBooks;
	}

	public void setOnHoldBooks(Set<OnHoldBook> onHoldBooks) {
		this.onHoldBooks = onHoldBooks;
	}

	public Set<WishlistBook> getWishlistBooks() {
		return wishlistBooks;
	}

	public void setWishlistBooks(Set<WishlistBook> wishlistBooks) {
		this.wishlistBooks = wishlistBooks;
	}

	public int getUserId() {
		return userId;
	}
	
}
