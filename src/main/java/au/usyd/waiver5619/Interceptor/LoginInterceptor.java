package au.usyd.waiver5619.Interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import au.usyd.waiver5619.annotation.LoginRequired;
import util.HostHolder;

@Component
public class LoginInterceptor implements HandlerInterceptor{

	@Autowired
	private HostHolder hostHolder;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod=(HandlerMethod)handler;
			Method method=handlerMethod.getMethod();
			LoginRequired loginRequired=method.getAnnotation(LoginRequired.class);
			if (loginRequired!=null&&hostHolder.getUser()==null) {
				response.sendRedirect(request.getContextPath()+"/getlogin");
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
