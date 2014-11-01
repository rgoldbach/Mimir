package com.mimir.library.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;

@Controller
public class AccountsController {
	@RequestMapping("/account")
	public ModelAndView showMessage(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("error");
			return mv;
		}
		ModelAndView mv = new ModelAndView("account");
		return mv;
	}
}
