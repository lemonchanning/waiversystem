package au.usyd.waiver5619.dao;

import java.util.List;

import au.usyd.waiver5619.domain.UrlLink;

public interface UrlDao {

	UrlLink selectUrlByLink(String url);
	
	void addUrl(UrlLink urlLink);
	
	List<UrlLink> findUrlLinksByPostId(int postId);
}
