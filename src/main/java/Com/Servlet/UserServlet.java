package Com.Servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.PrintWriter;
import java.sql.*;

import Com.Dao.UserDao;
import Com.DB.DBConnect;
import Com.User.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/registerServlet")
public class UserServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
		String name = req.getParameter("uname");
		String email = req.getParameter("email");
		double phone = Double.parseDouble(req.getParameter("phone"));
		String password = req.getParameter("password");

	    // Hash the password using MD5
	    String hashedPassword = hashPassword(password);
	
		
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPhone(phone);
		us.setPassword(hashedPassword);
		
		UserDao dao = new UserDao(DBConnect.getConn());
		boolean f = dao.addUser(us);
		System.out.println(f+" hello");
		PrintWriter out = resp.getWriter();
		
		if(f) {
			HttpSession session = req.getSession();
			session.setAttribute("sucessMsg", "Registeration Sucessfully");
			resp.sendRedirect("LoanRegisteration.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("Register.jsp");
		}	
}
	private String hashPassword(String password) {
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] messageDigest = md.digest(password.getBytes());
	        StringBuilder sb = new StringBuilder();
	        for (byte b : messageDigest) {
	            sb.append(String.format("%02x", b));
	        }
	        return sb.toString();
	    } catch (NoSuchAlgorithmException e) {
	        throw new RuntimeException(e);
	    }
	}
	
}