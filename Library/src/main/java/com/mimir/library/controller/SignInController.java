package com.mimir.library.controller;
 
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.service.AccountManager;
 
@Controller
public class SignInController {
 
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@ResponseBody
	public String signIn(@RequestBody LoginCredentials creds, HttpSession session) {
		System.out.println("in controller");
		//Do some sort of authentication, for now, just assume they are a valid user.
		
		
		//Get a default user for now
		RegisteredUser tempUser = AccountManager.getDefaultUser(creds.getUsername());
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, tempUser);
		return "success";

	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.POST)
	public @ResponseBody String signOut(@RequestBody String todo, HttpSession session) {
		System.out.println("in controller");
		//Do some sort of authentication, for now, just assume they are a valid user.
		
		
		//Get a default user for now
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, null);
		return "signoutsuccess";

	}
}