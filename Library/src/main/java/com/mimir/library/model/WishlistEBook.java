package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.joda.time.LocalDate;

import com.mimir.library.globalVariables.GlobalConstants;

@Entity
@Table(name="WishlistEBooks")
public class WishlistEBook {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "eBookId")
	private EBook eBook;

	public WishlistEBook(){}
	
	public WishlistEBook(EBook eBook, RegisteredUser user){
		//id = book.getBookId(); Not the same id, could cause an error
		this.user = user;
		this.eBook = eBook;	
	}
	
	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public EBook getEBook() {
		return eBook;
	}

	public void setEBook(EBook eBook) {
		this.eBook = eBook;
	}
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof BorrowedEBook)){
            return false;
        }
        WishlistEBook temp = (WishlistEBook)obj;
        return (temp.getEBook().getEBookId() == this.getEBook().getEBookId());
    }
}
