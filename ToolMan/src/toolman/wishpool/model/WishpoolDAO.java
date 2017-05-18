package toolman.wishpool.model;

import java.util.*;
import java.io.ByteArrayInputStream;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.criteria.Order;
import javax.sql.DataSource;

public class WishpoolDAO implements WishpoolDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO wishpool (c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT w_id,c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date FROM wishpool order by w_id";
	private static final String GET_ALLBYDATE_STMT = "SELECT w_id,c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date FROM wishpool order by w_date desc";
	private static final String GET_ONE_STMT = "SELECT w_id,c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date FROM wishpool where w_id = ?";
	private static final String DELETE = "DELETE FROM wishpool where w_id = ?";
	private static final String UPDATE = "UPDATE wishpool set c_id=?, w_content=?, w_image=?, w_pro=?, s_name=?, w_city=?, w_district=?, w_date=? where w_id = ?";

	@Override
	public void insert(WishpoolVO wishpoolVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, wishpoolVO.getC_id());
			pstmt.setString(2, wishpoolVO.getW_content());

			byte[] bsource = wishpoolVO.getW_image();
			pstmt.setBytes(3, wishpoolVO.getW_image());
			// ByteArrayInputStream bis = new ByteArrayInputStream(bsource);
			// pstmt.setBinaryStream(3,bis);
			// 上傳圖片的另一種方法
			pstmt.setString(4, wishpoolVO.getW_pro());
			pstmt.setString(5, wishpoolVO.getS_name());
			pstmt.setString(6, wishpoolVO.getW_city());
			pstmt.setString(7, wishpoolVO.getW_district());
			pstmt.setTimestamp(8, wishpoolVO.getW_date());

			pstmt.executeUpdate();

			// Handle any driver errors 捕捉資料庫錯誤
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, wishpoolVO.getC_id());
			pstmt.setString(2, wishpoolVO.getW_content());
			byte[] bsource = wishpoolVO.getW_image();
			pstmt.setBytes(3, wishpoolVO.getW_image());
			pstmt.setString(4, wishpoolVO.getW_pro());
			pstmt.setString(5, wishpoolVO.getS_name());
			pstmt.setString(6, wishpoolVO.getW_city());
			pstmt.setString(7, wishpoolVO.getW_district());
			pstmt.setTimestamp(8, wishpoolVO.getW_date());
			pstmt.setInt(9, wishpoolVO.getW_id());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, w_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, w_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
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
				// SELECT
				// w_id,c_id,w_con,w_image,w_pro,s_name,w_city,w_district,w_date
				// FROM wishpool order by w_id"
				list.add(wishpoolVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public List<WishpoolVO> getAllByDate(String order, String city) {
		List<WishpoolVO> list_date = new ArrayList<WishpoolVO>();
		WishpoolVO wishpoolVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			StringBuilder sql = new StringBuilder("SELECT w_id,c_id,w_content,w_image,w_pro,s_name,w_city,w_district,w_date FROM wishpool");
			
			if (city != null && city.length() > 0) {
				sql.append(" where w_city = ? ");
			}
			
			if ("asc".equals(order)) {
				sql.append(" order by w_date asc");
			} else {
				sql.append(" order by w_date desc");
			}
			
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			
			if (city != null && city.length() > 0) {
				pstmt.setString(0, city);
			}
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
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
				// SELECT
				// w_id,c_id,w_con,w_image,w_pro,s_name,w_city,w_district,w_date
				// FROM wishpool order by w_date desc"
				list_date.add(wishpoolVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list_date;
	}
	

}