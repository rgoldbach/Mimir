package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="AuthorAwards")
public class AuthorAward {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int authorAwardId;
	
	@OneToOne
	@JoinColumn(name = "awardId")
	private AwardInfo awardInfo;
	
	@OneToOne
	@JoinColumn(name = "authorId")
	private Author author;

	public int getAuthorAwardId() {
		return authorAwardId;
	}

	public AwardInfo getAwardInfo() {
		return awardInfo;
	}

	public void setAwardInfo(AwardInfo awardInfo) {
		this.awardInfo = awardInfo;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}


}
