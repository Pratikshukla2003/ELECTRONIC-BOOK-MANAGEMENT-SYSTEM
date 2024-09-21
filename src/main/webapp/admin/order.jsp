<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page
	import="com.entity.* , com.DB.* , com.DAO.* , com.user.servlet.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ALL ORDERS</title>
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
		<c:redirect url="../login.jsp" />
	</c:if>

	<h1 class="text-center">Hello Admin</h1>

	<table class="table table-hover">
		<thead class="bg-success">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		<!-- CREATING FOR LOOP TO GET THE DETAILS OF BOOKS WHICH IS ORDRED -->
			<%
			User u = (User) session.getAttribute("userobj");
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<div class="f1">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>