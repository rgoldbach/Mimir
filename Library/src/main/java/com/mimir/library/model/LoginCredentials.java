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
@Table(name="LoginCreds")
public class LoginCredentials {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int loginId;
	
	@OneToOne
	@JoinColumn(name = "userId")
	private RegisteredUser user;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "password")
	private String password;
	
	public LoginCredentials(){
		
	}
	
	public LoginCredentials(String username, String password){
		this.email = username;
		this.password = password;
	}
	
	public String getUsername(){ 
		return email; 
		}
	public String getPassword(){ 
		return password; 
		}
	public void setUsername(String username){ 
		this.email = username; 
		}	
	public void setPassword(String password){ 
		this.password = password; 
		}

	public int getLoginId() {
		return loginId;
	}
}
