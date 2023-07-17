package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());

		boolean f = userDao.deleteUser(id);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("msg", "Delete Successfully");
			resp.sendRedirect("logout");
		} else {
			session.setAttribute("msg", "Something went on server");
			resp.sendRedirect("user/view_expense.jsp");
		}
	}
}
