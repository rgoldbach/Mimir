package com.mimir.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.dao.SearchDao;
import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;

@Service("searchService")
@Transactional
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDao dao;

	@Override
	public List<Genre> getAllGenres() {
		return dao.getAllGenres();
	}
	@Override
	public List<String> getAllGenresAsStrings() {
		return dao.getAllGenresAsStrings();
	}

	@Override
	public List<InterestLevel> getAllInterestLevels() {
		return dao.getAllInterestLevels();
	}
	@Override
	public List<String> getAllInterestLevelsAsStrings() {
		return dao.getAllInterestLevelsAsStrings();
	}
	@Override
	public List<Language> getAllLanguages() {
		return dao.getAllLanguages();
	}
	@Override
	public List<String> getAllLanguagesAsStrings() {
		return dao.getAllLanguagesAsStrings();
	}
	@Override
	public List<Publisher> getAllPublishers() {
		return dao.getAllPublishers();
	}
	@Override
	public List<String> getAllPublishersAsStrings() {
		return dao.getAllPublishersAsStrings();
	}
	@Override
	public List<Format> getAllFormats() {
		return dao.getAllFormats();
	}
	@Override
	public List<String> getAllFormatsAsStrings() {
		return dao.getAllFormatsAsStrings();
	}
	@Override
	public List<AwardInfo> getAllAwards() {
		return dao.getAllAwards();
	}
	@Override
	public List<String> getAllAwardsAsStrings() {
		return dao.getAllAwardsAsStrings();
	}
	@Override
	public List<Book> quickSearch() {
		return dao.quickSearch();
	}
	@Override
	public List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria) {
		return dao.advancedSearch(advancedSearchCriteria);
	}
}
