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
	
	List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(int userId);
	List<PastBorrowedEBook> getPastEBooksOfSpecificUser(int userId);
	List<EBookOnHold> getWaitlistEBooksOfSpecificUser(int userId);
	List<WishlistEBook> getWishlistEBooksOfSpecificUser(int userId);
	
	AccountInfo signInUser(LoginCredentials loginCreds);
	RegisteredUser getSpecificUserFromAccountInfo(AccountInfo accountInfo);
	Admin getSpecificAdminFromAccountInfo(AccountInfo accountInfo);
	
}
