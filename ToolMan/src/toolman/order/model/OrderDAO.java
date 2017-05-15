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
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernate.util.HibernateUtil;
import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;
import toolman.rdata.model.RdataVO;
import toolman.work.model.WorkVO;

public class OrderDAO implements OrderDAO_Interface {
	
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
			Query query = session.createQuery("FROM OrderVO WHERE m_id.m_id = ?");
			query.setParameter(0, m_id);
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
	public void updateOrderSnameToUnfinishedReviewById(Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();				
			Query query = session.createQuery("Update OrderVO set s_name='一方未完成' where o_id=?");
			query.setParameter(0,o_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	}
	
	@Override
	public void updateOrderSnameToFishedById(Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();				
			Query query = session.createQuery("Update OrderVO set s_name='已完成' where o_id=?");
			query.setParameter(0,o_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	}

	
	@Override
	public void updateSnameAsDeletedById(Integer o_id) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();				
			Query query = session.createQuery("Update OrderVO set s_name='已刪除' where o_id=?");
			query.setParameter(0,o_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
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
	public int updateOrderSaonote(Integer o_id, String sa_onote){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int count=0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("update OrderVO set sa_onote=:snote where o_id=:o");
			query.setString("snote",sa_onote);
			query.setParameter("o",o_id);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
		
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
	public OrderVO getById(Integer o_id){
		OrderVO orderVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			orderVO = (OrderVO) session.get(OrderVO.class, o_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return orderVO;
	}
	public List<OrderVO> getBySname(String s_name) {
		List<OrderVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from OrderVO where s_name=:s ");
			query.setString("s",s_name);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
    public List<OrderVO> getOrderBySnameAndDate(String s_name,Timestamp o_tdate1,Timestamp o_tdate2){
    	List<OrderVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE s_name=? o_tdate BETWEEN ? AND ?");
			query.setParameter(1, s_name);
			query.setParameter(2, o_tdate2);
			query.setParameter(3, o_tdate2);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}	
    
//-------rating	
	
	@Override
	public OrderVO getRate(Integer o_id) {
		OrderVO orderVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			orderVO = (OrderVO) session.get(OrderVO.class, o_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return orderVO;
	}
	
	//--------------------------------------評價------------------------------------------
	public Integer updateOrderRate(Integer m_rating, Integer c_rating,String ca_des, String ma_des,Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("update OrderVO set m_rating = ? , c_rating = ? , ca_des = ? , ma_des = ? where o_id = ?");
			query.setParameter(0, m_rating);
			query.setParameter(1, c_rating);
			query.setParameter(2, ca_des);
			query.setParameter(3, ma_des);
			query.setParameter(4, o_id);
			query.executeUpdate();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	public Integer updateOrderRateByC(Integer m_rating,String ca_des,Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("update OrderVO set m_rating = ?  , ca_des = ?  where o_id = ?");
			query.setParameter(0, m_rating);
			query.setParameter(1, ca_des);
			query.setParameter(2, o_id);
			query.executeUpdate();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	public Integer updateOrderRateByM( Integer c_rating, String ma_des,Integer o_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("update OrderVO set c_rating = ?  , ma_des = ? where o_id = ?");
			query.setParameter(0, c_rating);
			query.setParameter(1, ma_des);
			query.setParameter(2, o_id);
			query.executeUpdate();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	
	//--------------------------------------川普長城---------------------------------------------------
	
	
	
	public static void main(String[] args) { 
		OrderDAO orderdao = new OrderDAO();
		OrderVO orderVO = new OrderVO();
		//insert tested ok
//			orderVO.setB_name("木工人");
//			orderVO.setM_id(1001);
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
//		
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
		//getOrderByM
		List<OrderVO> list = orderdao.getOrderByM(1001);
		for(OrderVO alist : list) {
			System.out.print(alist.getM_id().getM_id() + ",");
			System.out.print(alist.getM_id().getB_name() + ",");
			System.out.println(alist.getC_id().getC_id());
		}
			
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

//			 Calendar calobj1 = Calendar.getInstance();
//			 Timestamp o_edatetest = new Timestamp(calobj1.getTimeInMillis());
//			 orderVO.setO_edate(o_edatetest); 
//			 orderVO.setS_name("o_finished"); 
//			 orderVO.setM_onote("none");
//			 orderVO.setC_onote("none"); 
//			 orderVO.setSa_onote("none"); 
//			 orderVO.setM_rating(5);  
//			 orderVO.setC_rating(4);  
//			 orderVO.setCa_des("good"); 
//			 orderVO.setMa_des("great"); 
//			 orderVO.setO_id(3006);
//			 orderdao.updateOrder(orderVO);
//		
		
//	
//	OrderVO orderVO2 =  orderdao.getRate(3007);
	
//		OrderVO orderVO2 =  orderdao.getRate(3006);
	
//		System.out.print(orderVO2.getM_rating() + ",");
//		System.out.print(orderVO2.getC_rating() + ",");
//		System.out.print(orderVO2.getCa_des() + ",");
//		System.out.print(orderVO2.getMa_des() + ",");
		
		
	//	orderdao.getOrderByC("Snoopy");

//		
//		System.out.print(orderVO2.getM_rating() + ",");
//		System.out.print(orderVO2.getC_rating() + ",");
//		System.out.print(orderVO2.getCa_des() + ",");
//		System.out.print(orderVO2.getMa_des() + ",");
		

		
		}
		
		
		
		
		
		
		
		}