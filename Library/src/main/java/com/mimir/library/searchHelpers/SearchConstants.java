package com.mimir.library.searchHelpers;

public class SearchConstants {
	
	//Aliases
	public static final String AUTHOR_ALIAS = "authors";
	public static final String BOOK_DISPLAY_ALIAS = "bookDisplay";
	public static final String BOOK_GENRE_ALIAS = "bookGenre";
	public static final String GENRE_ALIAS = "genre";
	
	//Mappings
	public static final String BOOK = "book";
	public static final String BOOK_TO_AUTHORS = BOOK + ".authors";
	public static final String BOOK_TO_BOOK_DISPLAY = BOOK + ".bookDisplay";
	public static final String BOOK_TO_BOOK_GENRES = BOOK + ".genres";
	
	//Mappings Using Aliases
	public static final String BOOK_GENRES_TO_GENRE = BOOK_GENRE_ALIAS + ".genre";
	
	//Sorting
	public static final String AUTHOR_NAME = AUTHOR_ALIAS + ".name";
	public static final String BOOK_TITLE = BOOK_DISPLAY_ALIAS + ".title";
	public static final String BOOK_GENRE = GENRE_ALIAS + ".genre";
	//public static final String RELEASE_DATE_SORT = "";
	public static final String BOOK_DATE_ADDED = BOOK_DISPLAY_ALIAS + ".dateAdded";

}
