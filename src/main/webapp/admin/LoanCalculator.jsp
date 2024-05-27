<%@page import="Com.Servlet.CalculateLoanServlet"%>
<%@page import="Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect, Com.User.UserDetails"%>
<%@page import="Com.User.loan "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
UserDetails user5 = (UserDetails) session.getAttribute("userobj");

if (user5 == null) {
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
	background: url("../image/loan5.jpeg");
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
	<div class="container-fluid back-img">
		<div class="container pt-5 pb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-5">
					<div class="card shadow">
						<div class="card-header bg-success text-light text-center">
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h1 class="p-2">Loan Calculator</h1>
						</div>

						<div class="card-body">
							<form method="post" action="../CalculateLoanServlet">
								<div class="col-md-6 col-sm-12 py-2  pe-2 float-start">
									<label class="form-label fs-5">Client ID </label> <input
										type="text" class="form-control" name="id">
								</div>
								
								<div class="col-md-6 col-sm-12 py-2 float-end">
									<label class="form-label fs-5">Client Name </label> <input
										type="text" class="form-control" name="uname">
								</div>
								
								<div class="mb-1 py-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email">
								</div>
								
								<div class="mb-1 py-2 ">
									<label for="validationCustom01" class="form-label fs-5">Phone
									</label> <input type="number" class="form-control"
										id="validationCustom01" name="phone" required>
								</div>

								<div class=" mb-1 py-2 fs-5">
									<label for="validationCustom04" class="form-label">Loan
										Type</label> <select class="form-select" id="loantype" name="loantype"
										required>

										<option value="Home Loan">Home Loan</option>
										<option selected value="Personal Loan">Personal Loan</option>
										<option value="Auto loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
									</select>
								</div>

								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Loan Amount</label> <input
										type="text" class="form-control" id="amount" name="amount">
								</div>


								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Loan Duration (months)</label> <input
										type="text" class="form-control" id="months" name="month">
								</div>

								<div class="mb-1 py-2 fs-5">
									<label class="form-label">Annual Interest Rate</label>
									<div class="alert alert-success" role="alert">Interest
                                     </div>
									<input type="text" class="form-control" id="interest"
										name="interest" value="11.99" />
								</div>
								<div class="col-md-6 py-2 fs-5 d-grid pe-2 float-start">
									<input id="calculate" class="btn btn-success btn-lg"
										type="button" value="Calculate" />
								</div>
								<div class="col-md-6 py-2 fs-5 d-grid float-end">
									<input class="btn btn-success btn-lg" type="submit"
										value="Add Data" />
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Form End -->

				<!-- Results Container -->
				<div id="results" class="table-responsive table-responsive-sm">
				</div>
				<!-- Results End -->
			</div>
		</div>



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