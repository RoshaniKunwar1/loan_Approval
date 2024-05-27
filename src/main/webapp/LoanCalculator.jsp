<%@page import="Com.Servlet.CalculateLoanServlet"%>
<%@page import="Com.Dao.loanDao"%>
<%@page import="Com.DB.DBConnect"%>
<%@page import="Com.User.loan "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Calculator</title>
<style type="text/css">
.back-img3 {
	background: url("image/loan5.jpeg");
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
	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>

	<!-- <body class="d-flex flex-column h-100"> -->
	<div class="container-fluid back-img3">
		<div class="container pt-5 pb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-5">
					<div class="card shadow">
						<div class="card-header bg-success text-light text-center">
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h1 class="p-2">Loan Calculator</h1>
						</div>

						<div class="card-body">
							<form method="post" >
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
									<input type="text" class="form-control" id="interest"
										name="interest" value="11.99" />
								</div>
								<div class="mb-1 py-2 fs-5 d-grid pe-2">
									<input id="calculate" class="btn btn-success btn-lg"
										type="button" value="Calculate" />
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