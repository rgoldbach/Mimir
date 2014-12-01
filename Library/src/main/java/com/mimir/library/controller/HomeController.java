package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.beans.BasicBookInfo;
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
		searchService.initHibernateSearch();
		ModelAndView mv = new ModelAndView("library/index");
		
		List<BasicBookInfo> newEBooks =  searchService.getNewEBooks(8);
		mv.addObject("newBooks", newEBooks);
		
		List<BasicBookInfo> newAudioBooks = searchService.getNewAudioBooks(8);
		mv.addObject("newAudioBooks", newAudioBooks);
		
		List<BasicBookInfo> topEBooks = searchService.getTopEBooks(8);
		mv.addObject("topBooks", topEBooks);
		
		List<BasicBookInfo> topAudioBooks = searchService.getTopAudioBooks(8);
		mv.addObject("topAudioBooks", topAudioBooks);
		
		
		/*ArrayList<BookDisplayableInformation> newBooks = new ArrayList<BookDisplayableInformation>();
		newBooks.add(libraryService.getSpecificBook(1).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(3).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(2).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(6).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(5).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(8).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(7).getBookDisplay());
		newBooks.add(libraryService.getSpecificBook(4).getBookDisplay());
		
		ArrayList<BookDisplayableInformation> topBooks = new ArrayList<BookDisplayableInformation>();
		topBooks.add(libraryService.getSpecificBook(1).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(3).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(2).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(6).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(5).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(8).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(7).getBookDisplay());
		topBooks.add(libraryService.getSpecificBook(4).getBookDisplay());
		
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

		mv.addObject("topAudioBooks", topAudioBooks);*/
		
		
		return mv;
		
	}
	
}
