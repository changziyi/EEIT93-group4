package toolman.order.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.work.model.WorkVO;

public class OrderDAO implements OrderDAO_Interface {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=ToolMan";
	String userid = "sa";
	String passwd = "sa123456";
	
	private static final String INSERT_ORDER =
		      "INSERT INTO ord "
		     + "(b_name,m_id,c_id,o_bdate,o_des,req_exp,h_type,o_location,s_name"
		     + ") VALUES (?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_ORDER =
		      "SELECT * FROM ord ";

	private static final String GET_ORDER_BY_DATE =
		      "SELECT * FROM ord WHERE o_bdate BETWEEN ? AND ?";

	private static final String GET_ORDER_BY_M =
		      "SELECT * FROM ord WHERE m_id=?";

	private static final String GET_ALL_ORDER_BY_M_AND_DATE =
		      "SELECT * FROM ord WHERE m_id=? AND o_bdate BETWEEN ? AND ?";
	
	private static final String GET_ORDER_BY_C =
		      "SELECT * FROM ord WHERE c_id=?";

	private static final String GET_ORDER_BY_C_AND_DATE =
		      "SELECT * FROM ord WHERE c_id=? AND o_bdate BETWEEN ? AND ?";

	private static final String GET_ORDER_BY_M_AND_SNAME =
		      "SELECT * FROM ord WHERE m_id=? AND s_name=?";
					
	private static final String GET_ORDER_BY_C_AND_SNAME =
		      "SELECT * FROM ord WHERE c_id=? AND s_name=?";

	private static final String GET_ORDER_BY_M_AND_DATE_AND_SNAME =
		      "SELECT * FROM ord WHERE m_id=? AND o_bdate BETWEEN ? AND ? AND s_name=? ";
					
	private static final String GET_ORDER_BY_C_AND_DATE_AND_SNAME =
		      "SELECT * FROM ord WHERE c_id=? AND o_bdate BETWEEN ? AND ? AND s_name=? ";				
	
	private static final String DELETE_BY_ID =
		      "DELETE FROM ord where o_id = ?";
	private static final String UPDATE_ORDER=
		      "UPDATE ord "
		    	      + "SET,o_edate=?,s_name=?,m_onote=?,c_onote=?,sa_onote=?,m_rating=?,c_rating=?,ca_des=?,ma_des=?"
		    	      + ") WHERE　o_id=? ";



	@Override
	public void insert(OrderVO orderVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}


