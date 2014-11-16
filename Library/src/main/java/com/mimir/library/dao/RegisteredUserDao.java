package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;

public interface RegisteredUserDao {

	void saveRegisteredUser(RegisteredUser user);
	
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
	
	
	//Getting and Signing in specific Users
	AccountInfo signInUser(LoginCredentials loginCreds);
	RegisteredUser getSpecificUserFromAccountInfo(AccountInfo accountInfo);
	RegisteredUser getSpecificUserFromAccountInfoWithAllInfo(AccountInfo accountInfo);
	Admin getSpecificAdminFromAccountInfo(AccountInfo accountInfo);
	
}
