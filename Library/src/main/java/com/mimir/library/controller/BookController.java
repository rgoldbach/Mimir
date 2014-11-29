package com.mimir.library.controller;
 
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookFormat;
import com.mimir.library.model.AudioBookLanguage;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.AudioBookRating;
import com.mimir.library.model.Author;
import com.mimir.library.model.Book;
import com.mimir.library.model.BookModel;
import com.mimir.library.model.BookRating;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBook;
import com.mimir.library.model.EBookFormat;
import com.mimir.library.model.EBookLanguage;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistAudioBook;
import com.mimir.library.model.WishlistEBook;
import com.mimir.library.service.LamazonService;
import com.mimir.library.service.LibraryService;
import com.mimir.library.service.RegisteredUserService;
 
@Controller
public class BookController {
	
	@Autowired
	LibraryService libraryService;
	
	@Autowired
	RegisteredUserService userService;
	
	@RequestMapping("/book")
	public ModelAndView showMessage(
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") String whichBook) {
		System.out.println("in controller");
		
		ModelAndView mv = new ModelAndView("library/book");
		mv.addObject("whichBook", whichBook);
		return mv;
	}
	
	@RequestMapping("/bookModal")
	public ModelAndView openBookModal(
			@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
			@RequestParam(value = "bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
			HttpSession session){
		
		System.out.println(whichBook);
		Book book = libraryService.getSpecificBook(whichBook);
		session.setAttribute("viewBook", book);
		ModelAndView mv = null;
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			mv = new ModelAndView("library/bookModal");		
			EBook ebook = libraryService.getSpecificEBook(whichBook);
			mv.addObject("ebook", ebook);
		}
		if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			mv = new ModelAndView("library/audioBookModal");
			AudioBook audioBook = libraryService.getSpecificAudioBook(whichBook);
			mv.addObject("audiobook", audioBook);
		}
		
