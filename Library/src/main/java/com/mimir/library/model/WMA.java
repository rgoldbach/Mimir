package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import com.mimir.library.enums.FormatType;

public class WMA extends Audio{

	public WMA(Date releaseDate,
			Collection<Language> languages, Publisher publisher,
			Collection<DownloadSite> downloadSites,
			Collection<License> license, int numberOfParts, String duration,
			String fileSize) {
		super(FormatType.WMA, releaseDate, languages, publisher, downloadSites, license,
				numberOfParts, duration, fileSize);
	}

	
}
