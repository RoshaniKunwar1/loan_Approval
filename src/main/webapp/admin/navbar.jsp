<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<style type="text/css">
.bg-compose {
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
	<div class="container-fluid bg-compose" style="height: 10px;"></div>
	<div class="container-fluid p-2 bg-light d-flex justify-content-evenly">
	
		 <img alt="" src="../image/logo1.png" height="30px">
		 
				<b><i class="fa-solid fa-phone"></i> +977 9816600000</b> <b><i
			class="fa-solid fa-envelope text-success"></i> chola@125.com</b>
		<div class="pt-1 px-2	`">
			<a href="https://www.facebook.com" class="text-primary"><i
				class="fa-brands fa-square-facebook fa-2x"></i></a> <a
				href="https://www.whatsapp.com" class="text-success"><i
				class="fa-brands fa-square-whatsapp fa-2x"></i></a>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg bg-compose navbar-dark navbar-custom ">
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

			</div>
		</div>
	</nav>

</body>
</html>