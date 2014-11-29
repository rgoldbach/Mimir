package com.mimir.library.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="AudioBookHolds")
public class AudioBookOnHold {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int audioBookHoldId;

	
	@OneToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
	@JoinColumn(name = "audioBookId")
	private AudioBook audioBook;
	
	@Column(name = "positionInQueue")
	private int positionInQueue;

	public AudioBookOnHold(){}
	
	public AudioBookOnHold(AudioBook audioBook, RegisteredUser user){
		this.user = user;
		this.audioBook = audioBook;	
	}
	
	public int getAudioBookHoldId() {
		return audioBookHoldId;
	}

	public void setAudioBookOnHoldId(int audioBookHoldId) {
		this.audioBookHoldId = audioBookHoldId;
	}

	public RegisteredUser getUser() {
		return user;
	}

	public void setUser(RegisteredUser user) {
		this.user = user;
	}

	public AudioBook getAudioBook() {
		return audioBook;
	}

	public void setAudioBook(AudioBook audioBook) {
		this.audioBook = audioBook;
	}

	public int getPositionInQueue() {
		return positionInQueue;
	}

	public void setPositionInQueue(int positionInQueue) {
		this.positionInQueue = positionInQueue;
	}
	
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof AudioBookOnHold)){
            return false;
        }
        AudioBookOnHold temp = (AudioBookOnHold)obj;
        return (temp.getAudioBook().getAudioBookId() == this.getAudioBook().getAudioBookId());
    }
	
}
