<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Warning! You are deactivating your account</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body" style="height: 500px;">
						<h4 class="text-center text-danger">! Deactivate Your Account</h4>

						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form action="deactivateAccount" method="post">
						
							<input type="hidden" value="${userobj.id }" name="id">
							
							
							<div class="form-group">
								<input type="hidden" class="form-control"
									id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp" placeholder=" Type your username"
									value="${userobj.email}">
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder=" Type your password" required>
							</div>
							
							
							<div class="text-center mt-4">
								<button type="submit" class="text-center btn btn-danger">Deactivate</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>