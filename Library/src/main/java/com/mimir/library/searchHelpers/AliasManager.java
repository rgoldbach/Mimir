package com.mimir.library.searchHelpers;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.mimir.library.enums.SearchType;
import com.mimir.library.model.Book;

public class AliasManager {

	private SearchType searchType;
	
	public AliasManager(SearchType searchType){
		this.searchType = searchType;
	}
	
	public Criteria getAliases(Criteria criteria){
		switch(searchType){
			case Advanced: return null;
			case ByAuthor: return null;
			case ByGenre: return null;	
			default: return createAliasesForQuickSearch(criteria);
		}
	}
	
	public Criteria createAliasesForQuickSearch(Criteria criteria){
		criteria.createAlias(SearchConstants.BOOK_TO_BOOK_DISPLAY, SearchConstants.BOOK_DISPLAY_ALIAS);
		criteria.createAlias(SearchConstants.BOOK_TO_AUTHORS, SearchConstants.AUTHOR_ALIAS);
		criteria.createAlias(SearchConstants.BOOK_TO_BOOK_GENRES, SearchConstants.BOOK_GENRE_ALIAS);
		criteria.createAlias(SearchConstants.BOOK_GENRES_TO_GENRE, SearchConstants.GENRE_ALIAS);
		return criteria;
	}
	
}
