package com.mimir.library.search;

import java.util.ArrayList;
import java.util.List;

import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Book;

public class SearchManager {
	
	SortManager sortManager;
	
	public SearchManager(){
		sortManager = new SortManager();
	}
	
	public List<SearchResult> analyzeSearch(List<Book> books){
		List<SearchResult> searchResults = new ArrayList<SearchResult>();
		//Since the default search sorts on relevance, we will use the size of the result sort to maintain this order for relevance.
		int numberOfResults = books.size();
		for(Book book : books){
			SearchResult eBookResult = null;
			SearchResult audioBookResult = null;
			if(book.getEBook() != null){
				eBookResult = new SearchResult(book, GlobalConstants.EBOOK, numberOfResults);
			}
			if(book.getAudioBook() != null){
				audioBookResult = new SearchResult(book, GlobalConstants.AUDIOBOOK, numberOfResults);
			}
			numberOfResults--;
			if(eBookResult != null){
				searchResults.add(eBookResult);
			}
			if(audioBookResult != null){
				searchResults.add(audioBookResult);
			}
		}
		return searchResults;
	}

	public void sort(SortType sortType, List<SearchResult> searchResults){
		sortManager.sort(sortType, searchResults);
	}
	
	
}
