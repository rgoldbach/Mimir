package com.mimir.library.controller;
 
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
 
@Controller
public class BookController {
	@RequestMapping("/book")
	public ModelAndView showMessage(
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") String whichBook) {
		System.out.println("in controller");
 
		ModelAndView mv = new ModelAndView("library/book");
		mv.addObject("whichBook", whichBook);
		return mv;
	}
	
	@RequestMapping("/bookModal")
	public ModelAndView openBookModal(
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") String whichBook){
		System.out.println("in controller");
		ModelAndView mv = new ModelAndView("library/bookModal");
		//dummy data
		Book theBook = new Book();
		BookDisplayableInformation bdi = new BookDisplayableInformation();
		bdi.setTitle("Test Book");
		bdi.setDescription("This is a description for a fake book for a fake book for a fake book a fake book a fake book a fake book fake book fake book book book book ook ook ook ook ok ok ok k k k k k k            ");
		bdi.setImageFilePath("resources/img/TestImg3.jpg");
		theBook.setBookDisplay(bdi);
		ArrayList<Author> authors = new ArrayList<Author>();
		Author firstAuthor= new Author();
		Author secondAuthor = new Author();
		secondAuthor.setName("Jesse William");
		firstAuthor.setName("JW Carey");
		authors.add(firstAuthor);
		authors.add(secondAuthor);
		theBook.setAuthors(authors);
		
		
		mv.addObject("book", theBook);
		return mv;
	}
}