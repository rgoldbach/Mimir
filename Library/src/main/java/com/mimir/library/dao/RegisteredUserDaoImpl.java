package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;

import com.mimir.library.beans.BasicBookInfo;
import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AccountInfo;
import com.mimir.library.model.Admin;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;
import com.mimir.library.model.LoginCredentials;
import com.mimir.library.model.PastBorrowedAudioBook;
import com.mimir.library.model.PastBorrowedEBook;
import com.mimir.library.model.RegisteredUser;
import com.mimir.library.model.WishlistAudioBook;
import com.mimir.library.model.WishlistEBook;

@Repository("registeredUserDao")
public class RegisteredUserDaoImpl extends AbstractDao implements RegisteredUserDao {
	
	
	@Override
	public int getMaxAccountInfoId(){
		Criteria crit = getSession().createCriteria(AccountInfo.class);
		crit.addOrder(Order.desc("accountInfoId"));
		crit.setMaxResults(1);
		return ((AccountInfo) crit.uniqueResult()).getAccountInfoId();
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
		userCriteria.add(Restrictions.eq("accountInfo", accountInfo));
		RegisteredUser user = (RegisteredUser) userCriteria.uniqueResult();
		initializeUser(user);
		return user;
	}
	private void initializeUser(RegisteredUser user){
		Hibernate.initialize(user.getAudioBookHolds());
		Hibernate.initialize(user.getBorrowedAudioBooks());
		Hibernate.initialize(user.getBorrowedEBooks());
		Hibernate.initialize(user.geteBookHolds());
		Hibernate.initialize(user.getPastBorrowedAudioBooks());
		Hibernate.initialize(user.getPastBorrowedEBooks());
		Hibernate.initialize(user.getWishlistAudioBooks());
		Hibernate.initialize(user.getWishlistEBooks());
	}
	
	@Override
	public void saveRegisteredUser(RegisteredUser user) {
		persist(user);
	}
	
	@Override
	public void saveAccountInfo(AccountInfo info){
		persist(info);
	}
	
