<%@page import="Com.User.loanList"%>
<%@page import="Com.Dao.loanListDao,Com.Dao.calculateDao"%>
<%@page import="Com.DB.DBConnect, java.util.*"%>
<%@page import="Com.Dao.loanDao, Com.User.loan, Com.User.UserDetails"%>
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
<title>Customer Table</title>
<!-- Include CSS files for styling -->
<link rel="stylesheet" href="../path/to/bootstrap.min.css">
<style>
.back-img2 {
	background: url("../image/loan4.jpg");
	width: 100%;
	height: 100%;
	opacity: 90%;
	background-repeat: no-repeat;
	background-size: cover;
	/* margin-top: 8px; */
}
.margin-custom{
	 margin-left:-100px; 
}

</style>
</head>
<body>
	<%@ include file="../allComponent/allCSS.jsp"%>
	
<div class="container-fluid back-img2">
<%@ include file="navbar.jsp"%>

	<div class="container my-5">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead class="fs-5 py-3">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Details</th>
						<th scope="col" class="overflow-hidden">Property Paper</th>
						<th scope="col" class="overflow-hidden">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
				
											
				
				
				
					<%
					loanDao dao = new loanDao(DBConnect.getConn());
					ArrayList<loan> cal = (ArrayList) dao.getData();
	             	System.out.print("cal"+cal);
	             	
					for (int i = 0; i < cal.size(); i++) {
						loan cal1 = (loan) cal.get(i);
						String ln2 = cal1.getApproval();
					    if (!"Approved".equals(ln2)) {
						System.out.print(ln2);

					%>
					<tr>
					
					
						
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
					
					<td><%=cal1.getId() %></td>
					
					
		
						<td><%=cal1.getName()%></td>
						<td>
							<p>
								Email:
								<%=cal1.getEmail()%></p>
							<p>
								Phone:
								<%=cal1.getPhone()%></p>
							<p>
								Address:
								<%=cal1.getAddress()%>
							<p>
							<p>
								Loan Type:
								<%=cal1.getLoanType()%>
							<p>
							<p>
								Income Source:
								<%=cal1.getIncomeSource()%></p>
							<p>
								Loan From Other Bank:
								<%=cal1.getOtherBankLoan()%></p>
							<p>
								Income Amount:
								<%=cal1.getIncome()%></p>
							<p>
								Duration for Loan:
								<%=cal1.getMonths()%></p>
							
						</td>

						<td>
							<%
							String property = cal1.getPhotoName();
							String property2 = cal1.getLalpurja();
							if ("lal-purja.pdf".equals(property)) {
							%>
							 <object data="../image/lal-purja.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja.pdf" type="application/pdf" /> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja.pdf" download>Download PDF</a>
                            
							<%
							} else if ("lal-purja2.pdf".equals(property)) {
							%> 
								 <object data="../image/lal-purja2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja2.pdf" download>Download PDF</a>
							<%
							}else if ("lalpurja-3.pdf".equals(property)) {
							%>
							 <object data="../image/lalpurja-3.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lalpurja-3.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lalpurja-3.pdf" download>Download PDF</a>

									<%
							}else if ("lal-purja4.pdf".equals(property)) {
							%>
							 <object data="../image/lal-purja4.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja4.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja4.pdf" download>Download PDF</a>

									<%
							}else if ("ornament1.pdf".equals(property)) {
							%>
							 <object data="../image/ornament1.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament1.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/ornament1.pdf" download>Download PDF</a>
								<%
							}else if ("ornament2.pdf".equals(property)) {
							%>
							 <object data="../image/ornament2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/ornament2.pdf" download>Download PDF</a>
								<%
							}else if ("tax1.pdf".equals(property)) {
							%>
							 <object data="../image/tax1.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/tax1.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/tax1.pdf" download>Download PDF</a>
								<%
							}else {
							%>
							 <object data="../image/tax2.pdf" type="application/pdf" >
                                 <embed src="../image/tax2.pdf" type="application/pdf" /> 
                               </object>
                            <a class="btn btn-success" href="../image/tax2.pdf" download>Download PDF</a>
							<%} 
							
							//PROPERTY-2
							if ("lal-purja.pdf".equals(property2)) {
							%>
							
							 <object data="../image/lal-purja.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja.pdf" type="application/pdf" /> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja.pdf" download>Download PDF</a>
                            
							<%
							} else if ("lal-purja2.pdf".equals(property2)) {
							%> 
								 <object data="../image/lal-purja2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja2.pdf" download>Download PDF</a>
							<%
							}else if ("lalpurja-3.pdf".equals(property2)) {
							%>
							 <object data="../image/lalpurja-3.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lalpurja-3.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lalpurja-3.pdf" download>Download PDF</a>

									<%
							}else if ("lal-purja4.pdf".equals(property2)) {
							%>
							 <object data="../image/lal-purja4.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja4.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/lal-purja4.pdf" download>Download PDF</a>

									<%
							}else if ("ornament1.pdf".equals(property2)) {
							%>
							 <object data="../image/ornament1.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament1.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/ornament1.pdf" download>Download PDF</a>
								<%
							}else if ("ornament2.pdf".equals(property2)) {
							%>
							 <object data="../image/ornament2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/ornament2.pdf" download>Download PDF</a>
								<%
							}else if ("tax1.pdf".equals(property2)) {
							%>
							 <object data="../image/tax1.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/tax1.pdf" type="application/pdf" height="100%"/> 
                               </object>
                            <a class="btn btn-success" href="../image/tax1.pdf" download>Download PDF</a>
								<%
							}else {
							%>
							 <object data="../image/tax2.pdf" type="application/pdf" >
                                 <embed src="../image/tax2.pdf" type="application/pdf" /> 
                               </object>
                            <a class="btn btn-success" href="../image/tax2.pdf" download>Download PDF</a>
							<%} %>
							
						</td>
						<td>
							<div class="pt-5 fs-5 margin-custom">
								<select class="form-select" id="validationCustom04"
									name="option" disabled>
									<%
									String ln = cal1.getApproval();
									System.out.print("loan"+ln);

									if (ln != null) {
										if (ln.equals("forApproval")) {
									%>
									<option selected value="forApproval">For Approval</option>
									<option value="followUp">Follow Up</option>
									<option value="released">Released</option>
									<option value="reject">Reject</option>
									<option value="Approved">Approved</option>
									<%
									} else if (ln.equals("followUp")) {
									%>
									<option value="forApproval">For Approval</option>
									<option selected value="followUp">Follow Up</option>
									<option value="released">Released</option>
									<option value="reject">Reject</option>
									<option value="Approved">Approved</option>									<%
									}
									else if (ln.equals("released")) {
									%>
									<option  value="forApproval">For Approval</option>
									<option value="followUp">Follow Up</option>
									<option selected value="released">Released</option>
									<option value="reject">Reject</option>
									<option value="Approved">Approved</option>
									<%
									} else if(ln.equals("Approved")){
						
										
										%>

						            	<option  value="forApproval">For Approval</option>
										<option value="followUp">Follow Up</option>
										<option value="released">Released</option>
										<option value="reject">Reject</option>
										<option selected value="Approved">Approved</option>
										
										
										<%
										int id = cal1.getId();
										String name = cal1.getName();
										String email = cal1.getEmail();
										String phone = cal1.getPhone();
										String amount = cal1.getIncome();  
										double amount1 = Double.parseDouble(amount);
										String months = cal1.getMonths();
										int months1 = Integer.parseInt(months);
										String loantype = cal1.getLoanType();
										double interest;
										
										if (loantype == "Personal Loan") {
											interest = 11.99;
										} else if (loantype == "Home Loan") {
											interest = 10.85;
										} else if (loantype == "Auto Loan") {
											interest = 11.25;
										} else if (loantype == "Agriculture Loan") {
											interest = 9.85;
										} else {
											interest = 12.25;
										}
										
										System.out.print(loantype);
										interest = interest/(12*100);
										double emi = (amount1*interest*Math.pow(1+interest, months1))/(Math.pow(1+interest, months1)-1);
										double emi1 = Math.ceil(emi*100)/100;
										
										calculateDao dao5 = new calculateDao(DBConnect.getConn());
										boolean f = dao5.addCalculate(id, name, email, phone, emi1,amount,interest,months,loantype);					
										%>
										
									
									<%
									}
									else {
									%>
									<option value="forApproval">For Approval</option>
									<option value="followUp">Follow Up</option>
									<option value="released">Released</option>
									<option selected value="reject">Reject</option>
									<option value="Approved">Approved</option>
																		
								<% 	}}else{
									%>
									<option  value="forApproval">For Approval</option>
									<option value="followUp">Follow Up</option>
									<option value="released">Released</option>
									<option value="reject">Reject</option>
									<option selected value="Approved">Approved</option>		
									<%} %>
								</select>
							</div>

					<%-- <input type="hidden" name="idUser" value="<%=cal1.getId2() %>"> 
 --%>					


						</td>
						
						<td><a href="loanListEdit.jsp?id=<%=cal1.getId()%>"
							class="btn btn-sm btn-outline-primary"><i
								class="fa-regular fa-pen-to-square"></i> Edit</a> 
															<a
							href="../deleteLoanList?id=<%=cal1.getId()%>"
							class="btn btn-sm btn-outline-danger"><i
								class="fa-solid fa-trash"></i> Delete</a></td>
								
					</tr>
					<%
					}}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
