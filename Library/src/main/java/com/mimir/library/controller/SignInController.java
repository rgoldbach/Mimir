package com.mimir.library.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class SignInController {
 
	@RequestMapping("/signin")
	public ModelAndView showMessage(
			@RequestParam(value = "username", required = false, defaultValue = "ERROR") String username) {
		System.out.println("in controller");
 
		ModelAndView mv = new ModelAndView("signin");
		mv.addObject("username", username);
		return mv;
	}
}