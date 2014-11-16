package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.joda.time.LocalDate;

import com.mimir.library.globalVariables.GlobalConstants;

@Entity
@Table(name="EBookHolds")
public class EBookOnHold {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int ebookOnHoldId;

	
	@OneToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@Column(name = "positionInQueue")
	private int positionInQueue;

	public EBookOnHold(){}
	
	public EBookOnHold(EBook eBook, RegisteredUser user){
		this.user = user;
		this.eBook = eBook;	
	}
	
	public int getEbookOnHoldId() {
		return ebookOnHoldId;
	}

	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public EBook getEBook() {
		return eBook;
	}

	public void setEBook(EBook eBook) {
		this.eBook = eBook;
	}

	public int getPositionInQueue() {
		return positionInQueue;
	}

	public void setPositionInQueue(int positionInQueue) {
		this.positionInQueue = positionInQueue;
	}
	
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof BorrowedEBook)){
            return false;
        }
        EBookOnHold temp = (EBookOnHold)obj;
        return (temp.getEBook().getEBookId() == this.getEBook().getEBookId());
    }

}
