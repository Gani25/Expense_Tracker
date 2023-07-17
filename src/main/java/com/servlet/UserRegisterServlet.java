package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName = req.getParameter("fullName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");

		User u = new User(fullName, email, password, about);
		HttpSession session = req.getSession();
		RequestDispatcher rd = null;
//		System.out.println(u);
		if (fullName == null || fullName.equals("")) {
			req.setAttribute("msg", "Name cannot be blank");
			rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);

		}else if (email == null || email.equals("")) {
			req.setAttribute("msg", "Email cannot be blank");
			rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);


		}else if (password == null || password.equals("")) {
			req.setAttribute("msg", "Password cannot be blank");
			rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);

		}else if (about == null || about.equals("")) {
			req.setAttribute("msg", "About cannot be blank");
			rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);

		}
		else {

			UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
			boolean f = userDao.saveUser(u);

			if (f == true) {
				req.setAttribute("msg", "Register successfully");
				System.out.println("Register successfully");
				rd = req.getRequestDispatcher("register.jsp");
				rd.forward(req, resp);
//			resp.sendRedirect("register.jsp");
			} else {
				req.setAttribute("msg", "Something went on server");
				System.out.println("Something went on server");
				rd = req.getRequestDispatcher("register.jsp");
				rd.forward(req, resp);
//			resp.sendRedirect("register.jsp");
			}
		}
	}
}
