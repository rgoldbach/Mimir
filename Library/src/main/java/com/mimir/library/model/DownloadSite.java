package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DownloadSites")
public class DownloadSite {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int downloadSiteId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "baseUrl")
	private String baseUrl;
	
	@Column(name = "downloadUrl")
	private String downloadUrl;
	
	@Column(name = "bookKeyUrl")
	private String bookKeyUrl;
	
	@Column(name = "publicKey")
	private String publicKey;
	
}
