package au.usyd.waiver5619.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.service.PostService;

@Controller
@Transactional
public class PostController {
	@Autowired
	private PostService postService;
	
	
	@RequestMapping(value = "/apply1", method = RequestMethod.GET)
	public String apply() {
		return "views/apply-donation";
	}
	
	@RequestMapping(value = "/apply2", method = RequestMethod.POST)
	public String apply(HttpServletRequest request, Model model) {
		
		String title=request.getParameter("title");
		String target=request.getParameter("targetAmount");
		
		String contact=request.getParameter("contact_info");
		String content=request.getParameter("content");
		Map<String, Object> map=new HashMap<String, Object>();
		int targetAmount=0;
		if (StringUtils.isEmpty(title)) {
			map.put("titleMsg", "The title should not be null!");
		}
		
		if (StringUtils.isEmpty(contact)) {
			map.put("contactMsg", "The contact should not be null!");
		}
		
		if (StringUtils.isEmpty(content)) {
			map.put("contentMsg", "The content should not be null!");
		}
		if (!isDigit1(target)||StringUtils.isEmpty(target)) {
			map.put("amountMsg", "The number is wrong!");
		}else {
			targetAmount=Integer.parseInt(request.getParameter("targetAmount"));
		}
		
		if (map.size()!=0) {
			model.addAttribute("amountMsg",map.get("amountMsg"));
			model.addAttribute("titleMsg",map.get("titleMsg"));
			model.addAttribute("contentMsg",map.get("contentMsg"));
			model.addAttribute("contactMsg",map.get("contactMsg"));

			return "views/apply-donation";
		}else {
			Post post=new Post();
			post.setTitle(title);
			post.setContent(content);
			post.setCreateTime(new Date());
			post.setTargetAmount(targetAmount);
			post.setContact(contact);
			post.setUserId(1);
			postService.addPosts(post);
			
		}
		return "redirect:/";

		
	}
	
	 private boolean isDigit1(String strNum) {    
	     return strNum.matches("[0-9]{1,}");    
	 } 

}
