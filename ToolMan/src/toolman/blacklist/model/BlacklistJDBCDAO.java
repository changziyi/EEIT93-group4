package toolman.blacklist.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlacklistJDBCDAO implements BlacklistDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Toolman";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_MANAGER = "INSERT INTO blacklist ( c_id, m_id) "
			+ "VALUES (?,?)";
	
	private static final String DELETE = "DELETE FROM blacklist WHERE bk_id = ?";
	private static final String GETONE = "SELECT bk_id,  c_id, m_id FROM blacklist WHERE bk_id = ?";
	private static final String GETALL = "SELECT bk_id,  c_id, m_id FROM blacklist ORDER BY bk_id";

	@Override
	public void insert(BlacklistVO blacklistVO) {
		// TODO Auto-generated method stub
		// 新增
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_MANAGER);

			
			pstmt.setString(1, blacklistVO.getC_id());
			pstmt.setInt(2, blacklistVO.getM_id());
			

			int num = pstmt.executeUpdate();
			System.out.println("已新增" + num + "筆資料");

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}


	@Override
	public void delete(Integer Bk_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, Bk_id);

			int num = pstmt.executeUpdate();
			System.out.println("已刪除" + num + "筆資料");

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public BlacklistVO findByPrimaryKey(Integer Bk_id) {
		// TODO Auto-generated method stub

		BlacklistVO blacklistVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETONE);
			pstmt.setInt(1, Bk_id);
			rs = pstmt.executeQuery();

		
			
			
			
			while (rs.next()) {
				blacklistVO = new BlacklistVO();
				blacklistVO.setBk_id(rs.getInt("bk_id"));
				blacklistVO.setC_id(rs.getString("c_id"));
				blacklistVO.setM_id(rs.getInt("m_id"));
				
			
				
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return blacklistVO;
	}

	@Override
	public List<BlacklistVO> getAllBlacklist() {
		// TODO Auto-generated method stub
		List<BlacklistVO> list = new ArrayList<BlacklistVO>();
		BlacklistVO blacklistVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				blacklistVO = new BlacklistVO();
				blacklistVO.setBk_id(rs.getInt("bk_id"));
				blacklistVO.setC_id(rs.getString("c_id"));
				blacklistVO.setM_id(rs.getInt("m_id"));
				
				list.add(blacklistVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String args[]) throws IOException {

		BlacklistJDBCDAO dao = new BlacklistJDBCDAO();

		/************************** 測試新增 ****************************/
		BlacklistVO blacklistVO = new BlacklistVO();
		
		blacklistVO.setC_id("1001");
		blacklistVO.setM_id(1001);
		
		dao.insert(blacklistVO);

		/************************** 測試修改 ****************************/


		
		/************************** 測試刪除 ****************************/
//		 dao.delete(13001);

		/************************** 測試單筆查詢 ****************************/
//		RdataVO rdataVO3 = dao.findByPrimaryKey(12001);
//		System.out.print(blacklistVO3.getBk_id() + ",");

//		System.out.print(blacklistVO3.getC_id() + ",");
//	System.out.print(blacklistVO3.getM_id() + ",");

		
//		System.out.println("---------------------------------------------------------"
//				+ "---------------------------------------------------------");

		/************************** 測試多筆查詢 ****************************/
		 List<BlacklistVO> list =dao.getAllBlacklist();
		 for(BlacklistVO mda : list){
		System.out.print(mda.getBk_id() + ",");
	
		System.out.print(mda.getC_id() + ",");
		System.out.print(mda.getM_id() + ",");

		
		 System.out.println("---------------------------------------------------------"
		 + "---------------------------------------------------------");
		 }

	}
}
