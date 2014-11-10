package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="WishlistEBooks")
public class WishlistEBook {
	
	public WishlistEBook(){
		
	}
	
	public WishlistEBook(Book book, RegisteredUser user){
		this.user = user;
		eBook = new EBook(book);
		id = book.getBookId();
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "eBookId")
	private EBook eBook;

	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public EBook geteBook() {
		return eBook;
	}

	public void seteBook(EBook eBook) {
		this.eBook = eBook;
	}
	
}
