package com.mimir.library.service;

import java.util.ArrayList;
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
	public List<Book> quickSearch(String keyword, int firstResultIndex) {
		if(keyword.trim().equals("")) return null;
		System.out.println("Debug - Creating Keywords: ");
		List<String> keywords = this.seperateKeywords(keyword);
		return dao.quickSearch(keywords, firstResultIndex);
	}
	@Override
	public List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria, int firstResultIndex) {
		return dao.advancedSearch(advancedSearchCriteria, firstResultIndex);
	}
	
	public List<String> seperateKeywords(String keyword){
		System.out.println("Debug - Keywords: ");
        List<String> keywords = new ArrayList<String>();
        keyword = keyword.trim();
		for(int i = 0; i < keyword.length(); i++){
	            if(keyword.charAt(i) == '"'){
	                int endQuoteIndex = keyword.indexOf("\"", (i+1));
	                if(endQuoteIndex != -1){
	                	System.out.println(keyword.substring((i+1), endQuoteIndex) + " ");
	                    keywords.add(keyword.substring((i+1), endQuoteIndex));
	                    i = endQuoteIndex;
	                }
	            }
	            else if(keyword.charAt(i) != ' '){
	                int endIndex = keyword.indexOf(" ", (i+1));
	                if(endIndex == -1){
	                	System.out.println(keyword.substring((i), keyword.length()) + " ");
	                    keywords.add(keyword.substring((i), keyword.length()));
	                    return keywords;
	                }
	                System.out.println(keyword.substring((i), endIndex) + " ");
	                keywords.add(keyword.substring((i), endIndex));
	                i = endIndex;
	            }
	        }
        return keywords;
    }
}
