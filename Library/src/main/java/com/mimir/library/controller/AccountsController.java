package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.HashSet;

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
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;
import com.mimir.library.service.RegisteredUserService;

@Controller
public class AccountsController {
	
	@Autowired
    RegisteredUserService service;
	
	@RequestMapping("/account")
	public ModelAndView showMessage(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("error");
			return mv;
		}
		ModelAndView mv = new ModelAndView("library/newaccount");
		ArrayList<BookDisplayableInformation> dummyList = new ArrayList<BookDisplayableInformation>();
		
		Book dummyBook = new Book();
		Author dummyAuthor = new Author("Stephen Hawking", "I ARE SMART	");
		ArrayList<Author> dummyAuthors = new ArrayList<Author>();
		dummyAuthors.add(dummyAuthor);
		dummyBook.setAuthors(dummyAuthors);
		BookDisplayableInformation dummyInfo = new BookDisplayableInformation();
		//dummyInfo.setAuthor(new Author("Dummy Author", "Likes to write books"));
		//dummyInfo.setBookId("Dummy Id");
		dummyInfo.setImageFilePath("/Library/resources/img/TestImg1.jpg");
		dummyInfo.setTitle("Dummy Title");
		dummyInfo.setBook(dummyBook);
		dummyInfo.setDescription("Dummy Description...");
		dummyList.add(dummyInfo);
		
		
		Book dummyBook2 = new Book();
		Author dummyAuthor2 = new Author("Lois Lowry", "Wizards and stuff");
		ArrayList<Author> dummyAuthors2 = new ArrayList<Author>();
		dummyAuthors2.add(dummyAuthor2);
		dummyBook2.setAuthors(dummyAuthors2);
		BookDisplayableInformation dummyInfo2 = new BookDisplayableInformation();
		//dummyInfo2.setAuthor(new Author("Dummy Author2", "Doesn't like to write books"));
		//dummyInfo2.setBookId("Dummy Id2");
		dummyInfo2.setBook(dummyBook2);
		dummyInfo2.setImageFilePath("/Library/resources/img/TestImg2.jpg");
		dummyInfo2.setTitle("Dummy Title2");
		dummyInfo2.setDescription("Dummy Description2...Yay TestingLayoutSpacingTestingLayoutSpacing\nTestingLayoutSpacingTestingLayoutSpacingTestingLayoutSpacing");
		dummyList.add(dummyInfo2);
		
		mv.addObject("dummyBooks", dummyList);
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
				RegisteredUser user = service.getSpecificUserFromAccountInfo(currentUserAccountInfo);
				if(user != null){
					user.setCurrentEBooks(new HashSet<BorrowedEBook>());
					user.setWishlistEBooks(new HashSet<WishlistEBook>());
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
