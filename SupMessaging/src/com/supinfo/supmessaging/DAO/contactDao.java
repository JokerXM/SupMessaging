package com.supinfo.supmessaging.DAO;

import java.util.List;

import com.supinfo.supmessaging.entity.contact;

public interface contactDao {
	
	List<contact> getAllcontact(String username);
	void addcontact(contact c);
	void removecontact(String username);
	int findifhere(String username1,String username2);

}
