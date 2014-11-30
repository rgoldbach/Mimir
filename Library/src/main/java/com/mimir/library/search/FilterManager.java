package com.mimir.library.search;

import java.util.List;
import java.util.ListIterator;

import com.mimir.library.enums.FilterType;
import com.mimir.library.globalVariables.GlobalConstants;

public class FilterManager {

	public void filter(List<SearchResult> searchResults, FilterType filterType, String value){
		ListIterator<SearchResult> lIter = searchResults.listIterator();
		
		if(filterType.equals(FilterType.NoFilter)){
			// do nothing
		}
		else if(filterType.equals(FilterType.Format)){
			// by eBook
			if(value.equals(GlobalConstants.EBOOK)){
				while (lIter.hasNext()) {
					SearchResult searchResult = lIter.next();
					if (searchResult.getFormat() != GlobalConstants.EBOOK) {
						lIter.remove();
					}
				}
			}
			// by audio 
			else if(value.equals(GlobalConstants.AUDIOBOOK)){
				while (lIter.hasNext()) {
					SearchResult searchResult = lIter.next();
					if (searchResult.getFormat() != GlobalConstants.AUDIOBOOK) {
						lIter.remove();
					}
				}
			}
		}
		else if(filterType.equals(FilterType.Author)){
			while (lIter.hasNext()) {
				SearchResult searchResult = lIter.next();
				List<String> authorNames = searchResult.getAuthorNames();
				if (!authorNames.contains(value)) {
					lIter.remove();
				}
			}
		}
		else if(filterType.equals(FilterType.Genre)){
			while (lIter.hasNext()) {
				SearchResult searchResult = lIter.next();
				List<String> genreNames = searchResult.getGenreNames();
				if (!genreNames.contains(value)) {
					lIter.remove();
				}
			}
		}
		else if(filterType.equals(FilterType.Language)){
			while (lIter.hasNext()) {
				SearchResult searchResult = lIter.next();
				List<String> languageNames = searchResult.getLanguageNames();
				if (!languageNames.contains(value)) {
					lIter.remove();
				}
			}
		}
		else if(filterType.equals(FilterType.Publisher)){
			while (lIter.hasNext()) {
				SearchResult searchResult = lIter.next();
				List<String> publisherNames = searchResult.getPublisherNames();
				if (!publisherNames.contains(value)) {
					lIter.remove();
				}
			}
		}
		else if(filterType.equals(FilterType.Award)){
			while (lIter.hasNext()) {
				SearchResult searchResult = lIter.next();
				List<String> awardNames = searchResult.getAwardNames();
				if (!awardNames.contains(value)) {
					lIter.remove();
				}
			}
		}
		else{
			throw new IllegalArgumentException("Comparator not found for " + filterType);
		}
	}
}
