package au.usyd.waiver5619.dao;

import java.util.List;

import au.usyd.waiver5619.domain.Comment;

public interface CommentDao {
	List<Comment> findComments(int userId, int offset, int limit);
	Comment selectCommentById(int id);
	void addComment(Comment comment);
	void updateCommentById(int id);
	void removeComment(int id);
}
