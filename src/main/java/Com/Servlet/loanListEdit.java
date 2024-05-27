package Com.Servlet;

import java.io.IOException;

import Com.DB.DBConnect;
import Com.Dao.calculateDao;
import Com.Dao.loanDao;
import Com.Dao.loanListDao;
import Com.User.loanList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loanListEdit")
public class loanListEdit extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int id =Integer.parseInt(req.getParameter("idUser"));
       	String name = req.getParameter("uname");
		String approval = req.getParameter("option1");
		String feedback = req.getParameter("feedback");
		//int id2 = Integer.parseInt(req.getParameter("idUser"));
		/*HttpSession session = req.getSession();
		String id2 = (String)session.getAttribute("UserId");
		System.out.print(name+approval+id2); */
		try {
		
		loanDao cd = new loanDao(DBConnect.getConn());
		boolean f = cd.editLoanApproval(id, name, approval,feedback);
		//System.out.print(id+name+approval);
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg","Loan Data Edited SuccessFully");
			resp.sendRedirect("admin/loanList.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg", "Couldnot Update data, Sorry");
			resp.sendRedirect("admin/loanList.jsp");
		}
	}catch(Exception e) {
		e.printStackTrace();
	} 
}
}