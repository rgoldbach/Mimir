package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="AudioBookFormats")
public class AudioBookFormat {

	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int audioBookFormatId;
	
	@ManyToOne
	@JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@OneToOne
	@JoinColumn(name = "formatId")
	private Format format;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "releaseDate")
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate releaseDate;
	
	@Column(name = "fileSize")
	private Integer fileSize;
	
	@Column(name = "numOfParts")
	private Integer numOfParts;
	
	@Column(name = "duration")
	private Integer duration;

	public int getAudioBookFormatId() {
		return audioBookFormatId;
	}

	public void setAudioBookFormatId(int audioBookFormatId) {
		this.audioBookFormatId = audioBookFormatId;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
	}

	public Format getFormat() {
		return format;
	}

	public void setFormat(Format format) {
		this.format = format;
	}

	public LocalDate getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Integer getFileSize() {
		return fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	public Integer getNumOfParts() {
		return numOfParts;
	}

	public void setNumOfParts(Integer numOfParts) {
		this.numOfParts = numOfParts;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	
}
