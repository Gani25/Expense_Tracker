<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
						<p class="text-center fs-3">Login</p>
					</div>
					<div class="card-body">
						<form action="login" method="post">

							<div class="mb-3">
								<label>Enter Email</label> <input type="email" name="email"
									class="form-control">
							</div>
							<div class="mb-3">
								<label>Enter Password</label> <input type="password"
									name="password" class="form-control">
							</div>

							<button class="btn btn-info col-md-12">
								<i class="fa-solid fa-arrow-right-to-bracket"></i> Login
							</button>
							<div class="text-center mt-2">
								Don't have an accout <a href="register.jsp"
									class="text-decoration-none">Signup</a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		var msg = document.getElementById("msg").value;
		console.log(msg);
		if (msg === "Email cannot be blank") {
			swal("Sorry", "Email cannot be empty", "error");
		} else if (msg === "Password cannot be blank") {
			swal("Sorry", "Password cannot be empty", "error");
		} else if (msg === "Invalid email and password") {
			swal("Sorry", "Invalid email and password", "error");
		} else if (msg === "Logout Successfully") {
			swal("Logout Successfull", "Thanks and visit again", "success");
		}
	</script>
</body>
</html>