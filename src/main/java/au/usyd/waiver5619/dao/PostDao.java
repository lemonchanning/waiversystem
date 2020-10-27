package au.usyd.waiver5619.dao;

import java.util.List;

import au.usyd.waiver5619.domain.Post;

public interface PostDao {
	void addPost(Post post);
	void deletePostById(int id);
	void updatePost(int id, int type);
	Post selectPostById(int id);
	List<Post> findPost(int userId, int offset, int limit);
	int selectPostRows(int userId);
}
