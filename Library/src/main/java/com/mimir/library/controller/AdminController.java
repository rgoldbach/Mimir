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
import com.mimir.library.model.Author;
import com.mimir.library.model.AuthorAward;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;

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
	
	@RequestMapping(value ="uploadFile", method = RequestMethod.POST)
	public @ResponseBody String uploadFileHandler(@RequestParam("name") String name,
												  @RequestParam("file") MultipartFile file) {
 
        if (!file.isEmpty()) {
            try {
            	InputStream inputStream = file.getInputStream();
            	BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            	System.out.println("About to analyze file..");
            	String response = analyzeFile(bufferedReader);
            	
 
                return "";
            } catch (Exception e) {
                return "You failed to upload file => " + e.getMessage();
            }
        } else {
            return "You failed to upload because the file was empty.";
        }
    }
	
	private static String title = "Title-";
	private static String desc = "Description-";
	private static String authors = "Authors-";
	private static String authAwar = "AuthorAwards-";
	private static String authAwarFin = "AuthorAwardsFinished";
	private static String authAwarTit = "Title:";
	private static String authAwarDesc = "Description:";
	private static String authAwarYear = "Year:";
	private static String authFin = "AuthorFinished";
	private static String isbn = "ISBN-";
	private static String seriesName = "SeriesName-";
	private static String bookAwards = "BookAwards-";
	private static String bookAwardsFin = "BookAwardsFinished";
	private static String imgPath = "ImageFilePath-";
	private static String genres = "Genres-";
	private static String intrstLvls = "InterestLevels-";
	private static String ePublisher = "EBookPublisher-";
	private static String aPublisher = "AudioBookPublisher-";
	private static String format = "Format-";
	private static String ebookFormats = "EBookFormats";
	private static String type = "Type-";
	private static String release = "Release-";
	private static String fileSize = "FileSize-";
	private static String endEbookFormats = "EndEBookFormats";
	private static String audioBookFormats = "AudioBookFormats";
	private static String numOfParts = "NumOfParts-";
	private static String duration = "Duration-";
	private static String endAudioBookFormats = "EndAudioBookFormats";
	private static String languages = "Languages-";
	private static String downloadSite = "DownloadSite-";
	private static String ebookNumCopies = "EBookNumberOfCopies-";
	private static String audioBookNumCopies = "AudioBookNumberOfCopies-";
	
	private String analyzeFile(BufferedReader bufferedReader){
		Book book = new Book();
		String line = "";
    	try {
    		System.out.println("Parsing Title..");
    		line = bufferedReader.readLine();
    		parseTitle(line, book);
    		System.out.println("Parsing Description..");
    		line = bufferedReader.readLine();
    		parseDescription(line, book);
    		System.out.println("Parsing Authors..");
    		line = bufferedReader.readLine();
    		while(!line.equals(authFin)){
    			parseAuthors(line, book);
    			System.out.println("Parsing Author Awards..");
    			line = bufferedReader.readLine();
    			while(!line.equals(authAwarFin)){
    				parseAuthorAward(line, book);
    				line = bufferedReader.readLine();
    			}
    		}
    		System.out.println("Parsing Isbn..");
    		line = bufferedReader.readLine();
    		parseIsbn(line, book);
    		System.out.println("Success");
    		line = bufferedReader.readLine();
    		parseSeriesName(line, book);
    		line = bufferedReader.readLine();
    		while(!line.equals(bookAwardsFin)){
        		parseBookAwards(line, book);
        		line = bufferedReader.readLine();
    		}
    		addTodaysDate(book);
    		line = bufferedReader.readLine();
    		parseImageFile(line, book);
    		line = bufferedReader.readLine();
    		parseGenres(line, book);
    		line = bufferedReader.readLine();
    		parseInterestLevels(line, book);
    		line = bufferedReader.readLine();
    		parseEBookPublisher(line, book);
    		line = bufferedReader.readLine();
    		parseAudioBookPublisher(line, book);
    		line = bufferedReader.readLine();
    		while(!line.equals(endEbookFormats)){
        		parseEBookFormat(line, book);
        		line = bufferedReader.readLine();
    		}
    		line = bufferedReader.readLine();
    		while(!line.equals(endAudioBookFormats)){
        		parseAudioBookFormat(line, book);
        		line = bufferedReader.readLine();
    		}
    		line = bufferedReader.readLine();
    		parseLanguages(line, book);
    		line = bufferedReader.readLine();
    		parseDownloadSite(line, book);
    		line = bufferedReader.readLine();
    		parseEBookCopies(line, book);
    		line = bufferedReader.readLine();
    		parseAudioBookCopies(line, book);   		
    		
		} catch (IOException e) {
			System.out.println("Error Parsing File At Line " + line);
			return "Error Parsing File At Line " + line;
		}
		return GlobalConstants.DAO_SUCCESS;	
	}

	private void parseAudioBookCopies(String line, Book book) {
		
	}

	private void parseEBookCopies(String line, Book book) {
		
	}

	private void parseDownloadSite(String line, Book book) {
		
	}

	private void parseLanguages(String line, Book book) {
		
	}

	private void parseAudioBookFormat(String line, Book book) {
		
	}

	private void parseEBookFormat(String line, Book book) {
		
	}

	private void parseAudioBookPublisher(String line, Book book) {
		
	}

	private void parseEBookPublisher(String line, Book book) {
		
	}

	private void parseInterestLevels(String line, Book book) {
		
	}

	private void parseGenres(String line, Book book) {
		
	}

	private void parseImageFile(String line, Book book) {
		line = line.trim();
		if(!line.contains(imgPath)){
			throw new IllegalArgumentException();
		}
		book.getBookDisplay().setImageFilePath(line.substring(imgPath.length(), line.length()));
	}

	private void addTodaysDate(Book book) {
		
	}

	private void parseBookAwards(String line, Book book) {
		
	}

	private void parseSeriesName(String line, Book book) throws IOException {
		throw new IOException();
	}

	private void parseIsbn(String line, Book book) {
		line = line.trim();
		if(!line.contains(isbn)){
			throw new IllegalArgumentException();
		}
		book.setIsbn(line.substring(isbn.length(), line.length()));
	}
	
	private void parseAuthorAward(String line, Book book){
		AuthorAward award = new AuthorAward();
		AwardInfo awardInfo = new AwardInfo();
		line = line.trim();
		if(!line.contains(authAwar)){
			throw new IllegalArgumentException();
		}
		String restOfLine = line.substring(authAwar.length(), line.length());
		String[] awrdInfo = restOfLine.split("_");
		if(awrdInfo.length != 3){
			throw new IllegalArgumentException();
		}
		if(!awrdInfo[0].contains("Title:")){
			throw new IllegalArgumentException();
		}
		awardInfo.setTitle(awrdInfo[0].substring("Title:".length(), awrdInfo[0].length()));
		if(!awrdInfo[1].contains("Description:")){
			throw new IllegalArgumentException();
		}
		awardInfo.setDescription(awrdInfo[1].substring("Description:".length(), awrdInfo[1].length()));
		if(!awrdInfo[2].contains("Year:")){
			throw new IllegalArgumentException();
		}
		awardInfo.setYear(awrdInfo[2].substring("Year:".length(), awrdInfo[2].length()));
		award.setAwardInfo(awardInfo);
		Iterator<Author> it = book.getAuthors().iterator();
		Author author = null;
		while(it.hasNext()){
			author = it.next();
		}
		author.getAwards().add(award);
	}

	private void parseAuthors(String line, Book book) {
		Author author = new Author();
		line = line.trim();
		if(!line.contains(authors)){
			throw new IllegalArgumentException();
		}
		String restOfLine = line.substring(authors.length(), line.length());
		String[] authorInfo = restOfLine.split("_");
		if(authorInfo.length != 2){
			throw new IllegalArgumentException();
		}
		if(!authorInfo[0].contains("Name:")){
			throw new IllegalArgumentException();
		}
		author.setName(authorInfo[0].substring("Name:".length(), authorInfo[0].length()));
		if(!authorInfo[1].contains("Description:")){
			throw new IllegalArgumentException();
		}
		author.setDescription(authorInfo[1].substring("Description:".length(), authorInfo[1].length()));
		book.getAuthors().add(author);
	}

	private void parseDescription(String line, Book book) {
		line = line.trim();
		if(!line.contains(desc)){
			throw new IllegalArgumentException();
		}
		book.getBookDisplay().setDescription(line.substring(desc.length(), line.length()));
	}

	private void parseTitle(String line, Book book){
		line = line.trim();
		if(!line.contains(title)){
			throw new IllegalArgumentException();
		}
		book.getBookDisplay().setTitle(line.substring(title.length(), line.length()));
	}
}