		return mv;
	}
	
	@RequestMapping(value ="/bookModalTest", method = RequestMethod.GET)
	@ResponseBody
	public BookModel testModal(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
			@RequestParam(value = "bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
			HttpSession session){
		Book book = libraryService.getSpecificBook(whichBook);
		session.setAttribute("viewBook", book);
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);	
		BookModel bookModel = new BookModel();
		if(user == null)
			bookModel.setLoggedIn(false);
		else
			bookModel.setLoggedIn(true);
		
		boolean inBookshelf = false;
		boolean inWishlist = false;		
		bookModel.setType(bookFormat);
		if(bookFormat.equals(GlobalConstants.EBOOK)){

			EBook ebook = libraryService.getSpecificEBook(whichBook);
			bookModel.setImageFilePath(ebook.getBook().getBookDisplay().getImageFilePath());
			bookModel.setId(ebook.getEBookId());
			bookModel.setTitle(ebook.getBook().getBookDisplay().getTitle());
			bookModel.setDescription(ebook.getBook().getBookDisplay().getDescription());
			bookModel.setPublisher(ebook.getPublisher().getName());
			bookModel.setRating(ebook.getBookRating().getRating());
			if(ebook.getRemainingCopies() == 0)
				bookModel.setAvailable(false);
			else
				bookModel.setAvailable(true);
			
			ArrayList<String> authors = new ArrayList<String>();
			for (Author author : ebook.getBook().getAuthors()){
				authors.add(author.getName());
			}
			bookModel.setAuthors(authors);
			
			ArrayList<String> languages = new ArrayList<String>();
			for(EBookLanguage lang : ebook.getLanguages()){
				languages.add(lang.getLanguage().getLanguage());
			}
			bookModel.setLanguages(languages);
			
			ArrayList<String> formats = new ArrayList<String>();
			for(EBookFormat format: ebook.geteBookFormats()){
				formats.add(format.getFormat().getFormatType());
			}
			bookModel.setFormatTypes(formats);
			
			if(user!=null){
				for(BorrowedEBook testBook : user.getBorrowedEBooks()){
					if(testBook.getEBook().getBook().getBookId() == whichBook)
						inBookshelf = true;
				}
				bookModel.setInBookshelf(inBookshelf);
				for(WishlistEBook testBook : user.getWishlistEBooks()){
					if(testBook.getEBook().getBook().getBookId() == whichBook)
						inWishlist = true;
				}
				bookModel.setInWishlist(inWishlist);
			}
		}
		if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			//define AudioBook
			AudioBook audioBook = libraryService.getSpecificAudioBook(whichBook);
			bookModel.setImageFilePath(audioBook.getBook().getBookDisplay().getImageFilePath());
			bookModel.setId(audioBook.getAudioBookId());
			bookModel.setTitle(audioBook.getBook().getBookDisplay().getTitle());
			bookModel.setDescription(audioBook.getBook().getBookDisplay().getDescription());
			bookModel.setPublisher(audioBook.getPublisher().getName());
			bookModel.setRating(audioBook.getBookRating().getRating());
			if(audioBook.getRemainingCopies() == 0)
				bookModel.setAvailable(false);
			else
				bookModel.setAvailable(true);

			ArrayList<String> authors = new ArrayList<String>();
			for (Author author : audioBook.getBook().getAuthors()){
				authors.add(author.getName());
			}
			bookModel.setAuthors(authors);
			
			ArrayList<String> languages = new ArrayList<String>();
			for(AudioBookLanguage lang : audioBook.getLanguages()){
				languages.add(lang.getLanguage().getLanguage());
			}
			bookModel.setLanguages(languages);
			
			ArrayList<String> formats = new ArrayList<String>();
			for(AudioBookFormat format: audioBook.getAudioBookFormats()){
				formats.add(format.getFormat().getFormatType());
			}
			bookModel.setFormatTypes(formats);
			if(user!=null){
				for(BorrowedAudioBook testBook : user.getBorrowedAudioBooks()){
					if(testBook.getAudioBook().getBook().getBookId() == whichBook)
						inBookshelf = true;
				}
				bookModel.setInBookshelf(inBookshelf);
				for(WishlistAudioBook testBook : user.getWishlistAudioBooks()){
					if(testBook.getAudioBook().getBook().getBookId() == whichBook)
						inWishlist = true;
				}
				bookModel.setInWishlist(inWishlist);
			}
		}
		
		return bookModel;
		
	}
	
	@RequestMapping(value ="/borrow")
	@ResponseBody
	public String borrowBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, 
			@RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
			HttpSession session){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);	
		String message = "";
		BorrowedEBook borrowedEBook = null;
		BorrowedAudioBook borrowedAudioBook = null;
		if(currentUser!=null){
			System.out.println("Request to borrow " + bookFormat + " " + whichBook + " from " + currentUser.getAccountInfo().getLoginCredentials().getEmail());
			if(bookFormat.equals(GlobalConstants.EBOOK)){
				borrowedEBook = new BorrowedEBook(libraryService.getSpecificEBook(whichBook), currentUser);
				message = userService.saveBorrowedEBookOfSpecificUser(borrowedEBook);	
			}
			else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
				borrowedAudioBook = new BorrowedAudioBook(libraryService.getSpecificAudioBook(whichBook), currentUser);
				message = userService.saveBorrowedAudioBookOfSpecificUser(borrowedAudioBook);
			}
			if(message.equals(GlobalConstants.DAO_SUCCESS)){
				System.out.println("DEBUG - Successfully borrowed book!");
				//Borrowed EBook persisted...Adds book for  current session
				if(bookFormat.equals(GlobalConstants.EBOOK)){
					currentUser.addBookToBookshelf(borrowedEBook);
				}
				else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
					currentUser.addBookToBookshelf(borrowedAudioBook);
				}
				session.setAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER, currentUser);	
			}
			else{
				//Borrowed EBook not persisted...Reason why is already stored in message
			}	
		}		
		return message;
		
	}
	
	@RequestMapping("/waitlist")
	public String waitlistBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") String whichBook, HttpSession session){
		System.out.println("Request to waitlist " + whichBook);

		//get book from service
		
		//add book to current users waitlist
		
		//return message
		
		return "temp";
		
	}
	
	@RequestMapping("/wishlist")
	@ResponseBody
	public String wishlistBook(@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, 
							   @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
							   HttpSession session){
		System.out.println("Request to wishlist " + whichBook);
		String message = "";
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			message = addeEBookWishlist(currentUser, whichBook);
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			message = addAudioBookWishlist(currentUser, whichBook);
		}
		return message;
		
	}
	
	private String addAudioBookWishlist(RegisteredUser currentUser,int whichBook) {
		WishlistAudioBook wishBook = new WishlistAudioBook(libraryService.getSpecificAudioBook(whichBook), currentUser);
		String message = userService.saveWishlistAudioBookOfSpecificUser(wishBook);
		if(message.equals(GlobalConstants.DAO_SUCCESS)){
			currentUser.addBookToWishlist(wishBook);
		}
		return message;	
	}

	private String addeEBookWishlist(RegisteredUser currentUser, int whichBook) {
		WishlistEBook wishBook = new WishlistEBook(libraryService.getSpecificEBook(whichBook), currentUser);
		String message = userService.saveWishlistEBookOfSpecificUser(wishBook);
		if(message.equals(GlobalConstants.DAO_SUCCESS)){
			currentUser.addBookToWishlist(wishBook);
		}
		return message;	
	}

	@RequestMapping(value = "/ratebook", method = RequestMethod.GET )
	@ResponseBody
	public double rateBook(
			@RequestParam(value="whichBook", required = false, defaultValue = "ERROR") int whichBook, 
			@RequestParam(value="rating", required = false, defaultValue = "0") double rating, 
			@RequestParam(value="formatType", required = false, defaultValue = "EBook") String bookType, 
			HttpSession session){
		
		System.out.println("TESTEST " + whichBook + " " + rating + " " + bookType);
		RegisteredUser user = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		//user.get
		BookRating bookRating = null;
		if(bookType.equals(GlobalConstants.EBOOK)){
			BorrowedEBook ratedEBook = null;
			for(BorrowedEBook eBook : user.getBorrowedEBooks()){
				if(eBook.getEBook().getEBookId() == whichBook)
					eBook.setBookRating(rating);
					userService.saveBorrowedEBookOfSpecificUser(eBook);
			}
			
			EBook book = libraryService.getSpecificEBook(whichBook);
			bookRating = book.getBookRating();
			System.out.print("TESTBOOK");
			System.out.println(bookRating.getNumberOfRatings());
			System.out.println(bookRating.getSumOfRatings());
			System.out.println(bookRating.getRating());
			bookRating.addRating(rating);
			System.out.println(bookRating.getNumberOfRatings());
			System.out.println(bookRating.getSumOfRatings());
			System.out.println(bookRating.getRating());
			return bookRating.getRating();
			//PERSIST BOOKRATING
			//PERSIST USER
		}
		
		if(bookType.equals(GlobalConstants.AUDIOBOOK)){
			BorrowedAudioBook ratedAudioBook = null;
			for(BorrowedAudioBook audioBook : user.getBorrowedAudioBooks()){
				if(audioBook.getAudioBook().getAudioBookId()== whichBook)
					audioBook.setBookRating(rating);
					userService.saveBorrowedAudioBookOfSpecificUser(audioBook);
			}
			AudioBook book = libraryService.getSpecificAudioBook(whichBook);
			AudioBookRating audioBookRating= book.getBookRating();
			audioBookRating.addRating(rating);
			return audioBookRating.getRating();
			
			
			//PERSIST BOOKRATING
			//PERSIST USER
		}
		
		
		return -1;
		
	}
	
	@RequestMapping("/return")
	@ResponseBody
	public String returnBook(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
							 @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
							 HttpSession session){
		String message = GlobalConstants.DAO_SUCCESS;
		System.out.println("Request to return book " + whichBook);	
		//Determine which book format
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			message = returnEBook(session, whichBook);
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			message = returnAudioBook(session, whichBook);
		}	
		return message;
	}
	
	private String returnEBook(HttpSession session, int whichBook){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		Set<BorrowedEBook> bookshelf =(Set<BorrowedEBook>) currentUser.getBorrowedEBooks();
		BorrowedEBook bookToReturn = null;
		for(BorrowedEBook book: bookshelf){
			if(book.getEBook().getEBookId() == whichBook)
				bookToReturn = book;
		}
		currentUser.removeFromBorrowedEBooks(bookToReturn);
		String message = userService.returnBorrowedEBook(bookToReturn);
		return message;
	}
	
	private String returnAudioBook(HttpSession session, int whichBook){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		Set<BorrowedAudioBook> bookshelf =(Set<BorrowedAudioBook>) currentUser.getBorrowedAudioBooks();
		BorrowedAudioBook bookToReturn = null;
		for(BorrowedAudioBook book: bookshelf){
			if(book.getAudioBook().getAudioBookId() == whichBook)
				bookToReturn = book;
		}
		currentUser.removeFromBorrowedAudioBooks(bookToReturn);
		String message = userService.returnBorrowedAudioBook(bookToReturn);
		return message;
	}
	
	@RequestMapping("/removeFromWishlist")
	@ResponseBody
	public String removeFromWishList(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook, 
									 @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
									 HttpSession session){
		String message = "";
		System.out.println("Request to remove wishlist book " + whichBook);
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			message = removeEBookWishlist(currentUser, whichBook);
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			message = removeAudioBookWishlist(currentUser, whichBook);
		}
		return message;
	}

	private String removeAudioBookWishlist(RegisteredUser currentUser,int whichBook) {
		Set<WishlistAudioBook> wishlistBooks = (Set<WishlistAudioBook>) currentUser.getWishlistAudioBooks();
		WishlistAudioBook bookToRemove = null;
		for(WishlistAudioBook book: wishlistBooks){
			if(book.getAudioBook().getAudioBookId() == whichBook)
				bookToRemove = book;
		}
		currentUser.removeFromWishlistAudioBooks(bookToRemove);
		return userService.removeWishlistAudioBookOfSpecificUser(bookToRemove);
	}

	private String removeEBookWishlist(RegisteredUser currentUser, int whichBook) {
		Set<WishlistEBook> wishlistBooks = (Set<WishlistEBook>) currentUser.getWishlistEBooks();
		WishlistEBook bookToRemove = null;
		for(WishlistEBook book: wishlistBooks){
			if(book.getEBook().getEBookId() == whichBook)
				bookToRemove = book;
		}
		currentUser.removeFromWishlistEBooks(bookToRemove);
		return userService.removeWishlistEBookOfSpecificUser(bookToRemove);
	}

	@RequestMapping("/holdBook")
	@ResponseBody
	public String placeBookOnHold(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook, 
			  					  @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
			  					  HttpSession session){
		String message = "Error";
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			message = placeEBookOnHold(session, whichBook);
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			message = placeAudioBookOnHold(session, whichBook);
		}	
		return message;
	}
	private String placeAudioBookOnHold(HttpSession session, int whichBook) {
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		//Check if user is borrowing this book
		Set<BorrowedAudioBook> borrowedBooks = currentUser.getBorrowedAudioBooks();
		for(BorrowedAudioBook book : borrowedBooks){
			if(book.getAudioBook().getBook().getBookId() == whichBook){
				return "You are currently borrowing this book!";
			}
		}
		AudioBookOnHold audioBookOnHold = new AudioBookOnHold(libraryService.getSpecificAudioBook(whichBook), currentUser);
		String message = userService.saveOnHoldAudioBookOfSpecificUser(audioBookOnHold);
		currentUser.getAudioBookHolds().add(audioBookOnHold);
		return message;
	}
	private String placeEBookOnHold(HttpSession session, int whichBook) {
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		//Check if user is borrowing this book
		Set<BorrowedEBook> borrowedBooks = currentUser.getBorrowedEBooks();
		for(BorrowedEBook book : borrowedBooks){
			if(book.getEBook().getBook().getBookId() == whichBook){
				return "You are currently borrowing this book!";
			}
		}
		EBookOnHold eBookOnHold = new EBookOnHold(libraryService.getSpecificEBook(whichBook), currentUser);
		String message = userService.saveOnHoldEBookOfSpecificUser(eBookOnHold);
		currentUser.geteBookHolds().add(eBookOnHold);
		return message;
	}

	@RequestMapping("/removeFromHolds")
	@ResponseBody
	public String removeFromHolds(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook, 
								  @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
								  HttpSession session){
		String message = GlobalConstants.DAO_SUCCESS;
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(currentUser == null){
			return "library/error";
		}
		if(bookFormat.equals(GlobalConstants.EBOOK.toString())){
			EBookOnHold holdToRemove = getEBookHoldToRemove(currentUser, whichBook);
			if(holdToRemove == null){
				return "HoldNotFound";
			}
			message = userService.removeOnHoldEBook(holdToRemove);
		}else if(bookFormat.equals(GlobalConstants.AUDIOBOOK.toString())){
			AudioBookOnHold holdToRemove = getAudioBookHoldToRemove(currentUser, whichBook);
			if(holdToRemove == null){
				return "HoldNotFound";
			}
			message = userService.removeOnHoldAudioBook(holdToRemove);
		}
		return message;
	}
	private AudioBookOnHold getAudioBookHoldToRemove(RegisteredUser currentUser, int bookId) {
		Set<AudioBookOnHold> onHoldAudioBooks = currentUser.getAudioBookHolds();
		for(AudioBookOnHold onHold : onHoldAudioBooks){
			if(onHold.getAudioBook().getBook().getBookId() == bookId){
				return onHold;
			}
		}
		return null;
	}
	private EBookOnHold getEBookHoldToRemove(RegisteredUser currentUser, int bookId) {
		Set<EBookOnHold> onHoldEBooks = currentUser.geteBookHolds();
		for(EBookOnHold onHold : onHoldEBooks){
			if(onHold.getEBook().getBook().getBookId() == bookId){
				return onHold;
			}
		}
		return null;
	}

	@RequestMapping("/download")
	@ResponseBody
	public String downloadBook(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
							   @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
							   HttpSession session){
		RegisteredUser currentUser = (RegisteredUser)session.getAttribute(GlobalConstants.CURRENT_USER_SESSION_GETTER);
		if(currentUser == null) return "Error";
		LamazonService ls = new LamazonService();
		String bookKey = getBookKey(whichBook, bookFormat, currentUser);
		return ls.getBookPageUrl(whichBook, currentUser.getUserCode(), bookKey, bookFormat);
	}
	
	private String getBookKey(int bookId, String bookFormat, RegisteredUser user){
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			Set<BorrowedEBook> borrowedBooks = user.getBorrowedEBooks();
			for(BorrowedEBook book : borrowedBooks){
				if(book.getEBook().getEBookId() == bookId){
					return book.getEBookCode();
				}
			}
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			Set<BorrowedAudioBook> borrowedBooks = user.getBorrowedAudioBooks();
			for(BorrowedAudioBook book : borrowedBooks){
				if(book.getAudioBook().getAudioBookId() == bookId){
					return book.getAudioBookCode();
				}
			}
		}
		return "BookNotFound";
	}
	
	@RequestMapping("/changeBookFormatInfo")
	@ResponseBody
	public JSONObject changeFormatInfo(@RequestParam(value = "whichBook", required = false, defaultValue = "ERROR") int whichBook,
							   @RequestParam(value="bookFormat", required = false, defaultValue = "ERROR") String bookFormat,
							   HttpSession session){
		System.out.println("DEBUG - Changing book info on page for " + whichBook + " in " + bookFormat + " format.");
		if(bookFormat.equals(GlobalConstants.EBOOK)){
			EBook book = libraryService.getSpecificEBook(whichBook);
			System.out.println(book == null);
			return constructJsonObject(book);
		}
		else if(bookFormat.equals(GlobalConstants.AUDIOBOOK)){
			AudioBook book = libraryService.getSpecificAudioBook(whichBook);
			System.out.println(book == null);
			return constructJsonObject(book);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	private JSONObject constructJsonObject(EBook eBook){
		JSONObject json = new JSONObject();
		json.put("publisherName", eBook.getPublisher().getName());
		json.put("rating", eBook.getBookRating().getRating());
		json.put("remainingCopies", eBook.getRemainingCopies());
		JSONArray formats = new JSONArray();
		for(EBookFormat f : eBook.geteBookFormats()){
			formats.add(f.getFormat().getFormatType());	
		}
		json.put("formats", formats);
		JSONArray languages = new JSONArray();
		for(EBookLanguage l : eBook.getLanguages()){
			languages.add(l.getLanguage().getLanguage());
		}
		json.put("languages", languages);
		System.out.println(json);
		return json;
	}
	
	@SuppressWarnings("unchecked")
	private JSONObject constructJsonObject(AudioBook audioBook){
		JSONObject json = new JSONObject();
		json.put("publisherName", audioBook.getPublisher().getName());
		json.put("rating", audioBook.getBookRating().getRating());
		json.put("remainingCopies", audioBook.getRemainingCopies());
		JSONArray formats = new JSONArray();
		for(AudioBookFormat f : audioBook.getAudioBookFormats()){
			formats.add(f.getFormat().getFormatType());	
		}
		json.put("formats", formats);
		JSONArray languages = new JSONArray();
		for(AudioBookLanguage l : audioBook.getLanguages()){
			languages.add(l.getLanguage().getLanguage());
		}
		json.put("languages", languages);
		System.out.println(json);
		return json;
	}
}
