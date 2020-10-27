package au.usyd.waiver5619.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "salt")
	private String salt;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "type")
	private int type;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "credits")
	private double credits;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public double getCredits() {
		return credits;
	}
	public void setCredits(double credits) {
		this.credits = credits;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", salt=" + salt + ", password=" + password + ", email="
				+ email + ", type=" + type + ", createTime=" + createTime + ", credits=" + credits + "]";
	}
	
	
}
