package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="EBookHolds")
public class EBookOnHold {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int ebookOnHoldId;

	
	@OneToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@OneToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@Column(name = "positionInQueue")
	private int positionInQueue;


	public int getEbookOnHoldId() {
		return ebookOnHoldId;
	}


	public RegisteredUser getUser() {
		return user;
	}


	public void setUser(RegisteredUser user) {
		this.user = user;
	}


	public EBook geteBook() {
		return eBook;
	}


	public void seteBook(EBook eBook) {
		this.eBook = eBook;
	}

}
