package toolman.mdata.model;

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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import toolman.mpro.model.MProVO;

public class MdataJDBCDAO {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=toolman";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT = "INSERT INTO mdata (m_name, b_name, m_cel, m_email, m_city, m_district, m_addr, m_jdate, s_name, b_image, b_des, sa_mnote) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String INSERT_MPRO = "INSERT INTO mpro (m_pro, m_id) VALUES (?, ?)";
	private static final String UPDATE = "UPDATE mdata SET m_name=?, b_name=?, m_cel=?, m_email=?, m_city=?, m_district=?, m_addr=?, m_jdate=?, m_arating=?, o_finished=?, o_current=?, s_name=?, b_image=?, b_des=?, sa_mnote=? WHERE m_id=?";
	private static final String DELETE = "DELETE FROM mdata WHERE m_id = ?";
	private static final String GET_ONE = "SELECT m_id, m_name, b_name, m_cel, m_email, m_city, m_district, m_addr, m_jdate, m_arating, o_finished, o_current, s_name, b_image, b_des, sa_mnote FROM mdata WHERE m_id = ?";
	private static final String GET_ALL = "SELECT m_id, m_name, b_name, m_cel, m_email, m_city, m_district, m_addr, m_jdate, m_arating, o_finished, o_current, s_name, b_image, b_des, sa_mnote FROM mdata ORDER BY m_id";
	private static final String QUERY_DISTRICT = "SELECT m_name, b_name FROM mdata WHERE m_district = ?";

	public void insert(MdataVO mdataVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_mpro = null;
		ResultSet generatedkeys = null;
		Integer key = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, mdataVO.getM_name());
			pstmt.setString(2, mdataVO.getB_name());
			pstmt.setString(3, mdataVO.getM_cel());
			pstmt.setString(4, mdataVO.getM_email());
			pstmt.setString(5, mdataVO.getM_city());
			pstmt.setString(6, mdataVO.getM_district());
			pstmt.setString(7, mdataVO.getM_addr());
			pstmt.setTimestamp(8, mdataVO.getM_jdate());
			pstmt.setString(9, mdataVO.getS_name());
			pstmt.setBytes(10, mdataVO.getB_image());
			pstmt.setString(11, mdataVO.getB_des());
			pstmt.setString(12, mdataVO.getSa_mnote());

			int i = pstmt.executeUpdate();

			generatedkeys = pstmt.getGeneratedKeys();
			if (generatedkeys.next()) {
				key = generatedkeys.getInt(1);
			}

			mdataVO.setM_id(key);

			if (mdataVO.getMpros() != null) {
				pstmt_mpro = con.prepareStatement(INSERT_MPRO);

				Set<MProVO> m_proVO = mdataVO.getMpros();
				for (MProVO pros : m_proVO) {
					pstmt_mpro.setInt(1, key);
					pstmt_mpro.setString(2, pros.getM_pro());
//					if (pros.getM_proen().equals("floor")) {
//						pros.setM_pro("地板地磚");
//					} else if (pros.getM_proen().equals("electricity")) {
//						pros.setM_pro("水電工程");
//					} else if (pros.getM_proen().equals("waterproof")) {
//						pros.setM_pro("防水抓漏");
//					} else if (pros.getM_proen().equals("paint")) {
//						pros.setM_pro("油漆工程");
//					} else if (pros.getM_proen().equals("decoration")) {
//						pros.setM_pro("室內裝潢");
//					}
					pstmt_mpro.addBatch();
				}
				pstmt_mpro.executeBatch();
			}

