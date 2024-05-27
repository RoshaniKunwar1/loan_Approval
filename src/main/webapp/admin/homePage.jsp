<%@page import="Com.User.lineOfCredit"%>
<%@page import="Com.Dao.lineOfCreditDao"%>
<%@page import="Com.User.loanList"%>
<%@page import="Com.Dao.loanListDao"%>
<%@page import="Com.DB.DBConnect, java.util.*"%>
<%@page import="Com.Dao.loanDao, Com.User.loan, Com.User.UserDetails"%>
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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<%
		String SuccMsg2 = (String) session.getAttribute("SussMsg");
		if (SuccMsg2 != null) {
		%>
		<div class="alert alert-success" role="alert"><%=SuccMsg2%></div>
		<%
		session.removeAttribute("SuccMsg1");
		}
		%>

		<%
		String FailedMsg2 = (String) session.getAttribute("FailedMsg");
		if (FailedMsg2 != null) {
		%>
		<div class="alert alert-success" role="alert"><%=FailedMsg2%></div>
		<%
		session.removeAttribute("FailedMsg1");
		}
		%> 



		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					lineOfCreditDao ob = new lineOfCreditDao(DBConnect.getConn());
					List<lineOfCredit> post = ob.getData();
					if (post != null) {
						for (lineOfCredit po : post) {
				%> 
				
						<h1 class="text-center py-3 text-success">Edit Homepage</h1>

		<div class="container">
			<div class="row">
				<div class="col=md-12">
					<form action="../homePageEdit" method="post" enctype="multipart/form-data">
						<div class="mb-3">


							<%
							/* int note_id = Integer.parseInt(request.getParameter("noteId"));
							out.print(note_id);

							postDao pd = new postDao(DBConnect.getConn());
							out.print(pd);
							if (pd != null) {
								post pd1 = pd.getDataById(note_id);
								out.print(pd1); */
							%>

							



							<label for="exampleInputEmail1" class="form-label">Enter
								Title</label> <input type="text" class="form-control" name="title" value="<%=po.getTitle() %>"
								required>
						</div>

						<div class="form-group mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="6" cols="" class="form-control " name="content" required><%= po.getContent() %>
							 </textarea>
						</div>
						
						<div class="form-group mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content for Read More</label>
							<textarea rows="6" cols="" class="form-control " name="readmore" required><%= po.getReadmore() %>
							 </textarea>
						</div>
						
						<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Enter contact Information:
								</label> <input type="text" class="form-control" name="contact" value="<%= po.getContactInfo() %>"
								required>
						</div>
						<div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Enter Email:
								</label> <input type="text" class="form-control" name="email" value="<%= po.getEmail() %>"
								required>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label">Upload picture
								 </label> 
								<input class="form-control" type="file"
								id="formFile" name="image">
								</div>
						
						<div class="mb-3">
							<label for="formFile" class="form-label">Upload Map picture:
								 </label> 
								<input class="form-control" type="file"
								id="formFile" name="imageMap">
								</div>
						<%
						}}}
						%>

						<div class="container text-center mt-3 mb-5">
							<button type="submit" class="btn btn-outline-primary fs-5">Edit Homepage
								</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>

			</div>
		</div>
	<%@ include file="footer.jsp"%>
</body>
</html>