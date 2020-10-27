package au.usyd.waiver5619.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import au.usyd.waiver5619.dao.PostDao;
import au.usyd.waiver5619.domain.Post;

@Service(value = "postService")
public class PostService {

	
	@Autowired
	private PostDao postDao;
	
	
	public void addPosts(Post post) {
		postDao.addPost(post);
	}
	
	public void deletePostById(int id) {
		postDao.deletePostById(id);
	}
	
	public void update(int id, int type) {
		postDao.updatePost(id, type);
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
}
