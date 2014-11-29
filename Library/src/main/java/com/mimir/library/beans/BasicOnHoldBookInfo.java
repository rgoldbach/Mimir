package com.mimir.library.beans;

import com.mimir.library.model.AudioBookOnHold;
import com.mimir.library.model.BorrowedAudioBook;
import com.mimir.library.model.BorrowedEBook;
import com.mimir.library.model.EBookOnHold;

public class BasicOnHoldBookInfo extends BasicBookInfo{

	private int positionOnQueue;
	
	public BasicOnHoldBookInfo(){
		super();
	}
	
	public BasicOnHoldBookInfo(EBookOnHold eBook){
		
	}
	public BasicOnHoldBookInfo(AudioBookOnHold audioBook){
		
	}
	public int getPositionOnQueue() {
		return positionOnQueue;
	}

	public void setPositionOnQueue(int positionOnQueue) {
		this.positionOnQueue = positionOnQueue;
	}
}
