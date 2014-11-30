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
@Table(name="InterestLevelInterests")
public class InterestLevelInterest {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@OneToOne
	@JoinColumn(name = "interestLevelId")
	private InterestLevel interestLevel;
		
	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public InterestLevel getInterestLevel() {
		return interestLevel;
	}

	public void setInterestLevel(InterestLevel interestLevel) {
		this.interestLevel = interestLevel;
	}

	public int getId() {
		return id;
	}

}
