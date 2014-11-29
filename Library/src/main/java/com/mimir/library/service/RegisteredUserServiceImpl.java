package com.mimir.library.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.beans.BasicBookInfo;
import com.mimir.library.beans.BasicOnHoldBookInfo;
import com.mimir.library.dao.BookDao;
import com.mimir.library.dao.RegisteredUserDao;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.AudioBook;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.Book;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedAudioBook;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistAudioBook;
import com.mimir.library.model.WishlistEBook;

@Service("registeredUserService")
@Transactional
public class RegisteredUserServiceImpl implements RegisteredUserService{

	@Autowired
	RegisteredUserDao dao;
	
	@Autowired
	BookDao bookDao;
	
	@Override
	public void saveRegisteredUser(RegisteredUser user) {
		dao.saveRegisteredUser(user);	
	}
	@Override
	public void saveAccountInfo(AccountInfo info){
		dao.saveAccountInfo(info);
	}
	@Override
	public void updateRegisteredUser(RegisteredUser user) {
		dao.updateRegisteredUser(user);	
	}
	@Override 
	public int getMaxAccountInfoId(){
		return dao.getMaxAccountInfoId();
	}
	
	@Override
	public List<BasicBookInfo> getRecentlyAddedBooksOfUser(RegisteredUser currentUser) {
		return dao.getRecentlyAddedBooksOfUser(currentUser);
	}
	public List<BasicOnHoldBookInfo>  getPendingBooksOfUser(RegisteredUser currentUser){
		List<BasicOnHoldBookInfo> pendingBooks = new ArrayList<BasicOnHoldBookInfo>();
		Set<EBookOnHold> eBooksOnHold = currentUser.geteBookHolds();
		Set<AudioBookOnHold> audioBooksOnHold = currentUser.getAudioBookHolds();
		for(EBookOnHold eBook : eBooksOnHold){
			BasicOnHoldBookInfo pendingBook = new BasicOnHoldBookInfo(eBook);
			pendingBooks.add(pendingBook);
		}
		for(AudioBookOnHold audioBook : audioBooksOnHold){
			BasicOnHoldBookInfo pendingBook = new BasicOnHoldBookInfo(audioBook);
			pendingBooks.add(pendingBook);
		}
		return pendingBooks;
	}

	@Override
	public List<RegisteredUser> getAllUsers() {
		return dao.getAllUsers();
	}

	@Override
	public List<RegisteredUser> getAllUsersByFirstName(String firstName) {
		return dao.getAllUsersByFirstName(firstName);
	}

	@Override
	public void deleteRegisteredUserById(int id) {
		dao.deleteRegisteredUserById(id);
	}

	@Override
	public RegisteredUser getSpecificUser(int id) {
		return dao.getSpecificUser(id);
	}

