package com.mimir.library.dao;

import java.util.List;

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
	
	List<Book> quickSearch();
	List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria);
	
}
