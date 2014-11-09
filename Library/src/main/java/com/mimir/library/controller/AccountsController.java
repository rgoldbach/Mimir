package com.mimir.library.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
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
		ModelAndView mv = new ModelAndView("library/account");
		ArrayList<BookDisplayableInformation> dummyList = new ArrayList<BookDisplayableInformation>();
		
		BookDisplayableInformation dummyInfo = new BookDisplayableInformation();
		//dummyInfo.setAuthor(new Author("Dummy Author", "Likes to write books"));
		//dummyInfo.setBookId("Dummy Id");
		dummyInfo.setImageFilePath("/Library/resources/img/TestImg1.jpg");
		dummyInfo.setTitle("Dummy Title");
		dummyInfo.setDescription("Dummy Description...");
		dummyList.add(dummyInfo);
		
		BookDisplayableInformation dummyInfo2 = new BookDisplayableInformation();
		//dummyInfo2.setAuthor(new Author("Dummy Author2", "Doesn't like to write books"));
		//dummyInfo2.setBookId("Dummy Id2");
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
		RegisteredUser currentUser = service.userCanSignIn(creds);
		if(currentUser != null){
			System.out.println("User " + currentUser.getAccountInfo().getFirstName() + " now signed in.");
			session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, currentUser);
			return "success";
		}
		return "failure";

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
