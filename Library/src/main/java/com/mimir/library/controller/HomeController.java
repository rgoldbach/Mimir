package com.mimir.library.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.service.LibraryService;
import com.mimir.library.service.SearchService;
import com.mimir.library.service.TestLibrary;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	SearchService searchService;
	@Autowired
	LibraryService libraryService;
	
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public ModelAndView goToHomePage(){
		TestLibrary tl= new TestLibrary();
		searchService.initHibernateSearch();
		ArrayList<BookDisplayableInformation> newBooks = tl.getNewBooks();
		ArrayList<BookDisplayableInformation> topBooks = tl.getTopBooks();
		System.out.println("In Home Controller - Redirecting to Homepage");
		ModelAndView mv = new ModelAndView("library/index");
		mv.addObject("newBooks", newBooks);
		mv.addObject("topBooks", topBooks);
		ArrayList<BookDisplayableInformation> newAudioBooks = new ArrayList<BookDisplayableInformation>();
		newAudioBooks.add(libraryService.getSpecificBook(1).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(3).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(2).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(6).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(5).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(8).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(7).getBookDisplay());
		newAudioBooks.add(libraryService.getSpecificBook(4).getBookDisplay());
		
		mv.addObject("newAudioBooks", newAudioBooks);
		ArrayList<BookDisplayableInformation> topAudioBooks = new ArrayList<BookDisplayableInformation>();
		topAudioBooks.add(libraryService.getSpecificBook(2).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(3).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(1).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(4).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(5).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(6).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(7).getBookDisplay());
		topAudioBooks.add(libraryService.getSpecificBook(8).getBookDisplay());

		mv.addObject("topAudioBooks", topAudioBooks);
		
		
		return mv;
		
	}
	
}
