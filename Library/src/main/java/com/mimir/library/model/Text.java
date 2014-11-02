package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import com.mimir.library.enums.FormatType;

public abstract class Text extends Format {

	private String fileSize;
	
	public Text(FormatType formatType, Date releaseDate,
			Collection<Language> languages, Publisher publisher,
			Collection<DownloadSite> downloadSites, Collection<License> license,
			String fileSize) {
		super(formatType, releaseDate, languages, publisher, downloadSites, license);
		this.setFileSize(fileSize);
	}
	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
}
