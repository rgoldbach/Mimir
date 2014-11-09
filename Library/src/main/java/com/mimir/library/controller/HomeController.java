package com.mimir.library.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.service.TestLibrary;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public ModelAndView goToHomePage(){
		TestLibrary tl= new TestLibrary();
		ArrayList<BookDisplayableInformation> newBooks = tl.getNewBooks();
		ArrayList<BookDisplayableInformation> topBooks = tl.getTopBooks();
		System.out.println("In Home Controller - Redirecting to Homepage");
		ModelAndView mv = new ModelAndView("library/index");
		mv.addObject("newBooks", newBooks);
		mv.addObject("topBooks", topBooks);
		return mv;
	}
	
}
