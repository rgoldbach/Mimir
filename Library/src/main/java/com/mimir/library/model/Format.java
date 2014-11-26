package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.mimir.library.enums.FormatType;

@Entity
@Table(name="Formats")
public class Format {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int formatId;
	
	@Column(name = "format")
	@Enumerated(EnumType.STRING)
	private FormatType formatType;
	
	public int getFormatId() {
		return formatId;
	}

	public FormatType getFormatType() {
		return formatType;
	}

	public void setFormatType(FormatType formatType) {
		this.formatType = formatType;
	}

}
