package au.usyd.waiver5619.dao;

import java.util.List;

import org.hibernate.SQLQuery;
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
		SQLQuery query=session.createSQLQuery("select * from Token where token="+"'"+token+"'");
		List<LoginToken> loginTokens=(List<LoginToken>)query.addEntity(LoginToken.class).list();
		if (loginTokens==null||loginTokens.size()==0) {
			return null;
		}
		return loginTokens.get(0);
	}

	@Override
	public void updateStatus(String token, int status) {
		Session session=factory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from Token where token="+"'"+token+"'");
		List<LoginToken> loginTokens=(List<LoginToken>)query.addEntity(LoginToken.class).list();
		if (loginTokens.size()==0) {
			System.out.println("The token is null!");
			return;
		}
		LoginToken loginToken=loginTokens.get(0);
		loginToken.setStatus(1);
		session.update(loginToken);
	}

}
