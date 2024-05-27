<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Com.User.UserDetails, Com.Dao.UserDao, Com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<style type="text/css">
.bg-custom{
background: rgb(116,201,126);
background: linear-gradient(90deg, rgba(116,201,126,1) 5%, rgba(8,80,25,0.9663515064228817) 76%);
}
    .navbar .nav-item .nav-link {
	font-size: 20px;
     }
     
     .navbar .nav-item:hover .nav-link{
     background-color: white;
     color: green;
     border-radius: 5px;
     }
</style>
<%@ include file="allCSS.jsp"%>
</head>
<body>
	<div class="container-fluid bg-custom" style="height: 10px;"></div>
	<div class="container-fluid p-2 bg-light d-flex justify-content-evenly">
		    <img alt="" src="image/logo1.png" height="35px" >
		<b><i class="fa-solid fa-phone"></i> +977 9816600000</b> <b><i
			class="fa-solid fa-envelope text-success"></i> chola@125.com</b>
		<div class="pt-1 px-2">
			<a href="https://www.facebook.com" class="text-primary"><i
				class="fa-brands fa-square-facebook fa-2x"></i></a> <a
				href="https://www.whatsapp.com" class="text-success"><i
				class="fa-brands fa-square-whatsapp fa-2x"></i></a>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg bg-custom navbar-dark navbar-custom ">
		<div class="container-fluid py-1 px-3">
			<a class="navbar-brand" href="#"><i
				class="fa-solid fa-building-columns fa-2x"></i></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>

					
				
				
				
				
									
						<%
			    	UserDetails user = (UserDetails) session.getAttribute("userD");
				      if (user != null) {
				  %>
				  <li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LoanRegisteration.jsp"><i class="fa-solid fa-id-card"></i> Loan Registeration</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LoanCalculator.jsp"><i class="fa-solid fa-calculator"></i> Loan Calcutator</a></li>
        
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Approval1.jsp"><i class="fa-solid fa-thumbs-up"></i> Approval</a></li>

				</ul>
			 	<a href="" button class="btn btn-light mx-2" data-bs-toggle="modal"
					data-bs-target="#exampleModal" type="submit"> <i
					class="fa-solid fa-circle-user"></i> <%=user.getName()%></a> <a
					href="logoutServlet" class="btn btn-light mx-2"> <i
					class="fa-solid fa-right-to-bracket"></i> logout
				</a>


<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Profile: </h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="container text-center">
									<i class="fa fa-user fa-3x"></i>
									<hr>
									<table class="table">
										<tbody>
											<tr>
												<th>User Id:</th>
												<td><%=user.getId()%></td>
											</tr>
											<tr>
												<th>Full Name:</th>
												<td><%=user.getName()%></td>
											</tr>
											<tr>
												<th>Email Id:</th>
												<td><%=user.getEmail()%></td>
											</tr>
										</tbody>
									</table>
								</div>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>

		<%
				} else {
				%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="LoanCalculator.jsp"><i class="fa-solid fa-calculator"></i> Loan Calcutator</a></li>
        
				<div style="margin-left: 900px;">
				
				<a href="login.jsp" class="btn btn-outline-light mx-1 p-2"> <i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
					<a href="Register.jsp" class="btn btn-outline-light mx-1 p-2"> <i
					class="fa-solid fa-user-plus"></i> Register</a>
					</div>
				<%
				}
				%>
			</div>
		</div>
	</nav>
</body>
</html>