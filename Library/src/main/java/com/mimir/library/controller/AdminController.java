package com.mimir.library.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// Temporary until Signing in is figured out 
@Controller
public class AdminController {
	
	@RequestMapping("admin")
	public ModelAndView showMessage(HttpSession session){
		ModelAndView mv = new ModelAndView("admin/index");
		return mv;
	}
	
	@RequestMapping(value ="addBook", method = RequestMethod.GET)
	public String addBook() {
		return "admin/addBook";

	}
	
	@RequestMapping(value ="addBooks", method = RequestMethod.GET)
	public String addBooks() {
		return "admin/addBooks";
	}
	
	@RequestMapping(value ="searchBooks", method = RequestMethod.GET)
	public String searchBooks() {
		return "admin/searchBooks";
	}
	
	@RequestMapping(value ="users", method = RequestMethod.GET)
	public String users() {
		return "admin/users";
	}
	
	@RequestMapping(value ="support", method = RequestMethod.GET)
	public String support() {
		return "admin/support";
	}
	
}
