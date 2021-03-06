package com.mimir.library.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.beans.BasicBookInfo;
import com.mimir.library.beans.BasicOnHoldBookInfo;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.ChangeUserInfo;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
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
			ModelAndView mv = new ModelAndView("library/error");
			return mv;
		}
		RegisteredUser currentUser = (RegisteredUser) session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		ModelAndView mv = new ModelAndView("library/newaccount");
		
		//Recently Added
		List<BasicBookInfo> recentlyAddedBooks = service.getRecentlyAddedBooksOfUser(currentUser);
		mv.addObject("recentlyAdded", recentlyAddedBooks);
		mv.addObject("recentlyAddedSize", recentlyAddedBooks.size());
		
		//Pending 
		List<BasicOnHoldBookInfo> booksOnHold = service.getPendingBooksOfUser(currentUser);
		mv.addObject("pending", booksOnHold);

		//Wishlist
		List<BasicBookInfo> wishlist = service.getWishlistBooksOfUser(currentUser);
		mv.addObject("wishlist", wishlist);
		
		//Past Borrowed
		List<BasicBookInfo> pastBooks = service.getPastBorrowedBooksOfUser(currentUser);
		mv.addObject("pastBorrowed", pastBooks);
		
		//Recommended
		List<BasicBookInfo> recommendedBooks = service.getRecommendedBooksForUser(currentUser);
		mv.addObject("recommended", recommendedBooks);
		
		return mv;
	}
	
	private ArrayList<BookDisplayableInformation> getBookshelfEBooks(RegisteredUser currentUser){
		ArrayList<BookDisplayableInformation> bookshelfBooks = new ArrayList<BookDisplayableInformation>();
		Set<BorrowedEBook> books = currentUser.getBorrowedEBooks();
		for(BorrowedEBook book: books){
			bookshelfBooks.add(bookService.getSpecificBook(book.getEBook().getBook().getBookId()).getBookDisplay());
		}
		return bookshelfBooks;
	}
	private ArrayList<BookDisplayableInformation> getBookshelfAudioBooks(RegisteredUser currentUser){
		ArrayList<BookDisplayableInformation> bookshelfBooks = new ArrayList<BookDisplayableInformation>();
		Set<BorrowedAudioBook> books = currentUser.getBorrowedAudioBooks();
		for(BorrowedAudioBook book: books){
			bookshelfBooks.add(bookService.getSpecificBook(book.getAudioBook().getBook().getBookId()).getBookDisplay());
		}
		return bookshelfBooks;
	}
	
	@RequestMapping(value = "changeUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public String changeUserInformation(@RequestBody ChangeUserInfo info, HttpSession session){
		
		if(!info.getPassword().equals(info.getPasswordConfirm())){
			return "failure";
		}
		// System.out.println(service.numberOfUsersByEmail(info.getEmail()));
		
		if(!info.getEmail().equals(info.getOldEmail())){
			if(service.numberOfUsersByEmail(info.getEmail()).compareTo(BigInteger.ZERO)!=0){
				return "email";
			}
		}
		
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(!info.getCurrentPassword().equals(user.getAccountInfo().getLoginCredentials().getPassword())){
			return "invalid";
		}
		
		AccountInfo userInfo = user.getAccountInfo();
		LoginCredentials loginCreds = userInfo.getLoginCredentials();
		userInfo.setFirstName(info.getFirstName());
		userInfo.setLastName(info.getLastName());
		loginCreds.setEmail(info.getEmail());
		loginCreds.setPassword(info.getPassword());
		userInfo.setLoginCredentials(loginCreds);
		user.setAccountInfo(userInfo);
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, user);
		service.updateRegisteredUser(user);
		return "Success";
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@ResponseBody
	public String signIn(@RequestBody LoginCredentials creds, HttpSession session) {
		// System.out.println("In Accounts Controller --> Trying to login user. ");	
		AccountInfo currentUserAccountInfo = service.signInUser(creds);
		
		if(currentUserAccountInfo != null){
			// System.out.println("User " + currentUserAccountInfo.getFirstName() + " sign in.");
			if(currentUserAccountInfo.getAccountType().equals(GlobalConstants.REGISTERED_USER_TYPE)){
				// System.out.println("User " + currentUserAccountInfo.getFirstName() + " is a registered user.");
				//Joins all the book list tables, so those lists are now created
				RegisteredUser user = service.getSpecificUserFromAccountInfoWithAllInfo(currentUserAccountInfo);
				if(user != null){
					session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, user);
					// System.out.println("User " + currentUserAccountInfo.getFirstName() + " successfully signed in.");
					return "user";
				}			
			}
			else if(currentUserAccountInfo.getAccountType().equals(GlobalConstants.ADMIN_USER_TYPE)){
				// System.out.println("User " + currentUserAccountInfo.getFirstName() + " is an admin.");		
				Admin admin = service.getSpecificAdminFromAccountInfo(currentUserAccountInfo);
				if(admin != null){
					session.setAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER, admin);
					// System.out.println("User " + currentUserAccountInfo.getFirstName() + " successfully signed in.");
					return "admin";
				}	    
			}		
		}
		// System.out.println("Invalid user signin.");
		return "signinfailure";

	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.POST)
	public @ResponseBody String signOut(@RequestBody String todo, HttpSession session) {
		// System.out.println("Debug: User is signing out");
		session.setAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER, null);
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, null);
		return "signoutsuccess";

	}
	
	
}
