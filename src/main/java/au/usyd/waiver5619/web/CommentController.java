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
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.CommentService;
import au.usyd.waiver5619.service.PostService;
import util.HostHolder;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private HostHolder hostHolder;
	
	/**
	 * 
	 * @param model
	 * @param id: the detailed post id
	 * @param request
	 * @return post comment
	 */
	@RequestMapping(value = "/add/{id}",method = RequestMethod.POST)
	public String addComment(Model model, @PathVariable("id") int id, HttpServletRequest request) {
		Post post=postService.selectPostById(id);
		
		String content=request.getParameter("content");
		
			User user=hostHolder.getUser();
			if (user==null) {
				model.addAttribute("commentUser", "You are not logged in!!");
				return "redirect:/detail/"+id;
			}
			
			//Update comment count
			int commentCount=post.getCommentCount();
			postService.updateCommentCount(post.getId(), commentCount+1);
			
			
			//add comments
			Comment comment=new Comment();
			comment.setCreateTime(new Date());
			comment.setPostId(id);
			comment.setPostName(post.getTitle());
			comment.setUserId(hostHolder.getUser().getId());
			comment.setUsername(hostHolder.getUser().getUsername());
			comment.setContent(content);
			if (user.getHeaderUrl()!=null) {
				comment.setHeaderImage(user.getHeaderUrl());
			}
			
			commentService.addComment(comment);
		
		
		return "redirect:/detail/"+id;
	}
}
