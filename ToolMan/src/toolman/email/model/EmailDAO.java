package toolman.email.model;

import java.util.*;
import java.io.ByteArrayInputStream;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import toolman.mdata.model.MdataVO;

public class EmailDAO implements EmailDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ToolMan");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO mes (mss_id,msr_id,ms_date,ms_summary,ms_content,s_name) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ms_id,mss_id,msr_id,ms_date,ms_summary,ms_content,s_name FROM mes order by ms_date desc";
	private static final String GET_ONE_STMT = "SELECT ms_id,mss_id,msr_id,ms_date,ms_summary,ms_content,s_name FROM mes  where mss_id = ?";
	private static final String GET_ONE_STMT_BY_KEY = "SELECT ms_id,mss_id,msr_id,ms_date,ms_summary,ms_content,s_name FROM mes  where ms_id = ?";
	private static final String DELETE = "DELETE FROM mes where ms_id = ?";
	private static final String UPDATE = "UPDATE mes set mss_id=?, msr_id=?, ms_date=?, ms_summary=?, ms_content=?, s_name=?  where ms_id = ?";
	private static final String UPDATEISRead = "UPDATE mes set s_name=?  where ms_id = ?";
	
	//by Benny
	private static final String GET_ONE_MSRID = "SELECT * FROM mes  where msr_id = ?";

	@Override
	public void insert(EmailVO emailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, emailVO.getMss_id());
			pstmt.setString(2, emailVO.getMsr_id());
			pstmt.setTimestamp(3, emailVO.getMs_date());
			pstmt.setString(4, emailVO.getMs_summary());
			pstmt.setString(5, emailVO.getMs_content());
			pstmt.setBoolean(6, emailVO.getS_name());
			
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

	public void updateisRead(Integer ms_id){
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEISRead);
			pstmt.setBoolean(1, true);
			pstmt.setInt(2, ms_id);
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}finally {
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
	public void update(EmailVO emailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, emailVO.getMss_id());
			pstmt.setString(2, emailVO.getMsr_id());
			pstmt.setTimestamp(3, emailVO.getMs_date());
			pstmt.setString(4, emailVO.getMs_summary());
			pstmt.setString(5, emailVO.getMs_content());
			pstmt.setBoolean(6, emailVO.getS_name());
			pstmt.setBoolean(7, emailVO.getMs_trash());
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
	public void delete(Integer ms_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, ms_id);
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
	public EmailVO findByPrimaryKey(Integer ms_id) {

		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, ms_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				emailVO.setMs_trash(rs.getBoolean("ms_trash"));
				
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
		return emailVO;
	}

	
	
	@Override
	public EmailVO findByPrimaryKey1(Integer ms_id) {

		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_KEY);

			pstmt.setInt(1, ms_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				emailVO.setMs_trash(rs.getBoolean("ms_trash"));

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
		return emailVO;
	}

	@Override
	public List<EmailVO> getMail(String mss_id) {
		List<EmailVO> list = new ArrayList<EmailVO>();
		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, mss_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				
				list.add(emailVO);
			}
		} catch (SQLException se) {
		
		}
		return list;
	}

	
	
	@Override
	public List<EmailVO> getOneMail(Integer ms_id) {
		List<EmailVO> Onelist = new ArrayList<EmailVO>();
		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, ms_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				emailVO.setMs_trash(rs.getBoolean("ms_trash"));
				Onelist.add(emailVO);
			}
		} catch (SQLException se) {
			
		}
		return Onelist;
	}

	
	
	@Override
	public List<EmailVO> deleteMail(Integer ms_id) {
		List<EmailVO> DeleteList = new ArrayList<EmailVO>();
		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, ms_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				emailVO.setMs_trash(rs.getBoolean("ms_trash"));
				DeleteList.add(emailVO);
			}
		} catch (SQLException se) {
			
		}
		return DeleteList;
	}

	
	// List<EmailVO> list = null;
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// Query query = session.createQuery("from EmailVO where mss_id = ? order by
	// ms_date desc");
	// query.setParameter(0, mss_id);
	// list = query.list();
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// return list;

	@Override
	public List<EmailVO> getAll() {
		List<EmailVO> list = new ArrayList<EmailVO>();
		EmailVO emailVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				
				

				list.add(emailVO); 
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
	
	//By Benny
	public List<EmailVO> getMailByM(Integer m_id){
		List<EmailVO> Onelist = new ArrayList<EmailVO>();
		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, m_id.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getBoolean("s_name"));
				
				Onelist.add(emailVO);
			}
		} catch (SQLException se) {
			
		}
		return Onelist;	
	}	
	//By Benny
	
	public static void main(String[] args) {

	
		
	}

}