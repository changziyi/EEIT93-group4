package toolman.wishpool.model;

import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;

public class WishpoolJDBCDAO implements WishpoolDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=ToolMan";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO wishpool (c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT w_id,c_id,w_content,w_pro,s_name,w_city,w_district,w_date FROM wishpool order by w_id";
	private static final String GET_ONE_STMT =
		      "SELECT w_id,c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date FROM wishpool where w_id = ?";
	private static final String DELETE =
		      "DELETE FROM wishpool where w_id = ?";
	private static final String UPDATE =
		      "UPDATE wishpool set c_id=?, w_content=?, w_image=?, w_pro=?, s_name=?, w_city=?, w_district=?, w_date=? where w_id = ?";


	@Override
	public void insert(WishpoolVO wishpoolVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, wishpoolVO.getC_id());
			pstmt.setString(2, wishpoolVO.getW_content());
			pstmt.setBytes(3, wishpoolVO.getW_image());
			pstmt.setString(4, wishpoolVO.getW_pro());
			pstmt.setString(5, wishpoolVO.getS_name());
			pstmt.setString(6, wishpoolVO.getW_city());
			pstmt.setString(7, wishpoolVO.getW_district());
			pstmt.setTimestamp(8, wishpoolVO.getW_date());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void update(WishpoolVO wishpoolVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, wishpoolVO.getC_id());
			pstmt.setString(2, wishpoolVO.getW_content());
			pstmt.setBytes(3, wishpoolVO.getW_image());
			pstmt.setString(4, wishpoolVO.getW_pro());
			pstmt.setString(5, wishpoolVO.getS_name());
			pstmt.setString(6, wishpoolVO.getW_city());
			pstmt.setString(7, wishpoolVO.getW_district());
			pstmt.setTimestamp(8, wishpoolVO.getW_date());
			pstmt.setInt(9, wishpoolVO.getW_id());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void delete(Integer w_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, w_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public WishpoolVO findByPrimaryKey(Integer w_id) {

		WishpoolVO wishpoolVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, w_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				wishpoolVO = new WishpoolVO();
				wishpoolVO.setW_id(rs.getInt("W_id"));
				wishpoolVO.setC_id(rs.getString("C_id"));
				wishpoolVO.setW_content(rs.getString("W_content"));
				wishpoolVO.setW_image(rs.getBytes("W_image"));
				wishpoolVO.setW_pro(rs.getString("W_pro"));
				wishpoolVO.setS_name(rs.getString("S_name"));
				wishpoolVO.setW_city(rs.getString("W_city"));
				wishpoolVO.setW_district(rs.getString("W_district"));
				wishpoolVO.setW_date(rs.getTimestamp("W_date"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return wishpoolVO;
	}

	@Override
	public List<WishpoolVO> getAll() {
		List<WishpoolVO> list = new ArrayList<WishpoolVO>();
		WishpoolVO wishpoolVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				wishpoolVO = new WishpoolVO();
				wishpoolVO.setW_id(rs.getInt("W_id"));
				wishpoolVO.setC_id(rs.getString("C_id"));
				wishpoolVO.setW_content(rs.getString("W_content"));
				wishpoolVO.setW_image(rs.getBytes("W_image"));
				wishpoolVO.setW_pro(rs.getString("W_pro"));
				wishpoolVO.setS_name(rs.getString("S_name"));
				wishpoolVO.setW_city(rs.getString("W_city"));
				wishpoolVO.setW_district(rs.getString("W_district"));
				wishpoolVO.setW_date(rs.getTimestamp("W_date")); // Store the row in the list
				list.add(wishpoolVO);
			}
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) throws IOException {

		WishpoolJDBCDAO dao = new WishpoolJDBCDAO();
		
		File file = new File("WebContent/images/Penguins.jpg");
		FileInputStream in = new FileInputStream(file);
		byte[] buff = new byte[in.available()];
		in.read(buff);
		in.close();
		
		//新增
		WishpoolVO wishpoolVO1 = new WishpoolVO();;
		wishpoolVO1.setC_id("kitty");
		wishpoolVO1.setW_content("我家天花板會漏水啦");
		wishpoolVO1.setW_image(buff);
		wishpoolVO1.setW_pro("屋頂");
		wishpoolVO1.setS_name("m_pass");
		wishpoolVO1.setW_city("台北市");
		wishpoolVO1.setW_district("北投區");
		wishpoolVO1.setW_date(null);
		
		dao.insert(wishpoolVO1);

		//修改
		WishpoolVO wishpoolVO2 = new WishpoolVO();
		wishpoolVO2.setC_id("eeitjack");
		wishpoolVO2.setW_content("電腦壞了");
		wishpoolVO2.setW_image(null);
		wishpoolVO2.setW_pro("電腦");
		wishpoolVO2.setS_name("m_pass");
		wishpoolVO2.setW_city("新北市");
		wishpoolVO2.setW_district("永和區");
		wishpoolVO2.setW_date(null);
		wishpoolVO2.setW_id(8014);
		dao.update(wishpoolVO2);

		//刪除
	  //  dao.delete(8012);

		// 取得一筆資料
		WishpoolVO wishpoolVO3 = dao.findByPrimaryKey(8001);
		System.out.print(wishpoolVO3.getC_id() + ",");
		System.out.print(wishpoolVO3.getW_content() + ",");
		System.out.print(wishpoolVO3.getW_image() + ",");
		System.out.print(wishpoolVO3.getW_pro() + ",");
		System.out.print(wishpoolVO3.getS_name() + ",");
		System.out.print(wishpoolVO3.getW_city() + ",");
		System.out.print(wishpoolVO3.getW_district() + ",");
		System.out.print(wishpoolVO3.getW_date() + ",");
	 	System.out.println("---------------------");
	
		// 取得全部資料
		List<WishpoolVO> list = dao.getAll();
		for (WishpoolVO allwish : list) {
			System.out.print(allwish.getC_id() + ",");
			//System.out.print(allwish.getW_image() + ",");
			System.out.print(allwish.getW_content() + ",");
			System.out.print(allwish.getW_pro() + ",");
			System.out.print(allwish.getS_name() + ",");
			System.out.print(allwish.getW_city() + ",");
			System.out.print(allwish.getW_district() + ",");
			System.out.print(allwish.getW_date() + ",");
		 }
	}

	@Override
	public List<WishpoolVO> getAllByDate() {
		// TODO Auto-generated method stub
		return null;
	}
}
