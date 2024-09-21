<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-book : Index</title>
<%@include file="all_component/allCss.jsp"%>
<!--STARTING OF CSS -->
<style type="text/css">
body {
	background-color: #f7f7f7;
	font-family: "Roboto Condensed", sans-serif;
}
.back-img {
	background: url("img/background.png");
	height: 102vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
.main {
	color: black;
	weight: bolder;
}
.crd-ho:hover {
	background-color: #fcf7f7;
}
.row {
	display: flex;
	align-items: center;
	justify-content: center;
}
.btn-group-sm>.btn, .btn-sm {
	padding: 0.25rem 0.5rem;
	font-size: .875rem;
	line-height: 1.5;
	border-radius: 0.2rem;
	margin-top: 10px;
}
</style>
<!-- END OF CSS -->
</head>

<!-- BODY OF HOME PAGE -->
<body>
	<%@include file="all_component/navbar.jsp"%>
	<!-- USED FOR CHECKING VALID USER -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<!-- IMAGE ON HOME PAGE -->
	<div class="container-fluid back-img">
		<h2 class="text-center main">E-BOOK LIBRARY</h2>
	</div>

	<!-- START OF RECENT BOOKS -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<!-- CREATING FOR LOOP TO GET RECENT ADDED BOOKS FROM DATABASE -->
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<a href="Book/1984.pdf"><img alt=""
							src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail"></a>
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<!-- WHEN CATEGORY IS OLD -->
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Category:
							<%=b.getBookCategory()%>
						</p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						/*  WHEN CATEGORY IS NEW  */
						} else {
						%>
						Category:
						<%=b.getBookCategory()%>
						</p>
						<div class="row">
							<!-- CHECKING VALID USER OR NOT IF IT IS THEN GIVE ACCESS TO USER HOME PAGE -->
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add To Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add To Cart
							</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
						<!-- END OF CHECKING -->
					</div>
				</div>
			</div>
			<%
			}
			%>
			<!-- END OF LOOP -->
		</div>
		<!-- FOR EXPLORING RECENT PAGE -->
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm ">View
				All</a>
		</div>
	</div>
	<!-- END OF RECENT BOOKS -->
	<hr>
	<!-- START OF NEW BOOKS -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<!-- CREATING FOR LOOP TO GET NEW ADDED BOOKS FROM DATABASE -->
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%>
						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add To Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fa-solid fa-cart-shopping"></i> Add To Cart
							</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<!-- END OF LOOP -->
		</div>
		<!-- FOR EXPLORING NEW BOOKS PAGE -->
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm ">View
				All</a>
		</div>
	</div>
	<!-- END OF NEW BOOKS-->
	<hr>
	<!-- START OF OLD BOOKS -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<!-- CREATING FOR LOOP TO GET OLD ADDED BOOKS FROM DATABASE -->
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<a href="Book/1984.pdf"><img alt=""
							src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail"></a>
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<!-- END OF LOOP -->
		</div>
		<!-- FOR EXPLORING OLD BOOK PAGE -->
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm ">View
				All</a>
		</div>
	</div>
	<!-- END OF OLD BOOKS -->
	<%@include file="all_component/footer.jsp"%>
</body>
</html>