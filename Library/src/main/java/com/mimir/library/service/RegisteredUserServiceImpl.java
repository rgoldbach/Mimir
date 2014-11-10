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

	@Override
	public List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(int userId) {
		return dao.getBorrowedEBooksOfSpecificUser(userId);
	}

	@Override
	public List<PastBorrowedEBook> getPastEBooksOfSpecificUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EBookOnHold> getWaitlistEBooksOfSpecificUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WishlistEBook> getWishlistEBooksOfSpecificUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

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

}
