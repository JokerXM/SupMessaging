package com.supinfo.supmessaging.DAO;

import java.util.List;

import com.supinfo.supmessaging.entity.user;

public interface userDao {
	
	List<user> getAlluser();
//	void updateuser(user c);
	void removeuser(user c);
	void adduser(user u);
	List<user> finduser(String username);
	String findpassword(String username);
	int countuser();
	void updateuser(String firstname, String lastname, String mail,
			String password, String username);

}
