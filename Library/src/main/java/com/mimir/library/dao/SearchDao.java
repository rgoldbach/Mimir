package com.mimir.library.dao;

import java.util.List;

import com.mimir.library.beans.BasicBookInfo;
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

public interface SearchDao {

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
	
	List<Book> quickSearch(String keyword, int firstResultIndex, SortType sortType);
	List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria, int firstResultIndex);
	
	List<Book> search(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType);
	
	void initHibernateSearch();
	List<BasicBookInfo> getNewEBooks(int sizeOfList);
	List<BasicBookInfo> getNewAudioBooks(int sizeOfList);
	List<BasicBookInfo> getTopEBooks(int sizeOfList);
	List<BasicBookInfo> getTopAudioBooks(int sizeOfList);
}
