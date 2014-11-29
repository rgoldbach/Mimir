package com.mimir.library.search;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.joda.time.LocalDate;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookGenre;
import com.mimir.library.model.EBookFormat;

public class SearchResult {

	private int bookId;
	
	//Either AudioBookId or EBookId id
	private int formatId;
	
	private String format;
	
	private int relevanceScore;
	
	private int mostPopularScore;
	
	private List<String> authorNames;
	
	private double rating;
	
	private String title;
	
	private LocalDate releaseDate;
	
	private LocalDate dateAdded;
	
	private boolean isAvailable;
	
	private List<String> genreNames;
	
	private List<String> formatNames;
	
	private String imgPath;
	
	private String description;
	
	private int displayId;
	
	public SearchResult(){}
	
	public SearchResult(Book book, String format, int relevanceScore){
		if(format.equals(GlobalConstants.EBOOK)){
			
			this.bookId = book.getBookId();
			this.formatId = book.getEBook().getEBookId();
			this.format = GlobalConstants.EBOOK;
			this.relevanceScore = relevanceScore;
			this.mostPopularScore = 0; //TODO
			this.authorNames = getAuthorNames(book.getAuthors());
			this.rating = book.getEBook().getBookRating().getRating();
			this.title = book.getBookDisplay().getTitle();
			this.releaseDate = book.getEBook().geteBookFormats().iterator().next().getReleaseDate();
			this.dateAdded = book.getBookDisplay().getDateAdded();
			this.isAvailable = (book.getEBook().getRemainingCopies() != 0);
			this.genreNames = getGenreNames(book.getGenres());
			this.formatNames = getEBookFormatNames(book.getEBook().geteBookFormats());
			this.imgPath = book.getBookDisplay().getImageFilePath();
			this.description = book.getBookDisplay().getDescription();
			this.displayId = book.getBookDisplay().getBookDisplayId();
			
		}else if(format.equals(GlobalConstants.AUDIOBOOK)){
			
			this.bookId = book.getBookId();
			this.formatId = book.getAudioBook().getAudioBookId();
			this.format = GlobalConstants.AUDIOBOOK;
			this.relevanceScore = relevanceScore;
			this.mostPopularScore = 0; //TODO
			this.authorNames = getAuthorNames(book.getAuthors());
			this.rating = book.getAudioBook().getBookRating().getRating();
			this.title = book.getBookDisplay().getTitle();
			this.releaseDate = book.getAudioBook().getAudioBookFormats().iterator().next().getReleaseDate();
			this.dateAdded = book.getBookDisplay().getDateAdded();
			this.isAvailable = (book.getAudioBook().getRemainingCopies() != 0);
			this.genreNames = getGenreNames(book.getGenres());
			this.formatNames = getAudioBookFormatNames(book.getAudioBook().getAudioBookFormats());
			this.imgPath = book.getBookDisplay().getImageFilePath();
			this.description = book.getBookDisplay().getDescription();
			this.displayId = book.getBookDisplay().getBookDisplayId();
			
		}
	}
	
	private List<String> getAuthorNames(Collection<Author> authors){
		List<String> authorNames = new ArrayList<String>();
		for(Author a : authors){
			authorNames.add(a.getName());
		}
		return authorNames;
	}
	private List<String> getGenreNames(Collection<BookGenre> genres){
		List<String> genreNames = new ArrayList<String>();
		for(BookGenre g : genres){
			genreNames.add(g.getGenre().getGenre());
		}
		return genreNames;
	}
	private List<String> getEBookFormatNames(Collection<EBookFormat> bookFormats){
		List<String> formatNames = new ArrayList<String>();
		for(EBookFormat bf : bookFormats){
			formatNames.add(bf.getFormat().getFormatType().toString());
		}
		return formatNames;
	}
	private List<String> getAudioBookFormatNames(Collection<AudioBookFormat> bookFormats){
		List<String> formatNames = new ArrayList<String>();
		for(AudioBookFormat bf : bookFormats){
			formatNames.add(bf.getFormat().getFormatType().toString());
		}
		return formatNames;
	}
	
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getFormatId() {
		return formatId;
	}

	public void setFormatId(int formatId) {
		this.formatId = formatId;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public int getRelevanceScore() {
		return relevanceScore;
	}

	public void setRelevanceScore(int relevanceScore) {
		this.relevanceScore = relevanceScore;
	}

	public List<String> getAuthorNames() {
		return authorNames;
	}

	public void setAuthorNames(List<String> authorNames) {
		this.authorNames = authorNames;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public List<String> getGenreNames() {
		return genreNames;
	}

	public void setGenreNames(List<String> genreNames) {
		this.genreNames = genreNames;
	}

	public List<String> getFormatNames() {
		return formatNames;
	}

	public void setFormatNames(List<String> formatNames) {
		this.formatNames = formatNames;
	}

	public LocalDate getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}

	public LocalDate getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDate dateAdded) {
		this.dateAdded = dateAdded;
	}

	public int getMostPopularScore() {
		return mostPopularScore;
	}

	public void setMostPopularScore(int mostPopularScore) {
		this.mostPopularScore = mostPopularScore;
	}
	
	public String getImgPath(){
		return imgPath;
	}
	
	public String setImgPath(String imgPath){
		return this.imgPath = imgPath;
	}
	
	public String getDescription(){
		return description;
	}
	
	public String setDescription(String description){
		return this.description = description;
	}
	
	public int getDisplayId() {
		return displayId;
	}

	public void setDisplayId(int displayId) {
		this.displayId = displayId;
	}
	
	public void print(){
		System.out.println("bookid "+bookId);
		System.out.println("formatid "+formatId);
		System.out.println("format "+format);
		System.out.println("relevance "+relevanceScore);
		System.out.println("mostpop "+mostPopularScore);
		System.out.println("authorname "+authorNames.get(0));
		System.out.println("rating "+rating);
		System.out.println("title "+title);
		System.out.println("releasedate "+releaseDate);
		System.out.println("dateadded "+dateAdded);
		System.out.println("isavailable "+isAvailable);
		System.out.println("genrename "+genreNames.get(0));
		System.out.println("formatname "+formatNames.get(0));
	}
	
}
