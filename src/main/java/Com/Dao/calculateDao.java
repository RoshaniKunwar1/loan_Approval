package Com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Com.User.calculate;
import Com.User.loan;


public class calculateDao {
	private Connection conn;

	public calculateDao(Connection conn) {
		this.conn = conn;
	}

	public boolean addCalculate(int id, String name, String email, String phone, double emi,String amount, double interest, String months,String loantype) {
		boolean f = false;
		try {
			String query = "Insert into calculate(id, name, email, phone, emi,amount, interest, months,loantype) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.setDouble(5, emi);
			pstmt.setString(6, amount);
			pstmt.setDouble(7, interest);
			pstmt.setString(8, months);
			pstmt.setString(9, loantype);
			

	        if(pstmt.executeUpdate() == 1) {
				
				f=true;
			}else {
				System.out.println("not inserted");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return f;
	}

	public boolean editCalculate(int id, String name, String email, String phone, double emi,String amount, double interest, String months,String loantype) {
		boolean f = false;
		try {
			String query = "Update calculate set name=?, email=?, phone=?, emi=?, amount=?,interest=?,months=?,loantype=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setDouble(4, emi);
			pstmt.setString(5, amount);
			pstmt.setDouble(6, interest);
			pstmt.setString(7, months);
			pstmt.setString(8, loantype);
			
			pstmt.setInt(9, id);
	        if(pstmt.executeUpdate() == 1) {
				f=true;
			}else {
				System.out.println("not inserted");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return f;
	}
	
	
	public List<calculate> getData(){
		List<calculate> list = new ArrayList<calculate>();
		calculate po;
		try {
			String query = "Select * from calculate";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new calculate();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setEmail(rs.getString(3));
				po.setPhone(rs.getString(4));
				po.setEmi(rs.getDouble(5));
				po.setAmount(rs.getString(6));
				po.setInterest(rs.getDouble(7));
				po.setMonths(rs.getString(8));
				po.setLoantype(rs.getString(9));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	
	public calculate getDataById(int id) {
		calculate po = null;
		try {
			String query = "Select * from calculate where id=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				po = new calculate();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setEmail(rs.getString(3));
				po.setPhone(rs.getString(4));
				po.setEmi(rs.getDouble(5));
				po.setAmount(rs.getString(6));
				po.setInterest(rs.getDouble(7));
				po.setMonths(rs.getString(8));
				po.setLoantype(rs.getString(9));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return po;
	}
	
	
	public boolean deleteLoan(int id) {
		boolean f = false;
		
		try {
			String query ="Delete from calculate where id= ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			if(pstmt.executeUpdate() ==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
