<%@page import="Com.Dao.loanDao"%>
<%@page import=" java.util.List, Com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login.....");
}
%>



<%-- <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Registration</title>
<style type="text/css">
.back-img2 {
	background: url("image/loan.jpg");
	width: 100%;
	height: 100%;
	opacity: 80%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}

.bg-custom {
	background: rgb(116, 201, 126);
	background: linear-gradient(90deg, rgba(116, 201, 126, 1) 5%,
		rgba(8, 80, 25, 0.9663515064228817) 76%);
}
</style>
<body>



	<%@ include file="allComponent/allCSS.jsp"%>
	<%@ include file="allComponent/navbar.jsp"%>
	<div class="container-fluid back-img2">
		<div class="container pt-5 pb-5">
			<div class="row">
				<div class="col-md-6 offset-md-3 py-2">
					<div class="card shadow">
						<div class="card-header bg-custom text-light text-center">
							<!-- <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i> -->
							<h1 class="p-2">Loan Registration Form</h1>
						</div>
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
					
					<%
					String failedMsg = (String)session.getAttribute("failedMsg");
					if(failedMsg != null){
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
					<%
					session.removeAttribute("failedMsg");
					}%> --%>

						<div class="card-body">
							<form method="post" action="AddRegisterServlet"
								enctype="multipart/form-data">
								<div class="mb-1 py-2 pe-2 col-md-6 float-start">

									<%
									if (user2 != null) {
									%>
									<input type="hidden" name="idUser" value="<%=user2.getId()%>">
									<%
									}
									%>

									<label class="form-label fs-5 ">Client Name </label> <input
										type="text" class="form-control" name="uname">
								</div>
								
								<div class="mb-1 py-2 col-md-6 float-end">
									<label for="validationCustom01" class="form-label fs-5">Phone
									</label> <input type="number" class="form-control"
										id="validationCustom01" name="phone" required>
								</div>
								
								<div class="mb-1 py-2">
									<label for="exampleInputEmail1" class="form-label fs-5">Email
										address</label> <input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email">
								</div>
								
								<div class="col-md-6 mb-1 py-2 pe-2 float-start">
									<label for="exampleInputPassword1" class="form-label fs-5">Current
										Address</label> <input type="text" class="form-control" name="address"
										required>
								</div>


								<div class="col-md-6 mb-1 py-2 float-end">
									<label for="validationCustom04" class="form-label fs-5">Province</label>
									<select class="form-select" id="validationCustom04"
										name="province" required>
										<option selected>Koshi Province</option>
										<option>Madesh Province</option>
										<option>Bagmati Province</option>
										<option>Gandaki Province</option>
										<option>Lumbini Province</option>
										<option>Karnali Province</option>
									</select>
								</div>

								<div class="mb-1 py-2">
									<label class="form-label fs-5">Do you have Account at
										Royal Co-operative?</label>
									<div class="form-check fs-6 col-md-6">
										<input class="form-check-input" type="radio"
											name="exampleRadios" id="exampleRadios1" value="option1"
											checked> <label class="form-check-label"
											for="exampleRadios1"> Yes </label>
									</div>
									<div class="form-check fs-6">
										<input class="form-check-input" type="radio"
											name="exampleRadios" id="exampleRadios2" value="option2">
										<label class="form-check-label" for="exampleRadios2">
											No </label>
									</div>
								</div>

							
								<div class="mb-1 py-2 fs-5">
									<label for="validationCustom04" class="form-label">Loan
										Type</label> <select class="form-select" id="option1" name="option"
										required>
										<option selected value="Personal Loan">Personal Loan</option>
										<option value="Home Loan">Home Loan</option>
										<option value="Auto Loan">Auto Loan</option>
										<option value="Agriculture Loan">Agriculture Loan</option>
										<option value="Small Business Loan">Small Business
											Loan</option>
									</select>
								</div>
								<div class="col-md-6 float-start pe-2">
								 <label class="form-label fs-5 ">Loan Amount</label> <input
									type="text" class="form-control" id="amount" name="amount">
									</div>
									
									<div class="col-md-6 float-end">
									 <label
									class="form-label fs-5">Loan Duration</label> <input
									type="text" class="form-control" id="months" name="months">
                                   </div>

								<div class="col-md-3 py-2 fs-5 d-grid pe-2">
									<input id="calculate" class="btn btn-success btn-lg"
										type="button" value="Calculate" />
								</div>
								
						<div id="emiResult" class="container py-3">
						</div>

	                               <div class="col-md-6 mb-1 py-2 pe-2 float-start">
									<label for="validationCustom04" class="form-label fs-5">Loan
										From Other Bank</label> <input type="text" class="form-control"
										name="otherBank">
								</div>

								<div class="col-md-6 mb-1 py-2 float-end">
									<label for="validationCustom04" class="form-label fs-5">Income
										Source and Property</label> <select class="form-select"
										id="validationCustom04" name="income" required>
										<option selected>Rent</option>
										<option>Salary</option>
										<option>Foreign Remittance</option>
										<option>Business</option>
										<option>Others</option>
									</select>
								</div>

						<div class="my-1 py-2 fs-5">
							<label for="formFile" class="form-label">Upload photo For
								Income Source </label> 
								<input class="form-control" type="file"
								id="formFile" name="property" accept="application/pdf">
								<br>
								<input class="form-control" type="file" id="formFile" name="ornament" accept="application/pdf">
						</div>

						<div class="d-grid p-3">
							<%-- <a href="edit.jsp?noteId=<%=po.getId()%>" class="btn btn-primary">Edit</a> --%>
							<button class="btn btn-success p-2 fs-5" type="submit">Submit</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script type="application/javascript">
	const button = document.getElementById('calculate');

	button.addEventListener('click', (event) => {
		const amount = Number(document.getElementById('amount').value);
		const months = Number(document.getElementById('months').value);
		const interest = document.getElementById('option1').value;
		var interest2;

		if (interest == "Personal Loan") {
			interest2 = 11.99;
		} else if (interest == "Home Loan") {
			interest2 = 10.85;
		} else if (interest == "Auto Loan") {
			interest2 = 11.25;
		} else if (interest == "Agriculture Loan") {
			interest2 = 9.85;
		} else {
			interest2 = 12.25;
		}

		const monthlyInterestRate = interest2 / 1200;

		const emi = (amount * monthlyInterestRate * Math.pow((1 + monthlyInterestRate), months)) /
			(Math.pow((1 + monthlyInterestRate), months) - 1);
		const emi2 = emi.toFixed(2);

		// Display the EMI
		document.getElementById('emiResult').innerHTML = 'Your EMI is: Rs.' + emi2+ ' .Please show your income source equal to Rs.'+ emi2*2;
	});
</script>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>