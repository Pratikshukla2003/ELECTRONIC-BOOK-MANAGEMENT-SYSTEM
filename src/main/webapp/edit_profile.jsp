<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>

<style>
body{
background-color: #f7f7f7;
font-family: "Roboto Condensed", sans-serif;
}
.button1 {
	color: white;
	font-weight: bolder;
	padding: 1rem;
	height: 20%;
	width: 100%;
	background-color: blue;
	border: none;
}
.input {
	padding: 0.5rem;
	width: 100%;
	height: 20%;
}
</style>
</head>
<body style="">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h3 class="text-center">Edit Profile</h3>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center heading5 text-danger ">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center heading5 text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="update" method="post">

							<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-group">
								<label for="exampleInputFullName1">First Name </label> <br>
								<input type="text" name="firstName" class="in input"
									value="${userobj.firstName }"><br>
							</div>
							
							<div class="form-group">
								<label for="exampleInputFullName1">Last Name </label> <br>
								<input type="text" name="lastName" class="in input"
									value="${userobj.lastName }"><br>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"> Email </label> <br> <input
									type="email" name="email" class="in input"
									value="${userobj.email}"><br>
							</div>

							<div class="form-group">
								<label for="exampleInputPhoneNumber1"> Phone Number </label> <br>
								<input type="text" name="phone-number" class="in input"
									value="${userobj.phno }"><br>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1"> Password </label> <br>
								<input type="password" name="password" class="in input"><br>
							</div>
							<div class="text-center"><button type="submit" class="btn btn-primary">Update</button></div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>