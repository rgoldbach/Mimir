package com.mimir.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mimir.library.dao.RegisteredUserDao;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;

@Service("registeredUserService")
@Transactional
public class RegisteredUserServiceImpl implements RegisteredUserService{

	@Autowired
	RegisteredUserDao dao;
	
	@Override
	public void saveRegisteredUser(RegisteredUser user) {
		dao.saveRegisteredUser(user);	
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
		return dao.saveBorrowedEBookOfSpecificUser(borrowedEBook);
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
	//WISH-LIST EBOOKS
	@Override
	public List<WishlistEBook> getWishlistEBooksOfSpecificUser(RegisteredUser user) {
		return dao.getWishlistEBooksOfSpecificUser(user);
	}
	@Override
	public String saveWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook) {
		return dao.saveWishlistEBookOfSpecificUser(wishlistEBook);
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


}
