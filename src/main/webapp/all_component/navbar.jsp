<!-- IT IS INCLUDE BECAUSE WE WANT TO USE JSTL TAGS -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f;"></div>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> E-books
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
		    method="post">
				<div class="border"
					style="background-color: white; border-radius: 15px;">
					<input style="width: 600px; border-radius: 15px 0px 0px 15px;"
						class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search for new and old books" aria-label="Search">

					<button
						style="border: none; background-color: white; padding-right: 15px">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</form>
		</div>
		<c:if test="${not empty userobj }">


			<div class="col-md-3 upnav">
				<a href="info.jsp" class="btn btn-light"> <i
					class="fa-regular fa-user"></i> ${userobj.firstName}
				</a><a href="cart.jsp" class="btn btn-outline-info ml-2"> <i
					class="fa-solid fa-cart-shopping fa"></i> Cart
				</a> <a href="logout" class="btn btn-outline-info ml-2"><i
					class="fa-solid fa-right-from-bracket"></i> Logout </a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">

			<div class="col-md-3">

				<a href="login.jsp" class="btn btn-outline-info"> <i
					class="fa-regular fa-user"></i> Login
				</a> <a href="register.jsp" class="btn btn-outline-info ml-3"> <i
					class="fa-regular fa-address-card"></i> Register
				</a>
			</div>

		</c:if>


	</div>
</div>
<!-- Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you want to logout</h4>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					<a href="../logout">
						<button type="button" class="btn btn-outline-danger">Log
							Out</button>
					</a>
			    </div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom bg-primary">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
					New Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>
					Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a> <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-3"
				type="submit"> <i class="fa-solid fa-square-phone"></i> Contact
				Us
			</a>
		</form>
	</div>
</nav>
