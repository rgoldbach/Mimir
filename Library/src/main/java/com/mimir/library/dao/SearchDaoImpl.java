package com.mimir.library.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;

@Repository("searchDao")
public class SearchDaoImpl extends AbstractDao implements SearchDao{

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
	public List<Book> quickSearch() {
		return null;
	}

	@Override
	public List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria) {
		return null;
	}
}
