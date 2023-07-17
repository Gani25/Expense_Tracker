package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;

public class UserDao {
	private SessionFactory factory = null;

	private Session session = null;

	private Transaction tx = null;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveUser(User user) {

		boolean f = false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();

			session.persist(user);
			tx.commit();
			f = true;
		} catch (Exception e) {
			if (tx != null) {
				f = false;
				e.printStackTrace();
			}
		}

		return f;
	}

	// login check
	public User login(String email, String password) {

		User u = null;
		session = factory.openSession();
		Query q = session.createQuery("from User where email=:em and password=:pw");
		q.setParameter("em", email);
		q.setParameter("pw", password);

		u = (User) q.uniqueResult();

		return u;
	}

	public boolean deleteUser(int id) {

		boolean f = false;
		try {
			session = factory.openSession();

			tx = session.beginTransaction();
			User u = session.get(User.class, id);
			session.delete(u);
			tx.commit();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
