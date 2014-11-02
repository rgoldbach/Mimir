package com.mimir.library.model;

public class License {

	private int availableCopies;
	private String downloadSiteId;
	
	public License(){
		
	}
	public License(int availableCopies, String downloadSiteId){
		this.setAvailableCopies(availableCopies);
	}
	public int getAvailableCopies() {
		return availableCopies;
	}
	public void setAvailableCopies(int availableCopies) {
		this.availableCopies = availableCopies;
	}
	public String getDownloadSiteId() {
		return downloadSiteId;
	}
	public void setDownloadSiteId(String downloadSiteId) {
		this.downloadSiteId = downloadSiteId;
	}
	
	
}
