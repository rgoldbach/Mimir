package com.mimir.library.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.ChangeUserInfo;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.service.AddBookTextFileParsingService;
import com.mimir.library.service.LibraryService;
import com.mimir.library.service.RegisteredUserService;

// Temporary until Signing in is figured out 
@Controller
public class AdminController {
	
	@Autowired
	LibraryService service;
	
	@Autowired
	RegisteredUserService userService;
	
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
	
	
	
	@RequestMapping(value = "banUser", method = RequestMethod.GET)
	@ResponseBody
	public String banUser(@RequestParam("libraryCard") String libraryCard){
		RegisteredUser user = userService.getSpecificUser(libraryCard);
		userService.deleteRegisteredUserById(user.getRegUserId());
		
		return "success";
	}
	
	@RequestMapping(value ="uploadFile", method = RequestMethod.POST)
	public @ResponseBody String uploadFileHandler(@RequestParam("name") String name,
												  @RequestParam("file") MultipartFile file) {
 
        if (!file.isEmpty()) {
            try {
            	InputStream inputStream = file.getInputStream();
            	BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            	System.out.println("About to analyze file..");
            	AddBookTextFileParsingService fileParser = new AddBookTextFileParsingService(service);
            	String response = fileParser.analyzeFile(bufferedReader);
                return response;
            } catch (Exception e) {
                return "You failed to upload file => " + e.getMessage();
            }
        } else {
            return "You failed to upload because the file was empty.";
        }
    }
	
	@RequestMapping(value="getUserAdmin", method = RequestMethod.GET)
	@ResponseBody
	public ChangeUserInfo editUser(@RequestParam("number") String libraryCardNumber){
		ChangeUserInfo info = new ChangeUserInfo();
		RegisteredUser user = userService.getSpecificUser(libraryCardNumber);
		info.setEmail(user.getAccountInfo().getLoginCredentials().getEmail());
		info.setFirstName(user.getAccountInfo().getFirstName());
		info.setLastName(user.getAccountInfo().getLastName());
		info.setLibraryCardNumber(libraryCardNumber);
		info.setPassword(user.getAccountInfo().getLoginCredentials().getPassword());
		info.setPasswordConfirm(user.getAccountInfo().getLoginCredentials().getPassword());
		return info;
	}
	
	@RequestMapping(value="editUserAdmin", method = RequestMethod.POST)
	@ResponseBody
	public String editUserAdmin(@RequestBody ChangeUserInfo info){
		RegisteredUser user =userService.getSpecificUser(info.getLibraryCardNumber());
		
		AccountInfo userInfo = user.getAccountInfo();
		LoginCredentials loginCreds = userInfo.getLoginCredentials();
		userInfo.setFirstName(info.getFirstName());
		userInfo.setLastName(info.getLastName());
		loginCreds.setEmail(info.getEmail());
		loginCreds.setPassword(info.getPassword());
		userInfo.setLoginCredentials(loginCreds);
		user.setAccountInfo(userInfo);
		userService.updateRegisteredUser(user);
		return "Success";

		
	}
	
	
	
}
