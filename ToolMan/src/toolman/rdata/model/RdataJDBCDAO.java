package toolman.rdata.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RdataJDBCDAO implements RdataDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Toolman";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_MANAGER = "INSERT INTO rdata (r_date, c_id, m_id, p_summary, p_content, s_name, sa_rnote, d_id) "
			+ "VALUES (?,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE rdata set r_date=?, c_id=?, m_id=?, p_summary=?, p_content=?, s_name=?, sa_rnote=?, d_id=? WHERE r_id = ?";
	private static final String DELETE = "DELETE FROM rdata WHERE r_id = ?";
	private static final String GETONE = "SELECT r_id, r_date, c_id, m_id, p_summary, p_content, s_name, sa_rnote, d_id FROM rdata WHERE r_id = ?";
	private static final String GETALL = "SELECT r_id, r_date, c_id, m_id, p_summary, p_content, s_name, sa_rnote, d_id FROM rdata ORDER BY r_id";

	@Override
	public void insert(RdataVO rdataVO) {
		// TODO Auto-generated method stub
		// 新增
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_MANAGER);

			pstmt.setTimestamp(1, rdataVO.getR_date());
			pstmt.setString(2, rdataVO.getC_id());
			pstmt.setInt(3, rdataVO.getM_id());
			pstmt.setString(4, rdataVO.getP_summary());
			pstmt.setString(5, rdataVO.getP_content());
			pstmt.setString(6, rdataVO.getS_name());
			pstmt.setString(7, rdataVO.getSa_rnote());
			pstmt.setInt(8, rdataVO.getD_id());
			

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
	public void update(RdataVO rdataVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setTimestamp(1, rdataVO.getR_date());
			pstmt.setString(2, rdataVO.getC_id());
			pstmt.setInt(3, rdataVO.getM_id());
			pstmt.setString(4, rdataVO.getP_summary());
			pstmt.setString(5, rdataVO.getP_content());
			pstmt.setString(6, rdataVO.getS_name());
			pstmt.setString(7, rdataVO.getSa_rnote());
			pstmt.setInt(8, rdataVO.getD_id());

			int num = pstmt.executeUpdate();
			System.out.println("已修改" + num + "筆資料");

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
	public void delete(Integer R_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, R_id);

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
	public RdataVO findByPrimaryKey(Integer R_id) {
		// TODO Auto-generated method stub

		RdataVO rdataVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETONE);
			pstmt.setInt(1, R_id);
			rs = pstmt.executeQuery();

		
			
			
			
			while (rs.next()) {
				rdataVO = new RdataVO();
				rdataVO.setR_id(rs.getInt("r_id"));
				rdataVO.setR_date(rs.getTimestamp("r_date"));
				rdataVO.setC_id(rs.getString("c_id"));
				rdataVO.setM_id(rs.getInt("m_id"));
				rdataVO.setP_summary(rs.getString("p_summary"));
				rdataVO.setP_content(rs.getString("p_content"));
				rdataVO.setS_name(rs.getString("s_name"));
				rdataVO.setSa_rnote(rs.getString("sa_rnote"));
				rdataVO.setD_id(rs.getInt("d_id"));
			
				
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
		return rdataVO;
	}

	@Override
	public List<RdataVO> getAll() {
		// TODO Auto-generated method stub
		List<RdataVO> list = new ArrayList<RdataVO>();
		RdataVO rdataVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rdataVO = new RdataVO();
				rdataVO.setR_id(rs.getInt("r_id"));
				rdataVO.setR_date(rs.getTimestamp("r_date"));
				rdataVO.setC_id(rs.getString("c_id"));
				rdataVO.setM_id(rs.getInt("m_id"));
				rdataVO.setP_summary(rs.getString("p_summary"));
				rdataVO.setP_content(rs.getString("p_content"));
				rdataVO.setS_name(rs.getString("s_name"));
				rdataVO.setSa_rnote(rs.getString("sa_rnote"));
				rdataVO.setD_id(rs.getInt("d_id"));
				list.add(rdataVO);
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

//	public static void main(String args[]) throws IOException {

//		RdataJDBCDAO dao = new RdataJDBCDAO();

		/************************** 測試新增 ****************************/
//		RdataVO rdataVO = new RdataVO();
//		
//		rdataVO.setR_date(java.sql.Date.valueOf("2017-02-08"));
//		rdataVO.setC_id("1001");
//		rdataVO.setM_id(1001);
//		rdataVO.setP_summary("態度不佳");
//		rdataVO.setP_content("這個人會亂吐檳榔渣，還會罵髒話");
//		rdataVO.setS_name("m_pass");
//		rdataVO.setSa_rnote(null);
//		rdataVO.setD_id(6001);
//		dao.insert(rdataVO);

		/************************** 測試修改 ****************************/

		// 寫入資料庫


//		RdataVO rdataVO2 = new RdataVO();
//		
//		
//		rdataVO2.setR_date(java.sql.Date.valueOf("2017-02-08"));
//		rdataVO2.setC_id("1002");
//		rdataVO2.setM_id(1005);
//		rdataVO2.setP_summary("猥褻下流");
//		rdataVO2.setP_content("這個人猥褻下流，還會罵髒話");
//		rdataVO2.setS_name("m_pass");
//		rdataVO2.setSa_rnote(null);
//		rdataVO2.setD_id(6002);
//		dao.update(rdataVO2);

		
		/************************** 測試刪除 ****************************/
//		 dao.delete(7001);

		/************************** 測試單筆查詢 ****************************/
//		RdataVO rdataVO3 = dao.findByPrimaryKey(7002);
//		System.out.print(rdataVO3.getR_id() + ",");
//		System.out.print(rdataVO3.getR_date() + ",");
//		System.out.print(rdataVO3.getC_id() + ",");
//	System.out.print(rdataVO3.getM_id() + ",");
//		System.out.print(rdataVO3.getP_summary() + ",");
//		System.out.print(rdataVO3.getP_content() + ",");
//		System.out.print(rdataVO3.getS_name() + ",");
//		System.out.print(rdataVO3.getSa_rnote() + ",");
//		System.out.print(rdataVO3.getD_id());
		
//		System.out.println("---------------------------------------------------------"
//				+ "---------------------------------------------------------");

		/************************** 測試多筆查詢 ****************************/
//		 List<RdataVO> list =dao.getAll();
//		 for(RdataVO mda : list){
//		System.out.print(mda.getR_id() + ",");
//		System.out.print(mda.getR_date() + ",");
//		System.out.print(mda.getC_id() + ",");
//		System.out.print(mda.getM_id() + ",");
//		System.out.print(mda.getP_summary() + ",");
//		System.out.print(mda.getP_content() + ",");
//		System.out.print(mda.getS_name() + ",");
//		System.out.print(mda.getSa_rnote() + ",");
//		System.out.print(mda.getD_id());
//		
//		 System.out.println("---------------------------------------------------------"
//		 + "---------------------------------------------------------");
//		 }

	}
}
