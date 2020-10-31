package au.usyd.waiver5619.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import au.usyd.waiver5619.dao.UserDao;
import au.usyd.waiver5619.domain.User;
import util.CommonUtil;

@Service(value = "userService")
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public User selectUserByEmail(String email) {
		return userDao.selectUserByEmail(email);
	}
	
	public User selectUserById(int userId) {
		return userDao.selectUserById(userId);
	}
	
	public void removeUser(int id) {
		userDao.removeUser(id);
	}
	
	public void updatePassword(int id, String password) {
		userDao.updatePassword(id, password);
	}
	
	public void addUser(User user) {
		
		
		user.setCreateTime(new Date());
		user.setSalt(CommonUtil.randomSalt());
		user.setPassword(user.getPassword()+user.getSalt());
		user.setType(0);
		user.setCredits(0);
		userDao.addUser(user);
	}
}
