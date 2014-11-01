package com.mimir.library.model;

import com.mimir.library.enums.Interest;

public class InterestLevel {
	
	private Interest interestLevel;

	public InterestLevel(Interest interestLevel){
		this.interestLevel = interestLevel;
	}
	
	public Interest getInterestLevel() {
		return interestLevel;
	}

	public void setInterestLevel(Interest interestLevel) {
		this.interestLevel = interestLevel;
	} 
}
