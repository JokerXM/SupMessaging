package com.supinfo.supmessaging.daojpa;


//import java.math.BigInteger;
//import java.security.MessageDigest;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.supinfo.supmessaging.DAO.messageDao;
import com.supinfo.supmessaging.entity.message;

public class jpamessagedao implements messageDao{
	
	private EntityManagerFactory emf;
	public jpamessagedao(EntityManagerFactory emf){
		this.emf=emf;
	}

	@Override
	public void addmessage(message u) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		EntityTransaction t = em.getTransaction();
		t.begin();
		em.persist(u);
		t.commit();
		em.close();
		
		
	}


	@Override
	public void updatemessage(message c) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removemessage(message c) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<message> findmessage(String username, String ruser) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT m from message m WHERE (m.sender =:sname AND m.recipient =:rname) OR (m.recipient =:sname AND m.sender =:rname)");
		Query query2=em.createQuery("UPDATE FROM message AS m SET m.ifread = 'have read' WHERE (m.sender =:sname AND m.recipient =:rname) OR (m.recipient =:sname AND m.sender =:rname)");
		query.setParameter("rname", ruser);
		query.setParameter("sname", username);
		query2.setParameter("rname", ruser);
		query2.setParameter("sname", username);
		List<message> result = query.getResultList();
		EntityTransaction t = em.getTransaction();	
		t.begin();
		query2.executeUpdate();
		t.commit();
		
				
		return result;
	}

	@Override
	public List<message> getAllmessage(String username) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT m from message m WHERE (m.sender =:tname) OR (m.recipient =:tname)");
		query.setParameter("tname", username);
		List<message> message = query.getResultList();
		Collections.reverse(message);
		em.close();
		return message;
	}

	public int countmessage() {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT u from message as u");
		List result = query.getResultList();
		int number = result.size();
		
		return number;
	}

}
