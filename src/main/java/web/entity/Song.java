package web.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CollectionId;

@Entity
@Table(name = "Song")
public class Song {

	@Id
	@GeneratedValue
	@Column(name = "Song_Id")
	private int id;
	@Column(name = "Song_Name")
	private String songName;
	@Column(name = "Date")
	private String date;
	@Column(name = "Tag")
	private String tag;
	@Column(name = "Image")
	private String image;
	@Column(name = "Audio")
	private String audio;
	@Column(name = "Lyrics")
	private String lyric;
	@Column(name = "Author")
	private String author;
	@Column(name = "Performer")
	private String performer;
	@Column(name = "IsDel")
	private int isDel;
	@Column(name = "Point")
	private int point;
	@Column(name = "PreSong")
	private String pred;
	@OneToMany(mappedBy = "song",  fetch = FetchType.EAGER)
	private Collection<History> histories;

	public String getPred() {
		return pred;
	}

	public void setPred(String pred) {
		this.pred = pred;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSongName() {
		return songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}
	
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getLyric() {
		return lyric;
	}

	public void setLyric(String lyric) {
		this.lyric = lyric;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPerformer() {
		return performer;
	}

	public void setPerformer(String performer) {
		this.performer = performer;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Collection<History> getHistories() {
		return histories;
	}

	public void setHistories(Collection<History> histories) {
		this.histories = histories;
	}
	
	@SuppressWarnings("deprecation")
	public int getYear() {
		try {
			Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			return d1.getYear();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@SuppressWarnings("deprecation")
	public int getMonthOfTheYear() {
		try {
			Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			return d1.getMonth();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@SuppressWarnings("deprecation")
	public int getDayOfTheMonth() {
		try {
			Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			return d1.getDate();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public Integer isValidDay() {
		try {
			Date dateS = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			
			
			
		} catch (ParseException e) {
			return 0;
			
		}
		return 1;
	}
	public Long dayDiffNow() {
		//now - date
		try {
			ZonedDateTime zonedDateTime = LocalDate.now().atStartOfDay(ZoneId.systemDefault());
			Date currentDate = Date.from(zonedDateTime.toInstant());
			Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			
			if(currentDate.after(d1)||d1 ==currentDate) {
				Long diff = currentDate.getTime()-d1.getTime();
				Long diffDays = diff / (24 * 60 * 60 * 1000);
				return diffDays;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return (long) 0;
	}

}
