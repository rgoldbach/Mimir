package com.mimir.library.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.AudioBookLanguage;
import com.mimir.library.model.Author;
import com.mimir.library.model.AuthorAward;
import com.mimir.library.model.AwardInfo;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookAward;
import com.mimir.library.model.BookDisplayableInformation;
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

public class AddBookTextFileParsingService {

	private static String title = "Title-";
	private static String desc = "Description-";
	private static String authors = "Authors-";
	private static String authAwar = "AuthorAwards-";
	private static String authAwarFin = "AuthorAwardsFinished";
	private static String awarTit = "Title:";
	private static String awarDesc = "Description:";
	private static String awarYear = "Year:";
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
	private static String ebookFormats = "EBookFormats-";
	private static String type = "Type:";
	private static String release = "ReleaseDate:";
	private static String fileSize = "FileSize:";
	private static String endEbookFormats = "EndEBookFormats";
	private static String audioBookFormats = "AudioBookFormats-";
	private static String numOfParts = "NumOfParts:";
	private static String duration = "Duration:";
	private static String endAudioBookFormats = "EndAudioBookFormats";
	private static String languages = "Languages-";
	private static String downloadSite = "DownloadSite-";
	private static String downloadSiteName = "Name:";
	private static String ebookNumCopies = "EBookNumOfCopies:";
	private static String audioBookNumCopies = "AudioBookNumbOfCopies:";
	private static String endDownloadSite = "EndDownloadSite";
	
	LibraryService service;
	
	public AddBookTextFileParsingService(LibraryService service2){
		this.service = service2;
	}
	
