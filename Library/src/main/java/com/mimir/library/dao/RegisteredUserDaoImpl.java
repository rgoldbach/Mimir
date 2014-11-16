package com.mimir.library.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistEBook;

@Repository("registeredUserDao")
public class RegisteredUserDaoImpl extends AbstractDao implements RegisteredUserDao {

	@Override
	public void saveRegisteredUser(RegisteredUser user) {
		persist(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RegisteredUser> getAllUsers() {
		Criteria allUsersCriteria = getSession().createCriteria(RegisteredUser.class);
		return (List<RegisteredUser>) allUsersCriteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RegisteredUser> getAllUsersByFirstName(String firstName) {
		Criteria usersByFirstNameCriteria = getSession().createCriteria(RegisteredUser.class);
		return (List<RegisteredUser>) usersByFirstNameCriteria.add(Restrictions.eq("user.userAccountInfo.firstName", firstName)).list();
	}

	@Override
	public void deleteRegisteredUserById(int id) {
		Query query = getSession().createSQLQuery("DELETE FROM RegisteredUser WHERE userId = :userId");
        query.setLong("userId", id);
        query.executeUpdate();
		
	}

	@Override
	public RegisteredUser getSpecificUser(int id) {
		return (RegisteredUser) getSession().get(RegisteredUser.class, id);
	}

	//BORROWED EBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(RegisteredUser user) {
		Criteria eBookCriteria = getSession().createCriteria(BorrowedEBook.class);
		eBookCriteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<BorrowedEBook>) eBookCriteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook) {
		List<BorrowedEBook> userEBooks = getBorrowedEBooksOfSpecificUser(borrowedEBook.getUser());
		if(userEBooks.contains(borrowedEBook)){
			System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. User already has borrowed this book! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. Check if User has EBOOK passed! Attempting to Persist BorrowedEBook...");
		persist(borrowedEBook);
		System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. BorrowedEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
		
	}

	//PAST BORROWED EBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<PastBorrowedEBook> getPastBorrowedEBooksOfSpecificUser(RegisteredUser user) {
		Criteria eBookCriteria = getSession().createCriteria(PastBorrowedEBook.class);
		eBookCriteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<PastBorrowedEBook>) eBookCriteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String savePastBorrowedEBookOfSpecificUser(PastBorrowedEBook pastBorrowedEBook) {
		List<PastBorrowedEBook> userEBooks = getPastBorrowedEBooksOfSpecificUser(pastBorrowedEBook.getUser());
		if(userEBooks.contains(pastBorrowedEBook)){
			System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. User already has this EBOOK in history! Not adding...");
			return "EBook already in history!";
		}
		System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. Check if User has EBOOK in history passed! Attempting to Persist PastBorrowedEBook...");
		persist(pastBorrowedEBook);
		System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. PastBorrowedEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	
	

	//ON HOLD EBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<EBookOnHold> getOnHoldEBooksOfSpecificUser(RegisteredUser user) {
		Criteria eBookCriteria = getSession().createCriteria(EBookOnHold.class);
		eBookCriteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<EBookOnHold>) eBookCriteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveOnHoldEBookOfSpecificUser(EBookOnHold eBookOnHold) {
		//Determine the position in queue
		int positionInQueue = getOnHoldEBooks(eBookOnHold.getEBook().getEBookId()).size();
		eBookOnHold.setPositionInQueue(positionInQueue);
		
		List<EBookOnHold> userEBooks = getOnHoldEBooksOfSpecificUser(eBookOnHold.getUser());
		if(userEBooks.contains(eBookOnHold)){
			System.out.println("DEBUG: In saveOnHoldEBookOfSpecificUser. User already has this EBOOK on hold! Not adding...");
			return "You already have this EBook on hold!";
		}
		System.out.println("DEBUG: In saveOnHoldEBookOfSpecificUser. Check if User has EBOOK on hold passed! Attempting to Persist EBookOnHold...");
		persist(eBookOnHold);
		System.out.println("DEBUG: In saveOnHoldEBookOfSpecificUser. EBookOnHold persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public List<EBookOnHold> getOnHoldEBooks(int eBookId){
		Criteria eBookCriteria = getSession().createCriteria(EBookOnHold.class);
		eBookCriteria.addOrder(Order.asc("positionInQueue"));
		return (List<EBookOnHold>) eBookCriteria.add(Restrictions.eq("eBookId", eBookId)).list();
	}

	//WISH-LIST EBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<WishlistEBook> getWishlistEBooksOfSpecificUser(RegisteredUser user) {
		Criteria eBookCriteria = getSession().createCriteria(WishlistEBook.class);
		eBookCriteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<WishlistEBook>) eBookCriteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook) {
		List<WishlistEBook> userEBooks = getWishlistEBooksOfSpecificUser(wishlistEBook.getUser());
		if(userEBooks.contains(wishlistEBook)){
			System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. User already has this EBook in wishlist! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. Check if User has EBOOK in wishlist passed! Attempting to Persist WishlistEBook...");
		persist(wishlistEBook);
		System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. WishlistEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;	
	}

	
	
	@Override
	public AccountInfo signInUser(LoginCredentials loginCreds) {
		Criteria userSignInCriteria = getSession().createCriteria(AccountInfo.class, "account");
		userSignInCriteria.createAlias("account.loginCredentials", "loginCredentials");
		userSignInCriteria.add(Restrictions.eq("loginCredentials.email", loginCreds.getEmail()));
		userSignInCriteria.add(Restrictions.eq("loginCredentials.password", loginCreds.getPassword()));
		return (AccountInfo) userSignInCriteria.uniqueResult();
	}

	@Override
	public RegisteredUser getSpecificUserFromAccountInfo(AccountInfo accountInfo) {
		Criteria userCriteria = getSession().createCriteria(RegisteredUser.class, "registeredUser");
		userCriteria.add(Restrictions.eq("accountInfo", accountInfo));
		System.out.println("Account id = " + accountInfo.getAccountInfoId());
		return (RegisteredUser) userCriteria.uniqueResult();
	}

	@Override
	public Admin getSpecificAdminFromAccountInfo(AccountInfo accountInfo) {
		Criteria userCriteria = getSession().createCriteria(Admin.class, "admin");
		userCriteria.add(Restrictions.eq("accountInfo", accountInfo));
		return (Admin) userCriteria.uniqueResult();
	}


	@Override
	public RegisteredUser getSpecificUserFromAccountInfoWithAllInfo(AccountInfo accountInfo) {
		Criteria userCriteria = getSession().createCriteria(RegisteredUser.class, "registeredUser");
		userCriteria.setFetchMode("eBookHolds", FetchMode.JOIN);
		userCriteria.setFetchMode("borrowedEBooks", FetchMode.JOIN);
		userCriteria.setFetchMode("wishlistEBooks", FetchMode.JOIN);
		userCriteria.setFetchMode("pastBorrowedEBooks", FetchMode.JOIN);
		userCriteria.add(Restrictions.eq("accountInfo", accountInfo));
		System.out.println("Account id = " + accountInfo.getAccountInfoId());
		return (RegisteredUser) userCriteria.uniqueResult();
	}

	

}
