package com.mimir.library.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookDisplayableInformation;

@Controller
public class AccountsController {
	@RequestMapping("/account")
	public ModelAndView showMessage(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("error");
			return mv;
		}
		ModelAndView mv = new ModelAndView("library/account");
		ArrayList<BookDisplayableInformation> dummyList = new ArrayList<BookDisplayableInformation>();
		
		BookDisplayableInformation dummyInfo = new BookDisplayableInformation();
		dummyInfo.setAuthor(new Author("Dummy Author", "Likes to write books"));
		dummyInfo.setBookId("Dummy Id");
		dummyInfo.setImageFilePath("/Library/resources/img/TestImg1.jpg");
		dummyInfo.setTitle("Dummy Title");
		dummyInfo.setDescription("Dummy Description...");
		dummyList.add(dummyInfo);
		
		BookDisplayableInformation dummyInfo2 = new BookDisplayableInformation();
		dummyInfo2.setAuthor(new Author("Dummy Author2", "Doesn't like to write books"));
		dummyInfo2.setBookId("Dummy Id2");
		dummyInfo2.setImageFilePath("/Library/resources/img/TestImg2.jpg");
		dummyInfo2.setTitle("Dummy Title2");
		dummyInfo2.setDescription("Dummy Description2...Yay TestingLayoutSpacingTestingLayoutSpacing\nTestingLayoutSpacingTestingLayoutSpacingTestingLayoutSpacing");
		dummyList.add(dummyInfo2);
		
		mv.addObject("dummyBooks", dummyList);
		return mv;
	}
}
