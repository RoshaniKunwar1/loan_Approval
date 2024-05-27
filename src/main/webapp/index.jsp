<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<style type="text/css">
.back-img{
	background: url("image/loan3.jpg");
	width: 100%;
	height: 74vh;
	background-size: cover;
	background-repeat: no-repeat;
	opacity: 85%;
}
	
</style>
</head>
<body>
<%@ include file="allComponent/allCSS.jsp" %>
<%@ include file="allComponent/navbar.jsp" %>
<div class="container-fluid back-img">
	<div class="text-center p-5">
	<h1 class="text-light p-4 mt-5 fs-1">Loan Amortization</h1>
	<a href="login.jsp" class="btn btn-primary"><b class="text-light fs-4"> <i
					class="fa-solid fa-right-to-bracket"></i> Login</b></a>
	<a href="register.jsp" class="btn btn-danger mx-2"><b class="text-light fs-4"> <i
					class="fa-solid fa-user-plus"></i> Register</b></a>
	</div>
</div>

<%@ include file="allComponent/footer.jsp" %>
</body>
</html>