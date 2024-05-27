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

@WebServlet("/CalculateEditServlet1")
public class CalculateEditServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		int id =Integer.parseInt(req.getParameter("id"));
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
		
		try {
		calculateDao cd = new calculateDao(DBConnect.getConn());
		boolean f = cd.editCalculate(id, name, email, phone, emi, amount1, interest, months1,loantype);
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("SuccMsg","Loan Data Edited SuccessFully");
			resp.sendRedirect("admin/CustomerTable.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("FailedMsg", "Couldnot Update data, Sorry");
			resp.sendRedirect("admin/CustomerTable.jsp");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
}
}