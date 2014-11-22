package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;

import com.mimir.library.model.AdvancedSearchForm;
import com.mimir.library.model.Author;
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
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> quickSearch(List<String> keywords, int firstResultIndex) {
		Criteria criteria = getSession().createCriteria(Book.class, "book");
		//Creating aliases to reference the tables that will be searched against...
		criteria.createAlias("book.bookDisplay", "b");
		criteria.createAlias("book.authors", "a");
		criteria.createAlias("book.genres", "bg");
		criteria.createAlias("bg.genre", "g");
		//Matches each keyword with the name of each attribute, the number multiplied by keywords.size() is the number 
		//of different restrictions we are adding for each keyword. 
		Criterion[] restrictions = new Criterion[(keywords.size()*3)];
		int index = 0;
		for(String keyword : keywords){
			restrictions[index++] = Restrictions.like("b.title", ("%"+keyword+"%"));
			restrictions[index++] = Restrictions.like("a.name", ("%"+keyword+"%"));
			restrictions[index++] = Restrictions.like("g.genre", ("%"+keyword+"%"));
		}
		//Adds the criterion to the query
		criteria.add(Restrictions.or(restrictions));
		//Since we have multiple joins, we only want one distinct root entity instead of multiple...
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Book> books = (List<Book>) criteria.list();
		//So there are no lazy exceptions! 
		for(Book b : books){
			Hibernate.initialize(b.getAuthors());
			Hibernate.initialize(b.getGenres());
		}
		return books;
	}

	@Override
	public List<Book> advancedSearch(AdvancedSearchForm advancedSearchCriteria, int firstResultIndex) {
		return null;
	}
}
