package com.mimir.library.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.search.SearchManager;
import com.mimir.library.search.SearchResult;
import com.mimir.library.service.SearchService;

@Controller
public class TestPageController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/test")
	public String goToIndex(Model model) {
		return "/test/index";
	}
	
	@RequestMapping(value = "/results")
	public ModelAndView initResults(String query, HttpSession session) {
		ModelAndView mv = new ModelAndView("/test/results");
		
		// Obtain results
		List<SearchResult> searchResults = searchService.search(query, 0, SearchType.Quick, SortType.Relevance);
		
		// Page results
		PagedListHolder<SearchResult> pagedResults = new PagedListHolder<SearchResult>(searchResults);
		pagedResults.setPageSize(GlobalConstants.RESULTS_PER_QUERY);
		
		// Add paged results to Session
		session.setAttribute("pagedResults", pagedResults);

		// Add message
		mv.addObject("message", searchResults.size() + " results found for '" + query + "'");
		
		return mv;
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
			jBook.put("format", result.getFormat());
			jBook.put("description", result.getDescription());
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
		// Get the unsorted results from the Session
		PagedListHolder<SearchResult> unsortedPagedResults = (PagedListHolder<SearchResult>) session.getAttribute("pagedResults");
		List<SearchResult> results = unsortedPagedResults.getSource();
		
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
		// Probably going to need to return something here maybe idk who cares 
		return "";
		
	}

}
