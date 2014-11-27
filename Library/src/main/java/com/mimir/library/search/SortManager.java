package com.mimir.library.search;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.mimir.library.enums.SortType;

public class SortManager {
	
	Comparator<SearchResult> titleComparatorAtoZ = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getTitle().compareTo(o2.getTitle());
	    }
	};
	
	Comparator<SearchResult> titleComparatorZtoA = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getTitle().compareTo(o2.getTitle()) * -1;
	    }
	};
	
	Comparator<SearchResult> relevanceComparator = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return Integer.valueOf(o1.getRelevanceScore()).compareTo(o2.getRelevanceScore());
	    }
	};
	
	Comparator<SearchResult> authorComparatorAtoZ = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getAuthorNames().get(0).compareTo(o2.getAuthorNames().get(0));
	    }
	};
	
	Comparator<SearchResult> authorComparatorZtoA = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getAuthorNames().get(0).compareTo(o2.getAuthorNames().get(0)) * -1;
	    }
	};
	
	Comparator<SearchResult> ratingComparator = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return Double.valueOf(o1.getRating()).compareTo(o2.getRating());
	    }
	};
	
	Comparator<SearchResult> releaseDateComparator = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getReleaseDate().compareTo(o2.getReleaseDate());
	    }
	};
	
	Comparator<SearchResult> dateAddedComparator = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return o1.getDateAdded().compareTo(o2.getDateAdded());
	    }
	};
	
	Comparator<SearchResult> mostPopularComparator = new Comparator<SearchResult>() {
	    @Override
	    public int compare(SearchResult o1, SearchResult o2) {
	        return Integer.valueOf(o1.getMostPopularScore()).compareTo(o2.getMostPopularScore());
	    }
	};
	
	public void sort(SortType sortType, List<SearchResult> searchResults){
		
	    Comparator<SearchResult> comparator = null;
		
		if(sortType.equals(SortType.Relevance)){
			comparator = relevanceComparator;
		}else if(sortType.equals(SortType.TitleAtoZ)){
			comparator = titleComparatorAtoZ;
		}else if(sortType.equals(SortType.TitleZtoA)){
			comparator = titleComparatorZtoA;
		}else if(sortType.equals(SortType.AuthorAtoZ)){
			comparator = authorComparatorAtoZ;
		}else if(sortType.equals(SortType.AuthorZtoA)){
			comparator = authorComparatorZtoA;
		}else if(sortType.equals(SortType.AddedToSite)){
			comparator = dateAddedComparator;
		}else if(sortType.equals(SortType.HighestRated)){
			comparator = ratingComparator;
		}else if(sortType.equals(SortType.MostPopular)){
			comparator = mostPopularComparator;
		}else if(sortType.equals(SortType.ReleaseDate)){
			comparator = releaseDateComparator;
		}else{
			throw new IllegalArgumentException("Comparator not found for " + sortType);
		}
		
		Collections.sort(searchResults, comparator);
	}

}
