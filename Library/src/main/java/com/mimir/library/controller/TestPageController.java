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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
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
		session.setAttribute("message", searchResults.size() + " results found for '" + query + "'");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadResults")
	@ResponseBody
	public JSONObject loadResults(HttpSession session){
		PagedListHolder<SearchResult> pagedResults = (PagedListHolder<SearchResult>) session.getAttribute("pagedResults");
		List<SearchResult> results = pagedResults.getPageList();
		
		JSONObject jResultPage = new JSONObject();
		JSONArray jResults = new JSONArray();
		
		for(SearchResult result : results){
			JSONObject jBook = new JSONObject();
			jBook.put("imgPath", result.getImgPath());
			jBook.put("title", result.getTitle());
			jBook.put("format", result.getFormat());
			jResults.add(jBook);
		}
		
		jResultPage.put("jResults", jResults);
		
		if(pagedResults.isLastPage())
			jResultPage.put("isLastPage", true);
		else
			jResultPage.put("isLastPage", false);
		
		pagedResults.nextPage();
		
		return jResultPage;
	}

}
