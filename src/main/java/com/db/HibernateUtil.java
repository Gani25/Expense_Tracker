package com.db;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.entity.Expense;
import com.entity.User;

public class HibernateUtil {
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {

		if (sessionFactory == null) {
			Configuration config = new Configuration();
			Properties properties = new Properties();
			properties.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
			properties.put(Environment.URL, "jdbc:mysql://localhost:3306/expense_tracker_db");
			properties.put(Environment.USER, "root");
			properties.put(Environment.PASS, "BILALirfan@313");
			properties.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
			properties.put(Environment.HBM2DDL_AUTO, "update");
			properties.put(Environment.SHOW_SQL, true);
			properties.put(Environment.FORMAT_SQL, true);

			config.setProperties(properties);

			config.addAnnotatedClass(User.class);
			config.addAnnotatedClass(Expense.class);
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties())
					.build();
			sessionFactory = config.buildSessionFactory(serviceRegistry);
		}
		return sessionFactory;
	}

}
