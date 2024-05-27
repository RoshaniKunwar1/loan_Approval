package Com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Com.User.loan;


public class loanDao {
	private Connection conn;

	public loanDao(Connection conn) {
		this.conn = conn;
	}

	public boolean addLoan(String name, String email, String phone, String address, String province, String haveAccout,
			String loanType, String incomeSource, String otherBank, String photoName,int id2,String income, String months, String lalpurja) {
		boolean f = false;
		try {
			String query = "Insert into loan(name, email, phone, address, province, haveAccount, loanType, incomeSource, otherLoan,photoName,idUser,time,amount,lalpurja) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, province);
			pstmt.setString(6, haveAccout);
			pstmt.setString(7, loanType);
			pstmt.setString(8, incomeSource);
			pstmt.setString(9, otherBank);
			pstmt.setString(10, photoName);
			pstmt.setInt(11, id2);
			pstmt.setString(12, months);
			pstmt.setString(13, income);
			pstmt.setString(14, lalpurja);
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
	
	
	public boolean editLoan(int id, String name, String email, String phone, String address, String province, String haveAccout,
			String loanType, String incomeSource, String otherBank,String photoName,int id2,String income, String months, String lalpurja) {
		boolean f = false;
		try {
			String query = "Update loan set name=?, email = ?, phone = ?, address =?, province=?, haveAccount=?, loanType=?, incomeSource=?, otherLoan=?, photoName=?, idUser=?,time=?, amount=?,lalpurja=? where id1=? ";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, province);
			pstmt.setString(6, haveAccout);
			pstmt.setString(7, loanType);
			pstmt.setString(8, incomeSource);
			pstmt.setString(9, otherBank);
			pstmt.setString(10, photoName);
			pstmt.setInt(11, id2);
			pstmt.setString(12, months);
			pstmt.setString(13, income);
			pstmt.setString(14, lalpurja);
			pstmt.setInt(15, id);
			
			if(pstmt.executeUpdate() == 1) {
				f = true;
			}
					}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public boolean editLoanApproval(int id, String name,String approval,String feedback) {
		boolean f = false;
		try {
			String query = "Update loan set name=? ,approval=?,feedback=? where id1=? ";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, approval);
			pstmt.setString(3, feedback);
			pstmt.setInt(4, id);
			
			if(pstmt.executeUpdate() == 1) {
				f = true;
			}
					}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<loan> getData(){
		List<loan> list = new ArrayList<loan>();
		loan po;
		try {
			String query = "Select * from loan ";
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new loan();
				po.setId(rs.getInt("id1"));
				po.setName(rs.getString(2));
				po.setEmail(rs.getString(3));
				po.setPhone(rs.getString(4));
				po.setAddress(rs.getString(5));
				po.setProvince(rs.getString(6));
				po.setHaveAccout(rs.getString(7));
				po.setLoanType(rs.getString(8));
				po.setIncomeSource(rs.getString(9));
				po.setOtherBankLoan(rs.getString(10));
				po.setPhotoName(rs.getString(11));
				po.setFeedback(rs.getString(13));
				po.setApproval(rs.getString(14));
				po.setMonths(rs.getString("time"));
				po.setIncome(rs.getString("amount"));
				po.setLalpurja(rs.getString("lalpurja"));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	
	public List<loan> getDataUser(int id){
		List<loan> list = new ArrayList<loan>();
		loan po;
		try {
			String query = "Select * from loan where idUser=? ";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new loan();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setFeedback(rs.getString(13));
				po.setApproval(rs.getString(14));
				po.setLoanType(rs.getString("loanType"));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	
	public loan getDataById(int id) {
		loan po = null;
		try {
			String query = "Select * from loan where id1=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				po = new loan();
				po.setId(rs.getInt("id1"));
				po.setName(rs.getString(2));
				po.setEmail(rs.getString(3));
				po.setPhone(rs.getString(4));
				po.setAddress(rs.getString(5));
				po.setProvince(rs.getString(6));
				po.setHaveAccout(rs.getString(7));
				po.setLoanType(rs.getString(8));
				po.setIncomeSource(rs.getString(9));
				po.setOtherBankLoan(rs.getString(10));
				po.setPhotoName(rs.getString(11));
				po.setMonths(rs.getString("time"));
				po.setIncome(rs.getString("amount"));
				po.setLalpurja(rs.getString("lalpurja"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return po;
	}
	
	public loan getDataByIdUser(int id) {
		loan po = null;
		try {
			String query = "Select * from loan where idUser=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				po = new loan();
				po.setId(rs.getInt("id1"));
				po.setFeedback(rs.getString("feedback"));
				po.setApproval(rs.getString("approval"));
				po.setLoanType(rs.getString("loanType"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return po;
	}
	
	public boolean deleteRegist(int id) {
		boolean f = false;
		
		try {
			String query ="Delete from loan where id1= ?";
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