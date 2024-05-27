package Com.Servlet;

import java.io.IOException;

import Com.DB.DBConnect;
import Com.Dao.calculateDao;
import Com.Dao.loanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int id = Integer.parseInt(req.getParameter("id"));
		
		calculateDao dao1 = new calculateDao(DBConnect.getConn());
		loanDao dao2 = new loanDao(DBConnect.getConn());
		boolean f = dao1.deleteLoan(id);
		boolean f1 = dao2.deleteRegist(id);
		
		if(f== true && f1==true) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg1", "Deleted Succesfully from both register and loan calculator Table");
			resp.sendRedirect("admin/CustomerTable.jsp");
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg1", "Couldnot delete Successfully");
			resp.sendRedirect("admin/CustomerTable.jsp");
		}
		
	}
}