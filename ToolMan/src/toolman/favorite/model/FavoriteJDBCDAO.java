package toolman.favorite.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoriteJDBCDAO implements FavoriteDAO_interface {

	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Toolman";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_MANAGER = "INSERT INTO favorite ( c_id, m_id) "
			+ "VALUES (?,?)";
	
	private static final String DELETE = "DELETE FROM favorite WHERE f_id = ?";
	private static final String GETONE = "SELECT f_id,  c_id, m_id FROM favorite WHERE f_id = ?";
	private static final String GETALL = "SELECT f_id,  c_id, m_id FROM favorite ORDER BY f_id";

	@Override
	public void insert(FavoriteVO favoriteVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_MANAGER);

			
			pstmt.setString(1, favoriteVO.getC_id());
			pstmt.setInt(2, favoriteVO.getM_id());
			

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
	public void delete(Integer F_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, F_id);

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
	public FavoriteVO findByPrimaryKey(Integer F_id) {

		FavoriteVO favoriteVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETONE);
			pstmt.setInt(1, F_id);
			rs = pstmt.executeQuery();

		
			
			
			
			while (rs.next()) {
				favoriteVO = new FavoriteVO();
				favoriteVO.setF_id(rs.getInt("f_id"));
				favoriteVO.setC_id(rs.getString("c_id"));
				favoriteVO.setM_id(rs.getInt("m_id"));
				
			
				
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
		return favoriteVO;
	}

	@Override
	public List<FavoriteVO> getAllFavorite() {
		List<FavoriteVO> list = new ArrayList<FavoriteVO>();
		FavoriteVO favoriteVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				favoriteVO = new FavoriteVO();
				favoriteVO.setF_id(rs.getInt("f_id"));
				favoriteVO.setC_id(rs.getString("c_id"));
				favoriteVO.setM_id(rs.getInt("m_id"));
				
				list.add(favoriteVO);
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

		FavoriteJDBCDAO dao = new FavoriteJDBCDAO();

		/************************** 測試新增 ****************************/
		FavoriteVO favoriteVO = new FavoriteVO();
		
		favoriteVO.setC_id("Snoopy");
		favoriteVO.setM_id(1001);
		
		dao.insert(favoriteVO);

		/************************** 測試修改 ****************************/


		
		/************************** 測試刪除 ****************************/
//		 dao.delete(12001);

		/************************** 測試單筆查詢 ****************************/
//		RdataVO rdataVO3 = dao.findByPrimaryKey(12001);
//		System.out.print(favoriteVO3.getF_id() + ",");

//		System.out.print(favoriteVO3.getC_id() + ",");
//	System.out.print(favoriteVO3.getM_id() + ",");

		
//		System.out.println("---------------------------------------------------------"
//				+ "---------------------------------------------------------");

		/************************** 測試多筆查詢 ****************************/
		 List<FavoriteVO> list =dao.getAllFavorite();
		 for(FavoriteVO mda : list){
		System.out.print(mda.getF_id() + ",");
	
		System.out.print(mda.getC_id() + ",");
		System.out.print(mda.getM_id() + ",");

		
		 System.out.println("---------------------------------------------------------"
		 + "---------------------------------------------------------");
		 }

	}
}
