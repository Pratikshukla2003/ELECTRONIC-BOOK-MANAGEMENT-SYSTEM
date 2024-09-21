<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
body {
	background-color: #f7f7f7;
	font-family: "Roboto Condensed", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">

		<h3 class="text-center">Hello, ${userobj.firstName}</h3>


		<div class="row p-5">
			<div class="col-md-6">

				<div class="card">

					<div class="card-body text-center">
						<div class="text-primary">
							<a href="sell_book.jsp"><i
								class="fa-solid fa-book-open fa-3x"></i></a>
						</div>
						<h3>Sell Old Book</h3>
					</div>

				</div>

			</div>
			
			<div class="col-md-6">

				<div class="card">
					<div class="card-body text-center">
						<div class="text-primary">
							<a href="edit_profile.jsp"><i
								class="fa-solid fa-pen-nib fa-3x"></i></a>
						</div>
						<h3>Edit Profile</h3>
					</div>
				</div>

			</div>

			<div class="col-md-4 mt-3">

				<div class="card">
					<div class="card-body text-center">
						<div class="text-primary">
							<a href="order.jsp"><i
								class="fa-solid fa-box-archive fa-3x text-danger"></i></a>
						</div>
						<h3>My Order</h3>
						<p>Track you order</p>
					</div>
				</div>

			</div>

			<div class="col-md-4 mt-3">

				<div class="card">
					<div class="card-body text-center">
						<div class="text-primary">
							<a href="DeactivateAccount.jsp"><i
								class="fa-solid fa-person-circle-exclamation fa-3x text-danger"></i></a>
						</div>
						<h3>Deactivate Account</h3>
						<p>If You Want</p>
					</div>
				</div>

			</div>

			<div class="col-md-4 mt-3">

				<div class="card">
					<div class="card-body text-center ">
						<div class="text-primary">
							<a href="change_password.jsp"> <i
								class="fa-solid fa-3x fa-user-lock"></i></a>
						</div>
						<h3>Change Password</h3>
						<p>Secure Yourself</p>
					</div>
				</div>

			</div>

		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>