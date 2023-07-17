<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
User u = (User) session.getAttribute("loginUser");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-info ">
	<div class="container-fluid">
		<c:if test="${not empty loginUser}">
			<a class="navbar-brand" href="home.jsp"><i
				class="fa-solid fa-book-open"></i> Khata Book</a>
		</c:if>
		<c:if test="${empty loginUser}">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa-solid fa-book-open"></i> Khata Book</a>
		</c:if>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:if test="${not empty loginUser}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i
							class="fa-solid fa-house"></i> Home</a></li>
				</c:if>
				<c:if test="${empty loginUser}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i
							class="fa-solid fa-house"></i> Home</a></li>
				</c:if>




				<c:if test="${not empty loginUser}">
					<li class="nav-item"><a class="nav-link active"
						href="add_expense.jsp"><i class="fa-solid fa-circle-plus"></i>
							Add Expense</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="view_expense.jsp"><i class="fa-solid fa-rectangle-list"></i>
							View Expense</a></li>
				</c:if>
			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${not empty loginUser}">
					<li class="nav-item"><a class="nav-link active" href="#"><i
							class="fa-regular fa-circle-user"></i> ${loginUser.fullName}</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="../logout"><i class="fa-solid fa-arrow-right-to-bracket"></i>
							Logout</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="../deleteUser?id=<%=u.getId()%>"><i
							class="fa-solid fa-user-xmark"></i> Delete Account</a></li>

				</c:if>
				<c:if test="${empty loginUser}">
					<li class="nav-item"><a class="nav-link active"
						href="login.jsp"><i class="fa-solid fa-arrow-right-to-bracket"></i>
							Login</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="register.jsp"><i class="fa-solid fa-user-plus"></i>
							Register</a></li>
				</c:if>
			</ul>

		</div>
	</div>
</nav>