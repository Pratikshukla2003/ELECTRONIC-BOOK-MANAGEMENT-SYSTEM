<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
body {
	background-color: #f0f1f2;
	font-family: "Roboto Condensed", sans-serif;
}

div img {
	height: 200px;
	width: 150px;
}
</style>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row bg-white">

			<div class="col-md-6 text-center p-5 border">
				<img alt="" src="book/<%=b.getPhotoName()%>">
				<h4 class="mt-4">
					Book Name: <span class="text-success"> <%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>


			<div class="col-md-6 text-center p-5 border">
				<h2>
					<%=b.getBookName()%>
				</h2>

				<%
				if ("old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email :
					<%=b.getEmail()%></h5>
				<%
				}
				%>

				<div class="row mt-3">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Delivery</p>
					</div>

				</div>

				<%
				if ("old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"> <i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping
					</a> <a href="" class="btn btn-danger"> <i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
					</a>
				</div>

				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"> <i
						class="fa-solid fa-cart-shopping"></i> Add To Cart
					</a> <a href="" class="btn btn-danger"> <i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
					</a>

				</div>

				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>