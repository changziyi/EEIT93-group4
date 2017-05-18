package toolman.ad.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;
import toolman.wishpool.model.WishpoolVO;

public class AdDAO implements AdDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ToolMan");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO ad (m_id,ad_bdate,ad_enddate,s_name) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ad_id,m_id,ad_bdate,ad_enddate,s_name FROM ad order by ad_id";
	private static final String GET_ONE_STMT = "SELECT ad_id,m_id,ad_bdate,ad_enddate,s_name FROM ad where ad_id = ?";
	private static final String DELETE = "DELETE FROM ad where ad_id = ?";
	private static final String UPDATE = "UPDATE ad set m_id=?, ad_bdate=?, ad_enddate=?, s_name=?, where ad_id = ?";
	private static final String GET_BY_SNAME = "SELECT ad_id,m_id,ad_bdate,ad_enddate,s_name FROM ad where s_name = ?";
//	private static final String GET_ALL_BY_SNAME = "SELECT ad_id,m_id,ad_bdate,ad_enddate,s_name FROM ad where s_name = ? order by newid()";
	private static final String GET_ALL_BY_SNAME = "SELECT m.m_id,m.m_city,m.m_district,m.b_name,m.m_arating,m.o_finished,a.ad_id,a.s_name,a.ad_bdate,a.ad_enddate FROM ad a inner join mdata m on a.m_id = m.m_id where a.s_name = ? order by newid()";
	private static final String GET_ALL_BY_SNAME_AND_DATE = "SELECT * FROM ad WHERE s_name = ? AND ad_bdate=?";
	private static final String UPDATE_AS_DELETED = "UPDATE ad set s_name=? where ad_id = ?";//tested ok

	@Override
	public void insert(AdVO adVO) {
		
	
		Connection con = null;
		PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setInt(1, adVO.getM_id());
				pstmt.setTimestamp(2, adVO.getAd_bdate());
				pstmt.setTimestamp(3, adVO.getAd_enddate());
				pstmt.setString(4, adVO.getS_name());
				
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
	public void update(AdVO adVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, adVO.getAd_id());
			pstmt.setInt(2, adVO.getM_id());
			pstmt.setTimestamp(3, adVO.getAd_bdate());
			pstmt.setTimestamp(4, adVO.getAd_enddate());
			pstmt.setString(5, adVO.getS_name());

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
	public void delete(Integer ad_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, ad_id);

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
	public AdVO findByPrimaryKey(Integer ad_id) {
		
		AdVO adVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, ad_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_id(rs.getInt("Ad_id"));
				adVO.setM_id(rs.getInt("M_id"));
				adVO.setAd_bdate(rs.getTimestamp("Ad_bdate"));
				adVO.setAd_enddate(rs.getTimestamp("Ad_enddate"));
				adVO.setS_name(rs.getString("S_name"));
			
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
		return adVO;
	}

	@Override
	public List<AdVO> getAll() {
		
		List<AdVO> list = new ArrayList<AdVO>();
		AdVO adVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_id(rs.getInt("Ad_id"));
				adVO.setM_id(rs.getInt("M_id"));
				adVO.setAd_bdate(rs.getTimestamp("Ad_bdate"));
				adVO.setAd_enddate(rs.getTimestamp("Ad_enddate"));
				adVO.setS_name(rs.getString("S_name"));
				list.add(adVO); // Store the row in the list
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
	
	// benny
	@Override
	public List<AdVO> getBySname(String s_name) {
		List<AdVO> adVOlist = new ArrayList<AdVO>();
		AdVO adVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_SNAME);

			pstmt.setString(1, s_name);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adVO = new AdVO();
				adVO.setAd_id(rs.getInt("Ad_id"));
				adVO.setM_id(rs.getInt("M_id"));
				adVO.setAd_bdate(rs.getTimestamp("Ad_bdate"));
				adVO.setAd_enddate(rs.getTimestamp("Ad_enddate"));
				adVO.setS_name(rs.getString("S_name"));
				adVOlist.add(adVO);
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
		return adVOlist;
	}

	@Override
	public List<AdVO> getAllBySname2(String s_name) {
		
		List<AdVO> list = new ArrayList<AdVO>();
		AdVO adVO = null;
		MdataVO mdataVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_SNAME);
			pstmt.setString(1, s_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adVO = new AdVO();
				mdataVO = new MdataVO();
				adVO.setAd_id(rs.getInt("Ad_id"));
				adVO.setM_id(rs.getInt("M_id"));
				adVO.setAd_bdate(rs.getTimestamp("Ad_bdate"));
				adVO.setAd_enddate(rs.getTimestamp("Ad_enddate"));
				adVO.setS_name(rs.getString("S_name"));
				mdataVO.setB_name(rs.getString("b_name"));
				mdataVO.setM_city(rs.getString("m_city"));
				mdataVO.setM_district(rs.getString("m_district"));
				mdataVO.setO_finished(rs.getInt("o_finished"));
				mdataVO.setM_arating(rs.getInt("m_arating"));
				adVO.setMdataVO(mdataVO);
				list.add(adVO); // Store the row in the list
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
	
	//benny
	@Override
	public List<AdVO> getByDate(String s_name,Timestamp ad_bdate) {
		
		List<AdVO> list = new ArrayList<AdVO>();
		AdVO adVO = null;
		MdataVO mdataVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_SNAME_AND_DATE);
			pstmt.setString(1, s_name);
			pstmt.setTimestamp(2, ad_bdate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				adVO = new AdVO();
				mdataVO = new MdataVO();
				adVO.setAd_id(rs.getInt("Ad_id"));
				adVO.setM_id(rs.getInt("M_id"));
				adVO.setAd_bdate(rs.getTimestamp("Ad_bdate"));
				adVO.setAd_enddate(rs.getTimestamp("Ad_enddate"));
				adVO.setS_name(rs.getString("S_name"));
				mdataVO.setB_name(rs.getString("b_name"));
				mdataVO.setM_city(rs.getString("m_city"));
				mdataVO.setM_district(rs.getString("m_district"));
				adVO.setMdataVO(mdataVO);
				list.add(adVO); // Store the row in the list
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
	public AdVO findBySname(String s_name) {
		// TODO Auto-generated method stub
		return null;
	}
	//by benny tested ok
	@Override
	public void updateAsDeleted(Integer ad_id, String s_name) {//by benny
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_AS_DELETED);				
				pstmt.setString(1, s_name);
				pstmt.setInt(2, ad_id);			
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
}
