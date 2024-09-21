<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
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

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>
						
						<!-- STARTING OF FORM -->
						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Book Category</label> <select
									id="inputState" name="bookCategory" class="form-control">
									<%
									if ("New".equals(b.getBookCategory())) {
									%>
									<option value="New">New</option>
									<option value="Purana">old</option>
									<%
									} else {
									%>
									<option value="Purana">old</option>
									<option value="New">New</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
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