package au.usyd.waiver5619.web;

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

import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.UserService;

@Controller
@Transactional
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/getregister",method = RequestMethod.GET)
	public String getRegisterPage() {
		return "views/sign-up";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(Model model, User user,HttpServletRequest request) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String confirmPass=request.getParameter("confirmPass");
		String email=request.getParameter("email");
		Map<String, Object> map=new HashMap<String, Object>();
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
		
		if (map.size()!=0) {
			model.addAttribute("userMsg", map.get("userMsg"));
			model.addAttribute("passMsg", map.get("passMsg"));
			model.addAttribute("idenMsg", map.get("idenMsg"));
			model.addAttribute("emailMsg", map.get("emailMsg"));
			return "views/sign-up";
		}
		user.setPassword(password);
		user.setUsername(username);
		user.setEmail(email);
		userService.addUser(user);
		return "redirect:/";
	}
}
