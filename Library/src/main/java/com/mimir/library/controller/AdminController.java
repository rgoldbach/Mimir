package com.mimir.library.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.List;

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

import com.mimir.library.beans.AdminBook;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.ChangeUserInfo;
import com.mimir.library.model.EBook;
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
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("library/error");
			return mv;
		}
		ModelAndView mv = new ModelAndView("admin/index");
		return mv;
	}
	
	@RequestMapping(value ="addBook", method = RequestMethod.GET)
	public String addBook(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			return "library/error";
		}
		return "admin/addBook";

	}
	
	@RequestMapping(value ="addBooks", method = RequestMethod.GET)
	public String addBooks(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			return "library/error";
		}
		
		return "admin/addBooks";
	}
	
	@RequestMapping(value ="searchBooks", method = RequestMethod.GET)
	public ModelAndView searchBooks(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			ModelAndView mv = new ModelAndView("library/error");
			return mv;
		}
		
		ModelAndView mv = new ModelAndView("admin/searchBooks");
		List<AdminBook> adminBooks = service.getAllBooksForAdmin();
		mv.addObject("adminBooks", adminBooks);
		return mv;
	}
	
	@RequestMapping(value ="adminBookMoreInfo", method = RequestMethod.GET)
	@ResponseBody
	public AdminBook modalBookInfo(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
									  @RequestParam(value = "bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
									  HttpSession session) {
		Admin admin = (Admin) session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER);
		if(admin == null) return null;
		AdminBook book = null;
		if(bookFormat.equalsIgnoreCase(GlobalConstants.EBOOK)){
			EBook eBook = service.getSpecificEBook(whichBook);
			book = new AdminBook(eBook, "SIMPLE");
			book.setTotalCopies(service.getTotalCopiesOfEBook(eBook));
		}else if(bookFormat.equalsIgnoreCase(GlobalConstants.AUDIOBOOK)){
			AudioBook audioBook = service.getSpecificAudioBook(whichBook);
			book = new AdminBook(audioBook, "SIMPLE");
			book.setTotalCopies(service.getTotalCopiesOfAudioBook(audioBook));
		}
		return book;
	}
	@RequestMapping(value ="adminSaveBookChanges", method = RequestMethod.POST)
	@ResponseBody
	public AdminBook saveBookChanges(@RequestBody AdminBook book) {
		if(!service.updateBook(book)){
			// System.out.println("DEBUG - Book Not Updated!");
		}
		if(book.getAvailableCopies() > 0){
			userService.updateHolds(book);
		}
		return book;
	}
	@RequestMapping(value ="adminDeleteBook", method = RequestMethod.GET)
	@ResponseBody
	public String deleteBook(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
								@RequestParam(value = "bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
								HttpSession session) {
		return service.deleteBook(whichBook, bookFormat);
	}
	@RequestMapping(value ="users", method = RequestMethod.GET)
	public String users(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			return "library/error";
		}
		
		return "admin/users";
	}
	
	@RequestMapping(value ="support", method = RequestMethod.GET)
	public String support(HttpSession session) {
		if(session.getAttribute(GlobalConstants.CURRENT_ADMIN_SESSION_GETTER) == null){
			return "library/error";
		}
		
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
            	// System.out.println("About to analyze file..");
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
		if(!info.getEmail().equals(info.getOldEmail())){
			if(userService.numberOfUsersByEmail(info.getEmail()).compareTo(BigInteger.ZERO)!=0)
				return "email";
			
		}
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
