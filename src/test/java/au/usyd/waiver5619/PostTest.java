package au.usyd.waiver5619;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.Test;

import au.usyd.waiver5619.domain.Post;

public class PostTest {
	Post testPost=new Post();
	
	@Test
	public void testGetId() {
		testPost.setId(0);
		assertNotNull(testPost.getId());
		assertEquals(testPost.getId(), 0);
	}


	@Test
	public void testGetContent() {
		testPost.setContent("hello");
		assertNotNull(testPost.getContent());
		assertEquals(testPost.getContent(), "hello");
	}

	

	@Test
	public void testGetTitle() {
		testPost.setTitle("hi");
		assertNotNull(testPost.getTitle());
		assertEquals(testPost.getTitle(), "hi");
	}

	

	@Test
	public void tesCreateTime() {
		testPost.setCreateTime(new Date());
		assertNotNull(testPost.getCreateTime());
		assertEquals(testPost.getCreateTime(), new Date());
	}

	

	@Test
	public void getContact() {
		testPost.setContact("23456");
		assertNotNull(testPost.getContact());
		assertEquals(testPost.getContact(), "23456");

	}

	
}
