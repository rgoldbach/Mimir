package com.mimir.library.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class SearchController {
	String message = "Search Returned 1337 Results!";
 
	@RequestMapping("/search")
	public ModelAndView quickSearch(
			@RequestParam(value = "type", required = false, defaultValue = "") String query) {
		System.out.println("Quick Search for " + query);
 
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
}