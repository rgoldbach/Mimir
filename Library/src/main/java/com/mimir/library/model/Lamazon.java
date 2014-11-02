package com.mimir.library.model;

import com.mimir.library.exceptions.NotImplementedException;

public class Lamazon extends DownloadSite{

	private String downloadUrl;
	private String bookKeyUrl;
	private Object publicKey;
	
	public Lamazon(String name, String id, String baseUrl, String downloadUrl, String bookKeyUrl, Object publicKey){
		super(name, id, baseUrl);
		this.setDownloadUrl(downloadUrl);
		this.setBookKeyUrl(bookKeyUrl);
		this.setPublicKey(publicKey);
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public String getBookKeyUrl() {
		return bookKeyUrl;
	}

	public void setBookKeyUrl(String bookKeyUrl) {
		this.bookKeyUrl = bookKeyUrl;
	}

	public Object getPublicKey() {
		return publicKey;
	}

	public void setPublicKey(Object publicKey) {
		this.publicKey = publicKey;
	}
	
	public void generateBookKey(){
		throw new NotImplementedException();
	}
	
	public void goToDownloadSite(){
		throw new NotImplementedException();
	}
	
}
