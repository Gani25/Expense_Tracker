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

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		RequestDispatcher rd = null;
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());
		User u = userDao.login(email, password);
//		session.setAttribute("email", email);

		System.out.println(u);
		if (email == null || email.equals("")) {
			req.setAttribute("msg", "Email cannot be blank");
			rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);

		} else if (password == null || password.equals("")) {
			req.setAttribute("msg", "Password cannot be blank");
			rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);

		} else if (u == null) {
			req.setAttribute("msg", "Invalid email and password");
			rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		} else {
			session.setAttribute("loginUser", u);
			resp.sendRedirect("user/home.jsp");
		}
	}
}
