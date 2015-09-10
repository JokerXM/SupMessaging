package com.supinfo.supmessaging.DAO;

import com.supinfo.supmessaging.daojpa.jpacontactdao;
import com.supinfo.supmessaging.daojpa.jpamessagedao;
import com.supinfo.supmessaging.daojpa.jpauserdao;
import com.supinfo.supmessaging.util.PersistenceManager;

public class DAOfactory {
	
	private DAOfactory(){
	}
	public static jpauserdao userDao()
	{
		jpauserdao jud=new jpauserdao(PersistenceManager.getEntityManagerFactory());
		return jud;
	}
	
	public static jpamessagedao messageDao()
	{
		jpamessagedao jmd=new jpamessagedao(PersistenceManager.getEntityManagerFactory());
		return jmd;
	}
	
	public static jpacontactdao contactDao()
	{
		jpacontactdao jcd=new jpacontactdao(PersistenceManager.getEntityManagerFactory());
		return jcd;
	}

}
