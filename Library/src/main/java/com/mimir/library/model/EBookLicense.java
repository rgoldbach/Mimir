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

@Entity
@Table(name="EBookLicenses")
public class EBookLicense{

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int eBookLicenseId;
	
	@ManyToOne
	@JoinColumn(name = "eBookId")
	private EBook eBook;
	
	@OneToOne
	@JoinColumn(name = "downloadSiteId")
	private DownloadSite downloadSite;
	
	@Column(name = "numberOfCopiesForDownload")
	private int numberOfCopiesForDownload;

	public int geteBookLicenseId() {
		return eBookLicenseId;
	}

	public EBook geteBook() {
		return eBook;
	}

	public void seteBook(EBook eBook) {
		this.eBook = eBook;
	}

	public DownloadSite getDownloadSite() {
		return downloadSite;
	}

	public void setDownloadSite(DownloadSite downloadSite) {
		this.downloadSite = downloadSite;
	}

	public int getNumberOfCopiesForDownload() {
		return numberOfCopiesForDownload;
	}

	public void setNumberOfCopiesForDownload(int numberOfCopiesForDownload) {
		this.numberOfCopiesForDownload = numberOfCopiesForDownload;
	}
	
}
