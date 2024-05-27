<%@page import="Com.User.loanList, Com.User.loan, Com.User.UserDetails"%>
<%@page import="Com.Dao.loanListDao, Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect, java.util.*,Com.Dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
UserDetails user1 = (UserDetails) session.getAttribute("userD");


if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login.....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.back-img2 {
	background: url("image/loan4.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
h2 {
	font-size: 26px;
	margin: 20px 0;
	text-align: center;
	small
	{
	font-size
	:
	0.5em;
}

}
.responsive-table {li { border-radius:3px;
	padding: 25px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}

.table-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
}

.col-1 {
	flex-basis: 20%;
}

.col-2 {
	flex-basis: 40%;
}

.col-3 {
	flex-basis: 30%;
}


@media all and (max-width: 767px) {
	.table-header {
		display: none;
	}
	.table-row {
		
	}
	li {
		display: block;
	}
	.col {
		flex-basis: 100%;
	}
	.col {
		display: flex;
		padding: 10px 0; &: before { color : #6C7A88;
		padding-right: 10px;
		content: attr(data-label);
		flex-basis: 50%;
		text-align: right;
	}
}

}
}
section.card {
	background: #f6f6f6;
	border-radius: 24px 24px 24px 48px;
	padding: 48px 48px 48px 48px;
	margin: 84px 0;
	width: 60vw;
	max-width: 920px;
	min-width: 640px;
	display: flex;
	flex-direction: row;
	align-self: flex-start;
	position: relative;
	box-shadow: 5px 0 0 0 fade(#ccc, 30%), -5px 0 0 0 fade(#ccc, 30%), 0 5px
		0 0 fade(#ccc, 30%); . text-content { display : flex;
	flex-direction: column;
	width: calc(60vw - 192px); h3 { margin : 0;
	font-size: 1.5em;
	max-width: 20ch;
}

p {
	margin: 16px 0 24px;
	max-width: 36ch;
}

}
.visual {
	width: 240px;
	height: 100%;
	position: absolute;
	top: -24px;
	left: 24px;
	overflow: hidden;
	border-radius: 24px;
	box-shadow: 1px 2px 6px fade(white, 25%), 2px 6px 12px fade(black, 25%);
}

&
:nth-of-type(odd) {
	border-radius: 24px 24px 48px 24px;
	padding: 48px 308px 48px 48px; . visual { right : 24px;
	left: auto
}

.text-content a {
	align-self: flex-start
}

}
}
article {
	margin: auto;
	display: block;
	width: calc(60vw + 248px);
	max-width: calc(920px + 248px);
	min-width: calc(640px + 248px);
}

@media all and (max-width:1100px) {
	body {
		padding: 96px 48px 24px
	}
	article {
		width: 100%;
		max-width: 100%;
		min-width: 100%
	}
	section.card {
		width: 100%;
		max-width: 100%;
		min-width: 100%;
		.
		text-content
		{
		width
		:
		100%
	}
	&
	:nth-of-type(odd) {
		margin: 0
	}
}

}
@media all and (max-width:720px) {
	body {
		padding: 48px 24px 0
	}
	section.card {
		margin: 64px 0;
		padding: 36px 36px 36px;
		flex-direction: column;
		border-radius: 24px; &: nth-of-type (odd) { padding : 88px 36px 36px;
		border-radius: 24px;
	}
	.text-content {h3 { max-width:calc(100%);
		font-size: 1em
	}
	p, a {
		font-size: 0.8em
	}
}

}
}
html {
	box-sizing: border-box;
}

*, *:before, *:after {
	box-sizing: inherit;
}
.table-header {
background-color: white;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 0.03em;
  }
</style>
</head>
<body>
	<%@ include file="allComponent/allCSS.jsp"%>
	<div class="container-fluid back-img2">
	<%@ include file="allComponent/navbar.jsp"%>
	
	<article>
		<section class="card">
			<div class="text-content">
				<h3>Approvals:</h3>
				<p>
				<div class="container">
					<ul class="responsive-table">
				<li class="table-header">
                            <div class="col col-1">Name</div>
                          <div class="col col-2">Approval</div>
                            <div class="col col-3">Feedback</div>
                             </li>
							<%
                        
                           if(user1!= null){
		                     loanDao dao2 = new loanDao(DBConnect.getConn());
	                     	ArrayList<loan> cal = (ArrayList) dao2.getDataUser(user1.getId());
		
		                 for(int i=0; i<cal.size(); i++){
		                   loan cal1 = (loan)cal.get(i);
	              	  if (cal1 != null && cal1.getApproval() != null) {
		  
		                  System.out.println(cal1);  %>
		                  
		                  
                              <li class="table-row">
							<div class="col col-1" data-label="Name"> <%=cal1.getName()%></div>
						
							
							<div class="col col-2" data-label="approval">
								<% if(cal1.getApproval().equals("forApproval")){ %>
							<p class="card-description">Your Loan has been placed for <strong>Approval.</strong></p>

	                         	<% }if(cal1.getApproval().equals("followUp")){ %>
							<p class="card-description">Your Loan has been placed for <strong>follow up.</strong>
								</p>

	                          	<%  }if(cal1.getApproval().equals("released")){ %> 
							<p class="card-description">Your Loan approval has been <strong>released.</strong>
								</p>	
		
	                             <%  }if(cal1.getApproval().equals("reject")){  %>
                            <p class="card-description">Your Loan has been <strong>rejected.</strong></p>              
							
							<%  }if(cal1.getApproval().equals("Approved")){  %>
                            <p class="card-description">Your Loan has been <strong>approved.&nbsp; Please visit nearest Branch.</strong>
						</p>		        
								
								<%} %>      
							</div>
							<div class="col col-3" data-label="feedback"><%=cal1.getFeedback()%></div>
							
						</li>

					
					<%}} }%>
					</ul>
				</div>
				</p>
			</div>
		</section>
	</article>
	<%@include file="allComponent/footer.jsp" %>
	</div>
</body>
</html>