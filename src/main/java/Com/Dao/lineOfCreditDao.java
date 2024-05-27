/*
 * package Com.Dao;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.util.ArrayList; import java.util.List;
 * 
 * import Com.User.lineOfCredit;
 * 
 * 
 * public class lineOfCreditDao { private Connection conn;
 * 
 * public lineOfCreditDao(Connection conn) { this.conn = conn; }
 * 
 * public boolean addCredit(int id, String name, double fundNeeded, double
 * fundWithdrawl, double fundAvilable, int interest, int commitmentFee, int
 * totalDue) { boolean f = false; try { String query =
 * "Insert into credit(id, name, fundNeeded, fundWithdrawl, fundAvilable,interest, commitmentFee, totalDue) values(?,?,?,?,?,?,?,?)"
 * ; PreparedStatement pstmt = conn.prepareStatement(query); pstmt.setInt(1,
 * id); pstmt.setString(2, name); pstmt.setDouble(3, fundNeeded);
 * pstmt.setDouble(4, fundWithdrawl); pstmt.setDouble(5, fundAvilable);
 * pstmt.setInt(6, interest); pstmt.setInt(7, commitmentFee); pstmt.setFloat(8,
 * totalDue);
 * 
 * if(pstmt.executeUpdate() == 1) {
 * 
 * f=true; }else { System.out.println("not inserted"); } }catch (Exception e) {
 * e.printStackTrace(); } return f; }
 * 
 * public boolean editCredit(int id, String name, double fundNeeded, double
 * fundWithdrawl, double fundAvilable, int interest, int commitmentFee, int
 * totalDue) { boolean f = false; try { String query =
 * "Update credit set name=?, fundNeeded=?, fundWithdrawl=?, fundAvilable=?,interest=?, commitmentFee=?,totalDue=? where id=?"
 * ; PreparedStatement pstmt = conn.prepareStatement(query); pstmt.setString(1,
 * name); pstmt.setDouble(2, fundNeeded); pstmt.setDouble(3, fundWithdrawl);
 * pstmt.setDouble(4, fundAvilable); pstmt.setInt(5, interest); pstmt.setInt(6,
 * commitmentFee); pstmt.setFloat(7, totalDue);
 * 
 * pstmt.setInt(8, id); if(pstmt.executeUpdate() == 1) { f=true; }else {
 * System.out.println("not inserted"); } }catch (Exception e) {
 * e.printStackTrace(); } return f; }
 * 
 * 
 * public List<lineOfCredit> getData(){ List<lineOfCredit> list = new
 * ArrayList<lineOfCredit>(); lineOfCredit po; try { String query =
 * "Select * from credit"; PreparedStatement pstmt =
 * conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery();
 * while(rs.next()) { po = new lineOfCredit(); po.setId(rs.getInt(1));
 * po.setName(rs.getString(2)); po.setFundNeeded(rs.getDouble(3));
 * po.setFundWithdrawl(rs.getDouble(4)); po.setFundAvilable(rs.getDouble(5));
 * po.setInterest(rs.getInt(6)); po.setCommitmentFee(rs.getInt(7));
 * po.setTotalDue(rs.getFloat(8));
 * 
 * list.add(po); } }catch(Exception e) { e.printStackTrace(); } return list; }
 * 
 * 
 * public lineOfCredit getDataById(int id) { lineOfCredit po = null; try {
 * String query = "Select * from credit where id=?"; PreparedStatement pstmt =
 * conn.prepareStatement(query); pstmt.setInt(1, id);
 * 
 * ResultSet rs = pstmt.executeQuery();
 * 
 * while(rs.next()) { po = new lineOfCredit(); po.setId(rs.getInt(1));
 * po.setName(rs.getString(2)); po.setFundNeeded(rs.getDouble(3));
 * po.setFundWithdrawl(rs.getDouble(4)); po.setFundAvilable(rs.getDouble(5));
 * po.setInterest(rs.getInt(6)); po.setCommitmentFee(rs.getInt(7));
 * po.setTotalDue(rs.getFloat(8));
 * 
 * } }catch(Exception e) { e.printStackTrace(); }
 * 
 * return po; }
 * 
 * 
 * public boolean deleteLoan(int id) { boolean f = false;
 * 
 * try { String query ="Delete from credit where id= ?"; PreparedStatement pstmt
 * = conn.prepareStatement(query); pstmt.setInt(1, id); if(pstmt.executeUpdate()
 * ==1) { f=true; } }catch(Exception e) { e.printStackTrace(); } return f; }
 * 
 * }
 */