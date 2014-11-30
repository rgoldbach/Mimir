package com.mimir.library.searchHelpers;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import com.mimir.library.enums.SortType;

public class SortingManager {
	
	private SortType sortType;
	
	public SortingManager(SortType sortType){
		this.sortType = sortType;
	}

	public Criteria addSortingToSearch(Criteria criteria){
		switch (sortType){
			case HighestRated: return criteria;
			case TitleAtoZ: return addAscTitleSort(criteria);
			case TitleZtoA: return addDescTitleSort(criteria);
			case AuthorAtoZ: return addAscAuthorSort(criteria);
			case AuthorZtoA: return addDescAuthorSort(criteria);
			case ReleaseDate: return criteria;
			case AddedToSite: return addAddedToSideSort(criteria);
			default: return criteria;
		}
	}
	
	public Criteria addAscTitleSort(Criteria criteria){
		return criteria.addOrder(Order.asc(SearchConstants.BOOK_TITLE));
	}
	public Criteria addDescTitleSort(Criteria criteria){
		return criteria.addOrder(Order.desc(SearchConstants.BOOK_TITLE));
	}
	public Criteria addAscAuthorSort(Criteria criteria){
		return criteria.addOrder(Order.asc(SearchConstants.AUTHOR_NAME));
	}
	public Criteria addDescAuthorSort(Criteria criteria){
		return criteria.addOrder(Order.desc(SearchConstants.AUTHOR_NAME));
	}
	public Criteria addAddedToSideSort(Criteria criteria){
		return criteria.addOrder(Order.asc(SearchConstants.BOOK_DATE_ADDED));
	}
}
