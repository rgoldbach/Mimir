package com.mimir.library.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.UserRegisterInformation;
import com.mimir.library.service.RegisteredUserService;



@Controller
public class RegisterController {
	
	@Autowired
	RegisteredUserService service;
	
	@RequestMapping(value ="register", method = RequestMethod.POST)
	@ResponseBody
	public String addBook(@RequestBody UserRegisterInformation regInfo, HttpSession session) {
		//check if email and librarycard are unique
		Long check = new Long(0);
		// System.out.println(service.numberOfUsersByEmail(regInfo.getEmail()));
		if(service.numberOfUsersByEmail(regInfo.getEmail()).compareTo(BigInteger.ZERO)!=0){
			return "email";
		}
		ArrayList<RegisteredUser> temps = (ArrayList<RegisteredUser>)service.getAllUsers();
		for(RegisteredUser tempUser : temps){
			if(tempUser.getLibraryCardNumber().equals(regInfo.getLibraryCardNumber())){
				return "card";
			}
		}
		
		int accountId = service.getMaxAccountInfoId();
		accountId +=1;
		// System.out.println("TESTEST "+ accountId );
		// System.out.println("OASSWIRDASDA " + regInfo.getPassword());
		AccountInfo acctInfor = new AccountInfo();
		acctInfor.setFirstName(regInfo.getFirstName());
		acctInfor.setLastName(regInfo.getLastName());
		acctInfor.setAccountType(GlobalConstants.REGISTERED_USER_TYPE);
		service.saveAccountInfo(acctInfor);

		
		
		LoginCredentials creds = new LoginCredentials();
		creds.setEmail(regInfo.getEmail());
		creds.setPassword(regInfo.getPassword());
		creds.setAccountInfo(acctInfor);
		acctInfor.setLoginCredentials(creds);
		
		RegisteredUser user = new RegisteredUser();
		user.setLibraryCardNumber(regInfo.getLibraryCardNumber());
		user.setAccountInfo(acctInfor);
		user.setUserCode(UUID.randomUUID().toString());
		
		service.updateRegisteredUser(user);
		
		AccountInfo temp = service.signInUser(creds);
		user = service.getSpecificUserFromAccountInfoWithAllInfo(temp);
		session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, user);
		
		// System.out.print(user.getLibraryCardNumber());
		
		return "success";
		
	}
	
	@RequestMapping(value ="registerAdmin", method = RequestMethod.POST)
	@ResponseBody
	public String regAdmin(@RequestBody UserRegisterInformation regInfo, HttpSession session) {
		//check if email is unique
		Long check = new Long(0);
		// System.out.println(service.numberOfUsersByEmail(regInfo.getEmail()));
		if(service.numberOfUsersByEmail(regInfo.getEmail()).compareTo(BigInteger.ZERO)!=0){
			return "email";
		}
		
		AccountInfo acctInfor = new AccountInfo();
		acctInfor.setFirstName(regInfo.getFirstName());
		acctInfor.setLastName(regInfo.getLastName());
		acctInfor.setAccountType(GlobalConstants.ADMIN_USER_TYPE);
		service.saveAccountInfo(acctInfor);
		LoginCredentials creds = new LoginCredentials();
		creds.setEmail(regInfo.getEmail());
		creds.setPassword(regInfo.getPassword());
		creds.setAccountInfo(acctInfor);
		acctInfor.setLoginCredentials(creds);
		Admin admin = new Admin();
		admin.setAccountInfo(acctInfor);
		service.updateAdmin(admin);
		return "success";
		
	}
}
