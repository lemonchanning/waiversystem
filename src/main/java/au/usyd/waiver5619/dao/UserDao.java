package au.usyd.waiver5619.dao;

import au.usyd.waiver5619.domain.User;

public interface UserDao {
	User selectUserById(int id);
}
