package com.mimir.library.controller;
 
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Book;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.service.TestLibrary;
 
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
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook){
		System.out.println(whichBook);
		ModelAndView mv = new ModelAndView("library/bookModal");
		//dummy data final code will use whichBook to get book from service
		
		TestLibrary tl = new TestLibrary();
		Book theBook = tl.getBookById(whichBook);
		
		
		mv.addObject("book", theBook);
		return mv;
	}
	
	@RequestMapping(value ="/borrow")
	@ResponseBody
	public String borrowBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, HttpSession session){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(currentUser!=null){
			System.out.println("Request to borrow " + whichBook + " from " + currentUser.getLoginCredentials().getEmail());
			TestLibrary tl = new TestLibrary();
			BorrowedEBook rentedEBook = new BorrowedEBook(tl.getBookById(whichBook), currentUser);
			if(currentUser.getCurrentEBooks()==null){
				Set<BorrowedEBook> bookshelf = new HashSet<BorrowedEBook>();
				bookshelf.add(rentedEBook);
				currentUser.setCurrentEBooks(bookshelf);
			}
			else{
				currentUser.addBookToBookshelf(rentedEBook);
			}
			System.out.println(currentUser.getCurrentEBooks().size());
			
			
		}
		
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