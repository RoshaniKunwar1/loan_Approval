package Com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Com.User.UserDetails;

public class UserDao{
	private Connection conn;
	
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(UserDetails us) {
		boolean b = false;
		try {
			String query = "Insert into user(name, email,phone, password) values(?,?,?,?)";
			PreparedStatement pstmt  = conn.prepareStatement(query);
			pstmt.setString(1,us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setDouble(3, us.getPhone());
			pstmt.setString(4, us.getPassword());
			
			if(pstmt.executeUpdate() == 1) {
				b = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public UserDetails loginUser(UserDetails us) {
		UserDetails user = null;
		try {
			String query = "Select * from user where email=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1,us.getEmail());
			pstmt.setString(2, us.getPassword());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user = new UserDetails();
				user.setId(rs.getInt("idUser"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getDouble("phone"));
				user.setPassword("password");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}