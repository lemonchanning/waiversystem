package au.usyd.waiver5619.dao;

import au.usyd.waiver5619.domain.LoginToken;

public interface TokenDao {

	void addToken(LoginToken token);
	LoginToken selectByToken(String token);
	void updateStatus(String token, int status);
	
}
