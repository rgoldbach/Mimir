package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import com.mimir.library.enums.FormatType;

public class MP3 extends Audio{

	public MP3( Date releaseDate,
			Collection<Language> languages, Publisher publisher,
			Collection<DownloadSite> downloadSites,
			Collection<License> license, int numberOfParts, String duration,
			String fileSize) {
		super(FormatType.MP3, releaseDate, languages, publisher, downloadSites, license,
				numberOfParts, duration, fileSize);
		
	}

}
