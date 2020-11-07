package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	
	/**
	 * @description: receive cookies from client
	 * @param request
	 * @param name
	 * @return
	 */
	public static String getCookieValue(HttpServletRequest request, String name) {
		if (request==null||name==null) {
			throw new IllegalArgumentException("The argument is null!");
		}
		
		Cookie[] cookies=request.getCookies();
		if (cookies!=null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

}
