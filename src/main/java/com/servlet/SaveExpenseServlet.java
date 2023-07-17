package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/saveExpense")
public class SaveExpenseServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		String description = req.getParameter("description");
		String price = req.getParameter("price");

		HttpSession session = req.getSession();

		User u = (User) session.getAttribute("loginUser");
		RequestDispatcher rd = null;

		Expense e = new Expense(title, date, time, description, price, u);
		if (title == null || title.equals("")) {
			session.setAttribute("msg", "Title cannot be blank");
//			rd = req.getRequestDispatcher("user/add_expense.jsp");
//			rd.forward(req, resp);
			resp.sendRedirect("user/add_expense.jsp");

		} else if (date == null || date.equals("")) {
			session.setAttribute("msg", "Date cannot be blank");
//			rd = req.getRequestDispatcher("user/add_expense.jsp");
//			rd.forward(req, resp);
			resp.sendRedirect("user/add_expense.jsp");

		} else if (time == null || time.equals("")) {
			session.setAttribute("msg", "Time cannot be blank");
//			rd = req.getRequestDispatcher("user/add_expense.jsp");
//			rd.forward(req, resp);
			resp.sendRedirect("user/add_expense.jsp");

		} else if (description == null || description.equals("")) {
			session.setAttribute("msg", "Description cannot be blank");
//			rd = req.getRequestDispatcher("user/add_expense.jsp");
//			rd.forward(req, resp);
			resp.sendRedirect("user/add_expense.jsp");

		} else if (price == null || price.equals("")) {
			session.setAttribute("msg", "Price cannot be blank");
//			rd = req.getRequestDispatcher("user/add_expense.jsp");
//			rd.forward(req, resp);

			resp.sendRedirect("user/add_expense.jsp");

		} else {
			ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
			boolean f = expenseDao.saveExpense(e);

			if (f == true) {
				session.setAttribute("msg", "Expense Added Successfully");
//				rd = req.getRequestDispatcher("user/add_expense.jsp");
//				rd.forward(req, resp);
				resp.sendRedirect("user/add_expense.jsp");
			} else {
				session.setAttribute("msg", "Something went on server");
//				rd = req.getRequestDispatcher("user/add_expense.jsp");
//				rd.forward(req, resp);
				resp.sendRedirect("user/add_expense.jsp");
			}

		}
	}
}
