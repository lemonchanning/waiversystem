package au.usyd.waiver5619.web;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.waiver5619.domain.Comment;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.service.CommentService;
import au.usyd.waiver5619.service.PostService;

@Controller
@Transactional
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/addtest/{id}", method = RequestMethod.POST)
	public String test(@PathVariable("id") int id, HttpServletRequest request) {
		String content=request.getParameter("content");
		System.out.println(content);
		return "redirect:/detail/"+id;
	}
	
	@RequestMapping(value = "/add/{id}",method = RequestMethod.POST)
	public String addComment(Model model, @PathVariable("id") int id, HttpServletRequest request) {
		Post post=postService.selectPostById(id);
		String content=request.getParameter("content");
		
			Comment comment=new Comment();
			comment.setCreateTime(new Date());
			comment.setPostId(id);
			comment.setPostName(post.getTitle());
			comment.setUserId(1);
			comment.setUsername("Sam");
			comment.setContent(content);
			
			commentService.addComment(comment);
		
		
		return "redirect:/detail/"+id;
	}
}
