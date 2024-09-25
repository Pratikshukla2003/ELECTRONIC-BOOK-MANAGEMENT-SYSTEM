<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@include file="all_component/allCss.jsp"%>

<!-- STARTING OF CSS -->
<style type="text/css">
body {
	background-color: #f0f1f2;
	font-family: "Roboto Condensed", sans-serif;
}
</style>
<!-- END OF CSS -->

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body" style="height: 500px;">
						<h4 class="text-center">Login</h4>

						<!-- SHOWING MESSAGE THAT USER IS VALID OR NOT -->
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<!-- STARTING OF LOGIN FORM -->
						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp"
									placeholder=" Type your username" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder=" Type your password" required>
							</div>
										
							<div class="text-center mt-4">
								<button type="submit" class="text-center btn btn-primary">Submit</button>
							</div>
							<div class="text-center mt-5">
								<a href="register.jsp" style="decoration: none">OR REGISTER</a>
							</div>
						</form>
						<!-- END OF LOGIN FORM -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
