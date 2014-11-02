package com.mimir.library.model;

import java.util.Collection;
import java.util.Date;

import com.mimir.library.enums.FormatType;

public class Kindle extends Text{

	public Kindle(Date releaseDate,
			Collection<Language> languages, Publisher publisher,
			Collection<DownloadSite> downloadSites,
			Collection<License> license, String fileSize) {
		super(FormatType.Kindle, releaseDate, languages, publisher, downloadSites, license,
				fileSize);
		
	}

}
