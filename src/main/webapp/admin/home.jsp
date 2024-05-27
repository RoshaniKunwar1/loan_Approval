<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Com.User.UserDetails "%>
<%-- <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   --%>

<%
UserDetails user2 = (UserDetails) session.getAttribute("userobj");

if (user2 == null) {
	response.sendRedirect("../login.jsp");
	session.setAttribute("Login-error", "Please Login.....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
  outline: none;
}

/*****************
    - Header -
*****************/
.back-img2 {
	background: url("../image/loan2.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
header {
	position:relative;
	left:0;
	top:0;
	width:100%;
	min-height:120px;
	padding:50px 0;
	color:#fff;
	    background: #383838 url(https://www.athenadesignstudio.com/plugins/switch/images/bg.jpg) no-repeat center center;
	margin-bottom:30px
}

/* Logo */
header .logo {
	clear:both;
    display:block;
	text-align:center;
    padding-bottom:10px;
}

/* Title */
header h1 {
    font-weight:300;
    font-size:24px;
    color:#eee;	
	letter-spacing:2px;
	text-align:center;
	text-transform:uppercase;
	margin:0 !important;
	padding-bottom:25px;
}
@charset "utf-8";
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900|Open Sans:400,600,800');
h1,
h2,
h3,
h4,
h5,
h6,
div,
input,
p,
a {
    font-family: "Open Sans";
    margin: 0px;
}

a,
a:hover,
a:focus {
    color: inherit;
}

body {
    background-color: #F1F2F3;
}

.container-fluid,
.container {
    max-width: 1200px;
}

.card-container {
    padding: 100px 0px;
    -webkit-perspective: 1000;
    perspective: 1000;
}

.profile-card-4 {
    max-width: 300px;
    background-color: #FFF;
    border-radius: 5px;
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    position: relative;
    margin: 10px auto;
    cursor: pointer;
}

.profile-card-4 img {
    transition: all 0.25s linear;
}

.profile-card-4 .profile-content {
    position: relative;
    padding: 15px;
    background-color: #FFF;
}

.profile-card-4 .profile-name {
    font-weight: bold;
    position: absolute;
    left: 0px;
    right: 0px;
    top: -70px;
    color: #FFF;
    font-size: 17px;
}

.profile-card-4 .profile-name p {
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1.5px;
}

.profile-card-4 .profile-description {
    color: #777;
    font-size: 12px;
    padding: 10px;
}

.profile-card-4 .profile-overview {
    padding: 15px 0px;
}

.profile-card-4 .profile-overview p {
    font-size: 10px;
    font-weight: 600;
    color: #777;
}

.profile-card-4 .profile-overview h4 {
    color: #273751;
    font-weight: bold;
}

.profile-card-4 .profile-content::before {
    content: "";
    position: absolute;
    height: 20px;
    top: -10px;
    left: 0px;
    right: 0px;
    background-color: #FFF;
    z-index: 0;
    transform: skewY(3deg);
}

.profile-card-4:hover img {
    transform: rotate(5deg) scale(1.1, 1.1);
    filter: brightness(110%);
}
body {
  margin: 0;
  font-family: Sans-serif;
  overflow: hidden;
}
.dashboard {
  height: 100vh;
  display: flex;
}
.left {
  height: 100%;
  display: flex;
}

.navigation {
  width: 270px;
  /* */
  border-right: 1px solid #bada55;
}
.abilan > img {
  width: 120px;
  margin-bottom: 30px;
}

.wrapper2 {
  padding: 0 25px;
  height: 100%;
  overflow: auto;
}

.compose {
  width: 150px;
  text-align: center;
  height: 50px;
  border-radius: 13px;
  border: 1px solid;
  background-image: background: rgb(116,201,126);
  background: linear-gradient(90deg, rgba(116,201,126,1) 5%, rgba(8,80,25,0.9663515064228817) 76%);;
  color: white;
  font-size: 16px;
  padding-left: 20px;
  position: relative;
}

.folder-icons {
  margin-top: 20px;
  display: flex;
  align-items: center;
}

.icon-name1 {
  margin-left: 10px;
  color: #8b47a9;
  text-decoration: underline;
  font-size: 18px;
}

.icon-name {
  margin-left: 10px;
  color: grey;
}
.names {
  margin-left: 10px;
  font-weight: bold;
  font-size: 15px;
}

.avatar > img {
  width: 35px;
  border-radius: 10px;
}
.section1 {
  margin-top: 25px;
  margin-bottom: 10px;
}

.btn {
  border-radius: 3px;
  border: 1px;
  padding: 0 10px 0 30px;
  height: 30px;
  font-weight: bold;
  position: relative;
}

.buton1 {
  background-color: #f8f1ff;
  color: #a84bfe;
}

.tag {
  position: absolute;
  left: 8px;
  top: 10px;
}
.plus > img {
  width: 16px;
  height: 16px;
}
.plus {
  left: 10px;
  position: absolute;
}
.buton-span {
  border-radius: 15px;
  padding: 5px 10px;
  border: 1px;
  color: white;
  background-color: #fe365c;
  box-shadow: 0px 0px 10px 2px #f7bfc9;
  margin-left: 70px;
}
.online {
  position: absolute;
  top: -5px;
  right: -5px;
  border: 4px solid #fbfcf8;
  box-sizing: unset;
  background-color: #02c997;
  width: 10px;
  height: 10px;
  border-radius: 50%;
}
.avatar {
  position: relative;
}


.big-inbox {
  font-size: 25px;
  font-weight: 500;
}
.right-side {
  background-color: #f2f3f7;
  display: flex;
  flex-direction: column;
}

.top-bar {
  display: flex;
  align-items: center;
  text-align: center;
}
.top-bar-justify {
  display: flex;
  justify-content: space-between;
  width: 100%;
}
.card {
  background-color: white;
  border-radius: 4px;
  margin-top: 8px;
  margin-bottom: 5px;
  padding: 25px 25px 15px 25px;
  transition: 0.3s;
}
.card:hover {
  box-shadow: 5px 1px 20px 1px #ddd;
  transform: scale(0.96);
}



</style>
</head>
<body>
<%@include file="../allComponent/allCSS.jsp" %>
<div class="dashboard">
  <div class="left">
    <div class="navigation">
      <div class="wrapper2">
        <div class="abilan">
          <img src="../image/logo2.jpg" />
        </div>
       
        <div class="folders">.</div>
        <div class="folder-icons">
          <div class="icon1">
            <img src="https://i.ibb.co/qdgf3TJ/envelope.png" />
          </div>
          <div class="icon-name1">Registration Table
          </div>
        </div>
        <div class="folder-icons">
          <div class="folder-icon">
            <img src="https://i.ibb.co/2yLfX9W/sent-mail.png" />
          </div>
          <a href="loanList.jsp"><div class="icon-name1" >Registration Form</div></a>
        </div>
        <div class="folder-icons">
          <div class="icon1">
            <img src="https://i.ibb.co/6ZH9kK3/star.png" />
          </div>
          <a href="LoanCalculator.jsp"><div class="icon-name1">LoanCalculator</div></a>
        </div>
        <div class="folder-icons">
          <div class="icon1">
            <img src="https://i.ibb.co/z4QhcbD/email.png" />
          </div>
          <a href="CustomerTable.jsp"><div class="icon-name1">Customer Table</div></a>
        </div>
        
        <div class="my-5">.</div>
        <div class="mt-5">
        <a href="../logoutServlet">
       <button class="compose">Logout 
         <span class="plus">
            <img src="https://i.ibb.co/v1HxGWj/add-1.png"/></span></button></a></div>
      </div>
    </div>
  </div>
  
  
  
  
  
  <div class="right-side back-img2">
   
      <%@include file="navbar.jsp" %>
      

      <hr class="hr">
     

    <div class="container mt-5">
		<div class="row py-5">
			<div class="col-md-3 col-sm-6 py-5">
		    <div class="card text-center">
                <a href="loanList.jsp" class="text-decoration-none">
                    
                        <div class="card-body text-center py-4">
                            <i class="fa-solid fa-square-plus fa-4x text-primary"></i> <br>
                            <h4>Registration Table</h4>
                            --------------
                        </div>
                 
                </a>
            </div>
    </div>
    
    
    <div class="col-md-3 col-sm-6 py-5">
		    <div class="card text-center">
                <a href="loanList.jsp" class="text-decoration-none">
                    
                        <div class="card-body text-center p-4">
						<i class="fa-solid fa-calculator fa-4x text-danger"></i><br>
						<!-- <h4>All Books</h4> -->
						<h4>
							<a href="LoanCalculator.jsp" class="text-decoration-none">Loan Calculator</a>
						</h4>
						---------------
					</div>
                 
                </a>
            </div>
    </div>
    
    
		<div class="col-md-3 col-sm-6 py-5">
		    <div class="card text-center">
                <a href="CustomerTable.jsp" class="text-decoration-none">
                    
                     <div class="card-body text-center p-4">
                     
							<i class="fa-solid fa-table-list fa-4x text-warning"></i> <br>
							<h4>Customer Table</h4>
							------------------
						</div>
                       
                 
                </a>
            </div>
    </div>
		
		<div class="col-md-3 col-sm-6 py-5">
		    <div class="card text-center">
                <a href="../logoutServlet" class="text-decoration-none">
                    
                        <div class="card-body text-center p-4">
                                 <i class="fa-solid fa-right-to-bracket fa-4x text-primary"></i>
                                            <br>
                            <h4>Logout</h4>
                            --------------
                        </div>
                 
                </a>
            </div>
    </div>
		
    
</div>
	</div>
	<div class="margin-auto py-5">
	    <%@ include file="footer.jsp" %>   
	    </div>
</div> 
</div>

</body>
</html>