package au.usyd.waiver5619.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.waiver5619.annotation.LoginRequired;
import au.usyd.waiver5619.domain.Comment;
import au.usyd.waiver5619.domain.Page;
import au.usyd.waiver5619.domain.Post;
import au.usyd.waiver5619.domain.UrlLink;
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.CommentService;
import au.usyd.waiver5619.service.PostService;
import au.usyd.waiver5619.service.UserService;
import util.Constant;
import util.HostHolder;

@Controller
public class PostController implements Constant{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired  
	private HostHolder hostHolder;
	
	@Autowired
	private UserService userService;
	
	
	@LoginRequired
	@RequestMapping(value = "/apply1", method = RequestMethod.GET)
	public String apply() {
		return "views/apply-donation";
	}
	
	/**
	 * 
	 * @param request
	 * @param model
	 * @param multipartFiles
	 * @return upload the post info
	 */
	@RequestMapping(value = "/apply2", method = RequestMethod.POST)
	public String apply(HttpServletRequest request, Model model, @RequestParam(value = "multipartFiles")MultipartFile[] multipartFiles) {
		
		String title=request.getParameter("title");
		String target=request.getParameter("targetAmount");
		String contact=request.getParameter("contact_info");
		String content=request.getParameter("content");
		Map<String, Object> map=new HashMap<String, Object>();
		int targetAmount=0;
		
		//check the information
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
			//add posts
			Post post=new Post();
			post.setTitle(title);
			post.setContent(content);
			post.setCreateTime(new Date());
			post.setTargetAmount(targetAmount);
			post.setContact(contact);
			post.setUsername(hostHolder.getUser().getUsername());
			post.setUserId(hostHolder.getUser().getId());
			
			//check images
			if (multipartFiles[0].isEmpty()) {
				postService.addPosts(post);
			}else {
				postService.addPosts(post);
				for (int i=0; i<multipartFiles.length;i++) {
					String filename=multipartFiles[i].getOriginalFilename();
					String suffix=filename.substring(filename.lastIndexOf("."));
					if (StringUtils.isEmpty(suffix)) {
						model.addAttribute("filesMsg", "The file format is wrong!");
						return "views/apply-donation";
					}
					filename=UUID.randomUUID().toString().replaceAll("-", "")+suffix;
					File file=new File(LOCALPATH+"/"+filename);
					try {
						multipartFiles[i].transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					System.out.println("filename: "+filename);
					
					UrlLink urlLink=new UrlLink();
					urlLink.setPostId(post.getId());
					urlLink.setUrl(LOCALPATH+"/"+filename);
					urlLink.setImageName(filename);
					postService.addUrl(urlLink);
				}
				
			}
			
		}
		return "redirect:/";

		
	}
	 private boolean isDigit1(String strNum) {    
	     return strNum.matches("[0-9]{1,}");    
	 }
	 
	 /**
	  * 
	  * @param model
	  * @param page
	  * @param id
	  * @return fetch the post detail data
	  */
	 @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	 public String postDetail(Model model, Page page, @PathVariable("id") int id) {
		 Post post=postService.selectPostById(id);
		 List<UrlLink> links=postService.findUrlLinksByPostId(id);
		 User user=userService.selectUserById(post.getUserId());
		 User loginUser=hostHolder.getUser();
		 model.addAttribute("postuser", user);
		 
		 //check user header image
		 String headerUrl=user.getHeaderUrl();
		 if (headerUrl==null) {
			model.addAttribute("filename1", null);
		}else {
			headerUrl=headerUrl.substring(headerUrl.lastIndexOf("/"));
			headerUrl=headerUrl.substring(1);
			String filename1=headerUrl;
			model.addAttribute("filename1", filename1);
		}
		 if (links==null) {
			 model.addAttribute("post", post);
			 
			 page.setRows(post.getCommentCount());
			 page.setPath("/"+id);
			 page.setLimit(3);
			 List<Comment> comments=commentService.findComments(post.getId(), page.getOffset(), page.getLimit());
			 List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
			 for (Comment comment : comments) {
				if (comment.getHeaderImage()!=null) {
					String header=comment.getHeaderImage().substring(comment.getHeaderImage().lastIndexOf("/"));
					header=header.substring(1);
					comment.setHeaderImage(header);
				}
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("comment", comment);
				list.add(map);
			}
			 model.addAttribute("list", list);
			
		}else {
			
			model.addAttribute("links", links);
			 	
			 
			 model.addAttribute("post", post);
			 page.setRows(post.getCommentCount());
			 page.setPath("/"+id);
			 page.setLimit(3);
			 List<Comment> comments=commentService.findComments(post.getId(), page.getOffset(), page.getLimit());
			 List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
			 for (Comment comment : comments) {
				 if (comment.getHeaderImage()!=null) {
						String header=comment.getHeaderImage().substring(comment.getHeaderImage().lastIndexOf("/"));
						header=header.substring(1);
						comment.setHeaderImage(header);
					}
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("comment", comment);
				list.add(map);
			}
			 model.addAttribute("list", list);
			 
		}
		 
		 return "views/donate-info";
		
	}
	 
	 /**
	  * @description: fetch the multiple images
	  * @param model
	  * @param response
	  * @param linkName
	  * 
	  */
	 @RequestMapping(value = "/file/{linkName}/", method = RequestMethod.GET)
	 public void getFile(Model model,  HttpServletResponse response, @PathVariable("linkName") String[] linkName) {
		 for (int i=0;i<linkName.length;i++) {
			 String file=LOCALPATH+"/"+linkName[i];
			
			 String suffix=file.substring(file.lastIndexOf("."));
			 response.setContentType("image/"+suffix);
			 FileInputStream inputStream=null;
			 
			 try {
				inputStream=new FileInputStream(file);
				OutputStream os=response.getOutputStream();
				byte[] buffer=new byte[1024];
				int b=0;
				while ((b=inputStream.read(buffer))!=-1) {
					
					os.write(buffer,0,b);
				}
				os.close();
			} catch (FileNotFoundException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				logger.debug(e.getMessage());
			} 
			 
		}
	 }
	 

}
