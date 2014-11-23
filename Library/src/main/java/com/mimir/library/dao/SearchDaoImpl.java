package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.errors.EmptyQueryException;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;
import com.mimir.library.searchHelpers.CriteriaManager;

@Repository("searchDao")
public class SearchDaoImpl extends AbstractDao implements SearchDao{

	public void initHibernateSearch(){
		FullTextSession fullTextSession = Search.getFullTextSession(getSession());
		try {
			fullTextSession.createIndexer().startAndWait();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Genre> getAllGenres() {
		Criteria criteria = getSession().createCriteria(Genre.class);
		return (List<Genre>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllGenresAsStrings() {
		Query query = getSession().createSQLQuery("SELECT genre FROM Genres");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InterestLevel> getAllInterestLevels() {
		Criteria criteria = getSession().createCriteria(InterestLevel.class);
		return (List<InterestLevel>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllInterestLevelsAsStrings() {
		Query query = getSession().createSQLQuery("SELECT interestLevel FROM InterestLevels");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Language> getAllLanguages() {
		Criteria criteria = getSession().createCriteria(Language.class);
		return (List<Language>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllLanguagesAsStrings() {
		Query query = getSession().createSQLQuery("SELECT language FROM Languages");
		return (List<String>) query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Publisher> getAllPublishers() {
		Criteria criteria = getSession().createCriteria(Publisher.class);
		return (List<Publisher>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllPublishersAsStrings() {
		Query query = getSession().createSQLQuery("SELECT name FROM Publishers");
		return (List<String>) query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Format> getAllFormats() {
		Criteria criteria = getSession().createCriteria(Format.class);
		return (List<Format>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllFormatsAsStrings() {
		Query query = getSession().createSQLQuery("SELECT format FROM Formats");
		return (List<String>) query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AwardInfo> getAllAwards() {
		Criteria criteria = getSession().createCriteria(AwardInfo.class);
		return (List<AwardInfo>) criteria.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllAwardsAsStrings() {
		Query query = getSession().createSQLQuery("SELECT title FROM AwardInfo");
		return (List<String>) query.list();
	}
	
	@Override
	public List<Book> quickSearch(String keyword, int firstResultIndex, SortType sortType) {
		return null;
	}
	
	@Override
	public List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria, int firstResultIndex) {
		return null;
	}
	
	
	@Override
	public List<Book> search(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType){
		List<Book> books = new ArrayList<Book>();
		if(sortType == SortType.Relevance && searchType != SearchType.Advanced){
			System.out.println("DEBUG - Using Hibernate Search...");
			books = performHibernateSearch(searchKeyword, firstResultIndex);
		}
		else{
			System.out.println("DEBUG - Using Criteria Search...");
			books = performCriteriaSearch(searchKeyword, firstResultIndex, searchType, sortType);
		}
		
		this.initializeBooks(books);
		
		return books;
	}
	
	private void initializeBooks(List<Book> books){
		for(Book b : books){
			Hibernate.initialize(b.getAuthors());
			Hibernate.initialize(b.getGenres());
		}
	}
	
	//Helper methods...
	
	@SuppressWarnings("unchecked")
	private List<Book> performCriteriaSearch(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType){
		CriteriaManager critManager = new CriteriaManager(searchKeyword, firstResultIndex, searchType, sortType);
		Criteria criteria = getSession().createCriteria(Book.class, "book");
		criteria = critManager.getCriteria(criteria);
		return (List<Book>) criteria.list();
	}

	
	private List<Book> performHibernateSearch(String searchKeyword, int firstResultIndex) {
		String[] quickSearchCriteria = {"bookDisplay.title", "authors.name", "genres.genre.genre"};
		List<Book> books =  hibernateSearch(searchKeyword, quickSearchCriteria, firstResultIndex);
		if(books == null) return null;
		return books;
	}
	
	public List<Book> hibernateSearch(String keyword, String[] matchingAttributes, int firstResultIndex){
		FullTextSession fullTextSession = Search.getFullTextSession(getSession());
		QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Book.class).get();
		org.apache.lucene.search.Query luceneQuery;
		try{
			luceneQuery = qb
					  .keyword()
					  .onFields(matchingAttributes)
					  .matching(keyword)
					  .createQuery();
		}catch(EmptyQueryException e){
			System.out.println("DEBUG - Query Exception! Aborting search...");
			return null;
		}
		
		Query query = fullTextSession.createFullTextQuery(luceneQuery, Book.class);
		query.setFirstResult(firstResultIndex);
		query.setMaxResults(GlobalConstants.MAX_SEARCH_RESULTS);
		
		@SuppressWarnings("unchecked")
		List<Book> result = (List<Book>) query.list();
		System.out.println("DEBUG - " + result.size() + " results found!");
		return result;
	}
}
