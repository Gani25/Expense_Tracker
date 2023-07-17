<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("loginUser") == null) {
	out.print(session.getAttribute("email"));
	response.sendRedirect("../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<%@include file="../component/all_css.jsp"%>
<style type="text/css">
.card-shadow {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body class="bg-light">

	<%
	int id = Integer.parseInt(request.getParameter("id"));

	ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
	Expense ex = expenseDao.getExpenseById(id);
	%>
	<%@include file="../component/navbar.jsp"%>
	<input type="hidden" id="msg" value="<%=session.getAttribute("msg")%>">
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-shadow">
					<div class="card-header">
						<p class="text-center fs-3">Edit Expense</p>

					</div>
					<div class="card-body">
						<form action="../updateExpense" method="post">
							<div class="mb-3">
								<label>Title</label> <input type="text" name="title"
									class="form-control" value="<%=ex.getTitle()%>">
							</div>
							<div class="mb-3">
								<label>Date</label> <input type="date" name="date"
									class="form-control" value="<%=ex.getDate()%>">
							</div>
							<div class="mb-3">
								<label>Time</label> <input type="time" name="time"
									class="form-control" value="<%=ex.getTime()%>">
							</div>
							<div class="mb-3">
								<label>Description</label> <input type="text" name="description"
									class="form-control" value="<%=ex.getDescription()%>">
							</div>
							<div class="mb-3">
								<label>Price</label> <input type="text" name="price"
									class="form-control" value="<%=ex.getPrice()%>">
							</div>
							<input type="hidden" name="id" value="<%=ex.getId()%>">
							<button class="btn btn-info col-md-12">
								<i class="fa-solid fa-circle-check"></i> Update
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		var msg = document.getElementById("msg").value;
		console.log(msg);
		if (msg === "Title cannot be blank") {
			swal("Sorry", "Title cannot be empty", "error");
		} else if (msg === "Date cannot be blank") {
			swal("Sorry", "Date cannot be empty", "error");
		} else if (msg === "Time cannot be blank") {
			swal("Sorry", "Time cannot be empty", "error");
		} else if (msg === "Description cannot be blank") {
			swal("Sorry", "Description cannot be empty", "error");
		} else if (msg === "Price cannot be blank") {
			swal("Sorry", "Price cannot be empty", "error");
		}
	</script>
</body>
</html>