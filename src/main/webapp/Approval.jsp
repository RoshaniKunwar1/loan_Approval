<%@page import="Com.User.loanList, Com.User.loan"%>
<%@page import="Com.Dao.loanListDao, Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.back-img {
	background: url("image/loan3.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
h1 {
	--s: 0.1em; /* the thickness of the line */
	--c: #2c4bff; /* the color */
	color: #0000;
	padding-bottom: var(--s);
	background: linear-gradient(90deg, var(--c) 50%, #000 0)
		calc(100% - var(--_p, 0%))/200% 100%, linear-gradient(var(--c) 0 0) 0%
		100%/var(--_p, 0%) var(--s) no-repeat;
	-webkit-background-clip: text, padding-box;
	background-clip: text, padding-box;
	transition: 0.5s;
}

h1:hover {
	--_p: 100%
}

h1 {
	font-family: system-ui, sans-serif;
	font-size: 5rem;
	cursor: pointer;
}

.container {
	width: 1200px !important;
	padding: 10px !important;
	margin-right: auto;
	margin-left: auto;
	@media
	screen
	and
	(min-width:
	992px)
	and
	(max-width:
	1439px)
{
	max-width
	:
	 
	1279px
	 
	!
	important
	;
	
    
	padding
	:
	 
	0
	 
	!
	important
	;
	
    
	margin
	:
	 
	0
	 
	80px
	 
	!
	important
	;
	
    
	width
	:
	 
	auto
	 
	!
	important
	;
	
  
}

@media screen and (max-width: 991px) {
	max-width
	:
	 
	959px
	 
	!
	important
	;
	
    
	margin
	:
	 
	0
	 
	16px
	 
	!
	important
	;
	
    
	padding
	:
	 
	0
	 
	!
	important
	;
	
    
	width
	:
	 
	auto
	 
	!
	important
	;
	
  
}

}
.gradient-cards {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 32px;
	padding: 30px;
	@media
	screen
	and
	(max-width:
	991px)
{
	grid-template-columns
	:
	 
	1fr
	;
	
  
}

}
.container-title {
	text-align: center;
	padding: 0 !important;
	margin-bottom: 40px;
	font-size: 40px;
	color: #002379;
	font-weight: 600;
	line-height: 60px;
}

.card {
	max-width: 550px;
	border: 1px white;
	width: 100%;
	margin-inline: auto;
}

.container-card {
	position: relative;
	border: 0px solid white;
	background: #FFFAE6;
	background-clip: padding-box;
	border-radius: 45px;
	padding: 40px;
	img
	{
	margin-bottom
	:
	32px;
}

}
.bg-green-box, .bg-white-box, .bg-yellow-box, .bg-blue-box {
	position: relative;
}

.bg-green-box::after, .bg-white-box::after, .bg-yellow-box::after,
	.bg-blue-box::after {
	position: absolute;
	top: -1px;
	bottom: -1px;
	left: -1px;
	right: -1px;
	content: "";
	z-index: -1;
	border-radius: 45px;
}

.bg-green-box::after {
	background: linear-gradient(71deg, #0d1212, #3da077, #0d1212);
}

.bg-white-box::after {
	background: linear-gradient(71deg, #121013, #b0afb0, #121013);
}

.bg-yellow-box::after {
	background: linear-gradient(71deg, #110e0e, #afa220, #110e0e);
}

.bg-blue-box::after {
	background: linear-gradient(71deg, #0c0a0e, #5f6fad, #0c0a0e);
}

.card-title {
	font-weight: 600;
	color: #002379;
	letter-spacing: -0.02em;
	line-height: 40px;
	font-style: normal;
	font-size: 28px;
	padding-bottom: 8px;
}

.card-description {
	font-weight: 600;
	line-height: 20px;
	color: #FF5F00;
	font-size: 16px;
	max-width: 470px;
}
</style>
<title>Home page</title>
</head>
<body class="back-img">
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>

	<div class="container">
		<h1 class="container-title">
			Loan Approval:
			<h1>

				<div class="gradient-cards">
					<div class="card me-3">
						<div class="container-card bg-green-box">
							<svg width="80" height="80" viewBox="0 0 120 120" fill="none"
								xmlns="http://www.w3.org/2000/svg">
          <rect x="1" y="1" width="118" height="118" rx="24"
									fill="url(#paint0_linear_1366_4547)" fill-opacity="0.15"
									stroke="url(#paint1_radial_1366_4547)" stroke-width="2"></rect>
          <path
									d="M33.2182 61.4C33.2182 75.425 37.2682 86.75 51.5932 86.75C65.9182 86.75 69.8182 75.425 69.8182 61.4C69.8182 47.225 65.9182 35.9 51.5932 35.9C37.2682 35.9 33.2182 47.225 33.2182 61.4ZM43.7182 61.4C43.7182 53.075 45.5932 46.1 51.5932 46.1C57.5182 46.1 59.3182 53.075 59.3182 61.4C59.3182 69.65 57.5182 76.55 51.5932 76.55C45.5932 76.55 43.7182 69.65 43.7182 61.4Z"
									fill="#54E8A9"></path>
          <path
									d="M87.7143 36.35L78.0543 56H80.1243L89.7843 36.35H87.7143ZM74.6943 40.16C74.6943 42.44 76.4043 44.15 78.6843 44.15C80.9343 44.15 82.7043 42.44 82.7043 40.16C82.7043 37.91 80.9343 36.14 78.6843 36.14C76.4043 36.14 74.6943 37.91 74.6943 40.16ZM77.1243 40.16C77.1243 39.29 77.7543 38.57 78.6843 38.57C79.5543 38.57 80.2743 39.29 80.2743 40.16C80.2743 41.09 79.5543 41.72 78.6843 41.72C77.7543 41.72 77.1243 41.09 77.1243 40.16ZM85.3143 52.31C85.3143 54.59 87.0243 56.3 89.3043 56.3C91.5543 56.3 93.3243 54.59 93.3243 52.31C93.3243 50.06 91.5543 48.29 89.3043 48.29C87.0243 48.29 85.3143 50.06 85.3143 52.31ZM87.7443 52.31C87.7443 51.44 88.3743 50.72 89.3043 50.72C90.1743 50.72 90.8943 51.44 90.8943 52.31C90.8943 53.24 90.1743 53.87 89.3043 53.87C88.3743 53.87 87.7443 53.24 87.7443 52.31Z"
									fill="#2FCB89"></path>
          <defs>
            <linearGradient id="paint0_linear_1366_4547" x1="0.0063367"
									y1="0.168432" x2="120.853" y2="119.009"
									gradientUnits="userSpaceOnUse">
              <stop stop-color="#2FCB89" stop-opacity="0.7"></stop>
              <stop offset="0.489583" stop-color="#2FCB89"
									stop-opacity="0"></stop>
              <stop offset="1" stop-color="#2FCB89" stop-opacity="0.7"></stop>
            </linearGradient>
            <radialGradient id="paint1_radial_1366_4547" cx="0" cy="0"
									r="1" gradientUnits="userSpaceOnUse"
									gradientTransform="translate(60 60) rotate(96.8574) scale(122.674 149.921)">
              <stop stop-color="#54E8A9"></stop>
              <stop offset="1" stop-color="#1A3E31" stop-opacity="0.2"></stop>
            </radialGradient>
          </defs>
        </svg>
							<p class="card-title">Loan Approval</p>
							<p class="card-description">
                               <div class="table-responsive">
		                           	<table class="table table-striped">
				                    	<tr>
                        
								<%
                            UserDetails user1 = (UserDetails) session.getAttribute("userD");
	                         if (user1 != null) {
          
		                     loanDao dao2 = new loanDao(DBConnect.getConn());
	                     	ArrayList<loan> cal = (ArrayList) dao2.getDataUser(user1.getId());
		
		
		                 for(int i=0; i<cal.size(); i++){
		                   loan cal1 = (loan)cal.get(i);
	              	  if (cal1 != null && cal1.getApproval() != null) {
		  
		                  System.out.println(cal1);  %>
		  
		  <td>ID: <%=cal1.getId() %></td>
		  
		<% if(cal1.getApproval().equals("checked")){ %>
							<p class="card-description">Your Loan has been Checked by
								Loan Manager.</p>

		<% }if(cal1.getApproval().equals("forApproval")){ %>
							<p class="card-description">Your Loan has been placed for Approval
								Loan Manager.</p>

		<%  }if(cal1.getApproval().equals("forApproval")){ %> 
							<p class="card-description">Your Loan approval has been rejected by
								Loan Manager.</p>	
		
	    <%  }if(cal1.getApproval().equals("approved")){  %>
                            <p class="card-description">Your Loan has been approved.
								Please visit nearest Branch.</p>              
							<%}}}}%>


							</p>
						</div>
					</div>
   <%--  <% 
    for(int j=0; j<cal.size(); j++){
		  loanList cal2 = (loanList)cal.get(j);
		  System.out.println(cal2);
    
               if(cal2.getApproval().equals("approved")){
            	   loanDao dao3= new loanDao(DBConnect.getConn());
            	   loan ln = dao3.getDataById(cal2.getId());
            	   
            	   
            	   
            	   %> --%>

				</div>
			</h1>
		</h1>
	</div>


	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>