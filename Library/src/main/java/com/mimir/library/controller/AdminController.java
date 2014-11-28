package com.mimir.library.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AddBookForm;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.AudioBookLanguage;
import com.mimir.library.model.Author;
import com.mimir.library.model.AuthorAward;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookAward;
import com.mimir.library.model.BookGenre;
import com.mimir.library.model.BookInterestLevel;
import com.mimir.library.model.DownloadSite;
import com.mimir.library.model.EBookFormat;
import com.mimir.library.model.EBookLanguage;
import com.mimir.library.model.Format;
import com.mimir.library.model.Genre;
import com.mimir.library.model.InterestLevel;
import com.mimir.library.model.Language;
import com.mimir.library.model.Publisher;
import com.mimir.library.service.AddBookTextFileParsingService;
import com.mimir.library.service.LibraryService;

// Temporary until Signing in is figured out 
@Controller
public class AdminController {
	
	@Autowired
	LibraryService service;
	
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
	
}
