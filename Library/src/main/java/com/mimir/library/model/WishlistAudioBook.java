package com.mimir.library.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="WishlistAudioBooks")
public class WishlistAudioBook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "regUserId")
	private RegisteredUser user;
	
	@OneToOne
    @JoinColumn(name = "audioBookId")
	private AudioBook audioBook;

	public WishlistAudioBook(){}
	
	public WishlistAudioBook(AudioBook audioBook, RegisteredUser user){
		this.user = user;
		this.audioBook = audioBook;	
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	@Override
    public boolean equals(Object obj){
        if(!(obj instanceof WishlistAudioBook)){
            return false;
        }
        WishlistAudioBook temp = (WishlistAudioBook)obj;
        return (temp.getAudioBook().getAudioBookId() == this.getAudioBook().getAudioBookId());
    }
	
}
