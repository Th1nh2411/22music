package web.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "History")
public class History {

	@Id
	@GeneratedValue
	@Column(name = "History_Id")
	private int id;
	@ManyToOne
	@JoinColumn(name = "User_Id")
	private User user;
	@ManyToOne
	@JoinColumn(name = "Song_Id")
	private Song song;
	
	@Column(name = "Rating")
	private int rating;
	@Column(name = "Is_Pre")
	private int isPre;
	
	public int getIsPre() {
		return isPre;
	}
	public void setIsPre(int isPre) {
		this.isPre = isPre;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Song getSong() {
		return song;
	}
	public void setSong(Song song) {
		this.song = song;
	}


	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
}
