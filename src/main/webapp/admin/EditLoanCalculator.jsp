<%@page import="Com.User.calculate"%>
<%@page import="Com.Dao.calculateDao"%>
<%@page import="Com.Servlet.CalculateLoanServlet"%>
<%@page import="Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect"%>
<%@page import="Com.User.loan,Com.User.UserDetails "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
UserDetails user3 = (UserDetails) session.getAttribute("userobj");

if (user3 == null) {
	response.sendRedirect("../login.jsp");
	session.setAttribute("Login-error", "Please Login.....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Calculator</title>
<style type="text/css">
.back-img {
	background: url("../image/loan2.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
</style>
</head>
<body>
	<%@ include file="../allComponent/allCSS.jsp"%>
	<%@ include file="navbar.jsp"%>

	<!-- <body class="d-flex flex-column h-100"> -->
	<div class="container-fluid back-img ">
		<div class="container pt-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-3">
					<div class="card shadow mb-5">
						<div class="card-header bg-success text-light text-center">
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h1 class="p-2">Loan Calculator</h1>
						</div>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						calculateDao dao = new calculateDao(DBConnect.getConn());
						calculate ln = dao.getDataById(id);
						System.out.print(ln);
						loanDao dao2 = new loanDao(DBConnect.getConn());
						loan ln2 = dao2.getDataById(id);
						System.out.print(ln2);
						%>

						<div class="card-body">
							<form method="post" action="../CalculateEditServlet1">
							
								 <div class="col-md-6 py-2  pe-2 float-start">
							<%--	<input type="hidden" name="id" value="<%=ln.getId()"> --%>

									<label class="form-label fs-5">Client ID </label> <input
										type="number" class="form-control" name="id"
										value="<%=ln.getId()%>">
								</div>
								<div class="col-md-6 py-2 float-end">
									<label class="form-label fs-5">Client Name </label> <input
										type="text" class="form-control" name="uname"
										value="<%=ln.getName()%>">
								</div>
								<div class="mb-1 py-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email" value="<%=ln.getEmail()%>">
								</div>
								<div class="mb-1 py-2 ">
									<label for="validationCustom01" class="form-label fs-5">Phone
									</label> <input type="number" class="form-control"
										id="validationCustom01" name="phone"
										value="<%=ln.getPhone()%>" required>
								</div>

								<div class=" mb-1 py-2 fs-5">
									<label for="validationCustom04" class="form-label">Loan
										Type</label> <select class="form-select" id="validationCustom04" name="loantype"
										required>

										<%
								  if(ln != null && ln.getLoantype() != null){
									if ("Personal Loan".equals(ln.getLoantype())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option selected value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Home Loan".equals(ln.getLoantype())) {
									%>
										<option selected value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Auto Loan".equals(ln.getLoantype())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option selected value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Agriculture Loan".equals(ln.getLoantype())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option selected value="Agriculture Loan">Agriculture
											Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
										<%
									} else if ("Small Business Loan".equals(ln.getLoantype())) {
									%>
										<option value="Home Loan">Home Loan</option>
										<option value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option selected value="Small Business Loan">Small
											Business Loan</option>

										<%
									}}else{
									%>
									<option value="Home Loan">Home Loan</option>
										<option selected value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
									<%} %>
									</select>
								</div>

								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Loan Amount</label> <input
										type="text" class="form-control" id="amount" name="amount" value="<%=ln.getAmount() %>">
								</div>


								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Loan Duration (months)</label> <input
										type="text" class="form-control" id="months" name="month" value="<%=ln.getMonths()%>">
								</div>

								<%
							//CalculateLoanServlet cl = new CalculateLoanServlet();
							//int months = Integer.parseInt((String)(session.getAttribute("months")));
							//System.out.println(months);  
							if (ln != null){
							if ("Personal Loan".equals(ln.getLoantype())) {
							%>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
										Rate is 11.99% for Personal Loan(5 yrs)</div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="11.99" />
								</div>
								<%
								}else if("Home Loan".equals(ln.getLoantype())){
								%>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
										Rate is 10.85% for Home Loan(5 yrs)</div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="10.85" />
								</div>
								<%} else if("Auto Loan".equals(ln.getLoantype())){%>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
										Rate is 11.25% for Auto Loan(5 yrs)</div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="11.25" />
								</div>
								<%} else if("Agriculture Loan".equals(ln.getLoantype())){%>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
										Rate is 9.85% for Agriculture Loan(5 yrs)</div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="9.85" />
								</div>
								<%} else{%>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
										Rate is 12.25% for Small Business Loan(5 yrs)</div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="12.25" />
								</div>
								<%}}else{ %>
								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
								<input type="text" class="form-control" id="interest"
										name="interest" value="<%ln.getInterest(); %>" />
								</div>
								<%} %>
								
								<div class="col-md-6 pe-2 py-2 fs-5 d-grid float-start">
									<input id="calculate" class="btn btn-success btn-lg"
										type="button" value="Calculate" />
								</div>
								<div class="col-md-6 py-2 fs-5 d-grid float-end">
									<input  class="btn btn-success btn-lg"
										type="submit" value="Edit Data" />
								</div>
							</form>
						</div>
					</div>
					</div>
		</div>
	</div>
				
				<!-- Form End -->

				<!-- Results Container -->
				<div id="results" class="table-responsive table-responsive-sm py-3">
				</div>
				<!-- Results End -->
			


	<!-- Scripts -->
	<script type="application/javascript" src="emi.js"></script>
	<script type="application/javascript">
						
      const button = document.getElementById('calculate');

      button.addEventListener('click', (event) => {
        const amount = Number(document.getElementById('amount').value);
        const months = Number(document.getElementById('months').value);
        const interest = Number(document.getElementById('interest').value);

        const emi = EMI.Loan(amount, months, interest);
        const table = EMI.emiToHtmlTable(emi)

        document.getElementById('results').innerHTML = table;
      });					
	
	
	
	
	
	
	
	</script>
</div>
	<%@ include file="../allComponent/footer.jsp"%>
</body>
</html>