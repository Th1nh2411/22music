package web.entity;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "`User`")
public class User {

	@Id
	@GeneratedValue
	@Column(name = "User_Id")
	private int id;
	@Column(name = "Name")
	private String name;
	@Column(name = "Gender")
	private int gender;
	@Column(name = "Mail")
	private String mail;
	@Column(name = "PreUser")
	private String pred;
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private Account account;
	@OneToMany(mappedBy = "user",  fetch = FetchType.EAGER)
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Collection<History> getHistories() {
		return histories;
	}
	public void setHistories(Collection<History> histories) {
		this.histories = histories;
	}
	
}
