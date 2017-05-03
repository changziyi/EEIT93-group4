package toolman.cdata.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CdataJNDIDAO implements CdataDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_CDATA = "INSERT INTO cdata (c_id, c_pwd, c_name, c_cel, c_email, c_city, c_district,"
			+ "c_addr, c_birth, c_rating, c_finished, c_jdate) VALUES (?,?,?,?,?,?,?,?,?,?,?,getdate())";
	private static final String INSERT_CDATA_All = "INSERT INTO cdata (c_id, c_pwd, c_name, c_cel, c_email, c_city, c_district,"
			+ "c_addr, c_jdate, c_rating, s_name, c_fb, c_google, sa_cnote, c_birth, c_finished) "
			+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
	private static final String UPDATE ="UPDATE cdata set c_pwd=?, c_name=?, c_cel=?, c_email=?, c_city=?, c_district=?,"
			+ "c_addr=?, c_jdate=?, c_rating=?, s_name=?, c_fb=?, c_google=?, sa_cnote=?, c_birth=?, "
			+ "c_finished=? WHERE c_id = ?";
	private static final String DELETE = "DELETE FROM cdata WHERE c_id = ?";
	private static final String GETONE = "SELECT c_id, c_pwd, c_name, c_cel, c_email, c_city, c_district, c_addr, c_jdate,"
			+ "c_rating, m_id, s_name, c_fb, c_google, sa_cnote, c_birth, c_finished FROM cdata WHERE c_id = ?";
	private static final String GETALL = "SELECT c_id, c_pwd, c_name, c_cel, c_email, c_city, c_district, c_addr, c_jdate, c_rating,"
			+ "m_id, s_name, c_fb, c_google, sa_cnote, c_birth, c_finished FROM cdata ORDER BY c_id";
	
	
	@Override
	public CdataVO login_in(String c_id) {
		// TODO Auto-generated method stub
		CdataVO cdataVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();		
			pstmt = con.prepareStatement(GETONE);
			pstmt.setString(1,c_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				cdataVO = new CdataVO();
				cdataVO.setC_id(rs.getString("c_id"));				
				cdataVO.setC_name(rs.getString("c_name"));
				cdataVO.setC_pwd(rs.getString("c_pwd"));
				cdataVO.setC_cel(rs.getString("c_cel"));
				cdataVO.setC_email(rs.getString("c_email"));
				cdataVO.setC_city(rs.getString("c_city"));
				cdataVO.setC_district(rs.getString("c_district"));
				cdataVO.setC_addr(rs.getString("c_addr"));
				cdataVO.setC_jdate(rs.getTimestamp("c_jdate"));
				cdataVO.setC_rating(rs.getInt("c_rating"));
				cdataVO.setM_id(rs.getInt("m_id"));
				cdataVO.setS_name(rs.getString("s_name"));
				cdataVO.setC_fb(rs.getString("c_fb"));
				cdataVO.setC_google(rs.getString("c_google"));
				cdataVO.setSa_cnote(rs.getString("sa_cnote"));
				cdataVO.setC_birth(rs.getDate("c_birth"));
				cdataVO.setC_finished(rs.getInt("c_finished"));				
			}
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
		return cdataVO;
	}	
					
	@Override
	public void insert(CdataVO cdataVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_CDATA);

			pstmt.setString(1, cdataVO.getC_id());
			pstmt.setString(2, cdataVO.getC_pwd());
			pstmt.setString(3, cdataVO.getC_name());		
			pstmt.setString(4, cdataVO.getC_cel());
			pstmt.setString(5, cdataVO.getC_email());
			pstmt.setString(6, cdataVO.getC_city());
			pstmt.setString(7, cdataVO.getC_district());
			pstmt.setString(8, cdataVO.getC_addr());
			pstmt.setDate(9, cdataVO.getC_birth());
			pstmt.setInt(10, cdataVO.getC_rating());
			pstmt.setInt(11, cdataVO.getC_finished());
			
			int num = pstmt.executeUpdate();
			System.out.println("已新增" + num + "筆資料");

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
	public void update(CdataVO cdataVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, cdataVO.getC_pwd());
			pstmt.setString(2, cdataVO.getC_name());		
			pstmt.setString(3, cdataVO.getC_cel());
			pstmt.setString(4, cdataVO.getC_email());
			pstmt.setString(5, cdataVO.getC_city());
			pstmt.setString(6, cdataVO.getC_district());
			pstmt.setString(7, cdataVO.getC_addr());
			pstmt.setTimestamp(8, cdataVO.getC_jdate());
			pstmt.setInt(9, cdataVO.getC_rating());			
			pstmt.setString(10, cdataVO.getS_name());
			pstmt.setString(11, cdataVO.getC_fb());
			pstmt.setString(12, cdataVO.getC_google());
			pstmt.setString(13, cdataVO.getSa_cnote());
			pstmt.setDate(14, cdataVO.getC_birth());
			pstmt.setInt(15, cdataVO.getC_finished());
			pstmt.setString(16, cdataVO.getC_id());
			int num = pstmt.executeUpdate();
			System.out.println("已修改" + num + "筆資料");

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
	public void delete(String c_id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, c_id);

			int num = pstmt.executeUpdate();
			System.out.println("已刪除" + num + "筆資料");

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
	public List<CdataVO> getAll() {
		// TODO Auto-generated method stub
		List<CdataVO> list = new ArrayList<CdataVO>();
		CdataVO cdataVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cdataVO = new CdataVO();
				cdataVO.setC_id(rs.getString("c_id"));
				cdataVO.setC_name(rs.getString("c_name"));
				cdataVO.setC_pwd(rs.getString("c_pwd"));
				cdataVO.setC_cel(rs.getString("c_cel"));
				cdataVO.setC_email(rs.getString("c_email"));
				cdataVO.setC_city(rs.getString("c_city"));
				cdataVO.setC_district(rs.getString("c_district"));
				cdataVO.setC_addr(rs.getString("c_addr"));
				cdataVO.setC_jdate(rs.getTimestamp("c_jdate"));
				cdataVO.setC_rating(rs.getInt("c_rating"));
				cdataVO.setM_id(rs.getInt("m_id"));
				cdataVO.setS_name(rs.getString("s_name"));
				cdataVO.setC_fb(rs.getString("c_fb"));
				cdataVO.setC_google(rs.getString("c_google"));
				cdataVO.setSa_cnote(rs.getString("sa_cnote"));
				cdataVO.setC_birth(rs.getDate("c_birth"));
				cdataVO.setC_finished(rs.getInt("c_finished"));
				list.add(cdataVO);
			}
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
	
	public static void main(String args[]){
		
		CdataJNDIDAO dao = new CdataJNDIDAO();
		
		/**************************** 測試新增 ********************************/	
		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_id("1010");
//		cdataVO.setC_pwd(123456);
//		cdataVO.setC_name("泡芙阿姨");
//		cdataVO.setC_cel("0987252555");
//		cdataVO.setC_email("ffff@gmail.com");
//		cdataVO.setC_city("新北市");
//		cdataVO.setC_district("永和區");
//		cdataVO.setC_addr("中和路125號3樓");
//		cdataVO.setC_jdate(java.sql.Date.valueOf("2017-02-08"));
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		dao.insert(cdataVO);			
		
		/**************************** 測試新增All ********************************/	
		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_id("1006");
//		cdataVO.setC_pwd(123456);
//		cdataVO.setC_name("泡芙阿姨");
//		cdataVO.setC_cel("0987252555");
//		cdataVO.setC_email("ffff@gmail.com");
//		cdataVO.setC_city("新北市");
//		cdataVO.setC_district("永和區");
//		cdataVO.setC_addr("中和路125號3樓");
//		cdataVO.setC_jdate(java.sql.Date.valueOf("2017-02-08"));
//		cdataVO.setC_rating(0);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		dao.insert(cdataVO);		
		
		/**************************** 測試修改 ********************************/
		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_pwd(123456);
//		cdataVO.setC_name("泡芙阿姨1");
//		cdataVO.setC_cel("0987252555");
//		cdataVO.setC_email("ffff@gmail.com");
//		cdataVO.setC_city("新北市");
//		cdataVO.setC_district("永和區");
//		cdataVO.setC_addr("中和路125號3樓");
//		cdataVO.setC_jdate(java.sql.Date.valueOf("2017-02-08"));
//		cdataVO.setC_rating(0);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		cdataVO.setC_id("1006");
//		dao.update(cdataVO);		
				
		/**************************** 測試刪除 ********************************/
		
//		dao.delete("1004");

		/************************** 測試多筆查詢 ******************************/
		
//		List<CdataVO> list =dao.getAll();
//		for(CdataVO mda : list){
//			
//			System.out.print(mda.getC_id() + ",");
//			System.out.print(mda.getC_pwd() + ",");
//			System.out.print(mda.getC_name()+ ",");
//			System.out.print(mda.getC_cel() + ",");
//			System.out.print(mda.getC_email() + ",");
//			System.out.print(mda.getC_city() + ",");
//			System.out.print(mda.getC_district() + ",");
//			System.out.print(mda.getC_addr() + ",");
//			System.out.print(mda.getC_jdate() + ",");
//			System.out.print(mda.getC_rating() + ",");
//			System.out.print(mda.getM_id() + ",");
//			System.out.print(mda.getS_name() + ",");
//			System.out.print(mda.getC_fb() + ",");
//			System.out.print(mda.getC_google() + ",");
//			System.out.print(mda.getSa_cnote() + ",");
//			System.out.println(mda.getC_birth());
//			System.out.println("---------------------------------------------------------"
//					+ "---------------------------------------------------------");					
//		}

			
	}
}
