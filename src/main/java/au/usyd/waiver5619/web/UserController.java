package au.usyd.waiver5619.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.UserService;

@Controller
@Transactional
@RequestMapping(value = "/user")
public class UserController {
	private final String LOCALPATH="/Users/channing/Documents/workspace-sts-3.9.13.RELEASE/upload";
	
	private final String WEBPATH="http://localhost:8080/waiver5619";
	
	private String name="";
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String getSettingPage(Model model) {
		User user=userService.selectUserById(3);
		Map<String, Object> map=new HashMap<String, Object>();
		if (user.getHeaderUrl()==null) {
			map.put("headMsg", "");
			System.out.println("hello");
			return "views/profile";
		}
		model.addAttribute("map", map);
		model.addAttribute("header", user.getHeaderUrl());
		String filename=user.getHeaderUrl().substring(user.getHeaderUrl().lastIndexOf("/"));
		filename=filename.substring(1);
		model.addAttribute("filename", filename);
		
		name=filename;
		
		return "views/profile";
	}
	
	private String fileName() {
		return name;
	}
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(Model model, MultipartFile multipartFile) {
		if (multipartFile==null) {
			model.addAttribute("fileMsg", "The image is null!");
			return "redirect:/user/setting";
		}
		String filename=multipartFile.getOriginalFilename();
		String suffix=filename.substring(filename.lastIndexOf("."));
		if (StringUtils.isEmpty(suffix)) {
			model.addAttribute("fileMsg", "The format is incorrect!");
			return "redirect:/user/setting";
		}
		filename=UUID.randomUUID().toString().replaceAll("-", "")+suffix;
		File file=new File(LOCALPATH+"/"+filename);
		try {
			multipartFile.transferTo(file);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		//头像地址
		String url=WEBPATH+"/user/header/"+filename;
		//set a fixed user
		userService.updateHeader(3, url);
		return "redirect:/user/setting";
	}
	
	@RequestMapping(value = "/header/{filename}", method = RequestMethod.GET)
	public void getHeader(@PathVariable("filename") String filename, HttpServletResponse response) {
		filename=LOCALPATH+"/"+fileName();
		String suffix=filename.substring(filename.lastIndexOf("."));
		System.out.println(suffix);
		response.setContentType("image/"+suffix);
		FileInputStream inputStream=null;
		try {
			//找到图片
			inputStream=new FileInputStream(filename);
			
			//生成服务器输出流
			OutputStream os=response.getOutputStream();
			
			//把图片内容返还给前端客户端
			byte[] buffer=new byte[1024];
			int b=0;
			while ((b=inputStream.read(buffer))!=-1) {
				os.write(buffer,0,b);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
