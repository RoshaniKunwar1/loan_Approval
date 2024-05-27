<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<style type="text/css">
.back-img1 {
	background: url("image/loan.jpg");
	width: 100%;
	height: 75vh;
	opacity: 80%;
	background-repaeat: no-repeat;
	background-size: cover;
	margin-top: -48px;
}
</style>
<body>
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>
	<div class="container-fluid back-img1">
		<div class="container my-5 py-4 ">
		<div class="row">
			<div class="col-md-6 offset-3"> 
			<div class="card py-4 shadow" style="width: 100%;">
				<div class="card-title text-center">
					<h1>Login Form</h1>
				</div>
				<div class="card-body">

					<form method="post" action="loginServlet">
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label fs-5">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label fs-5">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="password">
						</div>
						<div class="d-grid gap-2 p-3">
							<button class="btn btn-success p-2 shadow-sm" type="submit">Submit</button>
						</div>

						<hr>
						<div class="text-center">
							<a href="Register.jsp" class="text-decoration-none"><b
								class="text-success fs-5">Create New Account</b></a>
						</div>
					</form>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>