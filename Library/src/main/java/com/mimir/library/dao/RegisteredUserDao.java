package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.model.BorrowedBook;
import com.mimir.library.model.OnHoldBook;
import com.mimir.library.model.PastBorrowedBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistBook;

public interface RegisteredUserDao {

	void saveRegisteredUser(RegisteredUser user);
	
	List<RegisteredUser> getAllUsers();
	List<RegisteredUser> getAllUsersByFirstName(String firstName);
	
	void deleteRegisteredUserById(int id);
	
	RegisteredUser getSpecificUser(int id);
	
	List<BorrowedBook> getBookshelfBooksOfSpecificUser(int userId);
	List<PastBorrowedBook> getPastBooksOfSpecificUser(int userId);
	List<OnHoldBook> getWaitlistBooksOfSpecificUser(int userId);
	List<WishlistBook> getWishlistBooksOfSpecificUser(int userId);
	
}
