package au.usyd.waiver5619.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.waiver5619.domain.Comment;

@Repository
@Transactional
public class CommentDaoImpl implements CommentDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Comment> findComments(int postId, int offset, int limit) {
		Session session=sessionFactory.getCurrentSession();
		List<Comment> list=null;
		if (postId!=0) {
			list=(List<Comment>)session
					.createSQLQuery("select * from Comment where post_id="+postId+" order by create_time desc limit "+offset+","+limit)
					.addEntity(Comment.class)
					.list();
		}else {
			list=(List<Comment>)session
					.createSQLQuery("select * from Comment order by create_time desc limit "+offset+","+limit)
					.addEntity(Comment.class)
					.list();
		}
		return list;
	}

	@Override
	public Comment selectCommentById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Comment comment=(Comment)session.get(Comment.class, id);
		return comment;
	}

	@Override
	public void addComment(Comment comment) {
		sessionFactory.getCurrentSession().save(comment);
	}

	@Override
	public void updateCommentById(int id) {
		
	}

	@Override
	public void removeComment(int id) {
		Session session=sessionFactory.getCurrentSession();
		Comment comment=(Comment)session.get(Comment.class, id);
		session.delete(comment);
	}

}
