package com.mimir.library.controller;
 
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Book;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;
import com.mimir.library.service.LibraryService;
import com.mimir.library.service.RegisteredUserService;
import com.mimir.library.service.TestLibrary;
 
@Controller
public class BookController {
	
	@Autowired
	LibraryService libraryService;
	
	@Autowired
	RegisteredUserService userService;
	
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
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook, HttpSession session){
		System.out.println(whichBook);
		ModelAndView mv = new ModelAndView("library/bookModal");		
		Book book = libraryService.getSpecificBook(whichBook);		
		session.setAttribute("viewBook", book);
		mv.addObject("book", book);
		return mv;
	}
	
	@RequestMapping(value ="/borrow")
	@ResponseBody
	public String borrowBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, HttpSession session){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);	
		String message = "";
		if(currentUser!=null){
			System.out.println("Request to borrow " + whichBook + " from " + currentUser.getAccountInfo().getLoginCredentials().getEmail());
			BorrowedEBook rentedEBook = new BorrowedEBook(libraryService.getSpecificEBook(whichBook), currentUser);
			message = userService.saveBorrowedEBookOfSpecificUser(rentedEBook);
			if(message.equals(GlobalConstants.DAO_SUCCESS)){
				//Borrowed EBook persisted...
				//adds book for  current session
				currentUser.addBookToBookshelf(rentedEBook);
			}
			else{
				//Borrowed EBook not persisted...
				//Reason why is already stored in message
			}	
		}	
		//return message		
		return message;
		
	}
	
	@RequestMapping("/waitlist")
	public String waitlistBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook, HttpSession session){
		System.out.println("Request to waitlist " + whichBook);

		//get book from service
		
		//add book to current users waitlist
		
		//return message
		
		return "temp";
		
	}
	
	@RequestMapping("/wishlist")
	public String wishlistBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, HttpSession session){
		System.out.println("Request to wishtlist " + whichBook);
		String message = "";
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		WishlistEBook wishBook = new WishlistEBook(libraryService.getSpecificEBook(whichBook), currentUser);
		message = userService.saveWishlistEBookOfSpecificUser(wishBook);
		System.out.println(currentUser.getWishlistEBooks().size());
		if(message.equals(GlobalConstants.DAO_SUCCESS)){
			currentUser.addBookToWishlist(wishBook);
			//Wish-list EBook persisted...
		}
		else{
			//Wish-list EBook not persisted...
			//Reason why is already stored in message
		}	
		
		return message;
		
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