	@Override
	public List<OrderVO> getAllOrder() {
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from OrderVO");
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO>  getOrderByDate(Timestamp o_tdate1, Timestamp o_tdate2){
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE o_tdate BETWEEN ? AND ?");
			query.setParameter(1, o_tdate1);
			query.setParameter(2, o_tdate2);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO> getOrderByM(Integer m_id) {
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE m_id = ?");
			query.setParameter(1, m_id);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO>  getAllOrderByMAndDate(Integer m_id,Timestamp o_tdate1, Timestamp o_tdate2) {	
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE m_id = ? AND o_tdate BETWEEN ? AND ?");
			query.setParameter(1, m_id);
			query.setParameter(2, o_tdate1);
			query.setParameter(3, o_tdate2);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO> getOrderByC(String c_id) {
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE c_id = ?");
			query.setParameter(1, c_id);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO>  getOrderByCAndDate(String c_id, Timestamp o_tdate1, Timestamp o_tdate2){
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE c_id = ? AND o_tdate BETWEEN ? AND ?");
			query.setParameter(1, c_id);
			query.setParameter(2, o_tdate1);
			query.setParameter(3, o_tdate2);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public Integer deleteById(Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from OrderVO where o_id = ?");
			query.setParameter(1, o_id);
			count = query.executeUpdate();		
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}


	@Override
	public void updateOrder(OrderVO orderVO) {
		
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Integer count = 0;
			
			try {
				session.beginTransaction();				
				session.saveOrUpdate(orderVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}	
	}
	
	@Override
	public List<OrderVO> getOrderByCAndSname(String c_id, String s_name) {
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE c_id = ? AND s_name = ?");
			query.setParameter(1, c_id);
			query.setParameter(2, s_name);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO> getOrderByMAndSname(Integer m_id, String s_name) {
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE m_id = ? AND s_name = ?");
			query.setParameter(1, m_id);
			query.setParameter(2, s_name);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO>  getAllOrderByMAndDateAndSname(Integer m_id,Timestamp o_tdate1, Timestamp o_tdate2,String s_name){
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE m_id = ? AND o_tdate BETWEEN ? AND ? AND s_name = ?");
			query.setParameter(1, m_id);
			query.setParameter(2, o_tdate1);
			query.setParameter(3, o_tdate2);
			query.setParameter(4, s_name);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}


	@Override
	public List<OrderVO> getAllOrderByCAndDateAndSname(String c_id,Timestamp o_tdate1, Timestamp o_tdate2,String s_name){
		List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE c_id = ? AND o_tdate BETWEEN ? AND ? AND s_name = ?");
			query.setParameter(1, c_id);
			query.setParameter(2, o_tdate1);
			query.setParameter(3, o_tdate2);
			query.setParameter(4, s_name);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	
	public static void main(String[] args) {
		OrderDAO orderdao = new OrderDAO();
		OrderVO orderVO = new OrderVO();
		//insert tested ok
	//		orderVO.setB_name("木工人");
	//		orderVO.setM_id(1001);
	//		orderVO.setC_id("testcustomer");
			
	//		java.sql.Date date = new java.sql.Date(2017/05/01);
			
			//method1 tested ok
	//		Calendar calobj = Calendar.getInstance();
	//		Timestamp o_tdatetest = new Timestamp(calobj.getTimeInMillis());
	//		orderVO.seto_tdate(o_tdatetest);
			
			//method2 tested ok
	//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//		Calendar calobj = Calendar.getInstance();
	//		try {
	//			calobj.setTime(df.parse("2017-05-01 02:03:05"));
	//		} catch (ParseException e) {
	//			e.printStackTrace();
	//		}
	//		Timestamp o_bdatetest = new Timestamp(calobj.getTimeInMillis());
	//		orderVO.setO_bdate(o_bdatetest);
	
	//		orderVO.setO_des("客廳木工裝潢");
	//		orderVO.setReq_exp(new Long(1440000));
	//		orderVO.setH_type(1);
	//		orderVO.setO_location("內湖路");
	//		orderVO.setS_name("o_motherfucker");
	//		orderdao.insert(orderVO);
		
		//getAllOrder tested ok
//			orderdao.getAllOrder();

//		//getOrderByDate tested ok
//			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Calendar calobj1 = Calendar.getInstance();
//			Calendar calobj2 = Calendar.getInstance();
//			try {
//					calobj1.setTime(df.parse("2017-05-01 02:03:05"));
//			} catch (ParseException e) {
//					e.printStackTrace();
//			}
//			try {
//				calobj2.setTime(df.parse("2017-05-03 05:03:05"));
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			Timestamp o_bdatetest = new Timestamp(calobj1.getTimeInMillis());
//			Timestamp o_bdatetest2 = new Timestamp(calobj2.getTimeInMillis());
//			orderdao.getOrderByDate(o_bdatetest,o_bdatetest2);
//		
//		//getOrderByM
//		orderdao.getOrderByM(1001);
//		
//		//getAllOrderByMAndDate tested ok
//			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Calendar calobj1 = Calendar.getInstance();
//			Calendar calobj2 = Calendar.getInstance();
//			try {
//					calobj1.setTime(df.parse("2017-05-01 02:03:05"));
//			} catch (ParseException e) {
//					e.printStackTrace();
//			}
//			try {
//				calobj2.setTime(df.parse("2017-05-03 05:03:05"));
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			Timestamp o_bdatetest = new Timestamp(calobj1.getTimeInMillis());
//			Timestamp o_bdatetest2 = new Timestamp(calobj2.getTimeInMillis());
//			orderdao.getAllOrderByMAndDate(1001,o_bdatetest,o_bdatetest2);
//		
//		//getOrderByC tested ok
//		orderdao.getOrderByC("testcustomer");
//		
//		
//		//getOrderByCAndDate tested ok
//			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Calendar calobj1 = Calendar.getInstance();
//			Calendar calobj2 = Calendar.getInstance();
//			try {
//					calobj1.setTime(df.parse("2017-05-01 02:03:05"));
//			} catch (ParseException e) {
//					e.printStackTrace();
//			}
//			try {
//				calobj2.setTime(df.parse("2017-05-03 05:03:05"));
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//			Timestamp o_bdatetest = new Timestamp(calobj1.getTimeInMillis());
//			Timestamp o_bdatetest2 = new Timestamp(calobj2.getTimeInMillis());
//			orderdao.getOrderByCAndDate("testcustomer", o_bdatetest, o_bdatetest2);
//		
//		//deleteById
//		orderdao.deleteById(3001);
//		
//		//updateOrder

			 Calendar calobj1 = Calendar.getInstance();
			 Timestamp o_edatetest = new Timestamp(calobj1.getTimeInMillis());
			 orderVO.setO_edate(o_edatetest); 
			 orderVO.setS_name("o_finished"); 
			 orderVO.setM_onote("none");
			 orderVO.setC_onote("none"); 
			 orderVO.setSa_onote("none"); 
			 orderVO.setM_rating(5);  
			 orderVO.setC_rating(4);  
			 orderVO.setCa_des("good"); 
			 orderVO.setMa_des("great"); 
			 orderVO.setO_id(3001);
			 orderdao.updateOrder(orderVO);
		}



	}

