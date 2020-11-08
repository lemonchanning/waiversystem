package au.usyd.waiver5619;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import au.usyd.waiver5619.domain.Comment;

public class CommentTest {
	Comment testComment = new Comment();
	
	@Test
	public void testGetId() {
		testComment.setId(0);
		assertNotNull(testComment.getId());
		assertEquals(testComment.getId(), 0);
	}


	@Test
	public void testGetContent() {
		testComment.setContent("hello");
		assertNotNull(testComment.getContent());
		assertEquals(testComment.getContent(), "hello");
	}

	

	@Test
	public void testGetPostId() {
		testComment.setPostId(0);
		assertNotNull(testComment.getPostId());
		assertEquals(testComment.getPostId(), 0);
	}

	

	@Test
	public void testGetPostName() {
		testComment.setPostName("Titile");
		assertNotNull(testComment.getPostName());
		assertEquals(testComment.getPostName(), "Titile");
	}

	

	@Test
	public void testGetUserId() {
		testComment.setUserId(0);
		assertNotNull(testComment.getUserId());
		assertEquals(testComment.getUserId(), 0);

	}

	@Test
	public void testGetUsername() {
		testComment.setPostName("Titile");
		assertNotNull(testComment.getUsername());
		assertEquals(testComment.getPostName(), "Titile");
	}

	

}