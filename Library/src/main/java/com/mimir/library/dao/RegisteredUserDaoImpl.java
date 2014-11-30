package com.mimir.library.dao;

import java.util.ArrayList;
import java.util.Iterator;
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
import com.mimir.library.service.LamazonService;

@Repository("registeredUserDao")
public class RegisteredUserDaoImpl extends AbstractDao implements RegisteredUserDao {

	@Override
	public int getMaxAccountInfoId() {
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
		Criteria userCriteria = getSession().createCriteria(Admin.class,"admin");
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

	private void initializeUser(RegisteredUser user) {
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
	public void saveAccountInfo(AccountInfo info) {
		persist(info);
	}

	@Override
	public void updateRegisteredUser(RegisteredUser user) {
		getSession().merge(user);
		getSession().merge(user.getAccountInfo());
		getSession().merge(user.getAccountInfo().getLoginCredentials());
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BasicBookInfo> getRecentlyAddedBooksOfUser(RegisteredUser currentUser) {
		List<BasicBookInfo> recentlyAddedBooks = new ArrayList<BasicBookInfo>();
		// Add EBooks
		Criteria recentlyAddedEBooks = getSession().createCriteria(BorrowedEBook.class);
		LocalDate eDate = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		recentlyAddedEBooks.add(Restrictions.eq("dateExpires", eDate));
		recentlyAddedEBooks.add(Restrictions.eq("user", currentUser));
		List<BorrowedEBook> eBooks = recentlyAddedEBooks.list();
		for (BorrowedEBook eBook : eBooks) {
			BasicBookInfo rab = new BasicBookInfo(eBook.getEBook());
			recentlyAddedBooks.add(rab);
		}
		// Add AudioBooks
		Criteria recentlyAddedAudioBooks = getSession().createCriteria(BorrowedAudioBook.class);
		LocalDate aDate = new LocalDate().plusDays(GlobalConstants.BORROW_BOOK_LENGTH);
		recentlyAddedAudioBooks.add(Restrictions.eq("dateExpires", aDate));
		recentlyAddedAudioBooks.add(Restrictions.eq("user", currentUser));
		List<BorrowedAudioBook> aBooks = recentlyAddedAudioBooks.list();
		for (BorrowedAudioBook aBook : aBooks) {
			BasicBookInfo rab = new BasicBookInfo(aBook.getAudioBook());
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
	
	@Override
	public RegisteredUser getSpecificUser(String libraryCardNumber){
		Criteria userCriteria = getSession().createCriteria(RegisteredUser.class, "registeredUser");
		userCriteria.add(Restrictions.eq("libraryCardNumber", libraryCardNumber));
		RegisteredUser user = (RegisteredUser) userCriteria.uniqueResult();
		initializeUser(user);
		return user;
	}

	// BORROWED EBOOKS
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
		if (userEBooks != null && userEBooks.contains(borrowedEBook)) {
			return "You currently are borrowing this book!";
		}
		//GENERATE LLAMAZON KEY
		generateLamazonKeyForEBook(borrowedEBook);
		persist(borrowedEBook);
		
		//DECREMENT REMAINING COPIES
		EBook eBook = borrowedEBook.getEBook();
		if (eBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED)
			return GlobalConstants.DAO_SUCCESS;
		eBook.setRemainingCopies(new Integer(eBook.getRemainingCopies().intValue() - 1));
		getSession().merge(eBook);
		
		System.out.println("DEBUG - EBook remaining copies decremented.");
		return GlobalConstants.DAO_SUCCESS;
	}
	
	private void generateLamazonKeyForEBook(BorrowedEBook borrowedEBook) {
		LamazonService ls = new LamazonService();
		String bookKey = ls.getBookKey(borrowedEBook.getEBook().getEBookId(), borrowedEBook.getUser().getUserCode(), GlobalConstants.EBOOK);
		if (bookKey == null) {
			System.out.println("DEBUG - Book Key is null");
			return;
		}
		if (bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_1) || bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_2)) {
			System.out.println("DEBUG - Llamazon Error");
			return;
		}
		borrowedEBook.setEBookCode(bookKey);
	}

	@Override
	public String removeBorrowedEBookOfSpecificUser(BorrowedEBook borrowedEBook) {
		System.out.println("DEBUG - Deleting Lamazon Key");
		//DELETE LAMAZON KEY
		LamazonService ls = new LamazonService();
		boolean isReturned = ls.deleteBookKey(borrowedEBook.getEBook().getEBookId(), borrowedEBook.getUser().getUserCode(), GlobalConstants.EBOOK);
		if(!isReturned){
			return "Unable to return book!";
		}
		
		//DELETE BORROWED EBOOK
		Query query = getSession().createSQLQuery("DELETE FROM BorrowedEBooks WHERE id = :id");
		query.setLong("id", borrowedEBook.getId());
		int bookId = borrowedEBook.getEBook().getEBookId();
		int positionInQueue = 0;
		query.executeUpdate();
		EBook eBook = borrowedEBook.getEBook();
		
		//INCREMENT REMAINING COPIES
		if (eBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED)
			return GlobalConstants.DAO_SUCCESS;
		eBook.setRemainingCopies(new Integer(eBook.getRemainingCopies().intValue() + 1));
		getSession().merge(eBook);
		
		//Update the holds for this book, if there are any...
		this.updateAllOtherEBookHolds(bookId, positionInQueue);
		
		return GlobalConstants.DAO_SUCCESS;
	}

	// PAST BORROWED EBOOKS
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
		if (userEBooks != null && userEBooks.contains(pastBorrowedEBook)) {
			System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. User already has this EBOOK in history! Not adding...");
			return "EBook already in history!";
		}
		System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. Check if User has EBOOK in history passed! Attempting to Persist PastBorrowedEBook...");
		persist(pastBorrowedEBook);
		System.out.println("DEBUG: In savePastBorrowedEBookOfSpecificUser. PastBorrowedEBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}

	// ON HOLD EBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<EBookOnHold> getOnHoldEBooksOfSpecificUser(RegisteredUser user) {
		Criteria eBookCriteria = getSession().createCriteria(EBookOnHold.class);
		eBookCriteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<EBookOnHold>) eBookCriteria.add(Restrictions.eq("user", user)).list();
	}

	@Override
	public String saveOnHoldEBookOfSpecificUser(EBookOnHold eBookOnHold) {
		// Determine the position in queue
		int positionInQueue = getOnHoldEBooks(eBookOnHold.getEBook().getEBookId()).size();
		eBookOnHold.setPositionInQueue(positionInQueue + 1);
		List<EBookOnHold> userEBooks = getOnHoldEBooksOfSpecificUser(eBookOnHold.getUser());
		if (userEBooks != null && userEBooks.contains(eBookOnHold)) {
			return "You already have this EBook on hold!";
		}
		System.out.println("DEBUG: In saveOnHoldEBookOfSpecificUser. Check if User has EBOOK on hold passed! Attempting to Persist EBookOnHold...");
		persist(eBookOnHold);
		System.out.println("DEBUG: In saveOnHoldEBookOfSpecificUser. EBookOnHold persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public List<EBookOnHold> getOnHoldEBooks(int eBookId) {
		Criteria eBookCriteria = getSession().createCriteria(EBookOnHold.class);
		eBookCriteria.addOrder(Order.asc("positionInQueue"));
		return (List<EBookOnHold>) eBookCriteria.add(
				Restrictions.eq("eBook.eBookId", eBookId)).list();
	}

	@Override
	public String removeOnHoldEBook(EBookOnHold eBookOnHold) {
		try {
			int bookId = eBookOnHold.getEBook().getEBookId();
			int positionInQueue = eBookOnHold.getPositionInQueue();
			System.out.println("DEBUG - Deleting on hold book...");
			delete(eBookOnHold);
			// Update all other on hold books...
			System.out.println("DEBUG - Updating all other on hold books...");
			updateAllOtherEBookHolds(bookId, positionInQueue);
			return GlobalConstants.DAO_SUCCESS;
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
	}

	private void updateAllOtherEBookHolds(int bookId, int positionInQueue) {
		List<EBookOnHold> holds = getOnHoldEBooks(bookId);
		for (EBookOnHold hold : holds) {
			if (hold.getPositionInQueue() > positionInQueue) {
				hold.setPositionInQueue(hold.getPositionInQueue() - 1);
				if (hold.getPositionInQueue() == 0) {
					BorrowedEBook borrowedEBook = new BorrowedEBook(hold.getEBook(), hold.getUser());
					saveBorrowedEBookOfSpecificUser(borrowedEBook);
					delete(hold);
				}
			}
		}
	}

	// WISH-LIST EBOOKS
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
		if (userEBooks != null && userEBooks.contains(wishlistEBook)) {
			return "You currently are borrowing this book!";
		}
		persist(wishlistEBook);
		return GlobalConstants.DAO_SUCCESS;
	}

	@Override
	public String removeWishlistEBookOfSpecificUser(WishlistEBook wishlistEBook) {
		Query query = getSession().createSQLQuery("DELETE FROM WishlistEBooks WHERE id = :id");
		query.setLong("id", wishlistEBook.getId());
		System.out.println(query.toString());
		query.executeUpdate();
		return GlobalConstants.DAO_SUCCESS;
	}

	// BORROWED AUDIOBOOKS
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
		if (userAudioBooks != null && userAudioBooks.contains(borrowedAudioBook)) {
			return "You currently are borrowing this book!";
		}
		//GENERATE LLAMAZON KEY
		generateLamazonKeyForAudioBook(borrowedAudioBook);
		persist(borrowedAudioBook);
		AudioBook aBook = borrowedAudioBook.getAudioBook();
		//DECREMENT REMAINING COPIES
		if (aBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED)
			return GlobalConstants.DAO_SUCCESS;
		aBook.setRemainingCopies(new Integer(aBook.getRemainingCopies().intValue() - 1));
		getSession().merge(aBook);
		System.out.println("DEBUG: In saveBorrowedAudioBookOfSpecificUser. BorrowedAudioBook persisted!");
		return GlobalConstants.DAO_SUCCESS;
	}
	
	private void generateLamazonKeyForAudioBook(BorrowedAudioBook borrowedAudioBook) {
		LamazonService ls = new LamazonService();
		String bookKey = ls.getBookKey(borrowedAudioBook.getAudioBook().getAudioBookId(), borrowedAudioBook.getUser().getUserCode(), GlobalConstants.AUDIOBOOK);
		if (bookKey == null) {
			return;
		}
		if (bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_1) || bookKey.equals(LamazonService.LLAMAZON_ERROR_CODE_2)) {
			System.out.println("DEBUG - Llamazon Error");
			return;
		}
		borrowedAudioBook.setAudioBookCode(bookKey);
	}

