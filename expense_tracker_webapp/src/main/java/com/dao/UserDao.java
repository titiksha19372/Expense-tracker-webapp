package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;

import jakarta.persistence.Query;

public class UserDao {
	private SessionFactory factory=null;
	private Session session =null;
    private Transaction tx=null;
	public UserDao(SessionFactory factory) {
		super();
		this.factory=factory;
	}
	public boolean saveuser(User user) {
	    boolean f = false;
	    try {
	        session = factory.openSession();
	        tx = session.beginTransaction();
	        session.save(user);
	        tx.commit();
	        f = true;
	    } catch (Exception e) {
	        if (tx != null) {
	            tx.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return f;
	}
	public User login(String email, String password) {
	    User u = null;
	    session = factory.openSession();
	    Query q = session.createQuery("from User where email = :em and password = :ps", User.class);
	    q.setParameter("em", email);
	    q.setParameter("ps", password);
	    List<User> userList = q.getResultList();
	    if (userList.size() == 1) {
	        u = userList.get(0);
	    }
	    session.close(); // close session after use
	    return u;
	}

}
