package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.enums.FilterType;
import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.search.FilterOption;
import com.mimir.library.search.SearchManager;
import com.mimir.library.search.SearchResult;
import com.mimir.library.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/search")
	public ModelAndView initResults(String query, HttpSession session) {
		ModelAndView mv = new ModelAndView("/library/search");
		
		// Obtain results
		List<SearchResult> searchResults = searchService.search(query, 0, SearchType.Quick, SortType.TitleAtoZ);
		
		// Store original results 
		session.setAttribute("originalResults", searchResults); 
		
		// Add message
		mv.addObject("message", searchResults.size() + " results found for '" + query + "'");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadFilters")
	@ResponseBody
	public JSONObject loadFilters(HttpSession session) {
		PagedListHolder<SearchResult> pagedResults = (PagedListHolder<SearchResult>) session.getAttribute("pagedResults");
		List<SearchResult> results = pagedResults.getSource();
		
		// Go through each result
		List<FilterOption> authorFilterOptions = new ArrayList<FilterOption>();
		List<FilterOption> genreFilterOptions = new ArrayList<FilterOption>();

		/*
		for (SearchResult result : results) {
			List<String> authorNames = result.getAuthorNames();
			for(String authorName : authorNames){
				boolean newFilter = true;
				for(FilterOption authorFilterOption : authorFilterOptions){
					if(authorFilterOption.matches(authorName)){
						newFilter = false;
						authorFilterOption.increment();
					}
				}
				if(newFilter){
					authorFilterOptions.add(new FilterOption(authorName));
				}
			}
		}*/
		
		for (SearchResult result : results) {
			filterBuilder(result.getAuthorNames(), authorFilterOptions);
			filterBuilder(result.getGenreNames(), genreFilterOptions);
		}
		
		JSONObject jFilterOptions = new JSONObject();
		JSONArray jAuthorFilterOptions = new JSONArray();
		JSONArray jGenreFilterOptions = new JSONArray();
		
		jAuthorFilterOptions.addAll(authorFilterOptions);
		jGenreFilterOptions.addAll(genreFilterOptions);
		
		jFilterOptions.put("authorFilterOptions", jAuthorFilterOptions);
		jFilterOptions.put("genreFilterOptions", jGenreFilterOptions);
		return jFilterOptions;
	}
	
	private void filterBuilder(List<String> names, List<FilterOption> options){
		for(String name : names){
			boolean newFilter = true;
			for(FilterOption option : options){
				if(option.matches(name)){
					newFilter = false;
					option.increment();
				}
			}
			if(newFilter){
				options.add(new FilterOption(name));
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadResults")
	@ResponseBody
	public JSONObject loadResults(HttpSession session){
		PagedListHolder<SearchResult> pagedResults = (PagedListHolder<SearchResult>) session.getAttribute("pagedResults");
		List<SearchResult> results = pagedResults.getPageList();
		
		// Create a json representing a paged result
		JSONObject jResultPage = new JSONObject();
		JSONArray jResults = new JSONArray();
		
		for(SearchResult result : results){
			JSONObject jBook = new JSONObject();
			jBook.put("imgPath", result.getImgPath());
			jBook.put("title", result.getTitle());
			JSONArray jAuthors = new JSONArray();
				List<String> authors = result.getAuthorNames();
				jAuthors.addAll(authors);
				jBook.put("authors", jAuthors);
			jBook.put("format", result.getFormat());
			jBook.put("description", result.getDescription());
			jBook.put("displayId", result.getDisplayId());
			jResults.add(jBook);
		}
		
		jResultPage.put("jResults", jResults);
		
		// Represent if last page
		if(pagedResults.isLastPage()){
			jResultPage.put("remainingResults", 0);
		}
		else{
			int remainingResults = (pagedResults.getNrOfElements() - ((pagedResults.getPage()+1) * GlobalConstants.RESULTS_PER_QUERY));
			jResultPage.put("remainingResults", remainingResults);
		}
		
		pagedResults.nextPage();
		
		return jResultPage;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sortResults")
	@ResponseBody
	public String sortResults(@RequestParam(value="sortType") String type, HttpSession session){
		// Get the unsorted original results from the Session
		List<SearchResult> originalResults = (List<SearchResult>) session.getAttribute("originalResults");
		List<SearchResult> results = new ArrayList<SearchResult>(originalResults);
		
		// Determine the sort type
		SortType sortType;
		switch (type){
			case "relevance":
				sortType = SortType.Relevance;
				break;
			case "highestRated":
				sortType = SortType.HighestRated;
				break;
			case "titleAtoZ":
				sortType = SortType.TitleAtoZ;
				break;
			case "titleZtoA":
				sortType = SortType.TitleZtoA;
				break;
			case "authorAtoZ":
				sortType = SortType.AuthorAtoZ;
				break;
			case "authorZtoA":
				sortType = SortType.AuthorZtoA;
				break;
			case "releaseDate":
				sortType = SortType.ReleaseDate;
				break;
			case "addedToSite":
				sortType = SortType.AddedToSite;
				break;
			case "mostPopular":
				sortType = SortType.MostPopular;
				break;
			default:
				sortType = SortType.Relevance;
				break;
		}
		
		// Sort the results
		SearchManager sm = new SearchManager();
		sm.sort(sortType, results);
		
		// Store the new sorted results in the Session
		PagedListHolder<SearchResult> sortedPagedResults = new PagedListHolder<SearchResult>(results);
		sortedPagedResults.setPageSize(GlobalConstants.RESULTS_PER_QUERY);
		session.setAttribute("pagedResults", sortedPagedResults);
		
		return "";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/filterResults")
	@ResponseBody
	public String filterResults(@RequestParam(value="filterTypeValue") String filterTypeValue, HttpSession session){
		// Get filter and value, has format filter?='value' in filterTypeValue
		String filter = filterTypeValue.substring(0, filterTypeValue.indexOf('?'));
		String value = filterTypeValue.substring(filterTypeValue.indexOf('=')+2, filterTypeValue.lastIndexOf('\''));;

		// Determine the filter type
		FilterType filterType;
		switch (filter){
			case "format":
				filterType = FilterType.Format;
				if(value.equals("eBookOnly")){
					value = GlobalConstants.EBOOK;
				}
				else if(value.equals("audioOnly")){
					value = GlobalConstants.AUDIOBOOK;
				}
				break;
			case "author":
				filterType = FilterType.Author;
				break;
			case "genre":
				filterType = FilterType.Genre;
				break;
			case "language":
				filterType = FilterType.Language;
				break;
			case "publisher":
				filterType = FilterType.Publisher;
				break;
			case "award":
				filterType = FilterType.Award;
				break;
			default:
				filterType = FilterType.NoFilter;
				break;
		}
		
		// Get the sorted but unfiltered results from the Session
		PagedListHolder<SearchResult> unfilteredPagedResults = (PagedListHolder<SearchResult>) session.getAttribute("pagedResults");
		List<SearchResult> results = unfilteredPagedResults.getSource();
						
		// Filter the results
		SearchManager sm = new SearchManager();
		sm.filter(results, filterType, value);
						
		// Store the new filtered results in the Session
		PagedListHolder<SearchResult> filteredPagedResults = new PagedListHolder<SearchResult>(results);
		filteredPagedResults.setPageSize(GlobalConstants.RESULTS_PER_QUERY);
		session.setAttribute("pagedResults", filteredPagedResults);
		
		return "";
	}
}