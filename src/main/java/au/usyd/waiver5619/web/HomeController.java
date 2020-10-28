package au.usyd.waiver5619.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.waiver5619.domain.Page;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.PostService;
import au.usyd.waiver5619.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Transactional
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Page page) {

		page.setRows(postService.selectPostRows(0));
		page.setPath("/");
		
		List<Post> list=postService.findPosts(0, page.getOffset(), page.getLimit());
		List<Map<String, Object>> discussList=new ArrayList<Map<String,Object>>();
		for (Post post : list) {
			Map<String,Object> map=new HashMap<String, Object>();
//			User user=userService.selectUserById(post.getUserId());
			map.put("post", post);
//			map.put("username",user.getUsername());
			discussList.add(map);
		}
		model.addAttribute("discussList", discussList);
		
		return "demo";
	}
	
	
}
