package au.usyd.waiver5619.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.waiver5619.dao.PostDao;
import au.usyd.waiver5619.dao.UrlDao;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.domain.UrlLink;

@Service(value = "postService")
@Transactional
public class PostService {

	
	@Autowired
	private PostDao postDao;
	
	@Autowired
	private UrlDao urlDao;
	
	public void addPosts(Post post) {
		postDao.addPost(post);
	}
	
	public void deletePostById(int id) {
		postDao.deletePostById(id);
	}
	
	public void update(int id, double actualAmount) {
		postDao.updatePost(id, actualAmount);
	}
	
	public List<Post> findPosts(int userId, int offset, int limit) {
		return postDao.findPost(userId, offset, limit);
	}
	
	public Post selectPostById(int id) {
		return postDao.selectPostById(id);
	}
	
	public int selectPostRows(int userId) {
		return postDao.selectPostRows(userId);
	}
	
	public UrlLink selectUrlByLink(String url) {
		return urlDao.selectUrlByLink(url);
	}
	
	public void addUrl(UrlLink urlLink) {
		urlDao.addUrl(urlLink);
	}
	
	public List<UrlLink> findUrlLinksByPostId(int postId) {
		return urlDao.findUrlLinksByPostId(postId);
	}
	
	public void updateCommentCount(int postId, int commentCount) {
		postDao.updateCommentCount(postId, commentCount);
	}
}
