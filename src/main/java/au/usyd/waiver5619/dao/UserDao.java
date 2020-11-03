package au.usyd.waiver5619.dao;

import au.usyd.waiver5619.domain.User;

public interface UserDao {
	User selectUserById(int id);
	void addUser(User user);
	void removeUser(int id);
	void updatePassword(int id, String password);
	User selectUserByEmail(String email);
	void updateHeaderUrl(int id, String headerUrl);
}
