<%@page import="Com.Dao.loanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect"%>
<%@page import="Com.User.loan, Com.User.UserDetails"%>
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
<title>Loan Registration</title>
<style type="text/css">
.back-img {
	background: url("../image/loan3.jpg");
	width: 100%;
	height: 100%;
	opacity: 80%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
</style>
<body>



	<%@ include file="allCSS.jsp"%>
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid back-img ">
		<div class="container pt-5 pb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-2">
					<div class="card shadow">
						
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h2 class="pt-2 d-flex justify-content-center">Client Registration Form</h2>
						<hr>
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
					
				<%-- <%-- 	<%
					String failedMsg = (String)session.getAttribute("failedMsg");
					if(failedMsg != null){
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
					<%
					session.removeAttribute("failedMsg");
					}%>
 --%>			
					
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						loanDao dao = new loanDao(DBConnect.getConn());
						loan ln = dao.getDataById(id);
						System.out.print(ln);
					
						%>
									
					
					

						<div class="card-body">
							<form method="post" action="../loanListEdit">
								<div class="col-md-6 py-2 float-start pe-2">
								<label class="form-label fs-5 float-start">Client Id </label> <input
										type="text" class="form-control" value="<%= ln.getId() %>" disabled>
										<input
										type="hidden" class="form-control" name="idUser" value="<%= ln.getId() %>">
								</div>
								<div class="col-md-6 py-2 float-end">
									<label class="form-label fs-5">Client Name </label> <input
										type="text" class="form-control" value=<%=ln.getName() %> disabled>
										 <input
										type="hidden" class="form-control" name="uname" value=<%=ln.getName() %>>
								</div>
								<div class="col-md-6 py-2 pe-2 float-start">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email" value=<%= ln.getEmail() %> disabled>
								</div>
								<div class="col-md-6 py-2 float-end">
									<label for="validationCustom01" class="form-label fs-5">Phone
									</label> <input type="number" class="form-control"
										id="validationCustom01" name="phone" required value=<%= ln.getPhone() %> disabled>
								</div>

								<div class="col-md-6 mb-1 py-2 pe-2 float-start">
									<label for="exampleInputPassword1" class="form-label fs-5">Current
										Address</label> <input type="text" class="form-control" name="address" value=<%= ln.getAddress() %>
										disabled>
								</div>
								
								
								<div class="col-md-6 mb-1 py-2 float-end">
									<label for="validationCustom04" class="form-label fs-5">Province</label>
									<select class="form-select" id="validationCustom04" name="province" disabled>
										<option selected>Koshi Province</option>
										<option>Madesh Province</option>
										<option>Bagmati Province</option>
										<option>Gandaki Province</option>
										<option>Lumbini Province</option>
										<option>Karnali Province</option>
									</select>
								</div>

								<div class="mb-1 py-2">
									<label class="form-label fs-5">Do you have Account at Pokhara Royal Co-operative?</label>
										<% if(ln.getHaveAccout().equals("option1")){ %>
									<div class="form-check fs-6">
										<input class="form-check-input" type="radio"
											name="exampleRadios" id="exampleRadios1" value="option1"
											checked> <label class="form-check-label"
											for="exampleRadios1"> Yes </label>
									</div>
									<%}else{ %>
									<div class="form-check fs-6">
										<input class="form-check-input" type="radio"
											name="exampleRadios" id="exampleRadios2" value="option2">
										<label class="form-check-label" for="exampleRadios2">
											No </label>
									</div>
									<%} %>
								</div>

							<div class="col-md-6 py-2 fs-5 pe-2 float-start">
									<label for="validationCustom04" class="form-label">Loan Type</label>
									<select class="form-select" id="validationCustom04" name="option" >
									<%
									if ("Personal Loan".equals(ln.getLoanType())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option selected value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Home Loan".equals(ln.getLoanType())) {
									%>
										<option selected value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Auto Loan".equals(ln.getLoanType())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option selected value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Agriculture Loan".equals(ln.getLoanType())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option selected value="Agriculture Loan">Agriculture
											Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Small Business Loan".equals(ln.getLoanType())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option selected value="Small Business Loan">Small
											Business Loan</option>

										<%
									}
									%>
									</select>
								</div>
								
									<div class="col-md-6 mb-2 py-2 pe-2 float-end">
									<label for="validationCustom04" class="form-label fs-5">Income Source and Property</label>
									<input type="text" class="form-control" name="income" value=<%= ln.getIncomeSource() %> disabled>
								</div>
								
								
					            	<div class="mb-2 pt-5  fs-5">
								   <select class="form-select" id="approved"
									name="option1">
									<option selected value="forApproval">For Approval</option>
									<option value="followUp">Follow Up</option>
									<option value="released">Released</option>
									<option value="reject">Reject</option>
									<option value="Approved" >Approved</option>
								</select>
							</div>	
										
										<div class=" py-2 mb-2">
										<label for="form-label" class="form-label fs-5">Feedback</label>
                                        <textarea class="form-control" placeholder="Leave a comment here" name="feedback"></textarea>
                                        </div>		
                                         		
								<div class="d-grid p-3">
								<%-- <a href="edit.jsp?noteId=<%=po.getId()%>" class="btn btn-primary">Edit</a> --%>
									<button class="btn btn-success p-2 fs-5" type="submit" onclick="{return confirmComplete();}">Edit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="application/javascript">
function confirmComplete() {
	var approved = document.getElementById('approved');
	const selectedValue = approved.value;
	console.log(selectedValue);
	if(selectedValue == "Approved"){
	alert("Approved confirm Complete");
	var answer=confirm("Are you sure you want to Approve?");
	if (answer==true)
	  {
	    return true;
	  }
	else
	  {
	    return false;
	  }
	}else{

	}
	}
</script>
	<%@ include file="footer.jsp"%>
</body>
</html>