package com.mimir.library.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.enums.SearchType;
import com.mimir.library.enums.SortType;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookGenre;
import com.mimir.library.service.SearchService;
 
@Controller
public class SearchController {
	String message = "Search Returned 1337 Results!";
	
	@Autowired
	SearchService searchService;
 
	@RequestMapping("/quickSearch")
	public ModelAndView quickSearch(
			@RequestParam(value = "query", required = false, defaultValue = "") String query, HttpSession session) {
		System.out.println("Quick Search for " + query);
		
		//Always set the first index to 0 every time a new search is made. 
		int firstResultIndex = 0;
		
		//Quick Search sorting by Relevance...
		List<Book> books = searchService.search(query, firstResultIndex, SearchType.Quick, SortType.Relevance);
		
		if(books == null){
			message = "No results for '" + query + "' were found!"; 
		}else{
			message = "Search for '" + query + "'"; 
		}
		
		debugPrint(books);
		
		//Try sorting by author name
		
		System.out.println("\n\n A DIFFERENT SEARCH FOR DEBUGGING \n\n");
		
		List<Book> books2 = searchService.search(query, firstResultIndex, SearchType.Quick, SortType.AuthorAtoZ);
 
		debugPrint(books2);
		
		ModelAndView mv = new ModelAndView("library/search");
		mv.addObject("message", message);
		
		return mv;
	}
	
	@RequestMapping("/advancedSearch")
	public ModelAndView advancedSearch(){
		//define search object and pass as paramater
		ModelAndView mv = new ModelAndView("library/search");
		//get list of books based on search object and add to mv
		
		return mv;
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
}