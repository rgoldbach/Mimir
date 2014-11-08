package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;

public interface RegisteredUserDao {

	void saveRegisteredUser(RegisteredUser user);
	
	List<RegisteredUser> getAllUsers();
	List<RegisteredUser> getAllUsersByFirstName(String firstName);
	
	void deleteRegisteredUserById(int id);
	
	RegisteredUser getSpecificUser(int id);
	
	List<BorrowedEBook> getBookshelfBooksOfSpecificUser(int userId);
	List<PastBorrowedEBook> getPastBooksOfSpecificUser(int userId);
	List<EBookOnHold> getWaitlistBooksOfSpecificUser(int userId);
	List<WishlistEBook> getWishlistBooksOfSpecificUser(int userId);
	
}
