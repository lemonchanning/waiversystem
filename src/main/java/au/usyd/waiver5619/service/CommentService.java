package au.usyd.waiver5619.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.waiver5619.dao.CommentDao;
import au.usyd.waiver5619.domain.Comment;

@Service(value = "commentService")
@Transactional
public class CommentService {
	
	@Autowired
	private CommentDao commentDao;
	
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}

	public void deleteComment(int id) {
		commentDao.removeComment(id);
	}
	
	public List<Comment> findComments(int postId, int offset, int limit) {
		return commentDao.findComments(postId, offset, limit);
	}
	
	public Comment selectCommentById(int id) {
		return commentDao.selectCommentById(id);
	}
	
	public void updateCommentUser(int userId, String url) {
		commentDao.updateCommentUser(userId, url);
	}
}
