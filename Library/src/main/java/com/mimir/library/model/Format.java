package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;


import java.util.LinkedList;

import com.mimir.library.enums.FormatType;

public abstract class Format {
	
	private FormatType formatType;
	private Date releaseDate;
	private Collection<String> userWaitlist;
	private Collection<Language> languages;
	private BookRating rating;
	private Publisher publisher;
	private Collection<DownloadSite> downloadSites;
	private Collection<License> license;
	
	public Format(FormatType formatType, 
				  Date releaseDate,
				  Collection<Language> languages,
				  Publisher publisher,
				  Collection<DownloadSite> downloadSites,
				  Collection<License> license){
		this.formatType = formatType;
		this.releaseDate = releaseDate;
		this.userWaitlist = new LinkedList<String>();
		this.languages = languages;
		this.rating = new BookRating();
		this.publisher = publisher;
		this.downloadSites = downloadSites;
		this.license = license;
		
	}
	public FormatType getFormatType() {
		return formatType;
	}
	public void setFormatType(FormatType formatType) {
		this.formatType = formatType;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Collection<String> getUserWaitlist() {
		return userWaitlist;
	}
	public void setUserWaitlist(Collection<String> userWaitlist) {
		this.userWaitlist = userWaitlist;
	}
	public Collection<Language> getLanguages() {
		return languages;
	}
	public void setLanguages(Collection<Language> languages) {
		this.languages = languages;
	}
	public BookRating getRating() {
		return rating;
	}
	public void setRating(BookRating rating) {
		this.rating = rating;
	}
	public Publisher getPublisher() {
		return publisher;
	}
	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
	public Collection<DownloadSite> getDownloadSites() {
		return downloadSites;
	}
	public void setDownloadSites(Collection<DownloadSite> downloadSites) {
		this.downloadSites = downloadSites;
	}
	public Collection<License> getLicense() {
		return license;
	}
	public void setLicense(Collection<License> license) {
		this.license = license;
	}
}
