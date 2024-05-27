package Com.Servlet;

import java.io.IOException;

import Com.DB.DBConnect;
import Com.Dao.calculateDao;
import Com.Dao.loanDao;
import Com.Dao.loanListDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteLoanList")
public class deleteLoanList extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int id = Integer.parseInt(req.getParameter("id"));
		
		loanDao dao = new loanDao(DBConnect.getConn());
		boolean f1 = dao.deleteRegist(id);
		
		loanListDao dao1 = new loanListDao(DBConnect.getConn());
		boolean f = dao1.deletePost(id);
		
		
		if(f== true || f1==true) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg1", "Deleted");
			resp.sendRedirect("admin/loanList.jsp");
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg1", "Couldnot delete Successfully");
			resp.sendRedirect("admin/loanList.jsp");
		}
		
	}
}