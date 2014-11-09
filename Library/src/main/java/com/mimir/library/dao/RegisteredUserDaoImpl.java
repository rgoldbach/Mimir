package com.mimir.library.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<BorrowedEBook> getBorrowedEBooksOfSpecificUser(int userId) {
		Criteria borrowedEBooksCriteria = getSession().createCriteria(BorrowedEBook.class);
		return (List<BorrowedEBook>) borrowedEBooksCriteria.add(Restrictions.eq("userId", userId)).list();
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
	public RegisteredUser userCanSignIn(LoginCredentials loginCreds) {
		Criteria userSignInCriteria = getSession().createCriteria(RegisteredUser.class, "registeredUser");
		userSignInCriteria.createAlias("registeredUser.loginCredentials", "loginCredentials");
		userSignInCriteria.add(Restrictions.eq("loginCredentials.email", loginCreds.getEmail()));
		return (RegisteredUser) userSignInCriteria.uniqueResult();
	}

	

}