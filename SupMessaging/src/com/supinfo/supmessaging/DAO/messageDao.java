package com.supinfo.supmessaging.DAO;

import java.util.List;

import com.supinfo.supmessaging.entity.message;

public interface messageDao {
	
	List<message> getAllmessage(String username);
	void updatemessage(message c);
	void removemessage(message c);
	void addmessage(message u);
	List findmessage(String username, String ruser);
	

}
