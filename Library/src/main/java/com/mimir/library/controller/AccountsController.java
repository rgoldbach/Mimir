package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;
import com.mimir.library.service.LibraryService;
import com.mimir.library.service.RegisteredUserService;

@Controller
public class AccountsController {
	
	@Autowired
    RegisteredUserService service;
	@Autowired
	LibraryService bookService;
	
	@RequestMapping("/account")
	public ModelAndView showMessage(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("error");
			return mv;
		}
		ModelAndView mv = new ModelAndView("library/newaccount");
		ArrayList<BookDisplayableInformation> bookshelfBooks = new ArrayList<BookDisplayableInformation>();
		RegisteredUser currentUser = (RegisteredUser) session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		Set<BorrowedEBook> books = currentUser.getBorrowedEBooks();
		for(BorrowedEBook book: books){
			bookshelfBooks.add(bookService.getSpecificBook(book.getEBook().getEBookId()).getBookDisplay());
		}
		mv.addObject("bookshelfBooks", bookshelfBooks);
		
		ArrayList<BookDisplayableInformation> wishlistBooks = new ArrayList<BookDisplayableInformation>();
		Set<WishlistEBook> waitBooks = currentUser.getWishlistEBooks();
		for(WishlistEBook book: waitBooks){
			wishlistBooks.add(bookService.getSpecificBook(book.getEBook().getEBookId()).getBookDisplay());
		}
		mv.addObject("wishlistBooks", wishlistBooks);
		return mv;
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@ResponseBody
	public String signIn(@RequestBody LoginCredentials creds, HttpSession session) {
		System.out.println("In Accounts Controller --> Trying to login user. ");	
		AccountInfo currentUserAccountInfo = service.signInUser(creds);
		
		if(currentUserAccountInfo != null){
			System.out.println("User " + currentUserAccountInfo.getFirstName() + " sign in.");
			if(currentUserAccountInfo.getAccountType().equals(GlobalConstants.REGISTERED_USER_TYPE)){
				System.out.println("User " + currentUserAccountInfo.getFirstName() + " is a registered user.");
				//Joins all the book list tables, so those lists are now created
				RegisteredUser user = service.getSpecificUserFromAccountInfoWithAllInfo(currentUserAccountInfo);
				if(user != null){
					session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, user);
					System.out.println("User " + currentUserAccountInfo.getFirstName() + " successfully signed in.");
					return "user";
				}			
			}
			else if(currentUserAccountInfo.getAccountType().equals(GlobalConstants.ADMIN_USER_TYPE)){
				System.out.println("User " + currentUserAccountInfo.getFirstName() + " is an admin.");		
				Admin admin = service.getSpecificAdminFromAccountInfo(currentUserAccountInfo);
				if(admin != null){
					session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, admin);
					System.out.println("User " + currentUserAccountInfo.getFirstName() + " successfully signed in.");
					return "admin";
				}	    
			}		
		}
		System.out.println("Invalid user signin.");
		return "signinfailure";

	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.POST)
	public @ResponseBody String signOut(@RequestBody String todo, HttpSession session) {
		System.out.println("in signin controller");
		//Do some sort of authentication, for now, just assume they are a valid user.
		
		
		//Get a default user for now
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, null);
		return "signoutsuccess";

	}
}