			System.out.println("新增" + i + "筆資料");
			System.out.println(mdataVO.getM_id());

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt_mpro != null) {
				try {
					pstmt_mpro.close();
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

	} // insert()

	public void update(MdataVO mdataVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, mdataVO.getM_name());
			pstmt.setString(2, mdataVO.getB_name());
			pstmt.setString(3, mdataVO.getM_cel());
			pstmt.setString(4, mdataVO.getM_email());
			pstmt.setString(5, mdataVO.getM_city());
			pstmt.setString(6, mdataVO.getM_district());
			pstmt.setString(7, mdataVO.getM_addr());
			pstmt.setTimestamp(8, mdataVO.getM_jdate());
			pstmt.setInt(9, mdataVO.getM_arating());
			pstmt.setInt(10, mdataVO.getO_finished());
			pstmt.setInt(11, mdataVO.getO_current());
			pstmt.setString(12, mdataVO.getS_name());
			pstmt.setBytes(13, mdataVO.getB_image());
			pstmt.setString(14, mdataVO.getB_des());
			pstmt.setString(15, mdataVO.getSa_mnote());
			pstmt.setInt(16, mdataVO.getM_id());

			int i = pstmt.executeUpdate();
			System.out.println("更新" + i + "筆資料");

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

	} // update()

	public void delete(Integer m_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, m_id);

			int i = pstmt.executeUpdate();
			System.out.println("刪除" + i + "筆資料");

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

	} // delete()

	public MdataVO findByPrimaryKey(Integer m_id) {

		MdataVO mdataVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setInt(1, m_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				mdataVO = new MdataVO();

				mdataVO.setM_id(rs.getInt("m_id"));
				mdataVO.setM_name(rs.getString("m_name"));
				mdataVO.setB_name(rs.getString("b_name"));
				mdataVO.setM_cel(rs.getString("m_cel"));
				mdataVO.setM_email(rs.getString("m_email"));
				mdataVO.setM_city(rs.getString("m_city"));
				mdataVO.setM_district(rs.getString("m_district"));
				mdataVO.setM_addr(rs.getString("m_addr"));
				mdataVO.setM_jdate(rs.getTimestamp("m_jdate"));
				mdataVO.setM_arating(rs.getInt("m_arating"));
				mdataVO.setO_finished(rs.getInt("o_finished"));
				mdataVO.setO_current(rs.getInt("o_current"));
				mdataVO.setS_name(rs.getString("s_name"));
				mdataVO.setB_image(rs.getBytes("b_image"));
				mdataVO.setB_des(rs.getString("b_des"));
				mdataVO.setSa_mnote(rs.getString("sa_mnote"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return mdataVO;
	} // findByPrimaryKey()

//	public List<MdataVO> getDistrict(String m_district) {
//		List<MdataVO> list = new ArrayList<MdataVO>();
//
//		MdataVO mdataVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(QUERY_DISTRICT);
//
//			pstmt.setString(1, m_district);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				mdataVO = new MdataVO();
//				mdataVO.setM_name(rs.getString("m_name"));
//				mdataVO.setB_name(rs.getString("b_name"));
//				list.add(mdataVO);
//			}
//
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. " + se.getMessage());
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	} // queryDistrict()

	public List<MdataVO> getAll() {
		List<MdataVO> list = new ArrayList<MdataVO>();
		MdataVO mdataVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mdataVO = new MdataVO();
				mdataVO.setM_id(rs.getInt("m_id"));
				mdataVO.setM_name(rs.getString("m_name"));
				mdataVO.setB_name(rs.getString("b_name"));
				mdataVO.setM_cel(rs.getString("m_cel"));
				mdataVO.setM_email(rs.getString("m_email"));
				mdataVO.setM_city(rs.getString("m_city"));
				mdataVO.setM_district(rs.getString("m_district"));
				mdataVO.setM_addr(rs.getString("m_addr"));
				mdataVO.setM_jdate(rs.getTimestamp("m_jdate"));
				mdataVO.setM_arating(rs.getInt("m_arating"));
				mdataVO.setO_finished(rs.getInt("o_finished"));
				mdataVO.setO_current(rs.getInt("o_current"));
				mdataVO.setS_name(rs.getString("s_name"));
				mdataVO.setB_image(rs.getBytes("b_image"));
				mdataVO.setB_des(rs.getString("b_des"));
				mdataVO.setSa_mnote(rs.getString("sa_mnote"));
				list.add(mdataVO);
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
	}// getAll()

	public static void main(String[] args) throws Exception {

		MdataJDBCDAO dao = new MdataJDBCDAO();

		// insert
//		File file = new File("WebContent/image/jake.gif");
//		InputStream in = new FileInputStream(file);
//		byte[] buf = new byte[in.available()];
//		in.read(buf);
//		in.close();
//
//		MdataVO mdataVO1 = new MdataVO();
//		mdataVO1.setM_name("阿部師");
//		mdataVO1.setB_name("阿部師的店");
//		mdataVO1.setM_cel("0987654321");
//		mdataVO1.setM_district("大安區");
//		mdataVO1.setB_image(buf);
//
//		dao.insert(mdataVO1);

		// ------------------------------------------------------

		// update
//		MdataVO mdataVO2 = new MdataVO();
//		mdataVO2.setM_name("小明師");
//		mdataVO2.setB_name("小明師的店");
//		mdataVO2.setM_cel("0987654321");
//		mdataVO2.setM_id(1000);
//		dao.update(mdataVO2);

		// ------------------------------------------------------

		// delete
//		dao.delete(1000);

		// ------------------------------------------------------

		// findByPrimaryKey(測試，沒查全部)
//		MdataVO mdataVO3 = dao.findByPrimaryKey(1000);
//		System.out.print(mdataVO3.getM_id() + ",");
//		System.out.print(mdataVO3.getM_name() + ",");
//		System.out.print(mdataVO3.getB_name() + ",");
//		System.out.print(mdataVO3.getM_cel() + ",");
//		System.out.print(mdataVO3.getM_email() + ",");
//		System.out.print(mdataVO3.getM_city() + ",");
//		System.out.print(mdataVO3.getM_district() + ",");
//		System.out.print(mdataVO3.getM_addr() + ",");
//		System.out.print(mdataVO3.getM_jdate() + ",");
//		System.out.println(mdataVO3.getB_image());

		// 把圖片寫到D碟路徑
//		byte[] getB_image = mdataVO3.getB_image();
//		OutputStream out = new FileOutputStream("D:\\test.jpg");
//		out.write(getB_image);
//		out.close();

		// ------------------------------------------------------

		// queryDistinct(測試，沒查全部)
//		List<MdataVO> list = dao.queryDistrict("中正區");
//		for (MdataVO aMaster : list) {
//			System.out.print(aMaster.getM_name() + ",");
//			System.out.println(aMaster.getB_name());
//		}

		// ------------------------------------------------------

		// getAll
		List<MdataVO> list = dao.getAll();
		for (MdataVO aMaster : list) {
			System.out.print(aMaster.getM_id() + ",");
			System.out.print(aMaster.getM_name() + ",");
			System.out.print(aMaster.getB_name() + ",");
			System.out.print(aMaster.getM_cel() + ",");
			System.out.print(aMaster.getM_email() + ",");
			System.out.print(aMaster.getM_city() + ",");
			System.out.print(aMaster.getM_district() + ",");
			System.out.print(aMaster.getM_addr() + ",");
			System.out.print(aMaster.getM_jdate() + ",");
			System.out.print(aMaster.getM_arating() + ",");
			System.out.print(aMaster.getO_finished() + ",");
			System.out.print(aMaster.getO_current() + ",");
			System.out.print(aMaster.getS_name() + ",");
			System.out.print(aMaster.getB_image() + ",");
			System.out.print(aMaster.getB_des() + ",");
			System.out.println(aMaster.getSa_mnote());
		}

	} // main()

} // MasterDAOJDBC
