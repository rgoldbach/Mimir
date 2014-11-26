package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.mimir.library.enums.LanguageName;

@Entity
@Table(name = "Languages")
public class Language {

	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int languageId;
	
	@Column(name = "language")
	@Enumerated(EnumType.STRING)
	private LanguageName language;

	public LanguageName getLanguage() {
		return language;
	}

	public void setLanguage(LanguageName language) {
		this.language = language;
	}

	public int getLanguageId() {
		return languageId;
	}
}
