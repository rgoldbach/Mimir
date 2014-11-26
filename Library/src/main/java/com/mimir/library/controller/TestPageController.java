package com.mimir.library.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookGenre;
import com.mimir.library.service.SearchService;

@Controller
public class TestPageController {
	
	@Autowired
	SearchService searchService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/results")
	public ModelAndView getResults(@RequestParam (required = false) String query, HttpSession session) {
		ModelAndView mv = new ModelAndView("/test/results");
		if(query != null) {
			List<Book> results = searchService.search(query, 0, SearchType.Quick, SortType.Relevance);
			if(results == null) {
				return new ModelAndView("/test/results", "message", "No results found.");
			}
			PagedListHolder<Book> pagedResults = new PagedListHolder<Book>(results);
			pagedResults.setPageSize(GlobalConstants.RESULTS_PER_QUERY);
			session.setAttribute("pagedResults", pagedResults);
			
			List<Book> resultPage = pagedResults.getPageList();
			System.out.println(resultPage);
			mv.addObject("resultPage", resultPage);
			
			return mv;
		}
		else {
			PagedListHolder<Book> pagedResults = (PagedListHolder<Book>) session.getAttribute("pagedResults");
			if(pagedResults == null) {
				return new ModelAndView("/test/results", "message", "Your session has timed out.");
			}
			else{
				if(!pagedResults.isLastPage()){
					pagedResults.nextPage();
				}
				List<Book> resultPage = pagedResults.getPageList();
				return new ModelAndView("/test/results", "resultPage", resultPage);
			}
		}
	}
	
	public void debugPrint(List<Book> books){
		System.out.println("Number of books = " + books.size());
		for(Book x : books){
			System.out.println("Book Found: ");
			System.out.println("Book Title: " + x.getBookDisplay().getTitle());
			for(Author a : x.getAuthors()){
				System.out.println("Book Author: " + a.getName());
			}
			for(BookGenre g : x.getGenres()){
				System.out.println("Book Genre: " + g.getGenre().getGenre());
			}
		}
	}
	
	@RequestMapping(value = "/test")
	public String initForm(Model model) {
		/*
		AdvancedSearchForm advancedSearchForm = new AdvancedSearchForm();
		model.addAttribute("advancedSearchForm", advancedSearchForm);
		initModelLists(model);
		*/
		return "/test/index";
	}
	
	/* this should somehow be done by the database
	private void initModelLists(Model model) {
		
		//Gives you a list of Genre Objects.
		List<Genre> genreList2PointO = searchService.getAllGenres();
		
		//Gives you a list of Strings that represent genre names.
		List<String> genreList3PointO = searchService.getAllGenresAsStrings();
		
		List<String> genreList = new ArrayList<String>();
			genreList.add("genre test 1");
			genreList.add("genre test 2");
			genreList.add("genre test 3");
			genreList.add("genre test 4");
			
		List<String> languageList = searchService.getAllLanguagesAsStrings();
		List<String> publisherList = searchService.getAllPublishersAsStrings();
		List<String> awardList = searchService.getAllAwardsAsStrings();
		List<String> formatList = searchService.getAllFormatsAsStrings();
		List<String> addedList = new ArrayList<String>();
		for(int i = 0; i < GlobalConstants.DATE_ADDED_FOR_SEARCH.length; i++){
			addedList.add(GlobalConstants.DATE_ADDED_FOR_SEARCH[i]);
		}
		List<String> languageList = new ArrayList<String>();
			languageList.add("language test 1");
			languageList.add("language test 2");
			languageList.add("language test 3");
			languageList.add("language test 4");
			
		List<String> publisherList = new ArrayList<String>();
			publisherList.add("publisher test 1");
			publisherList.add("publisher test 2");
			publisherList.add("publisher test 3");
			publisherList.add("publisher test 4");
			
		List<String> awardList = new ArrayList<String>();
			awardList.add("award test 1");
			awardList.add("award test 2");
			awardList.add("award test 3");
			awardList.add("award test 4");
			
		List<String> formatList = new ArrayList<String>();
			formatList.add("format test 1");
			formatList.add("format test 2");
			formatList.add("format test 3");
			formatList.add("format test 4");
			
		model.addAttribute("genres", genreList3PointO);
		model.addAttribute("languages", languageList);
		model.addAttribute("publishers", publisherList);
		model.addAttribute("awards", awardList);
		model.addAttribute("addeds", addedList);
		model.addAttribute("formats", formatList);
	}
	*/
}
