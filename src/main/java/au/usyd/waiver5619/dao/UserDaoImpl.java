package au.usyd.waiver5619.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import au.usyd.waiver5619.domain.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{
	private final static Logger LOGGER=LoggerFactory.getLogger(UserDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User selectUserById(int id) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, id);
		return user;
	}

	@Override
	public void addUser(User user) {
		System.out.println("hi");
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void removeUser(int id) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, id);
		session.delete(user);
 	}

	@Override
	public void updatePassword(int id, String password) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, id);
		user.setPassword(password);
		session.update(user);
	}

	@Override
	public User selectUserByEmail(String email) {
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from User where email='"+email+"'");
		List<User> user=(List<User>)query.addEntity(User.class).list();
		return user.get(0);
	}

	@Override
	public void updateHeaderUrl(int id, String headerUrl) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class, id);
		user.setHeaderUrl(headerUrl);
		session.update(user);
	}

}
