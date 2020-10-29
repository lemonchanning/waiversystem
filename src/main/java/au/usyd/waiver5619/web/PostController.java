package au.usyd.waiver5619.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.waiver5619.domain.Comment;
import au.usyd.waiver5619.domain.Page;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.service.CommentService;
import au.usyd.waiver5619.service.PostService;

@Controller
@Transactional
public class PostController {
	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/apply1", method = RequestMethod.GET)
	public String apply() {
		return "views/apply-donation";
	}

	@RequestMapping("testFileUpload")
	public String testFileUpload(@RequestParam("desc") String desc, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) throws IOException {
		System.out.println("desc: " + desc);
		System.out.println("OriginalFilename" + file.getOriginalFilename());
		System.out.println("InputStream: " + file.getInputStream());
		
		//Get File upload real path
		String path = request.getSession().getServletContext().getRealPath("/uploads");
		//Create a new file object
		File newfile = new File(path);
		if(!newfile.exists()) {
			newfile.mkdirs();
		}
		//Get file name
		String name = System.currentTimeMillis()+file.getOriginalFilename();
		System.out.println(path);
		File targetFile = new File(path+"/"+name);
		try {
			//Write file into the specific path
			FileUtils.writeByteArrayToFile(targetFile, file.getBytes());
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "success";
	}

	@RequestMapping(value = "/apply2", method = RequestMethod.POST)
	public String apply(HttpServletRequest request, Model model) {

		String title = request.getParameter("title");
		String target = request.getParameter("targetAmount");

		String contact = request.getParameter("contact_info");
		String content = request.getParameter("content");
		Map<String, Object> map = new HashMap<String, Object>();
		int targetAmount = 0;
		if (StringUtils.isEmpty(title)) {
			map.put("titleMsg", "The title should not be null!");
		}

		if (StringUtils.isEmpty(contact)) {
			map.put("contactMsg", "The contact should not be null!");
		}

		if (StringUtils.isEmpty(content)) {
			map.put("contentMsg", "The content should not be null!");
		}
		if (!isDigit1(target) || StringUtils.isEmpty(target)) {
			map.put("amountMsg", "The number is wrong!");
		} else {
			targetAmount = Integer.parseInt(request.getParameter("targetAmount"));
		}

		if (map.size() != 0) {
			model.addAttribute("amountMsg", map.get("amountMsg"));
			model.addAttribute("titleMsg", map.get("titleMsg"));
			model.addAttribute("contentMsg", map.get("contentMsg"));
			model.addAttribute("contactMsg", map.get("contactMsg"));

			return "views/apply-donation";
		} else {
			Post post = new Post();
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

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String postDetail(Model model, Page page, @PathVariable("id") int id) {
		Post post = postService.selectPostById(id);
		model.addAttribute("post", post);

		page.setRows(post.getCommentCount());
		page.setPath("/" + id);
		page.setLimit(3);
		List<Comment> comments = commentService.findComments(post.getId(), page.getOffset(), page.getLimit());
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (Comment comment : comments) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("comment", comment);
			list.add(map);
		}
		model.addAttribute("list", list);
		return "views/donate-info";
	}

}
