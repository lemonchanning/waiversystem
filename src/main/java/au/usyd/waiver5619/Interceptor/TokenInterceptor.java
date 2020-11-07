package au.usyd.waiver5619.Interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import au.usyd.waiver5619.domain.LoginToken;
import au.usyd.waiver5619.domain.User;
import au.usyd.waiver5619.service.UserService;
import util.CookieUtil;
import util.HostHolder;

@Component
public class TokenInterceptor implements HandlerInterceptor{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HostHolder hostHolder;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String token=CookieUtil.getCookieValue(request, "token");
		if (token!=null) {
			LoginToken loginToken=userService.finLoginToken(token);
			if (loginToken!=null&&loginToken.getStatus()==0&&loginToken.getExpiredTime().after(new Date())) {
				User user=userService.selectUserById(loginToken.getUserId());
				hostHolder.setUser(user);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		User user=hostHolder.getUser();
		if (user!=null&&modelAndView!=null) {
			if (user.getHeaderUrl()==null) {
				modelAndView.addObject("loginUserHeader", user.getHeaderUrl());
				modelAndView.addObject("loginUser", user);
			}else {
				String filename=user
						.getHeaderUrl()
						.substring(user.getHeaderUrl().lastIndexOf("/"));
				filename=filename.substring(1);
				modelAndView.addObject("filename", filename);
				modelAndView.addObject("loginUserHeader", user.getHeaderUrl());
				modelAndView.addObject("loginUser", user);
			}
			
		}
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		hostHolder.clear();
		
	}

}
