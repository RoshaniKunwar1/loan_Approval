<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
</head>
<style type="text/css">
.back-img2 {
	background: url("image/loan4.jpg");
	width: 100%;
	height: 110vh;
	opacity: 80%;
	background-repaeat: no-repeat;
	background-size: cover;
	 /* margin-top: 8px; */
}

.bg-custom {
	background: rgb(116, 201, 126);
	background: linear-gradient(90deg, rgba(116, 201, 126, 1) 5%,
		rgba(8, 80, 25, 0.9663515064228817) 76%);
}
</style>
<body>
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>
	<div class="container-fluid back-img2">
		<div class="container pt-5 pb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-2">
					<div class="card shadow">
						<div class="card-header bg-custom text-light text-center">
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h1 class="p-3">Register Form</h1>
						</div>
						<%-- 	<%
					String sucMsg = (String) session.getAttribute("sucessMsg");
					if (sucMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=sucMsg%>
					Login <a href="login.jsp">Click here</a>
					</div>
					<%
					session.removeAttribute("sucessMsg");
					}
					%>
					
					<%
					String failedMsg = (String)session.getAttribute("failedMsg");
					if(failedMsg != null){
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
					<%
					session.removeAttribute("failedMsg");
					}%> --%>

						<div class="card-body">
							<form method="post" action="registerServlet">
								<div class="mb-2 py-2">
									<label class="form-label fs-5">Full Name </label> <input
										type="text" class="form-control" name="uname">
								</div>
								<div class="mb-2 py-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email">
								</div>
								<div class="mb-2 py-2">
									<label for="validationCustom01" class="form-label fs-5">Phone
									</label> <input type="text" class="form-control"
										name="phone" required>
								</div>

								<div class="mb-2 py-2">
									<label for="exampleInputPassword1" class="form-label fs-5">Password</label>
									<input type="password" class="form-control"
										id="exampleInputPassword1" name="password">
								</div>

								<div class="mb-3 py-2 form-check">
									<input type="checkbox" class="form-check-input fs-5"
										id="exampleCheck1" name="check"> <label
										class="form-check-label fs-5" for="exampleCheck1">Agree
										Terms and Conditions</label>
								</div>

								<div class="d-grid p-3">
									<button class="btn btn-success p-2 fs-5" type="submit">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="allComponent/footer.jsp" %>

</body>
</html>