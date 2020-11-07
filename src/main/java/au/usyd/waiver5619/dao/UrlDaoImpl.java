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

import au.usyd.waiver5619.domain.UrlLink;

@Repository
@Transactional
public class UrlDaoImpl implements UrlDao{
	private final static Logger LOGGER=LoggerFactory.getLogger(UrlDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public UrlLink selectUrlByLink(String url) {
		Session session=sessionFactory.getCurrentSession();
		List<UrlLink> links=(List<UrlLink>)session.createSQLQuery("select * from Url where url="+"'"+url+"'").list();
		if (links.size()==0) {
			return null;
		}
		return links.get(0);
	}

	@Override
	public void addUrl(UrlLink urlLink) {
		sessionFactory.getCurrentSession().save(urlLink);
	}

	@Override
	public List<UrlLink> findUrlLinksByPostId(int postId) {
		Session session=sessionFactory.getCurrentSession();
		SQLQuery query=session.createSQLQuery("select * from Url where post_id="+postId);
		List<UrlLink> links=(List<UrlLink>)query.addEntity(UrlLink.class).list();
		if (links.size()==0) {
			return null;
		}
		return links;
	}

}
