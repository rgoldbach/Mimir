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
@Table(name="AudioBookLanguages")
public class AudioBookLanguage {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int audioBookLanguageId;
	
	@ManyToOne
	@JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@OneToOne
	@JoinColumn(name = "languageId")
	private Language language;

	public int getAudioBookLanguageId() {
		return audioBookLanguageId;
	}

	public void setAudioBookLanguageId(int audioBookLanguageId) {
		this.audioBookLanguageId = audioBookLanguageId;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
	}

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}
	
}
