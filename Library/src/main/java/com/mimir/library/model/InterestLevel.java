package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.mimir.library.enums.Interest;

@Entity
@Table(name = "InterestLevels")
public class InterestLevel {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int interestLevelId;
	
	@Column(name = "interestLevel")
	private String interestLevel;
	
	public String getInterestLevel() {
		return interestLevel;
	}

	public void setInterestLevel(String interestLevel) {
		this.interestLevel = interestLevel;
	}
	/*public void setInterestLevel(String interestLevel) {
		System.out.println(interestLevel);
		if(interestLevel.equals(Interest.Adult.toString())){
			this.interestLevel = Interest.Adult;
		}else if(interestLevel.equals(Interest.College.toString())){
			this.interestLevel = Interest.College;
		}else if(interestLevel.equals(Interest.Elementary.toString())){
			this.interestLevel = Interest.Elementary;
		}else if(interestLevel.equals(Interest.HighSchool.toString())){
			this.interestLevel = Interest.HighSchool;
		}else if(interestLevel.equals(Interest.Kindergarten.toString())){
			this.interestLevel = Interest.Kindergarten;
		}else if(interestLevel.equals(Interest.MiddleSchool.toString())){
			this.interestLevel = Interest.MiddleSchool;
		}else if(interestLevel.equals(Interest.YoungAdult.toString())){
			this.interestLevel = Interest.YoungAdult;
		}
	}*/
	public int getInterestLevelId() {
		return interestLevelId;
	}
}
