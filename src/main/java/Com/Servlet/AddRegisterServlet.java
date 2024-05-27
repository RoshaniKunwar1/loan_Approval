package Com.Servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.tomcat.util.http.fileupload.FileUpload;

import Com.Dao.loanDao;
import Com.DB.DBConnect;
import Com.User.UserDetails;
import Com.User.loan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddRegisterServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10, // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)
public class AddRegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		int id = Integer.parseInt(req.getParameter("idUser"));	
		String name = req.getParameter("uname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String province = req.getParameter("province");
		String haveAccount = req.getParameter("exampleRadios");
		String loanType = req.getParameter("option");
		String incomeSource = req.getParameter("income");
		String otherBank = req.getParameter("otherBank");
		String amount = req.getParameter("amount");
		String months = req.getParameter("months");
		Part part = req.getPart("property");
		String fileName = part.getSubmittedFileName();

		Part part2 = req.getPart("ornament");
		String fileName2 = part.getSubmittedFileName();

	    String UploadPath  = "C:/eclipseAllFile/LoanArmotization/src/main/webapp/image"+fileName;
	    String UploadPath2 = "C:/eclipseAllFile/LoanArmotization/src/main/webapp/image"+fileName2;

		
	    FileOutputStream fos = new FileOutputStream(UploadPath);
	    InputStream is = part.getInputStream();
	    
	    FileOutputStream fos2 = new FileOutputStream(UploadPath2);
	    InputStream is2 = part2.getInputStream();
	    
	    byte[] data = new byte[is.available()];
	    is.read(data);
	    fos.write(data);
	    fos.close();
	    
	    byte[] data2 = new byte[is2.available()];
	    is2.read(data2);
	    fos2.write(data2);
	    fos2.close();
		/*
		 * UserDao dao = new UserDao(DBConnect.getConn()); UserDetails use =
		 * dao.loginUser(us);
		 * 
		 * if(use!=null) { HttpSession session = req.getSession();
		 * session.setAttribute("userD", use); resp.sendRedirect("home.jsp"); } else {
		 * HttpSession session = req.getSession();
		 * session.setAttribute("failedMsg","Invalid Email or password");
		 * resp.sendRedirect("login.jsp"); }
		 */
		
		
    System.out.print(name+ email+ phone+ address+ " "+province+ haveAccount+ loanType+ incomeSource+ otherBank);

		loanDao dao = new loanDao(DBConnect.getConn());
		boolean f = dao.addLoan(name, email, phone, address, province, haveAccount, loanType, incomeSource, otherBank,fileName, id,amount,months,fileName2);
		
		if(f) {
	    	    resp.sendRedirect("LoanCalculator.jsp");
		}
	}
}
