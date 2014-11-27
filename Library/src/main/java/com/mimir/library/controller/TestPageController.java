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
import com.mimir.library.model.Book;
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
		List<Book> results = searchService.search(query, 0, SearchType.Quick, SortType.Relevance);
		PagedListHolder<Book> pagedResults = new PagedListHolder<Book>(results);
		pagedResults.setPageSize(GlobalConstants.RESULTS_PER_QUERY);
		session.setAttribute("pagedResults", pagedResults);
		session.setAttribute("message", results.size() + " results found for '" + query + "'");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadResults")
	@ResponseBody
	public JSONObject loadResults(HttpSession session){
		PagedListHolder<Book> pagedResults = (PagedListHolder<Book>) session.getAttribute("pagedResults");
		List<Book> results = pagedResults.getPageList();
		
		JSONObject jResultPage = new JSONObject();
		JSONArray jResults = new JSONArray();
		
		for(Book result : results){
			JSONObject jBook = new JSONObject();
			jBook.put("isbn", result.getIsbn());
			jBook.put("imgPath", result.getBookDisplay().getImageFilePath());
			jBook.put("title", result.getBookDisplay().getTitle());
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
