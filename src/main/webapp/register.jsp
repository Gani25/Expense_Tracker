<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="component/all_css.jsp"%>
<style type="text/css">
.card-shadow {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body class="bg-light">
	<%@include file="component/navbar.jsp"%>
	<input type="hidden" id="msg" value="<%=request.getAttribute("msg")%>">
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card card-shadow">
					<div class="card-header">
						<p class="text-center fs-3">Register</p>
						<%-- <c:if test="${not empty msg}">
							<p class="text-center text-info fs-4">${msg}</p>
							<c:remove var="msg" />
						</c:if> --%>
					</div>
					<div class="card-body">
						<form action="userRegister" method="post">
							<div class="mb-3">
								<label>Enter Full Name</label> <input type="text"
									name="fullName" class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Email</label> <input type="email" name="email"
									class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Password</label> <input type="password"
									name="password" class="form-control">
							</div>
							<div class="mb-3">
								<label>About</label> <input type="text" name="about"
									class="form-control">
							</div>
							<button class="btn btn-info col-md-12">
								<i class="fa-solid fa-user-plus"></i> Signup
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
		if (msg === "Name cannot be blank") {
			swal("Sorry", "Name cannot be empty", "error");
		} else if (msg === "Email cannot be blank") {
			swal("Sorry", "Email cannot be empty", "error");
		} else if (msg === "Password cannot be blank") {
			swal("Sorry", "Password cannot be empty", "error");
		} else if (msg === "About cannot be blank") {
			swal("Sorry", "About cannot be empty", "error");
		} else if (msg === "Register successfully") {
			swal("Thankyou", "Thanks for register", "success");
		} else if (msg === "Something went on server") {
			swal("Sorry", "Something bad happen to server", "error");
		} else if (msg === "Delete Successfully") {
			swal("Sorry", "Do Visit Again", "success");
		}
	</script>
</body>
</html>