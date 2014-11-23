package com.mimir.library.searchHelpers;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.mimir.library.enums.SearchType;

public class RestrictionsManager {
	
	private SearchType searchType;
	
	public RestrictionsManager(SearchType searchType){
		this.searchType = searchType;
	}
	
	public Criterion[] getRestrictions(List<String> keywords){
		switch(searchType){
			case Advanced: return null;
			case ByAuthor: return null;
			case ByGenre: return null;	
			default: return getRestrictionsForQuickSearch(keywords);
		}
	}
	
	public Criterion[] getRestrictionsForQuickSearch(List<String> keywords){
		Criterion[] restrictions = new Criterion[(keywords.size()*3)];
		int index = 0;
		for(String keyword : keywords){
			restrictions[index++] = Restrictions.like(SearchConstants.BOOK_TITLE, ("%"+keyword+"%"));
			restrictions[index++] = Restrictions.like(SearchConstants.AUTHOR_NAME, ("%"+keyword+"%"));
			restrictions[index++] = Restrictions.like(SearchConstants.BOOK_GENRE, ("%"+keyword+"%"));
		}
		return restrictions;
	}

}
