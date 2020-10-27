package au.usyd.waiver5619.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import au.usyd.waiver5619.dao.UserDao;
import au.usyd.waiver5619.domain.User;

@Service(value = "userService")
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public User selectUserById(int id) {
		return userDao.selectUserById(id);
	}

}
