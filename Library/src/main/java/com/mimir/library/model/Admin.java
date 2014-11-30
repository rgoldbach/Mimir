package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Admins")
public class Admin{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int adminId;

	@OneToOne
	@JoinColumn(name = "accountInfoId")
	private AccountInfo accountInfo;
	
}
