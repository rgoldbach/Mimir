package com.mimir.library.service;

import java.util.List;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;
import com.mimir.library.search.SearchResult;

public interface SearchService {

	List<Genre> getAllGenres();
	List<String> getAllGenresAsStrings();
	List<InterestLevel> getAllInterestLevels();
	List<String> getAllInterestLevelsAsStrings();
	List<Language> getAllLanguages();
	List<String> getAllLanguagesAsStrings();
	List<Publisher> getAllPublishers();
	List<String> getAllPublishersAsStrings();
	List<Format> getAllFormats();
	List<String> getAllFormatsAsStrings();
	List<AwardInfo> getAllAwards();
	List<String> getAllAwardsAsStrings();
	
	List<SearchResult> search(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType);
	List<Book> quickSearch(String keyword, int firstResultIndex, SortType sortType);
	
	void initHibernateSearch();
	
}
