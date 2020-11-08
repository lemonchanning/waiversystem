package au.usyd.waiver5619;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.Test;

import au.usyd.waiver5619.domain.User;

public class UserTest {
	User testUser=new User();
	
	@Test
	public void testGetId() {
		testUser.setId(0);
		assertNotNull(testUser.getId());
		assertEquals(testUser.getId(), 0);
	}


	@Test
	public void testGetPassword() {
		testUser.setPassword("hello");
		assertNotNull(testUser.getPassword());
		assertEquals(testUser.getPassword(), "hello");
	}

	

	@Test
	public void testGetSalt() {
		testUser.setSalt("123");
		assertNotNull(testUser.getSalt());
		assertEquals(testUser.getSalt(), "123");
	}

	

	@Test
	public void testGetEmail() {
		testUser.setEmail("www@qq.com");
		assertNotNull(testUser.getEmail());
		assertEquals(testUser.getEmail(), "www@qq.com");
	}

	

	@Test
	public void testGetCreateTime() {
		testUser.setCreateTime(new Date());
		assertNotNull(testUser.getCreateTime());
		assertEquals(testUser.getCreateTime(), new Date());

	}

	@Test
	public void testGetUsername() {
		testUser.setUsername("Titile");
		assertNotNull(testUser.getUsername());
		assertEquals(testUser.getUsername(), "Titile");
	}
}
