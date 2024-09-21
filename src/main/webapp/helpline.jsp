<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CONTACT US</title>
<%@include file="all_component/allCss.jsp"%>

<style>
body{
background-color: #f7f7f7;
font-family: "Roboto Condensed", sans-serif;
}
.cont {
	display: flex;
	justify-content: center;
	margin: 2rem;
	flex-direction: column;
	align-items: center;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container text-center">
		<div class="text-success">
			<i class="fa-solid fa-phone fa-3x"></i>
		</div>
		<br>
		<h3>24*7 Service</h3>
		<br>
		<h3>Help Line Number</h3>
		<br>
		<h3>012 88584584</h3><br>
		<a href="index.jsp" class="btn btn-primary">Home</a>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>