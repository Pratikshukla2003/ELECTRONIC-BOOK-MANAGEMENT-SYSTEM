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
<title>Order Copy</title>
<%@include file="all_component/allCss.jsp"%>

<!-- STARTING OF CSS -->
<style>
body {
	background-color: #f7f7f7;
	font-family: "Roboto Condensed", sans-serif;
}

.container1 {
	display: flex;
	justify-content: center;
	margin: 2rem;
}

.c2 {
	margin-top: 2rem;
	color: magenta;
}
</style>
<!-- END OF CSS -->
</head>
<body>

	<c:if test="${ empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="text-center c2">
		<h2>Your Order</h2>
	</div>
	<div class="container1">

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<!-- CREATING FOR LOOP FOR GETTING ORDERS COMPLETED BY USER -->
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
				<!-- END OF LOOP -->
			</tbody>

		</table>

	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>