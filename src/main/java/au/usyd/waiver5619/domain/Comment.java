package au.usyd.waiver5619.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "post_id")
	private int postId;
	
	@Column(name = "post_name")
	private String postName;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "image")
	private String headerImage;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getHeaderImage() {
		return headerImage;
	}
	public void setHeaderImage(String headerImage) {
		this.headerImage = headerImage;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", postId=" + postId + ", postName=" + postName
				+ ", userId=" + userId + ", username=" + username + ", createTime=" + createTime + ", headerImage="
				+ headerImage + "]";
	}
	
	
	
}
