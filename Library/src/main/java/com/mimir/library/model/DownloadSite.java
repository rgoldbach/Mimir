package com.mimir.library.model;

public abstract class DownloadSite {

	private String name;
	private String id;
	private String baseUrl;
	public DownloadSite(String name, String id, String baseUrl){
		this.name = name;
		this.id = id;
		this.baseUrl = baseUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBaseUrl() {
		return baseUrl;
	}
	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
