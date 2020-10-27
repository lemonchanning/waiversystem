package util;

import org.springframework.stereotype.Component;

import au.usyd.waiver5619.domain.User;

@Component
public class HostHolder {
	ThreadLocal<User> threadLocal=new ThreadLocal<User>();
	
	public void setUser(User user) {
		threadLocal.set(user);
	}

	public User getUser() {
		return threadLocal.get();
	}
	
	public void clear() {
		threadLocal.remove();
	}
}
