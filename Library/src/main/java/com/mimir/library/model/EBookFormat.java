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
@Table(name="EBookFormats")
public class EBookFormat {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookFormatId;
	
	@ManyToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@OneToOne
	@JoinColumn(name = "formatId")
	private Format format;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name = "releaseDate")
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate releaseDate;
	
	@Column(name = "fileSize")
	private Integer fileSize;

	public int geteBookFormatId() {
		return eBookFormatId;
	}

	public void seteBookFormatId(int eBookFormatId) {
		this.eBookFormatId = eBookFormatId;
	}

	public EBook geteBook() {
		return eBook;
	}

	public void seteBook(EBook eBook) {
		this.eBook = eBook;
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
}
