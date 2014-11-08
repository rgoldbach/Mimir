package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.mimir.library.enums.AccountType;

@Entity
@Table(name="UserAccountInfo")
public class UserAccountInfo extends AccountInfo{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountInfoId;
	
	@OneToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@Column(name = "firstName")
	private String firstName;
	
	@Column(name = "lastName")
	private String lastName;
	
	private AccountType accountType;
	
	public UserAccountInfo(){
		accountType = AccountType.RegisteredUser;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public AccountType getAccountType() {
		return accountType;
	}

	public int getAccountInfoId() {
		return accountInfoId;
	}
	
}
