package com.mimir.library.searchHelpers;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Book;

public class CriteriaManager {

	private String searchKeyword;
	private int firstResultIndex;
	private AliasManager aliasManager;
	private RestrictionsManager restrictManager;
	private SortingManager sortingManager;
	
	public CriteriaManager(String searchKeyword, int firstResultIndex, SearchType searchType, SortType sortType){
		this.searchKeyword = searchKeyword;
		this.firstResultIndex = firstResultIndex;
		this.aliasManager = new AliasManager(searchType);
		this.restrictManager = new RestrictionsManager(searchType);
		this.sortingManager = new SortingManager(sortType);
	}
	
	public Criteria getCriteria(Criteria criteria){
		List<String> keywords = this.seperateKeywords();
		if(keywords == null) return null;
		
		//Add Aliases
		criteria = aliasManager.getAliases(criteria);
		
		//Add Restrictions
		Criterion[] restrictions = restrictManager.getRestrictions(keywords);
		criteria.add(Restrictions.or(restrictions));
		
		//Add sorting
		criteria = sortingManager.addSortingToSearch(criteria);
		
		//Make sure each entity is distinct...
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		//Control size and location of output
		criteria.setMaxResults(GlobalConstants.MAX_RESULTS);
		criteria.setFirstResult(firstResultIndex);
		
		return criteria;
	}
	
	public List<String> seperateKeywords(){
		System.out.println("Debug - Keywords: ");
	    List<String> keywords = new ArrayList<String>();
	    searchKeyword = searchKeyword.trim();
		for(int i = 0; i < searchKeyword.length(); i++){
	            if(searchKeyword.charAt(i) == '"'){
	                int endQuoteIndex = searchKeyword.indexOf("\"", (i+1));
	                if(endQuoteIndex != -1){
	                    keywords.add(searchKeyword.substring((i+1), endQuoteIndex));
	                    i = endQuoteIndex;
	                }
	            }
	            else if(searchKeyword.charAt(i) != ' '){
	                int endIndex = searchKeyword.indexOf(" ", (i+1));
	                if(endIndex == -1){
	                    keywords.add(searchKeyword.substring((i), searchKeyword.length()));
	                    return keywords;
	                }
	                keywords.add(searchKeyword.substring((i), endIndex));
	                i = endIndex;
	            }
	        }
	    return keywords;
	}
	
}
