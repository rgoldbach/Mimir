package com.mimir.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public ModelAndView goToHomePage(){
		System.out.println("In Home Controller - Redirecting to Homepage");
		ModelAndView mv = new ModelAndView("library/index");
		return mv;
	}
	
}
