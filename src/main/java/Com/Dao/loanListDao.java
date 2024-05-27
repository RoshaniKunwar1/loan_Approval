package Com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Com.User.loanList;

public class loanListDao{
	private Connection con;

	public loanListDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean AddApproval( int id1, String name, String approval,int id3) {
		boolean f = false;
		
		try {
			String query = "insert into loanapproval(id1, name, Approval,idThis1) values(?,?,?,?)";
			PreparedStatement pstmt  = con.prepareStatement(query);
			pstmt.setInt(1, id1);
			pstmt.setString(2, name);
			pstmt.setString(3, approval);
			pstmt.setInt(4, id3);

			if(pstmt.executeUpdate() == 1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<loanList> getData(int id){
		List<loanList> list = new ArrayList<loanList>();
		loanList po;
		try {
			String query = "Select * from loanapproval where id1=? ORDER BY id1 DESC LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new loanList();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setApproval(rs.getString(3));
				po.setId3(rs.getInt(5));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public List<loanList> getDataUser(int id){
		List<loanList> list = new ArrayList<loanList>();
		loanList po;
		try {
			String query = "Select * from loanapproval where idThis1=? ORDER BY idThis1 DESC LIMIT 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new loanList();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setApproval(rs.getString(3));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	
	
	
	
	public loanList getDataById(int id1) {
		loanList po = null;
		try {
			String query = "Select * from loanapproval where id1=? ORDER BY id1 DESC LIMIT 1 ";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id1);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				po = new loanList();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setApproval(rs.getString(3));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return po;
	}
	
	
	public loanList getDataByIdUser(int id1) {
		loanList po = null;
		try {
			String query = "Select * from loanapproval where idThis1=? ";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id1);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				po = new loanList();
				po.setId(rs.getInt(1));
				po.setName(rs.getString(2));
				po.setApproval(rs.getString(3));
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return po;
	}
	
	
	
	public boolean postUpdate(int nid, String ti, String cont) {
		boolean f = false;
		try {
			String query = "Update loanapproval set name=?, approval=?  where idThis=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, ti);
			pstmt.setString(2, cont);
			pstmt.setInt(3, nid);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("Updated");
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;	
	}
	
	public boolean deletePost(int nid) {
		boolean f = false;
		
		try {
			String query ="Delete from loanapproval where id1= ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nid);
			if(pstmt.executeUpdate() ==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}