package com.mimir.library.globalVariables;

public class GlobalConstants {
	
	public static final String CURRENT_USER_SESSION_GETTER = "currentUser";
	
	//Account Type
	public static final String REGISTERED_USER_TYPE = "RegUser";
	public static final String ADMIN_USER_TYPE = "Admin";
	
	
	//Amount of days to borrow a book.
	public static final int BORROW_BOOK_LENGTH = 14;
	
	//DAO success text
	public static final String DAO_SUCCESS = "Success";
	
	public static final String[] DATE_ADDED_FOR_SEARCH = {"7 Days", "14 Days", "30 Days", "3 Months", "6 Months", "1 Year"};
	
	
	//SEARCHING
	public static final int RESULTS_PER_QUERY = 4;
	public static final int MAX_RESULTS = RESULTS_PER_QUERY * 10;
	
	
	//BOOK FORMATS
	public static final String EBOOK = "EBook";
	public static final String AUDIOBOOK = "AudioBook";
	
	//Unlimited book downloads
	public static int UNLIMITED = -5;

}
