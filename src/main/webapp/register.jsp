<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book: Register</title>
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
					<div class="card-body">
						<h4 class="text-center">Registration</h4>
						<!-- SHOWING THE MESSAGE THAT REGISTRATION IS SUCCESSFULL OR NOT -->
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<c:if test="${not empty failedMsg }">
							<p class="text-center text-success">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<!-- REGISTRATION FORM -->
						<form action="register" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputName1">First Name</label> <input
									type="text" class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" name="firstName" required>
							</div>

							<div class="form-group">
								<label for="exampleInputName1">Last Name</label> <input
									type="text" class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" name="lastName" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required>
							</div>

							<div class="form-group">
								<label for="exampleInputPhno1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputPhno1"
									aria-describedby="emailHelp" name="phno" required>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Profile
									Photo</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Terms and
									Conditions</label>
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
						<!-- END OF REGISTRATION FORM -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>