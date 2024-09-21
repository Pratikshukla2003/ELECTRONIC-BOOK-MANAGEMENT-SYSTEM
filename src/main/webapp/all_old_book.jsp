<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>

<!-- STARTING OF CSS -->
<style>
body {
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
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
		
			<!-- CREATING FOR LOOP TO GET OLD ADDED BOOKS FROM DATABASE -->
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllOldBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-5">
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
	</div>
</body>
</html>