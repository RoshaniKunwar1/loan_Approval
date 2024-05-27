package Com.Servlet;

import java.io.IOException;

import Com.DB.DBConnect;
import Com.Dao.calculateDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CalculateLoanServlet")
public class CalculateLoanServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("uname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		double amount = Double.parseDouble(req.getParameter("amount"));
		double interest = Double.parseDouble(req.getParameter("interest"));
		int months = Integer.parseInt(req.getParameter("month"));
		String loantype = req.getParameter("loantype");
		
		System.out.print(loantype);
		interest = interest/(12*100);
		double emi = (amount*interest*Math.pow(1+interest, months))/(Math.pow(1+interest, months)-1);
		double emi1 = Math.ceil(emi*100)/100;
		
		String months1 = String.valueOf(months);
		String amount1 = String.valueOf(amount);
		calculateDao dao = new calculateDao(DBConnect.getConn());
		boolean f = dao.addCalculate(id, name, email, phone, emi1,amount1,interest,months1,loantype);
		
		if(f) {
			f=true;
			resp.sendRedirect("admin/CustomerTable.jsp");
		}
		
		
		/* HttpSession session = req.getSession(); session.setAttribute("months",
		 * months); req.getRequestDispatcher
		 *("LoanCalculator.jsp").forward(req, resp);
		 */
	}
}