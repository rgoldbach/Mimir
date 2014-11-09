package com.mimir.library.controller;
 
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println(whichBook);
		ModelAndView mv = new ModelAndView("library/bookModal");
		//dummy data final code will use whichBook to get book from service
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
	
	@RequestMapping(value ="/borrow")
	@ResponseBody
	public String borrowBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook, HttpServletRequest request){
		System.out.println("Request to borrow " + whichBook);
		
		//get book from service
		
		//add book to current users bookshelf
		
		//return message
		
		return "temp";
		
	}
	
	@RequestMapping("/waitlist")
	public String waitlistBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook){
		System.out.println("Request to waitlist " + whichBook);
		
		//get book from service
		
		//add book to current users waitlist
		
		//return message
		
		return "temp";
		
	}
	
	@RequestMapping("/wishlist")
	public String wishlistBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook){
		System.out.println("Request to wishtlist " + whichBook);
		
		//get book from service
		
		//add book to current users waishist
		
		//return message
		
		return "temp";
		
	}
	
	@RequestMapping("/ratebook")
	public String rateBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook, 
			@RequestParam(value="whichBook", required = false, defaultValue = "0") double rating){
		System.out.println("Request to waitlist " + whichBook + "to " + rating);
		
		//get book from service
		
		//add book to current users waitlist
		
		//return message
		
		return "temp";
		
	}
	
	
	
}