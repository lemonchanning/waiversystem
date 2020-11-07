package au.usyd.waiver5619.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import au.usyd.waiver5619.dao.TokenDao;
import au.usyd.waiver5619.dao.UserDao;
import au.usyd.waiver5619.domain.LoginToken;
import au.usyd.waiver5619.domain.User;
import util.CommonUtil;

@Service(value = "userService")
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private TokenDao tokenDao;
	
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
		user.setPassword(CommonUtil.md5(user.getPassword()+user.getSalt()));
		user.setType(0);
		user.setCredits(0);
		userDao.addUser(user);
	}
	
	public void updateHeader(int userId, String headerUrl) {
		userDao.updateHeaderUrl(userId, headerUrl);
	}
	
	public Map<String, Object> login(String email,String password, int expiredTime) {
		Map<String, Object> map=new HashMap<String, Object>();
		if (StringUtils.isEmpty(email)) {
			map.put("emailMsg", "The email should not be null!");
			return map;
		}
		
		if (StringUtils.isEmpty(password)) {
			map.put("passwordMsg", "The password should not be null!");
			return map;
		}
		
		User user=userDao.selectUserByEmail(email);
		if (user==null) {
			map.put("nullMsg", "The user doesn't exist!");
			return map;
		}
		String encryptedPassword=CommonUtil.md5(password+user.getSalt());
		if (!encryptedPassword.equals(user.getPassword())) {
			map.put("wrongMsg", "The password is wrong!");
			return map;
		}
		
		LoginToken loginToken=new LoginToken();
		loginToken.setStatus(0);
		loginToken.setUserId(user.getId());
		loginToken.setExpiredTime(new Date(System.currentTimeMillis()+expiredTime*1000));
		loginToken.setToken(UUID.randomUUID().toString().replaceAll("-", ""));
		
		tokenDao.addToken(loginToken);
		map.put("token", loginToken.getToken());
		return map;
	}
	
	public Map<String, Object> reset(String email,String password, String confirmPass) {
		Map<String, Object> map=new HashMap<String, Object>();
		if (StringUtils.isEmpty(email)) {
			map.put("emailMsg", "The email should not be null!");
			return map;
		}
		
		if (StringUtils.isEmpty(password)) {
			map.put("passMsg", "The password should not be null!");
			return map;
		}
		
		if (StringUtils.isEmpty(email)) {
			map.put("passMsg", "The passMsg should not be null!");
			return map;
		}
		
		if (!password.equals(confirmPass)) {
			map.put("idenMsg", "The two passwords should be identical!");
			return map;
		}
		User user=userDao.selectUserByEmail(email);
		if (user==null) {
			map.put("emailMsg", "The email does not exist!");
			return map;
		}
		
		user.setPassword(CommonUtil.md5(password+user.getSalt()));
		userDao.updatePassword(user.getId(), user.getPassword());
		
		return null;
	}
	public LoginToken finLoginToken(String token) {
		return tokenDao.selectByToken(token);
	}
	public void logout(String token) {
		tokenDao.updateStatus(token, 1);
	}
}
