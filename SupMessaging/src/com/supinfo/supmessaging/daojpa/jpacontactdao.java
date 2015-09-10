package com.supinfo.supmessaging.daojpa;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.supinfo.supmessaging.DAO.contactDao;
import com.supinfo.supmessaging.entity.contact;

public class jpacontactdao implements contactDao{
	
	private EntityManagerFactory emf;
	public jpacontactdao(EntityManagerFactory emf){
		this.emf=emf;
	}

	@Override
	public List<contact> getAllcontact(String username) {
		// TODO Auto-generated method stub
		
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT c from contact c WHERE c.myname =:sname ");
		query.setParameter("sname", username);
		List<contact> contact = query.getResultList();
		em.close();
		return contact;
		
	}

	@Override
	public void removecontact(String username) {
		// TODO Auto-generated method stub	
		EntityManager em = emf.createEntityManager();

		Query query = em.createQuery("SELECT c from contact c WHERE c.myname =:sname ");
		query.setParameter("sname", username);
		contact result = (contact) query.getSingleResult();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.remove(result);
		et.commit();
		em.close();
		
	}

	@Override
	public void addcontact(contact c) {
		// TODO Auto-generated method stub
		
		EntityManager em = emf.createEntityManager();
		EntityTransaction t = em.getTransaction();
		t.begin();
		em.persist(c);
		t.commit();
		em.close();
		
	}

	@Override
	public int findifhere(String username1, String username2) {
		// TODO Auto-generated method stub
		
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT c from contact c WHERE (c.myname =:sname AND c.friendname =:mname)");
		query.setParameter("sname", username1);
		query.setParameter("mname", username2);
		List result = query.getResultList();
		if (result!=null){  
			Iterator iterator = result.iterator();
			while( iterator.hasNext() ){  
				return 1;				
			}
		}
		return 0;
	}

}
