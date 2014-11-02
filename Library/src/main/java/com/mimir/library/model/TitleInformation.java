package com.mimir.library.model;

import java.util.Collection;
import java.util.LinkedList;

public class TitleInformation {

	private Collection<Format> formats;
	
	public TitleInformation(){
		formats = new LinkedList<Format>();
	}
	public Collection<Format> getFormats() {
		return formats;
	}
	public void setFormats(Collection<Format> formats) {
		this.formats = formats;
	}
	
}
