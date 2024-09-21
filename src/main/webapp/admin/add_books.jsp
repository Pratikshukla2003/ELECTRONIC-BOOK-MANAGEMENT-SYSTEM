<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>

<!-- STARTING OF CSS -->
<style>
* {
	box-sizing: border-box;
}

html, body {
	margin: 0%;
	height: 100%;
	width: 100%;
}

.f1 {
	margin-top: 32vh;
}
</style>
<!-- END OF CSS -->

</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- CHECKING THE USER IS VALID OR NOT -->
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>

						<!-- SHOWING THE MESSAGE THAT BOOKS ARE SUCCESSFULLY ADDED OR NOT -->
						<div>
							<c:if test="${not empty succMsg}">
								<h5 class="text-center text-success">${succMsg}</h5>
								<c:remove var="succMsg" scope="session" />
							</c:if>
						</div>

						<div>
							<c:if test="${not empty failedMsg}">
								<h5 class="text-center text-danger">${failedMsg}</h5>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
						</div>

						<!-- STARTING OF FORM -->
						<form action="../add_books" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--Select--</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
						<!-- END OF FORM -->
						 
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="f1">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>