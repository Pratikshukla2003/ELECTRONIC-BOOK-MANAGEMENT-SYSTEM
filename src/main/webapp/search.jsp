<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Book</title>
<%@include file="all_component/allCss.jsp"%>
<!-- STARTING OF CSS -->
<style>
body{
font-family: "Roboto Condensed", sans-serif;
}
.row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
	align-items: center;
	justify-content: center;
}
</style>
<!-- END OF CSS -->
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-5">
					<div class="card-body text-center">
						<a href="Book/1984.pdf"><img alt=""
							src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail"></a>
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
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
						} else {
						%>

						Category:
						<%=b.getBookCategory()%>
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

						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>
			
		</div>
	</div>
</body>
</html>