package au.usyd.waiver5619;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.Test;

import au.usyd.waiver5619.domain.LoginToken;

public class TokenTest {

	LoginToken token=new LoginToken();
	
	@Test
	public void testGetId() {
		token.setId(0);
		assertNotNull(token.getId());
		assertEquals(token.getId(), 0);
	}


	@Test
	public void testGetToken() {
		token.setToken("sadasdasdasc");
		assertNotNull(token.getToken());
		assertEquals(token.getToken(), "sadasdasdasc");
	}

	

	@Test
	public void testExiredTime() {
		token.setExpiredTime(new Date());
		assertNotNull(token.getExpiredTime());
		assertEquals(token.getExpiredTime(),new Date());
	}
}
