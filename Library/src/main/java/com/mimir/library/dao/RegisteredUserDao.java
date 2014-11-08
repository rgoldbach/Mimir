package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.model.BookshelfBook;
import com.mimir.library.model.RegisteredUser;

public interface RegisteredUserDao {

	void saveRegisteredUser(RegisteredUser user);
	
	List<RegisteredUser> getAllUsers();
	List<RegisteredUser> getAllUsersByFirstName(String firstName);
	
	void deleteRegisteredUserById(int id);
	
	RegisteredUser getSpecificUser(int id);
	
	List<BookshelfBook> getBookshelfBooksOfSpecificUser(int userId);
	List<BookshelfBook> getPastBooksOfSpecificUser(int userId);
	List<BookshelfBook> getWaitlistBooksOfSpecificUser(int userId);
	List<BookshelfBook> getWishlistBooksOfSpecificUser(int userId);
	
}
