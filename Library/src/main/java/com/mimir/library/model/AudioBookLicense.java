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
@Table(name="AudioBookLicenses")
public class AudioBookLicense {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int audioBookLicenseId;
	
	@ManyToOne
	@JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@OneToOne
	@JoinColumn(name = "downloadSiteId")
	private DownloadSite downloadSite;
	
	@Column(name = "numberOfCopiesForDownload")
	private int numberOfCopiesForDownload;

	public AudioBookLicense(){
		
	}
	
	public int getAudioBookLicenseId() {
		return audioBookLicenseId;
	}

	public void setAudioBookLicenseId(int audioBookLicenseId) {
		this.audioBookLicenseId = audioBookLicenseId;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
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
