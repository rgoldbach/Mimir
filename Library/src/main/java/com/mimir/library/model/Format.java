package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.FormatSchema;

import com.mimir.library.enums.FormatType;

@Entity
@Table(name="Formats")
public class Format {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int formatId;
	
	@Column(name = "format")
	private String formatType;
	
	public int getFormatId() {
		return formatId;
	}

	public String getFormatType() {
		return formatType;
	}

	public void setFormatType(String formatType) {
		this.formatType = formatType;
	}
	/*public void setFormatType(String formatType){
		if(formatType.equalsIgnoreCase(FormatType.EPub.toString())){
			this.formatType = FormatType.EPub;
		}
		else if(formatType.equalsIgnoreCase(FormatType.Html.toString())){
			this.formatType = FormatType.Html;
		}
		else if(formatType.equalsIgnoreCase(FormatType.Kindle.toString())){
			this.formatType = FormatType.Kindle;
		}
		else if(formatType.equalsIgnoreCase(FormatType.MP3.toString())){
			this.formatType = FormatType.MP3;
		}
		else if(formatType.equalsIgnoreCase(FormatType.Pdf.toString())){
			this.formatType = FormatType.Pdf;
		}
		else if(formatType.equalsIgnoreCase(FormatType.WMA.toString())){
			this.formatType = FormatType.WMA;
		}
		
	}*/

}
