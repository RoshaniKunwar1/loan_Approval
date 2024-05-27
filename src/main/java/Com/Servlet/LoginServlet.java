package Com.Servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import Com.Dao.UserDao;
import Com.DB.DBConnect;
import Com.User.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		// Hash the password using MD5
	    String hashedPassword = hashPassword(password);
				

		HttpSession session = req.getSession();
		try {
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				UserDetails us = new UserDetails();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			} else
			{
				UserDetails us = new UserDetails();
				us.setEmail(email);
				us.setPassword(hashedPassword);

				UserDao dao = new UserDao(DBConnect.getConn());
				UserDetails use = dao.loginUser(us);

				if (use != null) {
					
					session.setAttribute("userD", use);
					resp.sendRedirect("home.jsp");
				} else {
					session.setAttribute("FailedMsg", "Invalid Email or password");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
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