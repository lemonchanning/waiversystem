package au.usyd.waiver5619.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.waiver5619.annotation.LoginRequired;
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.UserService;
import util.Constant;
import util.HostHolder;

@Controller
@Transactional
@RequestMapping(value = "/user")
public class UserController implements Constant{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HostHolder hostHolder;
	
	/**
	 * @description: get user profile, login required
	 * @param model
	 * @return
	 */
	@LoginRequired
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String getSettingPage(Model model) {
		User user=hostHolder.getUser();
		if (user==null) {
			model.addAttribute("user1", null);
			return "views/profile";
		}else {
			if (user.getHeaderUrl()==null) {
				model.addAttribute("header1", null);
				model.addAttribute("user1", user);
				
			}else {
				String filename=user.getHeaderUrl().substring(user.getHeaderUrl().lastIndexOf("/"));
				filename=filename.substring(1);
				model.addAttribute("header1", filename);
				model.addAttribute("filename", filename);
				model.addAttribute("user1", user);
			}
			return "views/profile";
		}
	}
	
	/**
	 * @description upload header image
	 * @param model
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(Model model, MultipartFile multipartFile) {
		if (multipartFile==null) {
			model.addAttribute("fileMsg", "The file is null!");
			return "redirect:/user/setting";
		}
		String filename=multipartFile.getOriginalFilename();
		if (StringUtils.isEmpty(filename)) {
			model.addAttribute("fileMsg", "The file does not exist!");
			return "redirect:/user/setting";
		}
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
		
		//image url
		String url=WEBPATH+"/user/header/"+filename;
	
		userService.updateHeader(hostHolder.getUser().getId(), url);
		return "redirect:/user/setting";
	}
	
	/**
	 * @description: output image by bytes 
	 * @param filename
	 * @param response
	 */
	@RequestMapping(value = "/header/{filename}/", method = RequestMethod.GET)
	public void getHeader(@PathVariable("filename") String filename, HttpServletResponse response) {
		filename=LOCALPATH+"/"+filename;
		String suffix=filename.substring(filename.lastIndexOf("."));
		response.setContentType("image/"+suffix);
		FileInputStream inputStream=null;
		try {
			//out put image from local
			inputStream=new FileInputStream(filename);
			OutputStream os=response.getOutputStream();
			byte[] buffer=new byte[1024];
			int b=0;
			while ((b=inputStream.read(buffer))!=-1) {
				os.write(buffer,0,b);
			}
		} catch (FileNotFoundException e) {
			logger.debug(e.getMessage());
		} catch (IOException e) {
			logger.debug(e.getMessage());
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				logger.debug(e.getMessage());
			}
		}
	}
	@RequestMapping(value = "/getreset", method = RequestMethod.GET)
	public String getResetPage() {
		return "views/fgt_psd";
	}
	
	
	/**
	 * @description forget password
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String reset(Model model, HttpServletRequest request) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmPass=request.getParameter("confirmPass");
		
		Map<String, Object> map=userService.reset(email,password,confirmPass);
		if (map!=null) {
			model.addAttribute("emailMsg", map.get("emailMsg"));
			model.addAttribute("passMsg", map.get("passMsg"));
			model.addAttribute("idenMsg", map.get("idenMsg"));
			return "views/fgt_psd";
		}
		return "views/sign_in";
	}
	
	
}
