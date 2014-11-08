package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	private Interest interestLevel;
	
	public Interest getInterestLevel() {
		return interestLevel;
	}

	public void setInterestLevel(Interest interestLevel) {
		this.interestLevel = interestLevel;
	}

	public int getInterestLevelId() {
		return interestLevelId;
	}
}
