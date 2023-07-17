<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("loginUser") == null) {
	response.sendRedirect("../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expenses</title>
<style type="text/css">
.card-shadow {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/all_css.jsp"%>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>

	<input type="hidden" id="msg" value="<%=session.getAttribute("msg")%>">
	<div class="container p-5">
		<div class="row">
			<div class="col-md-12 ">
				<div class="card card-shadow">
					<div class="card-header">
						<p class="text-center fs-3">All Expenses</p>
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("loginUser");
								ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
								List<Expense> expenses = expenseDao.getAllExpenseByUser(user);

								for (Expense expense : expenses) {
								%>
								<tr>
									<th scope="row"><%=expense.getTitle()%></th>
									<td><%=expense.getDescription()%></td>
									<td><%=expense.getDate()%></td>
									<td><%=expense.getTime()%></td>
									<td><%=expense.getPrice()%></td>
									<td><a href="edit_expense.jsp?id=<%=expense.getId()%>"
										class="btn btn-sm btn-info me-1"><i
											class="fa-solid fa-pen-to-square"></i> Edit</a> <a
										href="../deleteExpense?id=<%=expense.getId()%>"
										class="btn btn-sm btn-danger me-1"><i
											class="fa-solid fa-trash-can"></i> Delete</a></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var msg = document.getElementById("msg").value;
		console.log(msg);
		if (msg === "Expense Update Successfully") {
			swal("Thankyou", "Congrats!! Expense Updated", "success");
		} else if (msg === "Delete Successfully") {
			swal("Hurrayy!!", "Expense Deleted Successfully", "success");
		} else if (msg === "Something went on server") {
			swal("Sorry", "Something bad happen to server", "error");
		}
	</script>
</body>
</html>