	public String analyzeFile(BufferedReader bufferedReader){
		Book book;
		String response = "Books Added: ";
		String line = "";
    	try {
    		line = bufferedReader.readLine();
    		while(line!=null && !(line.equalsIgnoreCase("Finished") || line.equalsIgnoreCase(""))){
    			book = new Book();
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseTitle(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseDescription(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		while(!line.trim().equalsIgnoreCase(authFin)){
        			// System.out.println(line + " matching " + authFin + " results to " + (line.equalsIgnoreCase(authFin)));
        			parseAuthors(line, book);
        			line = bufferedReader.readLine();
        			// System.out.println(line);
        			while(!line.equalsIgnoreCase(authAwarFin)){
        				parseAuthorAward(line, book);
        				line = bufferedReader.readLine();
        				// System.out.println(line);
        			}
        			line = bufferedReader.readLine();
        			// System.out.println(line);
        		}
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseIsbn(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseSeriesName(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		while(!line.trim().equalsIgnoreCase(bookAwardsFin)){
            		parseBookAwards(line, book);
            		line = bufferedReader.readLine();
            		// System.out.println(line);
        		}
        		addTodaysDate(book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseImageFile(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseGenres(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseInterestLevels(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseEBookPublisher(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseAudioBookPublisher(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		while(!line.trim().equalsIgnoreCase(endEbookFormats)){
            		parseEBookFormat(line, book);
            		line = bufferedReader.readLine();
            		// System.out.println(line);
        		}
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		while(!line.trim().equalsIgnoreCase(endAudioBookFormats)){
            		parseAudioBookFormat(line, book);
            		line = bufferedReader.readLine();
            		// System.out.println(line);
        		}
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		parseLanguages(line, book);
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		while(!line.trim().equalsIgnoreCase(endDownloadSite)){
        			parseDownloadSite(line, book);
            		line = bufferedReader.readLine();
            		// System.out.println(line);
        		}
        		line = bufferedReader.readLine();
        		// System.out.println(line);
        		service.saveBook(book);
        		response += " " + book.getBookDisplay().getTitle() + ", ";
        		// System.out.println(response);
    		}
		} catch (IOException e) {
			// System.out.println("Error Parsing File At Line " + line);
			return  "Response: " + response + "Error Parsing File At Line " + line + "! Reason: " +  e;
		} catch(IllegalArgumentException e1){
			return "Response: " + response + "Error Parsing File At Line " + line + "! Reason: " + e1;
		}
		return response;	
	}

	private void parseDownloadSite(String line, Book book) {
		line = line.trim();
		if(!line.contains(downloadSite)){
			throw new IllegalArgumentException("Expected download site, actual is " + line);
		}
		String restOfLine = line.substring(downloadSite.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("Download site cannot be null! Line: " + line);
		}
		String[] downloadSiteInfo = restOfLine.split("_");
		if(downloadSiteInfo.length != 3){
			throw new IllegalArgumentException();
		}
		if(!downloadSiteInfo[0].contains(downloadSiteName)){
			throw new IllegalArgumentException();
		}
		DownloadSite dls = new DownloadSite();
		dls.setName(downloadSiteInfo[0].substring(downloadSiteName.length(), downloadSiteInfo[0].length()));
		if(!downloadSiteInfo[1].contains(ebookNumCopies)){
			throw new IllegalArgumentException();
		}
		book.getEBook().setRemainingCopies(new Integer(downloadSiteInfo[1].substring(ebookNumCopies.length(), downloadSiteInfo[1].length())));
		if(!downloadSiteInfo[2].contains(audioBookNumCopies)){
			throw new IllegalArgumentException();
		}
		book.getAudioBook().setRemainingCopies(new Integer(downloadSiteInfo[2].substring(audioBookNumCopies.length(), downloadSiteInfo[2].length())));
	}

	private void parseLanguages(String line, Book book) {
		line = line.trim();
		if(!line.contains(languages)){
			throw new IllegalArgumentException("Expected languages, actual is " + line);
		}
		String restOfLine = line.substring(languages.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("A book must have languages! Line: " + line);
		}
		String[] languages = restOfLine.split("_");
		for(String languageName : languages){
			Language language = service.getLanguage(languageName);
			EBookLanguage ebl = new EBookLanguage();
			AudioBookLanguage abl = new AudioBookLanguage();
			ebl.setLanguage(language);
			abl.setLanguage(language);
			book.getEBook().getLanguages().add(ebl);
			book.getAudioBook().getLanguages().add(abl);
		}
	}

	private void parseAudioBookFormat(String line, Book book) {
		AudioBookFormat abf = new AudioBookFormat();
		line = line.trim();
		if(!line.contains(audioBookFormats)){
			throw new IllegalArgumentException("Expected audio book formats, actual is " + line);
		}
		String restOfLine = line.substring(audioBookFormats.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("You must add specific formats for the audiobook! Line: " + line);
		}
		String[] formatInfo = restOfLine.split("_");
		if(formatInfo.length != 5){
			throw new IllegalArgumentException();
		}
		if(!formatInfo[0].contains(type)){
			throw new IllegalArgumentException();
		}
		// System.out.println(formatInfo[0].substring(type.length(), formatInfo[0].length()));
		Format f = service.getFormat(formatInfo[0].substring(type.length(), formatInfo[0].length()));
		if(f == null) throw new IllegalArgumentException("Invalid Audio Format Type");
		abf.setFormat(f);
		if(!formatInfo[1].contains(release)){
			throw new IllegalArgumentException();
		}
		DateTimeFormatter dtf = DateTimeFormat.forPattern("MM/dd/yyyy");
		LocalDate date = LocalDate.parse(formatInfo[1].substring(release.length(), formatInfo[1].length()), dtf);
		abf.setReleaseDate(date);
		if(!formatInfo[2].contains(fileSize)){
			throw new IllegalArgumentException();
		}
		abf.setFileSize(new Integer(formatInfo[2].substring(fileSize.length(), formatInfo[2].length())));
		if(!formatInfo[3].contains(numOfParts)){
			throw new IllegalArgumentException();
		}
		abf.setNumOfParts(new Integer(formatInfo[3].substring(numOfParts.length(), formatInfo[3].length())));
		if(!formatInfo[4].contains(duration)){
			throw new IllegalArgumentException();
		}
		abf.setDuration(new Integer(formatInfo[4].substring(duration.length(), formatInfo[4].length())));
		book.getAudioBook().getAudioBookFormats().add(abf);
	}

	private void parseEBookFormat(String line, Book book) {
		EBookFormat ebf = new EBookFormat();
		line = line.trim();
		if(!line.contains(ebookFormats)){
			throw new IllegalArgumentException("Expected ebook formats, actual is " + line);
		}
		String restOfLine = line.substring(ebookFormats.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("You must add specific formats for the ebook! Line: " + line);
		}
		String[] formatInfo = restOfLine.split("_");
		if(formatInfo.length != 3){
			throw new IllegalArgumentException();
		}
		if(!formatInfo[0].contains(type)){
			throw new IllegalArgumentException();
		}
		Format f = service.getFormat(formatInfo[0].substring(type.length(), formatInfo[0].length()));
		if(f == null) throw new IllegalArgumentException("Invalid Audio Format Type");
		ebf.setFormat(f);
		if(!formatInfo[1].contains(release)){
			throw new IllegalArgumentException();
		}
		DateTimeFormatter dtf = DateTimeFormat.forPattern("MM/dd/yyyy");
		LocalDate date = LocalDate.parse(formatInfo[1].substring(release.length(), formatInfo[1].length()), dtf);
		ebf.setReleaseDate(date);
		// System.out.println(formatInfo[1]);
		if(!formatInfo[2].contains(fileSize)){
			throw new IllegalArgumentException();
		}
		ebf.setFileSize(new Integer(formatInfo[2].substring(fileSize.length(), formatInfo[2].length())));
		// System.out.println(formatInfo[2]);
		book.getEBook().geteBookFormats().add(ebf);
	}

	private void parseAudioBookPublisher(String line, Book book) {
		line = line.trim();
		if(!line.contains(aPublisher)){
			throw new IllegalArgumentException("Expected audiobook publisher, actual is " + line);
		}
		String restOfLine = line.substring(aPublisher.length(), line.length());
		if(restOfLine.equalsIgnoreCase("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("AudioBook Publisher cannot be null! Line: " + line);
		}

		Publisher publisher = service.getPublisher(restOfLine);
		if(publisher == null){
			publisher = new Publisher();
			publisher.setName(restOfLine);
		}
		book.getAudioBook().setPublisher(publisher);
	}

	private void parseEBookPublisher(String line, Book book) {
		line = line.trim();
		if(!line.contains(ePublisher)){
			throw new IllegalArgumentException("Expected ebook publisher, actual is " + line);
		}
		String restOfLine = (line.substring(ePublisher.length(), line.length()));
		if(restOfLine.equalsIgnoreCase("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("EBook Publisher cannot be null! Line: " + line);
		}
		Publisher publisher = service.getPublisher(restOfLine);
		if(publisher == null){
			publisher = new Publisher();
			publisher.setName(restOfLine);
		}
		book.getEBook().setPublisher(publisher);
	}

	private void parseInterestLevels(String line, Book book) {
		line = line.trim();
		if(!line.contains(intrstLvls)){
			throw new IllegalArgumentException("Expected interest levels, actual is " + line);
		}
		String restOfLine = (line.substring(intrstLvls.length(), line.length()));
		if(restOfLine.equalsIgnoreCase("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("Interest Levels cannot be null! Line:" + line);
		}	
		String[] interestLevels = restOfLine.split("_");
		for(String interestLevelname : interestLevels){
			// System.out.println("DEBUG - " + interestLevelname);
			BookInterestLevel il = new BookInterestLevel();
			InterestLevel interestLevel = service.getInterestLevel(interestLevelname);
			if(interestLevel == null){
				interestLevel = new InterestLevel();
				interestLevel.setInterestLevel(interestLevelname);
				il.setInterestLevel(interestLevel);
				book.getInterestLevels().add(il);
			}
			else{
				il.setInterestLevel(interestLevel);
				book.getInterestLevels().add(il);
			}
		}
	}

	private void parseGenres(String line, Book book) {
		line = line.trim();
		if(!line.contains(genres)){
			throw new IllegalArgumentException("Expected genres, actual is " + line);
		}
		String restOfLine = line.substring(genres.length(), line.length());
		if(restOfLine.equalsIgnoreCase("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("A book must have a genre! Line:"+line);
		}
		String[] genres = restOfLine.split("_");
		for(String genreName : genres){
			BookGenre bg = new BookGenre();
			Genre genre = service.getGenre(genreName);
			if(genre == null){
				genre = new Genre();
				genre.setGenre(genreName);
				bg.setGenre(genre);
				book.getGenres().add(bg);
			}
			else{
				bg.setGenre(genre);
				book.getGenres().add(bg);
			}
		}
	}

	private void parseImageFile(String line, Book book) {
		line = line.trim();
		if(!line.contains(imgPath)){
			throw new IllegalArgumentException("Expected image path, found " + line);
		}
		String restOfLine = line.substring(imgPath.length(), line.length());
		if((restOfLine.equalsIgnoreCase("null") || restOfLine.equals(""))){
			throw new IllegalArgumentException("Image path cannot be null! Line: " + line);
		}
		book.getBookDisplay().setImageFilePath(restOfLine);
	}

	private void addTodaysDate(Book book) {
		LocalDate today = new LocalDate();
		book.getBookDisplay().setDateAdded(today);;
	}

	private void parseBookAwards(String line, Book book) {
		BookAward award = new BookAward();
		AwardInfo awardInfo = new AwardInfo();
		line = line.trim();
		if(!line.contains(bookAwards)){
			throw new IllegalArgumentException("Expected book awards, found " + line);
		}
		String restOfLine = line.substring(bookAwards.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			return;
		}
		String[] awrdInfo = restOfLine.split("_");
		if(awrdInfo.length != 3){
			throw new IllegalArgumentException();
		}
		if(!awrdInfo[0].contains(awarTit)){
			throw new IllegalArgumentException();
		}
		String title = awrdInfo[0].substring(awarTit.length(), awrdInfo[0].length());
		awardInfo.setTitle(title);
		if(!awrdInfo[1].contains(awarDesc)){
			throw new IllegalArgumentException();
		}
		awardInfo.setDescription(awrdInfo[1].substring(awarDesc.length(), awrdInfo[1].length()));
		if(!awrdInfo[2].contains(awarYear)){
			throw new IllegalArgumentException();
		}
		String year = awrdInfo[2].substring(awarYear.length(), awrdInfo[2].length());
		awardInfo.setYear(year);
		AwardInfo persistedAwardInfo = service.getAwardInfo(title, year);
		if(persistedAwardInfo != null){
			award.setAwardInfo(persistedAwardInfo);
		}
		else{
			award.setAwardInfo(awardInfo);
		}
		book.getAwards().add(award);
	}

	private void parseSeriesName(String line, Book book) throws IOException {
		line = line.trim();
		if(!line.contains(seriesName)){
			throw new IllegalArgumentException("Expected series name, found " + line);
		}
		String restOfLine = line.substring(seriesName.length(), line.length());
		if((restOfLine.equalsIgnoreCase("null") || restOfLine.equals(""))){
			return;
		}
		book.setSeriesName(restOfLine);
	}

	private void parseIsbn(String line, Book book) {
		line = line.trim();
		if(!line.contains(isbn)){
			throw new IllegalArgumentException("Expected isbn, found " + line);
		}
		String restOfLine = line.substring(isbn.length(), line.length());
		if((restOfLine.equalsIgnoreCase("null") || restOfLine.equals(""))){
			throw new IllegalArgumentException("Isbn cannot be null...");
		}
		book.setIsbn(restOfLine);
	}
	
	private void parseAuthorAward(String line, Book book){
		AuthorAward award = new AuthorAward();
		AwardInfo awardInfo = new AwardInfo();
		line = line.trim();
		if(!line.contains(authAwar)){
			throw new IllegalArgumentException("Expected author awards, found " + line);
		}
		String restOfLine = line.substring(authAwar.length(), line.length());
		if(restOfLine.equals("null")){
			return;
		}
		String[] awrdInfo = restOfLine.split("_");
		if(awrdInfo.length != 3){
			throw new IllegalArgumentException();
		}
		if(!awrdInfo[0].contains(awarTit)){
			throw new IllegalArgumentException();
		}
		String title = awrdInfo[0].substring(awarTit.length(), awrdInfo[0].length());
		awardInfo.setTitle(title);
		if(!awrdInfo[1].contains(awarDesc)){
			throw new IllegalArgumentException();
		}
		awardInfo.setDescription(awrdInfo[1].substring(awarDesc.length(), awrdInfo[1].length()));
		if(!awrdInfo[2].contains(awarYear)){
			throw new IllegalArgumentException();
		}
		String year = awrdInfo[2].substring(awarYear.length(), awrdInfo[2].length());
		awardInfo.setYear(year);
		AwardInfo persistedAwardInfo = service.getAwardInfo(title, year);
		if(persistedAwardInfo != null){
			award.setAwardInfo(persistedAwardInfo);
		}
		else{
			award.setAwardInfo(awardInfo);
		}
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
			throw new IllegalArgumentException("Expected authors, found " + line);
		}
		String restOfLine = line.substring(authors.length(), line.length());
		String[] authorInfo = restOfLine.split("_");
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException();
		}
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
			throw new IllegalArgumentException("Expected description, found " + line);
		}
		String restOfLine = line.substring(desc.length(), line.length());
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("Description cannot be null! Line: " + line);
		}
		book.getBookDisplay().setDescription(restOfLine);
	}

	private void parseTitle(String line, Book book){
		line = line.trim();
		if(!line.contains(title)){
			throw new IllegalArgumentException("Expected title, actual is " + line);
		}
		String restOfLine = line.substring(title.length(), line.length());
		BookDisplayableInformation bdi = service.getBookDisplayByTitle(restOfLine);
		if(bdi != null){
			throw new IllegalArgumentException("Title already exists in database! " + line);
		}
		if(restOfLine.equals("null") || restOfLine.equals("")){
			throw new IllegalArgumentException("Title cannot be null! " + line);
		}
		book.getBookDisplay().setTitle(restOfLine);
	}
	
}
