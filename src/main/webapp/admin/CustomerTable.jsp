<%@page import="Com.DB.DBConnect, java.util.*"%>
<%@page import="Com.Dao.calculateDao, Com.User.calculate, Com.User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<style>
.back-img2 {
	background: url("../image/loan.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
</style>
<title>Customer Table</title>
</head>
<body>
    <%@ include file="../allComponent/allCSS.jsp"%>
	<%@ include file="navbar.jsp"%> 
	<div class="container-fluid back-img2">
	<!-- <h3 class="text-center mb-5 text-primary">Hello</h3> -->
	
	<%
					String SuccMsg = (String) session.getAttribute("SuccMsg");
					if (SuccMsg != null) {     %>
					
					<div class="alert alert-success" role="alert"><%=SuccMsg%></div>
					
					<%  session.removeAttribute("SuccMsg");
					}
					%>

					<%
					String FailedMsg = (String) session.getAttribute("FailedMsg");
					if (FailedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=FailedMsg%></div>
					<%
					session.removeAttribute("FailedMsg");
					}
					%>
	
	
	
		<%
					String succMsg1 = (String)session.getAttribute("SuccMsg1");
					if(succMsg1 != null){ %>
						<div class="alert alert-success" role="alert"><%=succMsg1 %></div>
						
					<%  session.removeAttribute("SuccMsg1");
			        	}
					%>
					
					<%
						String FailedMsg1 = (String) session.getAttribute("FailedMsg1");
					if(FailedMsg1!=null){
					%>
					<div class="alert alert-danger" role="alert"><%= FailedMsg1 %></div>
					<%
					session.removeAttribute("FailedMsg1");
					}
					%>
	<div  class="table-responsive table-responsive-sm">
	<table class="table table-striped my-5 ">
		<thead class="fs-5">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">EMI</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				calculateDao dao = new calculateDao(DBConnect.getConn());
				ArrayList<calculate> cal = (ArrayList) dao.getData();
				//System.out.print(cal);
				for(int i=0; i<cal.size(); i++){
					calculate cal1 = (calculate)cal.get(i);
				%>
				
				<td><%=cal1.getId() %></td>
				<td><%=cal1.getName() %></td>
				<td><%=cal1.getEmail() %></td>
				<td><%=cal1.getPhone() %></td>
				<td><%=cal1.getEmi() %></td>
				<td>
				
					<a href="EditLoanCalculator.jsp?id=<%=cal1.getId() %>" class="btn btn-sm btn-outline-primary">Edit</a>
					
					<a href="ViewLoanList.jsp?id=<%=cal1.getId() %>" class="btn btn-sm btn-outline-primary">View Approval</a>
					
					<a href="../deleteServlet?id=<%=cal1.getId() %>" class="btn btn-sm btn-outline-danger">Delete</a>
				
		
					</td>
					</tr>
					<%} %>
		</tbody>
	</table>
</div>
</div>
	<%@ include file="../allComponent/footer.jsp"%>
</body>
</html>