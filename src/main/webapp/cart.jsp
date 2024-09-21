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
<title>CART PAGE</title>
<%@include file="all_component/allCss.jsp"%>
<!-- STARTING OF CSS -->
<style>
body {
	background-color: #f7f7f7;
	font-family: "Roboto Condensed", sans-serif;
}

.succMsg {
	color: black;
	font-weight: bolder;
}
</style>
<!-- END OF CSS -->
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center succMsg" role="alert">
			${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-success text-center succMsg" role="alert">
			${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<!-- CHECKING THE USER IS VALID OR NOT -->
	<c:if test="${ empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<!-- LISTING THE BOOKS WHICH USER WANT TO BUY -->
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByuser(u.getId());
								Double totalPrice = 0.00;
								/* CREATING FOR LOOP FOR TAKING CART ITEMS */
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger"> Remove </a></td>
								</tr>
								<%
								}
								%>
								<!-- END OF FOR LOOP -->
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>

					</div>

				</div>
			</div>
			<!-- CREATING THE FORM FOR DITAILS -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4"
										value="${userobj.firstName }" name="username" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="${userobj.email }" name="email" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4"
										value="${userobj.phno }" name="phone" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value=""
										name="address" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="landmark"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value=" " name="city"
										required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="state"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PinCode</label> <input type="text"
										class="form-control" id="inputPassword4" value=" "
										name="pincode" required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment</label> <select class="form-control"
									name="payment">
									<option value="noselect">-- Select --</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success"> Continue
									Shopping</a>
							</div>

						</form>
						<!-- END OF FORM -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>