	@Override
	public String removeBorrowedAudioBookOfSpecificUser(BorrowedAudioBook borrowedAudioBook) {
		//DELETE LAMAZON KEY
		LamazonService ls = new LamazonService();
		boolean isReturned = ls.deleteBookKey(borrowedAudioBook.getAudioBook().getAudioBookId(), borrowedAudioBook.getUser().getUserCode(), GlobalConstants.AUDIOBOOK);
		if(!isReturned){
			return "Unable to return book!";
		}
		
		//DELETE AUDIO BOOK
		Query query = getSession().createSQLQuery("DELETE FROM BorrowedAudioBooks WHERE id = :id");
		query.setLong("id", borrowedAudioBook.getId());
		System.out.println("Debug: in removeBorrowedAudioBookOfSpecificUser");
		int bookId = borrowedAudioBook.getAudioBook().getAudioBookId();
		int positionInQueue = 0;
		query.executeUpdate();
		AudioBook audioBook = borrowedAudioBook.getAudioBook();
		
		//INCREMENT REMAINING COPIES
		if (audioBook.getRemainingCopies().intValue() == GlobalConstants.UNLIMITED)
			return GlobalConstants.DAO_SUCCESS;
		audioBook.setRemainingCopies(new Integer(audioBook.getRemainingCopies().intValue() + 1));
		getSession().merge(audioBook);
		
		//Update on hold books..
		this.updateAllOtherAudioBookHolds(bookId, positionInQueue);
		return GlobalConstants.DAO_SUCCESS;
	}

