<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<!-- CHECKING THE USER IS VALID OR NOT -->
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h1 class="text-center">Hello Admin</h1>
	
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

	<table class="table table-hover">
		<thead class="bg-success">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<!-- CREATING FOR LOOP TO GET ALL BOOKS PRESENT IN DATABASE -->
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllBooks();
			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"> <i
						class="fa-regular fa-pen-to-square"></i> Edit
				</a> <a href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"> <i class="fa-solid fa-trash"></i>
						Delete
				</a></td>
			</tr>
			<%
			}
			%>
			<!-- END OF LOOP -->
		</tbody>
	</table>
	<div class="f1">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>