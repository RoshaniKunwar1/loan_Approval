/*
 * package Com.Servlet;
 * 
 * import java.io.IOException;
 * 
 * import Com.DB.DBConnect; import Com.Dao.calculateDao; import
 * jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import
 * jakarta.servlet.http.HttpSession;
 * 
 * @WebServlet("/CalculateLoanServlet") public class LineOfCreditServlet extends
 * HttpServlet{ public void doPost(HttpServletRequest req, HttpServletResponse
 * resp)throws ServletException, IOException{ int id =
 * Integer.parseInt(req.getParameter("id")); String name =
 * req.getParameter("uname"); double amount =
 * Double.parseDouble(req.getParameter("fundNeeded")); double fundWithdraw =
 * Double.parseDouble(req.getParameter("fundWithdraw")); int loanDuration =
 * Integer.parseInt(req.getParameter("duration")); double interest =
 * Double.parseDouble(req.getParameter("interest"));
 * 
 * 
 * double fundAvilable = amount - fundWithdraw; double commitmentFee = 0.05 *
 * fundAvilable; double fundWithdraw2 = fundWithdraw * interest;
 * 
 * System.out.println(fundAvilable + commitmentFee + fundWithdraw2);
 * 
 * 
 * interest = interest/(12*100); double emi =
 * (amount*interest*Math.pow(1+interest, months))/(Math.pow(1+interest,
 * months)-1); double emi1 = Math.ceil(emi*100)/100;
 * 
 * String months1 = String.valueOf(months); String amount1 =
 * String.valueOf(amount); calculateDao dao = new
 * calculateDao(DBConnect.getConn()); boolean f = dao.addCalculate(id, name,
 * email, phone, emi1,amount1,interest,months1);
 * 
 * 
 * if(f) { f=true; resp.sendRedirect("CustomerTable.jsp"); }
 * 
 * 
 * HttpSession session = req.getSession(); session.setAttribute("months",
 * months); req.getRequestDispatcher ("LoanCalculator.jsp").forward(req, resp);
 * 
 * } }
 */