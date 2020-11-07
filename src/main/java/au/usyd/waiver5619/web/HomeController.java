package au.usyd.waiver5619.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.waiver5619.domain.Page;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.domain.UrlLink;
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.PostService;
import au.usyd.waiver5619.service.UserService;
import util.HostHolder;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private HostHolder hostHolder;
	
	
	/**
	 * @description: show home page
	 * @param locale
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Page page) {
		User user=hostHolder.getUser();
		if (user==null) {
			model.addAttribute("currentUser", null);
		}else {
			if (user.getHeaderUrl()==null) {
				model.addAttribute("userImage", null);
				model.addAttribute("currentUser", user);
			}else {
				model.addAttribute("userImage", user.getHeaderUrl());
				model.addAttribute("currentUser", user);
				String filename=user
						.getHeaderUrl()
						.substring(user.getHeaderUrl().lastIndexOf("/"));
				filename=filename.substring(1);
				model.addAttribute("filename", filename);
			}
		}
		
		
		//pagination and show posts
		page.setRows(postService.selectPostRows(0));
		page.setPath("/");
		List<Post> list=postService.findPosts(0, page.getOffset(), page.getLimit());
		List<Map<String, Object>> discussList=new ArrayList<Map<String,Object>>();
		for (Post post : list) {
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("post", post);
			discussList.add(map);
		}
		model.addAttribute("discussList", discussList);
		
		return "demo";
	}
	
	
	@RequestMapping(value = "/donate/{id}", method = RequestMethod.GET)
	public String donate(Model model, @PathVariable("id") int id) {
		model.addAttribute("postid", id);
		return "views/pay";
	}
	
	
	
}
