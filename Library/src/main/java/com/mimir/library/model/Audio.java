package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import com.mimir.library.enums.FormatType;

public abstract class Audio{
	
	private int numberOfParts;
	private String duration;
	private String fileSize;

	public Audio(FormatType formatType, Date releaseDate,
			Collection<Language> languages, Publisher publisher,
			Collection<DownloadSite> downloadSites, Collection<License> license,
			int numberOfParts, String duration, String fileSize) {
		this.setNumberOfParts(numberOfParts);
		this.setDuration(duration);
		this.setFileSize(fileSize);
	}

	public int getNumberOfParts() {
		return numberOfParts;
	}

	public void setNumberOfParts(int numberOfParts) {
		this.numberOfParts = numberOfParts;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	

}