	//BORROWED EBOOKS
	@Override
	public List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(RegisteredUser user) {
		return dao.getBorrowedEBooksOfSpecificUser(user);
	}
	@Override
	public String saveBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook) {
		System.out.println("DEBUG - Attempting to borrow book.");
		//Double check to make sure there is an available copy...
		EBook bookToBorrow = borrowedEBook.getEBook();
		if(bookToBorrow.getRemainingCopies().intValue() == 0){
			return "No more available copies!";
		}
		//Generate the book key from Llamazon...
		System.out.println("DEBUG - Generating Key from Lamazon");
		LamazonService ls = new LamazonService();
		String bookKey = ls.getBookKey(borrowedEBook.getEBook().getBook().getBookId(), borrowedEBook.getUser().getUserCode(), GlobalConstants.EBOOK);
		if(bookKey == null){
			return "Could not connect to Llamazon";
		}
		if(bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_1) || bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_2)){
			return bookKey;
		}
		borrowedEBook.setEBookCode(bookKey);
		System.out.println("DEBUG - Lamazon returned " + bookKey);
		//Persist
		String response = dao.saveBorrowedEBookOfSpecificUser(borrowedEBook);
		return response;
	}
	@Override
	public String returnBorrowedEBook(BorrowedEBook borrowedEBook){
		//Delete the book key on the lamazon site
		System.out.println("DEBUG - Deleting Key from Lamazon");
		LamazonService ls = new LamazonService();
		boolean isReturned = ls.deleteBookKey(borrowedEBook.getEBook().getBook().getBookId(), borrowedEBook.getUser().getUserCode(), GlobalConstants.EBOOK);
		if(!isReturned){
			return "Unable to return book!";
		}
		PastBorrowedEBook pastBook = new PastBorrowedEBook(borrowedEBook);
		String message = dao.removeBorrowedEBookOfSpecificUser(borrowedEBook);
		dao.savePastBorrowedEBookOfSpecificUser(pastBook);
		return message;
	}

	//PAST BORROWED EBOOKS
	@Override
	public List<PastBorrowedEBook> getPastBorrowedEBooksOfSpecificUser(RegisteredUser user) {
		return dao.getPastBorrowedEBooksOfSpecificUser(user);
	}
	@Override
	public String savePastBorrowedEBookOfSpecificUser(PastBorrowedEBook pastBorrowedEBook) {
		return dao.savePastBorrowedEBookOfSpecificUser(pastBorrowedEBook);
	}

	//ON HOLD EBOOKS
	@Override
	public List<EBookOnHold> getOnHoldEBooksOfSpecificUser(RegisteredUser user) {
		return dao.getOnHoldEBooksOfSpecificUser(user);
	}
	@Override
	public String saveOnHoldEBookOfSpecificUser(EBookOnHold eBookOnHold) {
		return dao.saveOnHoldEBookOfSpecificUser(eBookOnHold);
	}

	@Override
	public List<EBookOnHold> getOnHoldEBooks(int eBookId) {
		return dao.getOnHoldEBooks(eBookId);
	}
	
	public String removeOnHoldEBook(EBookOnHold eBookOnHold) {
		return dao.removeOnHoldEBook(eBookOnHold);
	}
	//WISH-LIST EBOOKS
	@Override
	public List<WishlistEBook> getWishlistEBooksOfSpecificUser(RegisteredUser user) {
		return dao.getWishlistEBooksOfSpecificUser(user);
	}
	@Override
	public String saveWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook) {
		return dao.saveWishlistEBookOfSpecificUser(wishlistEBook);
	}
	@Override
	public String removeWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook){
		return dao.removeWishlistEBookOfSpecificUser(wishlistEBook);
	}

	//USER STUFF
	@Override
	public AccountInfo signInUser(LoginCredentials loginCreds) {
		return dao.signInUser(loginCreds);
	}
	@Override
	public RegisteredUser getSpecificUserFromAccountInfo(AccountInfo accountInfo) {
		return dao.getSpecificUserFromAccountInfo(accountInfo);
	}
	@Override
	public Admin getSpecificAdminFromAccountInfo(AccountInfo accountInfo) {
		return dao.getSpecificAdminFromAccountInfo(accountInfo);
	}
	@Override
	public RegisteredUser getSpecificUserFromAccountInfoWithAllInfo(AccountInfo accountInfo) {
		return dao.getSpecificUserFromAccountInfoWithAllInfo(accountInfo);
	}

	//AUDIO BOOK STUFF
	
	@Override
	public List<BorrowedAudioBook> getBorrowedAudioBooksOfSpecificUser(
			RegisteredUser user) {
		return dao.getBorrowedAudioBooksOfSpecificUser(user);
	}

	@Override
	public String saveBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook) {
		//Double check to make sure there is an available copy...
		AudioBook bookToBorrow = borrowedAudioBook.getAudioBook();
		if(bookToBorrow.getRemainingCopies().intValue() == 0){
			return "No more available copies!";
		}
		//Generate the book key from Llamazon...
		LamazonService ls = new LamazonService();
		String bookKey = ls.getBookKey(borrowedAudioBook.getAudioBook().getBook().getBookId(), borrowedAudioBook.getUser().getUserCode(), GlobalConstants.AUDIOBOOK);
		if(bookKey == null){
			return "Could not connect to Llamazon";
		}
		if(bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_1) || bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_2)){
			return bookKey;
		}
		borrowedAudioBook.setAudioBookCode(bookKey);
		//Persist
		String response = dao.saveBorrowedAudioBookOfSpecificUser(borrowedAudioBook);
		return response;
	}

	@Override
	public String returnBorrowedAudioBook(BorrowedAudioBook borrowedAudioBook) {
		//Delete the book key on the lamazon site
		System.out.println("DEBUG - Deleting Key from Lamazon");
		LamazonService ls = new LamazonService();
		boolean isReturned = ls.deleteBookKey(borrowedAudioBook.getAudioBook().getBook().getBookId(), borrowedAudioBook.getUser().getUserCode(), GlobalConstants.AUDIOBOOK);
		if(!isReturned){
			return "Unable to return book!";
		}
		PastBorrowedAudioBook pastBook = new PastBorrowedAudioBook(borrowedAudioBook);
		String message = dao.removeBorrowedAudioBookOfSpecificUser(borrowedAudioBook);
		dao.savePastBorrowedAudioBookOfSpecificUser(pastBook);
		return message;
	}

	@Override
	public List<PastBorrowedAudioBook> getPastBorrowedAudioBooksOfSpecificUser(
			RegisteredUser user) {
		return dao.getPastBorrowedAudioBooksOfSpecificUser(user);
	}

	@Override
	public String savePastBorrowedAudioBookOfSpecificUser(
			PastBorrowedAudioBook pastBorrowedAudioBook) {
		return dao.savePastBorrowedAudioBookOfSpecificUser(pastBorrowedAudioBook);
	}

	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooksOfSpecificUser(
			RegisteredUser user) {
		return dao.getOnHoldAudioBooksOfSpecificUser(user);
	}

	@Override
	public String saveOnHoldAudioBookOfSpecificUser(
			AudioBookOnHold audioBookOnHold) {
		return dao.saveOnHoldAudioBookOfSpecificUser(audioBookOnHold);
	}

	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooks(int audioBookId) {
		return dao.getOnHoldAudioBooks(audioBookId);
	}
	@Override
	public String removeOnHoldAudioBook(AudioBookOnHold holdToRemove) {
		return dao.removeOnHoldAudioBook(holdToRemove);
	}
	
	@Override
	public List<WishlistAudioBook> getWishlistAudioBooksOfSpecificUser(
			RegisteredUser user) {
		return dao.getWishlistAudioBooksOfSpecificUser(user);
	}

	@Override
	public String saveWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook) {
		return dao.saveWishlistAudioBookOfSpecificUser(wishlistAudioBook);
	}

	@Override
	public String removeWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook) {
		return dao.removeWishlistAudioBookOfSpecificUser(wishlistAudioBook);
	}
	@Override
	public List<BasicBookInfo> getRecommendedBooksForUser(RegisteredUser currentUser) {
		return dao.getRecommendedBooksForUser(currentUser);
	}
	@Override
	public List<BasicBookInfo> getWishlistBooksOfUser(RegisteredUser currentUser) {
		List<BasicBookInfo> wishlist = new ArrayList<BasicBookInfo>();
		Set<WishlistEBook> eBooks = currentUser.getWishlistEBooks();
		Set<WishlistAudioBook> aBooks = currentUser.getWishlistAudioBooks();
		for(WishlistEBook e : eBooks){
			wishlist.add(new BasicBookInfo(e.getEBook()));
		}
		for(WishlistAudioBook a : aBooks){
			wishlist.add(new BasicBookInfo(a.getAudioBook()));
		}
		return wishlist;
	}
	
}
