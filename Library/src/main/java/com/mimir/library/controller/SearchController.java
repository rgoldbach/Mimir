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
	public ModelAndView showMessage(
			@RequestParam(value = "type", required = false, defaultValue = "ERROR") String type) {
		System.out.println("in controller");
 
		ModelAndView mv = new ModelAndView("library/search");
		mv.addObject("message", message);
		mv.addObject("type", type);
		return mv;
	}
}