package com.mimir.library.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="RegisteredUsers")
public class RegisteredUser{
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int regUserId;
	
	@Column(name = "libraryCard")
	private String libraryCardNumber;
	
	@Column(name = "userCode")
	private String userCode;
	
	@OneToOne
	@JoinColumn(name = "accountInfoId")
	private AccountInfo accountInfo;
	
	@OneToMany(mappedBy = "user")
	private Set<GenreInterest> genreInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<InterestLevelInterest> interestLevelInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<LanguageInterest> languageInterests;
	
	@OneToMany(mappedBy = "user")
	private Set<BorrowedEBook> borrowedEBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<PastBorrowedEBook> pastBorrowedEBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<EBookOnHold> eBookHolds;
	
	@OneToMany(mappedBy = "user")
	private Set<WishlistEBook> wishlistEBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<BorrowedAudioBook> borrowedAudioBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<PastBorrowedAudioBook> pastBorrowedAudioBooks;
	
	@OneToMany(mappedBy = "user")
	private Set<AudioBookOnHold> audioBookHolds;
	
	@OneToMany(mappedBy = "user")
	private Set<WishlistAudioBook> wishlistAudioBooks;
	
	
	public RegisteredUser(){
		
	}
 
	public String getLibraryCardNumber(){ 
		return libraryCardNumber; 
	}
	
	public void setLibraryCardNumber(String libraryCardNumber){ 
		this.libraryCardNumber = libraryCardNumber; 
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

	public Set<WishlistEBook> getWishlistEBooks() {
		return wishlistEBooks;
	}

	public void setWishlistEBooks(Set<WishlistEBook> wishlistEBooks) {
		this.wishlistEBooks = wishlistEBooks;
	}
	
	public void addBookToBookshelf(BorrowedEBook bookToBorrow){
		borrowedEBooks.add(bookToBorrow);
	}
	public void addBookToBookshelf(BorrowedAudioBook bookToBorrow){
		borrowedAudioBooks.add(bookToBorrow);
	}
	
	public AccountInfo getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(AccountInfo accountInfo) {
		this.accountInfo = accountInfo;
	}
	
	public void addBookToWishlist(WishlistEBook bookToAdd){
		wishlistEBooks.add(bookToAdd);
	}
	public void addBookToWishlist(WishlistAudioBook wishBook) {
		wishlistAudioBooks.add(wishBook);
	}

	public int getRegUserId() {
		return regUserId;
	}

	public Set<PastBorrowedEBook> getPastBorrowedEBooks() {
		return pastBorrowedEBooks;
	}

	public void setPastBorrowedEBooks(Set<PastBorrowedEBook> pastBorrowedEBooks) {
		this.pastBorrowedEBooks = pastBorrowedEBooks;
	}

	public Set<EBookOnHold> geteBookHolds() {
		return eBookHolds;
	}

	public void seteBookHolds(Set<EBookOnHold> eBookHolds) {
		this.eBookHolds = eBookHolds;
	}
	
	public Set<BorrowedEBook> getBorrowedEBooks(){
		return borrowedEBooks;
	}
	public void setBorrowedEBooks(Set<BorrowedEBook> borrowedEBooks){
		this.borrowedEBooks = borrowedEBooks;
	}
	
	public void removeFromBorrowedEBooks(BorrowedEBook borrowedBook){
		this.borrowedEBooks.remove(borrowedBook);
	}
	
	public void removeFromWishlistEBooks(WishlistEBook wishlistBook){
		this.wishlistEBooks.remove(wishlistBook);
	}

	public Set<BorrowedAudioBook> getBorrowedAudioBooks() {
		return borrowedAudioBooks;
	}

	public void setBorrowedAudioBooks(Set<BorrowedAudioBook> borrowedAudioBooks) {
		this.borrowedAudioBooks = borrowedAudioBooks;
	}
	
	public void removeFromBorrowedAudioBooks(BorrowedAudioBook borrowedAudioBook){
		this.borrowedAudioBooks.remove(borrowedAudioBook);
	}

	public Set<PastBorrowedAudioBook> getPastBorrowedAudioBooks() {
		return pastBorrowedAudioBooks;
	}

	public void setPastBorrowedAudioBooks(Set<PastBorrowedAudioBook> pastBorrowedAudioBooks) {
		this.pastBorrowedAudioBooks = pastBorrowedAudioBooks;
	}

	public Set<AudioBookOnHold> getAudioBookHolds() {
		return audioBookHolds;
	}

	public void setAudioBookHolds(Set<AudioBookOnHold> audioBookHolds) {
		this.audioBookHolds = audioBookHolds;
	}
	
	public void removeFromAudioBookHolds(AudioBookOnHold audioBookOnHold){
		this.audioBookHolds.remove(audioBookOnHold);
	}

	public Set<WishlistAudioBook> getWishlistAudioBooks() {
		return wishlistAudioBooks;
	}

	public void setWishlistAudioBooks(Set<WishlistAudioBook> wishlistAudioBooks) {
		this.wishlistAudioBooks = wishlistAudioBooks;
	}
	
	public void removeFromWishlistAudioBooks(WishlistAudioBook wishlistAudioBooks){
		this.wishlistAudioBooks.remove(wishlistAudioBooks);
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	
}