	@Override public void updateRegisteredUser(RegisteredUser user){
		 getSession().merge(user);
		 getSession().merge(user.getAccountInfo());
		 getSession().merge(user.getAccountInfo().getLoginCredentials());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BasicBookInfo> getRecentlyAddedBooksOfUser(RegisteredUser currentUser) {
		List<BasicBookInfo> recentlyAddedBooks = new ArrayList<BasicBookInfo>();
		//Add EBooks
		Criteria recentlyAddedEBooks = getSession().createCriteria(BorrowedEBook.class);
		LocalDate eDate = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		recentlyAddedEBooks.add(Restrictions.eq("dateExpires", eDate));
		recentlyAddedEBooks.add(Restrictions.eq("user", currentUser));
		List<BorrowedEBook> eBooks = recentlyAddedEBooks.list();
		for(BorrowedEBook eBook : eBooks){
			BasicBookInfo rab = new BasicBookInfo(eBook);
			recentlyAddedBooks.add(rab);
		}
		//Add AudioBooks
		Criteria recentlyAddedAudioBooks = getSession().createCriteria(BorrowedAudioBook.class);
		LocalDate aDate = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		recentlyAddedAudioBooks.add(Restrictions.eq("dateExpires", aDate));
		recentlyAddedAudioBooks.add(Restrictions.eq("user", currentUser));
		List<BorrowedAudioBook> aBooks = recentlyAddedAudioBooks.list();
		for(BorrowedAudioBook aBook : aBooks){
			BasicBookInfo rab = new BasicBookInfo(aBook);
			recentlyAddedBooks.add(rab);
		}
		return recentlyAddedBooks;
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
		if(userEBooks != null && userEBooks.contains(borrowedEBook)){
			System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. User already has borrowed this book! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. Check if User has EBOOK passed! Attempting to Persist BorrowedEBook...");
		persist(borrowedEBook);
		System.out.println("DEBUG: In saveBorrowedEBookOfSpecificUser. BorrowedEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}	
	@Override
	public String removeBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook){
		Query query = getSession().createSQLQuery("DELETE FROM BorrowedEBooks WHERE id = :id");
		query.setLong("id", borrowedEBook.getId());
		System.out.println("Debug: in removeBorrowedEBookOfSpecificUser");
		System.out.println(query.toString());
		query.executeUpdate();
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
		if(userEBooks != null && userEBooks.contains(pastBorrowedEBook)){
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
		if(userEBooks != null && userEBooks.contains(eBookOnHold)){
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
		if(userEBooks != null && userEBooks.contains(wishlistEBook)){
			System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. User already has this EBook in wishlist! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. Check if User has EBOOK in wishlist passed! Attempting to Persist WishlistEBook...");
		persist(wishlistEBook);
		System.out.println("DEBUG: In saveWishlistEBookOfSpecificUser. WishlistEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;	
	}
	@Override
	public String removeWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook){
		Query query = getSession().createSQLQuery("DELETE FROM WishlistEBooks WHERE id = :id");
		query.setLong("id", wishlistEBook.getId());
		System.out.println("Debug: In removeWishlistEBooksOfSpecificUser");
		System.out.println(query.toString());
		query.executeUpdate();
		return GlobalConstants.DAO_SUCCESS;
	}

	//BORROWED AUDIOBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<BorrowedAudioBook> getBorrowedAudioBooksOfSpecificUser(RegisteredUser user) {
		Criteria criteria = getSession().createCriteria(BorrowedAudioBook.class);
		criteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<BorrowedAudioBook>) criteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook) {
		List<BorrowedAudioBook> userAudioBooks = getBorrowedAudioBooksOfSpecificUser(borrowedAudioBook.getUser());
		if(userAudioBooks != null && userAudioBooks.contains(borrowedAudioBook)){
			System.out.println("DEBUG: In saveBorrowedAudioBookOfSpecificUser. User already has borrowed this book! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveBorrowedAudioBookOfSpecificUser. Check if User has AudioBOOK passed! Attempting to Persist BorrowedAudioBook...");
		persist(borrowedAudioBook);
		System.out.println("DEBUG: In saveBorrowedAudioBookOfSpecificUser. BorrowedAudioBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	@Override
	public String removeBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook) {
		Query query = getSession().createSQLQuery("DELETE FROM BorrowedAudioBooks WHERE id = :id");
		query.setLong("id", borrowedAudioBook.getId());
		System.out.println("Debug: in removeBorrowedAudioBookOfSpecificUser");
		System.out.println(query.toString());
		query.executeUpdate();
		return GlobalConstants.DAO_SUCCESS;	
	}

	//PAST BORROWED AUDIOBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<PastBorrowedAudioBook> getPastBorrowedAudioBooksOfSpecificUser(RegisteredUser user) {
		Criteria criteria = getSession().createCriteria(PastBorrowedAudioBook.class);
		criteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<PastBorrowedAudioBook>) criteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String savePastBorrowedAudioBookOfSpecificUser(PastBorrowedAudioBook pastBorrowedAudioBook) {
		List<PastBorrowedAudioBook> userAudioBooks = getPastBorrowedAudioBooksOfSpecificUser(pastBorrowedAudioBook.getUser());
		if(userAudioBooks != null && userAudioBooks.contains(pastBorrowedAudioBook)){
			System.out.println("DEBUG: In savePastBorrowedAudioBookOfSpecificUser. User already has this AUDIOBOOK in history! Not adding...");
			return "AudioBook already in history!";
		}
		System.out.println("DEBUG: In savePastBorrowedAudioBookOfSpecificUser. Check if User has AUDIOBOOK in history passed! Attempting to Persist PastBorrowedAudioBook...");
		persist(pastBorrowedAudioBook);
		System.out.println("DEBUG: In savePastBorrowedAudioBookOfSpecificUser. PastBorrowedAudioBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	
	//ON HOLD AUDIOBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooksOfSpecificUser(RegisteredUser user) {
		Criteria criteria = getSession().createCriteria(AudioBookOnHold.class);
		criteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<AudioBookOnHold>) criteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveOnHoldAudioBookOfSpecificUser(AudioBookOnHold audioBookOnHold) {
		//Determine the position in queue
		int positionInQueue = getOnHoldEBooks(audioBookOnHold.getAudioBook().getAudioBookId()).size();
		audioBookOnHold.setPositionInQueue(positionInQueue);
		
		List<AudioBookOnHold> userAudioBooks = getOnHoldAudioBooksOfSpecificUser(audioBookOnHold.getUser());
		if(userAudioBooks != null && userAudioBooks.contains(audioBookOnHold)){
			System.out.println("DEBUG: In saveOnHoldAudioBookOfSpecificUser. User already has this AudioBOOK on hold! Not adding...");
			return "You already have this AudioBook on hold!";
		}
		System.out.println("DEBUG: In saveOnHoldAudioBookOfSpecificUser. Check if User has AudioBOOK on hold passed! Attempting to Persist AudioBookOnHold...");
		persist(audioBookOnHold);
		System.out.println("DEBUG: In saveOnHoldAudioBookOfSpecificUser. AudioBookOnHold persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooks(int audioBookId) {
		Criteria criteria = getSession().createCriteria(AudioBookOnHold.class);
		criteria.addOrder(Order.asc("positionInQueue"));
		return (List<AudioBookOnHold>) criteria.add(Restrictions.eq("eBookId", audioBookId)).list();
	}
	
	//WISH-LIST AUDIOBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<WishlistAudioBook> getWishlistAudioBooksOfSpecificUser(RegisteredUser user) {
		Criteria criteria = getSession().createCriteria(WishlistAudioBook.class);
		criteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<WishlistAudioBook>) criteria.add(Restrictions.eq("user", user)).list();
	}
	@Override
	public String saveWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook) {
		List<WishlistAudioBook> userAudioBooks = getWishlistAudioBooksOfSpecificUser(wishlistAudioBook.getUser());
		if(userAudioBooks != null && userAudioBooks.contains(wishlistAudioBook)){
			System.out.println("DEBUG: In saveWishlistAudioBookOfSpecificUser. User already has this AudioBook in wishlist! Not adding...");
			return "You currently are borrowing this book!";
		}
		System.out.println("DEBUG: In saveWishlistAudioBookOfSpecificUser. Check if User has AudioBOOK in wishlist passed! Attempting to Persist WishlistAudioBook...");
		persist(wishlistAudioBook);
		System.out.println("DEBUG: In saveWishlistAudioBookOfSpecificUser. WishlistAudioBook persisted!");
		return GlobalConstants.DAO_SUCCESS;	
	}
	@Override
	public String removeWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook) {
		Query query = getSession().createSQLQuery("DELETE FROM WishlistAudioBooks WHERE id = :id");
		query.setLong("id", wishlistAudioBook.getId());
		System.out.println("Debug: In removeWishlistAudioBooksOfSpecificUser");
		System.out.println(query.toString());
		query.executeUpdate();
		return GlobalConstants.DAO_SUCCESS;
	}
}
