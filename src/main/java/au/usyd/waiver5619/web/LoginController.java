package au.usyd.waiver5619.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.UserService;
import util.Constant;

@Controller
@Transactional
public class LoginController implements Constant{
	
	@Autowired
	private UserService userService;

	
	
	@RequestMapping(value = "/getregister",method = RequestMethod.GET)
	public String getRegisterPage() {
		return "views/sign-up";
	}
	
	/**
	 * @description: User Register
	 * @param model
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(Model model, User user,HttpServletRequest request) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String confirmPass=request.getParameter("confirmPass");
		String email=request.getParameter("email");
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> mapEmail=new HashMap<String, Object>();
		
		//check the information
		if (StringUtils.isEmpty(username)) {
			map.put("userMsg", "The username should not be null!");
		}
		
		if (StringUtils.isEmpty(password)) {
			map.put("passMsg", "The password should not be null!");
		}
		
		if (StringUtils.isEmpty(confirmPass)||!confirmPass.equals(password)) {
			map.put("idenMsg", "The two passwords are not identical!");
		}
		
		if (StringUtils.isEmpty(email)) {
			map.put("emailMsg", "The email should not be null!");
		}
		
		User tempUser=userService.selectUserByEmail(email);
		if (tempUser!=null) {
			mapEmail.put("mailMsg", "The email has already existed!");
		}
		
		if (map.size()!=0) {
			model.addAttribute("userMsg", map.get("userMsg"));
			model.addAttribute("passMsg", map.get("passMsg"));
			model.addAttribute("idenMsg", map.get("idenMsg"));
			model.addAttribute("emailMsg", map.get("emailMsg"));
			return "views/sign-up";
		}else if (mapEmail.size()!=0) {
			model.addAttribute("mailMsg", mapEmail.get("mailMsg"));
			return "views/sign-up";
		}
		
		//add user
		user.setPassword(password);
		user.setUsername(username);
		user.setEmail(email);
		userService.addUser(user);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/getlogin",method = RequestMethod.GET)
	public String getLogin() {
		return "views/sign_in";
	}
	
	/**
	 * @description: User Login
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		boolean rememberme="true".equals(request.getParameter("rememberme"));
		int expired=rememberme?REMEMBERME_TIME:DEFAULT_TIME;

		Map<String, Object> map=userService.login(email, password, expired);
		
		//set login cookie
		if (map.containsKey("token")) {
			Cookie cookie=new Cookie("token", map.get("token").toString());
			cookie.setPath("http://localhost:8080/waiver5619/");
			System.out.println(cookie.getPath());
			cookie.setMaxAge(expired);
			response.addCookie(cookie);
			return "redirect:/";
		}else {
			model.addAttribute("emailMsg", map.get("emailMsg"));
			model.addAttribute("passwordMsg", map.get("passwordMsg"));
			model.addAttribute("nullMsg", map.get("nullMsg"));
			model.addAttribute("wrongMsg", map.get("wrongMsg"));

			return "views/sign_in";
		}
	}
	
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logout(@CookieValue("token") String token) {
		userService.logout(token);
		return "/views/sign_in";
	}
}
