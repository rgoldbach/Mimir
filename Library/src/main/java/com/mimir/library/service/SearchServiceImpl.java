package com.mimir.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.beans.BasicBookInfo;
import com.mimir.library.dao.SearchDao;
import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;
import com.mimir.library.search.SearchManager;
import com.mimir.library.search.SearchResult;

@Service("searchService")
@Transactional
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDao dao;
	
	public void initHibernateSearch(){
		dao.initHibernateSearch();
	}

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
	
	public List<SearchResult> search(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType){
		List<Book> results = dao.search(searchKeyword, firstResultIndex, searchType, sortType);
		
		SearchManager searchManager = new SearchManager();
		List<SearchResult> searchResults = searchManager.analyzeSearch(results, searchKeyword);
		searchManager.sort(sortType, searchResults);
		// System.out.println(searchResults);
		
		return searchResults;
	}

	@Override
	public List<Book> quickSearch(String keyword, int firstResultIndex, SortType sortType) {
		List<Book> results = dao.quickSearch(keyword, firstResultIndex, sortType);
		return results;
	}

	@Override
	public List<BasicBookInfo> getNewEBooks(int sizeOfList) {
		return dao.getNewEBooks(sizeOfList);
	}

	@Override
	public List<BasicBookInfo> getNewAudioBooks(int sizeOfList) {
		return dao.getNewAudioBooks(sizeOfList);
	}

	@Override
	public List<BasicBookInfo> getTopEBooks(int sizeOfList) {
		return dao.getTopEBooks(sizeOfList);
	}

	@Override
	public List<BasicBookInfo> getTopAudioBooks(int sizeOfList) {
		return dao.getTopAudioBooks(sizeOfList);
	}
	
	
}
