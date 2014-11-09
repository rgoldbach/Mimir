package com.mimir.library.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// Temporary until Signing in is figured out 
@Controller
public class TestPageController {
	@RequestMapping("/test")
	public ModelAndView showMessage(HttpSession session){
		ModelAndView mv = new ModelAndView("test/index");
		return mv;
	}
}
