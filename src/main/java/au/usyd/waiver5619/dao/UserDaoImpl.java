package au.usyd.waiver5619.dao;

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

}
