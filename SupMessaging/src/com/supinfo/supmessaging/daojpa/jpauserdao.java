package com.supinfo.supmessaging.daojpa;

//import java.math.BigInteger;
//import java.security.MessageDigest;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.supinfo.supmessaging.DAO.userDao;
import com.supinfo.supmessaging.entity.user;

public class jpauserdao implements userDao{
	
	private EntityManagerFactory emf;
	public jpauserdao(EntityManagerFactory emf){
		this.emf=emf;
	}

	@Override
	public void adduser(user u) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		EntityTransaction t = em.getTransaction();
		t.begin();
		em.persist(u);
		t.commit();
		em.close();
		
		
	}

	@Override
	public List<user> getAlluser() {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT p from user as p");
		List<user> user = query.getResultList();
		em.close();
		return user;
	}

	@Override
	public void updateuser(String firstname,String lastname,String email,String password,String username) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		EntityTransaction t = em.getTransaction();		
		t.begin();
		Query query=em.createQuery("UPDATE FROM user AS u SET u.firstname='"+firstname+"', u.lastname='"+lastname+"',u.password='"+password+"',u.email='"+email+"' WHERE u.username='"+username+"'");
		query.executeUpdate();
		t.commit();
				
				
	}

	@Override
	public void removeuser(user c) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String findpassword(String username) {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT u.password from user u WHERE u.username = :name");
		query.setParameter("name", username);
		List result = query.getResultList();
		String password = null;
		if (result!=null){  
			Iterator iterator = result.iterator();
			while( iterator.hasNext() ){  
				password = (String) iterator.next();

				
			}
		}
		
		
		
		em.close();
		return password;
		
		
	}

	@Override
	public List<user> finduser(String username) {
		// TODO Auto-generated method stub
		
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT u from user u WHERE u.username = :name");
		query.setParameter("name", username);
		List result = query.getResultList();		
		em.close();
		return result;
	}

	@Override
	public int countuser() {
		// TODO Auto-generated method stub
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT u from user as u");
		List<user> result = query.getResultList();		
        int number = result.size();		
		return number;
	}
	

	
	

}
