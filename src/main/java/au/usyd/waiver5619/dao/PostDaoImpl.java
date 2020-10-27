package au.usyd.waiver5619.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.waiver5619.domain.Post;

@Repository
@Transactional
public class PostDaoImpl implements PostDao{
	private final static Logger LOGGER=LoggerFactory.getLogger(PostDaoImpl.class);

	@Autowired
	private SessionFactory factory;
	
	@Override
	public void addPost(Post post) {
		factory.getCurrentSession().save(post);
	}

	@Override
	public void deletePostById(int id) {
		Session session=factory.getCurrentSession();
		Post post=(Post) session.get(Post.class, id);
		session.delete(post);
	}

	@Override
	public void updatePost(int id, int type) {
		Session session=factory.getCurrentSession();
		Post post=(Post) session.get(Post.class, id);
		post.setType(type);
		session.update(post);
	}

	@Override
	public Post selectPostById(int id) {
		Session session=factory.getCurrentSession();
		Post post=(Post) session.get(Post.class, id);
		return post;
	}

	@Override
	public List<Post> findPost(int userId, int offset, int limit) {
		Session session=factory.getCurrentSession();
		List<Post> posts =null;
		if (userId==0) {
			posts=(List<Post>)session
					.createSQLQuery("select * from Post order by create_time desc limit " +offset+","+limit)
					.addEntity(Post.class)
					.list();
		}else {
			posts=(List<Post>)session
					.createSQLQuery("select * from Post where user_id="+userId+" order by create_time desc limit " +offset+","+limit)
					.addEntity(Post.class)
					.list();
		}
		
		return posts;
	}

	@Override
	public int selectPostRows(int userId) {
		Session session=factory.getCurrentSession();
		int count1=0;
		if (userId!=0) {
//			long count= ((Long)session.createSQLQuery("select count(id) from Post where user_id="+userId).iterate().next()).intValue();
			SQLQuery query=session.createSQLQuery("select count(id) from Post where user_id="+userId);
			BigInteger count=(BigInteger)query.uniqueResult();
			count1=count.intValue();

		}else {
//			long count= ((Long)session.createSQLQuery("select count(id) from Post").iterate().next()).intValue();
//			count1=(int)count;
			SQLQuery query=session.createSQLQuery("select count(id) from Post");
			BigInteger count=(BigInteger)query.uniqueResult();
			count1=count.intValue();

		}
		return count1;
	}
}
