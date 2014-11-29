package com.mimir.library.beans;

import com.mimir.library.globalVariables.GlobalConstants;
import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.EBookOnHold;

public class BasicOnHoldBookInfo extends BasicBookInfo{

	private int positionInQueue;
	
	public BasicOnHoldBookInfo(){
		super();
	}
	
	public BasicOnHoldBookInfo(EBookOnHold eBook){
		this.setAuthor(eBook.getEBook().getBook().getAuthors().iterator().next().getName());
		this.setBookId(eBook.getEBook().getBook().getBookId());
		this.setBookTitle(eBook.getEBook().getBook().getBookDisplay().getTitle());
		this.setFormat(GlobalConstants.EBOOK);
		this.setImageFilePath(eBook.getEBook().getBook().getBookDisplay().getImageFilePath());
		this.setPositionInQueue(eBook.getPositionInQueue());
	}
	public BasicOnHoldBookInfo(AudioBookOnHold audioBook){
		this.setAuthor(audioBook.getAudioBook().getBook().getAuthors().iterator().next().getName());
		this.setBookId(audioBook.getAudioBook().getBook().getBookId());
		this.setBookTitle(audioBook.getAudioBook().getBook().getBookDisplay().getTitle());
		this.setFormat(GlobalConstants.AUDIOBOOK);
		this.setImageFilePath(audioBook.getAudioBook().getBook().getBookDisplay().getImageFilePath());
		this.setPositionInQueue(audioBook.getPositionInQueue());
	}

	public int getPositionInQueue() {
		return positionInQueue;
	}

	public void setPositionInQueue(int positionInQueue) {
		this.positionInQueue = positionInQueue;
	}

}
