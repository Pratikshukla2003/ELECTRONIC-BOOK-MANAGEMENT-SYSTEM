<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@include file="all_component/allCss.jsp"%>
<!-- STARTING OF CSS -->
<style type="text/css">
body {
	background-color: #f0f1f2;
	font-family: "Roboto Condensed", sans-serif;
}
</style>
<!-- END OF CSS -->
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body" style="height: 500px;">
						<h4 class="text-center">Change Your Password</h4>

                         <!-- SHOWING THE MESSAGE THAT PASSWORD IS UPDATED OR NOT -->
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center heading5 text-success ">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<c:if test="${not empty succMsg}">
							<h5 class="text-center heading5  text-danger ">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="changePassword" method="post">
						
							<!-- USERID IS TAKEN FOR VALIDATION OF USER -->
							<input type="hidden" value="${userobj.id }" name="id">


							<div class="form-group mt-4">
								<label for="exampleInputPassword1">Old Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="oldPassword" placeholder=" Type your old password"
									required>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">New Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="newPassword" placeholder=" Type your new password"
									required>
							</div>
							
							<div class="text-center mt-4">
								<button type="submit" class="text-center btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>