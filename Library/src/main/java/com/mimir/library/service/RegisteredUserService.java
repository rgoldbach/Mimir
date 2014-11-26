package com.mimir.library.service;

import java.util.List;

import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedAudioBook;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistAudioBook;
import com.mimir.library.model.WishlistEBook;

public interface RegisteredUserService {

	void saveRegisteredUser(RegisteredUser user);
	void updateRegisteredUser(RegisteredUser user);
	
	List<RegisteredUser> getAllUsers();
	List<RegisteredUser> getAllUsersByFirstName(String firstName);
	
	void deleteRegisteredUserById(int id);
	
	RegisteredUser getSpecificUser(int id);
	
	//Borrowed EBooks
	List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(RegisteredUser user);
	String saveBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook);
	String removeBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook);
	
	//Past Borrowed EBooks
	List<PastBorrowedEBook> getPastBorrowedEBooksOfSpecificUser(RegisteredUser user);
	String savePastBorrowedEBookOfSpecificUser(PastBorrowedEBook pastBorrowedEBook);
	
	//On Hold EBooks
	List<EBookOnHold> getOnHoldEBooksOfSpecificUser(RegisteredUser user);
	String saveOnHoldEBookOfSpecificUser(EBookOnHold eBookOnHold);
	List<EBookOnHold> getOnHoldEBooks(int eBookId);
	
	//Wish-list EBooks
	List<WishlistEBook> getWishlistEBooksOfSpecificUser(RegisteredUser user);
	String saveWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook);
	String removeWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook);
	
	//Borrowed AudioBooks
	List<BorrowedAudioBook> getBorrowedAudioBooksOfSpecificUser(RegisteredUser user);
	String saveBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook);
	String removeBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook);
	
	//Past Borrowed AudioBooks
	List<PastBorrowedAudioBook> getPastBorrowedAudioBooksOfSpecificUser(RegisteredUser user);
	String savePastBorrowedAudioBookOfSpecificUser(PastBorrowedAudioBook pastBorrowedAudioBook);
	
	//On Hold AudioBooks
	List<AudioBookOnHold> getOnHoldAudioBooksOfSpecificUser(RegisteredUser user);
	String saveOnHoldAudioBookOfSpecificUser(AudioBookOnHold audioBookOnHold);
	List<AudioBookOnHold> getOnHoldAudioBooks(int audioBookId);
	
	//Wish-list AudioBooks
	List<WishlistAudioBook> getWishlistAudioBooksOfSpecificUser(RegisteredUser user);
	String saveWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook);
	String removeWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook);
	
	AccountInfo signInUser(LoginCredentials loginCreds);
	RegisteredUser getSpecificUserFromAccountInfo(AccountInfo accountInfo);
	RegisteredUser getSpecificUserFromAccountInfoWithAllInfo(AccountInfo accountInfo);
	Admin getSpecificAdminFromAccountInfo(AccountInfo accountInfo);
}
