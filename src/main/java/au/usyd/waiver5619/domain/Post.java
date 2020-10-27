package au.usyd.waiver5619.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "post")
public class Post {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "administrator")
	private String administrator;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "type")
	private int type;
	
	@Column(name = "target_amount")
	private double targetAmount;
	
	@Column(name = "actual_amount")
	private double actualAmount;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "comment_count")
	private int commentCount;
	
	@Column(name = "like_count")
	private int likeCount;
	
	@Column(name = "contact")
	private String contact;
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAdministrator() {
		return administrator;
	}
	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(double targetAmount) {
		this.targetAmount = targetAmount;
	}
	public double getActualAmount() {
		return actualAmount;
	}
	public void setActualAmount(double actualAmount) {
		this.actualAmount = actualAmount;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", userId=" + userId + ", administrator=" + administrator + ", content=" + content
				+ ", title=" + title + ", type=" + type + ", targetAmount=" + targetAmount + ", actualAmount="
				+ actualAmount + ", createTime=" + createTime + "]";
	}
	
	
}
