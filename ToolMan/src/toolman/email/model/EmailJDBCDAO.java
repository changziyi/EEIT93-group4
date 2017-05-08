package toolman.email.model;

import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;

public class EmailJDBCDAO implements EmailDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=ToolMan";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO mes (mss_id,msr_id,ms_date,ms_summary,ms_content,s_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT ms_id,mss_id,msr_id,ms_date,ms_summary,ms_content,s_name FROM mes order by ms_id";
	private static final String GET_ONE_STMT =
		      "SELECT ms_id,mss_id,msr_id,ms_date,ms_summary,ms_content,s_name FROM mes where ms_id = ?";
	private static final String DELETE =
		      "DELETE FROM mes where ms_id = ?";
	private static final String UPDATE =
		      "UPDATE mes set mss_id=?, msr_id=?, ms_date=?, ms_summary=?, ms_content=?, s_name=? where ms_id = ?";


	@Override
	public void insert(EmailVO emailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, emailVO.getMss_id());
			pstmt.setString(2, emailVO.getMsr_id());
			pstmt.setTimestamp(3, emailVO.getMs_date());
			pstmt.setString(4, emailVO.getMs_summary());
			pstmt.setString(5, emailVO.getMs_content());
			pstmt.setString(6, emailVO.getS_name());

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
	public void update(EmailVO emailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, emailVO.getMss_id());
			pstmt.setString(2, emailVO.getMsr_id());
			pstmt.setTimestamp(3, emailVO.getMs_date());
			pstmt.setString(4, emailVO.getMs_summary());
			pstmt.setString(5, emailVO.getMs_content());
			pstmt.setString(6, emailVO.getS_name());

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
	public void delete(Integer ms_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, ms_id);

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
	public EmailVO findByPrimaryKey(Integer ms_id) {

		EmailVO emailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, ms_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getString("s_name"));

			
					
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
		return emailVO;
	}

	@Override
	public List<EmailVO> getAll() {
		List<EmailVO> list = new ArrayList<EmailVO>();
		EmailVO emailVO = null;

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
				emailVO = new EmailVO();
				emailVO.setMs_id(rs.getInt("ms_id"));
				emailVO.setMss_id(rs.getString("mss_id"));
				emailVO.setMsr_id(rs.getString("msr_id"));
				emailVO.setMs_date(rs.getTimestamp("ms_date"));
				emailVO.setMs_summary(rs.getString("ms_summary"));
				emailVO.setMs_content(rs.getString("ms_content"));
				emailVO.setS_name(rs.getString("s_name"));

			
				
				list.add(emailVO);
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

		EmailJDBCDAO dao = new EmailJDBCDAO();
		
		File file = new File("WebContent/images/Penguins.jpg");
		FileInputStream in = new FileInputStream(file);
		byte[] buff = new byte[in.available()];
		in.read(buff);
		in.close();


		//刪除
	  //  dao.delete(8012);

		// 取得一筆資料
		EmailVO emailVO3 = dao.findByPrimaryKey(8001);
		System.out.print(emailVO3.getMs_id() + ",");
		System.out.print(emailVO3.getMss_id() + ",");
		System.out.print(emailVO3.getMsr_id() + ",");
		System.out.print(emailVO3.getMs_date() + ",");
		System.out.print(emailVO3.getMs_summary() + ",");
		System.out.print(emailVO3.getS_name() + ",");

	 	System.out.println("---------------------");
	
		// 取得全部資料
		List<EmailVO> list = dao.getAll();
		for (EmailVO allemail : list) {
			System.out.print(allemail.getMs_id() + ",");
			System.out.print(allemail.getMss_id() + ",");
			System.out.print(allemail.getMsr_id() + ",");
			System.out.print(allemail.getMs_date() + ",");
			System.out.print(allemail.getMs_summary() + ",");
			System.out.print(allemail.getS_name() + ",");

	}
}}
