<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.* , com.DB.* , com.DAO.* , java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Book</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<!-- END OF CSS -->
</head>
<body>
	<!-- USED FOR CHECKING VALID USER -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<!-- FOR CHECKING THAT CART PAGE IS EMPTY OR NOT  -->
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>
		<!-- FOR SHOWING POP UP TO OF ADD CART -->
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
        </script>
		<!-- FOR REMOVE THAT POP UP -->
		<c:remove var="addCart" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<!-- CREATING FOR LOOP TO GET NEW ADDED BOOKS FROM DATABASE -->
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBooks();
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
	</div>
</body>
</html>