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
*{
font-size: 14px;}
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
							<h2 class="pt-2 d-flex justify-content-center">Approved Form</h2>
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
								<div class="col-md-6 py-2 float-start pe-2">
								<label class="form-label fs-5 float-start">Client Id </label> <input
										type="text" class="form-control" value="<%= ln.getId() %>" disabled>
										<input
										type="hidden" class="form-control" name="idUser" value="<%= ln.getId() %>">
								</div>
								<div class="col-md-6 py-2 float-end">
									<label class="form-label fs-5">Client Name </label> <input
										type="text" class="form-control" value=<%=ln.getName() %> disabled>
										 
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
								
								<label  class="form-label fs-5">Photo </label>
								
								<div class="col-md-6 pe-2 fs-5 float-start">
																
								<%
							  String property = ln.getPhotoName();
							  
							if ("lal-purja.pdf".equals(property)) {
							%>
							 <object data="../image/lal-purja.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja.pdf" type="application/pdf" /> 
                               </object>
                               <br>
                            <a class="btn btn-success" href="../image/lal-purja.pdf" download>Download PDF</a>
                            
							<%
							} else if ("lal-purja2.pdf".equals(property)) {
							%> 
								 <object data="../image/lal-purja2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                               <br>
                            <a class="btn btn-success" href="../image/lal-purja2.pdf" download>Download PDF</a>
							<%
							}else if ("lalpurja-3.pdf".equals(property)) {
							%>
							 <object data="../image/lalpurja-3.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lalpurja-3.pdf" type="application/pdf" height="100%"/> 
                               </object>
                               <br>
                            <a class="btn btn-success" href="../image/lalpurja-3.pdf" download>Download PDF</a>

									<%
							}else if ("lal-purja4.pdf".equals(property)) {
							%>
							 <object data="../image/lal-purja4.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/lal-purja4.pdf" type="application/pdf" height="100%"/> 
                               </object>
                               <br>
                            <a class="btn btn-success" href="../image/lal-purja4.pdf" download>Download PDF</a>

									<%
							}else if ("ornament1.pdf".equals(property)) {
							%>
							 <object data="../image/ornament1.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament1.pdf" type="application/pdf" height="100%"/> 
                               </object>
                               <br>
                            <a class="btn btn-success" href="../image/ornament1.pdf" download>Download PDF</a>
								<%
							}else if ("ornament2.pdf".equals(property)) {
							%>
							 <object data="../image/ornament2.pdf" type="application/pdf" height="1%">
                                 <embed src="../image/ornament2.pdf" type="application/pdf" height="100%"/> 
                               </object>
                               <br>
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
							<%} %>							
							</div>
								
								
								<div class="col-md-6 mb-2 float-end">
								<%
						    String property2 = ln.getLalpurja();
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
								
								</div>
								
								
					            	<%-- <div class="mb-2 pt-5  fs-5">
								   <input type="text" class="form-control"
									name="option1" value=<%= ln.getApproval() %> />
							</div>	 --%>
										
										
                                         		
								<%
String feedback = ln.getFeedback();
if (feedback != null) {
%>
<div class=" py-3 mb-2">
<label for="form-label" class="form-label fs-5">Feedback</label>
    <textarea class="form-control" placeholder="<%= feedback %>" name="feedback"></textarea>
    </div>
<%
} else {
%>
    <!-- Handle the case where feedback is null -->
    <div class=" py-3 mb-2">
<label for="form-label" class="form-label fs-5">Feedback</label>
    <textarea class="form-control" placeholder="No feedback available" name="feedback"></textarea>
    </div>
<%
}
%>
								
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>