	// PAST BORROWED AUDIOBOOKS
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
		if (userAudioBooks != null && userAudioBooks.contains(pastBorrowedAudioBook)) {
			return "AudioBook already in history!";
		}
		persist(pastBorrowedAudioBook);
		return GlobalConstants.DAO_SUCCESS;
	}

	// ON HOLD AUDIOBOOKS
	@SuppressWarnings("unchecked")
	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooksOfSpecificUser(RegisteredUser user) {
		Criteria criteria = getSession().createCriteria(AudioBookOnHold.class);
		criteria.setFetchMode("RegisteredUsers", FetchMode.JOIN);
		return (List<AudioBookOnHold>) criteria.add(Restrictions.eq("user", user)).list();
	}

	@Override
	public String saveOnHoldAudioBookOfSpecificUser(AudioBookOnHold audioBookOnHold) {
		// Determine the position in queue
		int positionInQueue = getOnHoldEBooks(audioBookOnHold.getAudioBook().getAudioBookId()).size();
		audioBookOnHold.setPositionInQueue(positionInQueue + 1);
		List<AudioBookOnHold> userAudioBooks = getOnHoldAudioBooksOfSpecificUser(audioBookOnHold.getUser());
		if (userAudioBooks != null && userAudioBooks.contains(audioBookOnHold)) {
			return "You already have this AudioBook on hold!";
		}
		persist(audioBookOnHold);
		return GlobalConstants.DAO_SUCCESS;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AudioBookOnHold> getOnHoldAudioBooks(int audioBookId) {
		Criteria criteria = getSession().createCriteria(AudioBookOnHold.class);
		criteria.addOrder(Order.asc("positionInQueue"));
		return (List<AudioBookOnHold>) criteria.add(Restrictions.eq("audioBook.audioBookId", audioBookId)).list();
	}

	@Override
	public String removeOnHoldAudioBook(AudioBookOnHold audioBookOnHold) {
		try {
			int bookId = audioBookOnHold.getAudioBook().getAudioBookId();
			int positionInQueue = audioBookOnHold.getPositionInQueue();
			delete(audioBookOnHold);
			// Update all other on hold books...
			updateAllOtherAudioBookHolds(bookId, positionInQueue);
			return GlobalConstants.DAO_SUCCESS;
		} catch (Exception e) {
			System.out.println(e);
			return "error";
		}
	}

	private void updateAllOtherAudioBookHolds(int bookId, int positionInQueue) {
		List<AudioBookOnHold> holds = getOnHoldAudioBooks(bookId);
		for (AudioBookOnHold hold : holds) {
			if (hold.getPositionInQueue() > positionInQueue) {
				hold.setPositionInQueue(hold.getPositionInQueue() - 1);
				if (hold.getPositionInQueue() == 0) {
					// Ready to be borrowed!
					BorrowedAudioBook borrowedAudioBook = new BorrowedAudioBook(hold.getAudioBook(), hold.getUser());
					// Generate Llamazon Key
					// Save the audio book to the new user...
					saveBorrowedAudioBookOfSpecificUser(borrowedAudioBook);
					// Delete their hold..
					delete(hold);
				}
			}
		}
	}

	// WISH-LIST AUDIOBOOKS
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
		if (userAudioBooks != null && userAudioBooks.contains(wishlistAudioBook)) {
			return "You currently are borrowing this book!";
		}
		persist(wishlistAudioBook);
		return GlobalConstants.DAO_SUCCESS;
	}

	@Override
	public String removeWishlistAudioBookOfSpecificUser(WishlistAudioBook wishlistAudioBook) {
		Query query = getSession().createSQLQuery("DELETE FROM WishlistAudioBooks WHERE id = :id");
		query.setLong("id", wishlistAudioBook.getId());
		System.out.println(query.toString());
		query.executeUpdate();
		return GlobalConstants.DAO_SUCCESS;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BasicBookInfo> getRecommendedBooksForUser(RegisteredUser currentUser) {
		int totalRecommendedBooks = 8;
		List<BasicBookInfo> recommendedBooks = new ArrayList<BasicBookInfo>();
		List<BorrowedEBook> borrowedEBooks = (List<BorrowedEBook>) getSession().createCriteria(BorrowedEBook.class, "borrowedE")
				.add(Restrictions.eq("user", currentUser))
				.addOrder(Order.desc("dateExpires"))
				.list();
		if(borrowedEBooks != null && borrowedEBooks.size() != 0){
			BorrowedEBook mostRecentEBook = borrowedEBooks.get(0);
			List<Book> books = (List<Book>) getSession().createCriteria(Book.class, "book")
					.createAlias("book.genres", "bookGenre")
					.createAlias("bookGenre.genre", "genre")
					.add(Restrictions.eq("genre.genre", mostRecentEBook.getEBook().getBook().getGenres().iterator().next().getGenre().getGenre()))
					.list();
			Iterator<Book> it = books.iterator();
			while(totalRecommendedBooks > 0){
				if(!it.hasNext()){
					break;
				}
				Book book = it.next();
				if(book.getEBook() == null){
					boolean canAdd = true;
					for(BorrowedEBook e : currentUser.getBorrowedEBooks()){
						if(e.getEBook().getEBookId() == book.getEBook().getEBookId()){
							canAdd = false;
						}
					}
					for(PastBorrowedEBook e : currentUser.getPastBorrowedEBooks()){
						if(e.getEBook().getEBookId() == book.getEBook().getEBookId()){
							canAdd = false;
						}
					}
					if(canAdd){
						recommendedBooks.add(new BasicBookInfo(book.getEBook()));	
						totalRecommendedBooks--;	
					}	
				}
			}
		}
		List<BorrowedAudioBook> borrowedAudioBooks = (List<BorrowedAudioBook>) getSession().createCriteria(BorrowedAudioBook.class, "borrowedA")
				.add(Restrictions.eq("user", currentUser))
				.addOrder(Order.desc("dateExpires"))
				.list();
		if(borrowedAudioBooks != null && borrowedAudioBooks.size() != 0){
			BorrowedAudioBook mostRecentAudioBook = borrowedAudioBooks.get(0);
			List<Book> books = (List<Book>) getSession().createCriteria(Book.class, "book")
					.createAlias("book.genres", "bookGenre")
					.createAlias("bookGenre.genre", "genre")
					.add(Restrictions.eq("genre.genre", mostRecentAudioBook.getAudioBook().getBook().getGenres().iterator().next().getGenre().getGenre()))
					.list();
			Iterator<Book> it = books.iterator();
			while(totalRecommendedBooks > 0){
				if(!it.hasNext()){
					break;
				}
				Book book = it.next();
				if(book.getAudioBook() != null){
					boolean canAdd = true;
					for(BorrowedAudioBook a : currentUser.getBorrowedAudioBooks()){
						if(a.getAudioBook().getAudioBookId() == book.getAudioBook().getAudioBookId()){
							canAdd = false;
						}
					}
					for(PastBorrowedAudioBook a : currentUser.getPastBorrowedAudioBooks()){
						if(a.getAudioBook().getAudioBookId() == book.getAudioBook().getAudioBookId()){
							canAdd = false;
						}
					}
					if(canAdd){
						recommendedBooks.add(new BasicBookInfo(book.getAudioBook()));	
						totalRecommendedBooks--;	
					}
				}
			}
		}
		for(BasicBookInfo b : recommendedBooks){
			System.out.println("Recommended " + b.getBookTitle());
		}
		return recommendedBooks;
	}
	@Override
	public void updateBorrowedBook(BorrowedEBook book){
		getSession().merge(book);
	}
	@Override
	public void updateBorrowedBook(BorrowedAudioBook book){
		getSession().merge(book);
	}
}
