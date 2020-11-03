package au.usyd.waiver5619.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.waiver5619.domain.LoginToken;

@Repository
@Transactional
public class TokenDaoImpl implements TokenDao{

	@Autowired
	private SessionFactory factory;
	
	@Override
	public void addToken(LoginToken token) {
		factory.getCurrentSession().save(token);
	}

	@Override
	public LoginToken selectByToken(String token) {
		Session session=factory.getCurrentSession();
		LoginToken loginToken=(LoginToken)session.get(LoginToken.class, token);
		return loginToken;
	}

	@Override
	public void updateStatus(String token, int status) {
		Session session=factory.getCurrentSession();
		LoginToken loginToken=(LoginToken)session.get(LoginToken.class, token);
		loginToken.setStatus(1);
		session.update(loginToken);
	}

}
