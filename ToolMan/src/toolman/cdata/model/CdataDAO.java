package toolman.cdata.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import hibernate.util.HibernateUtil;
import toolman.blacklist.model.BlacklistVO;
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;

public class CdataDAO implements CdataDAO_interface{
	
	private static final String GET_ALL_STMT = "from CdataVO order by c_id";

	
	
	//send mail
	@Override
	public List<CdataVO> geteMailAll(String c_email) {
		List<CdataVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(CdataVO.class);
			query.addOrder( Order.asc("c_email") );
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	//update forget password
	public int updateMemberfwd(String c_email, String c_pwd) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("update CdataVO set c_pwd=:p where c_email=:e");
			query.setParameter("e",c_email);
			query.setParameter("p",c_pwd);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	//Member update password
	public int updateMemberpwd(String c_id, String c_pwd) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("update CdataVO set c_pwd=:p where c_id=:c");
			query.setParameter("c",c_id);
			query.setParameter("p",c_pwd);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	
	//update member
	public int updateMember(String c_name,String c_pwd, Date c_birth, String c_cel, 
							String c_email, String c_addr, String c_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		try {
			session.beginTransaction();
			Query query = session.createQuery(
					"update CdataVO set c_name = ? , c_pwd = ? , c_birth = ? , c_cel = ? , c_email = ? , c_addr = ? where c_id = ?");
			query.setParameter(0,c_name);
			query.setParameter(1,c_pwd);
			query.setParameter(2,c_birth);
			query.setParameter(3,c_cel);
			query.setParameter(4,c_email);
			query.setParameter(5,c_addr);
			query.setParameter(6,c_id);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	//login in 
	@Override
	public CdataVO login_in(String c_id) {
		CdataVO cdataVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
//			Criteria query = session.createCriteria(CdataVO.class);
//			query.add(Restrictions.eq("c_id", "Micky"));
//			query.setParameter(0, c_id);
			cdataVO = (CdataVO) session.get(CdataVO.class, c_id);
			
//			cdataVO = (CdataVO) query.list().get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return cdataVO;
	}	
	//login out				
	@Override
	public void insert(CdataVO cdataVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(cdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override
	public void update(CdataVO cdataVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(cdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String c_id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			CdataVO cdataVO = (CdataVO) session.get(CdataVO.class, c_id);
			session.delete(cdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<CdataVO> getAll() {
		// TODO Auto-generated method stub
		List<CdataVO> list = new ArrayList<CdataVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	//cdata_des
	public CdataVO cdata_des(String c_id) {
		CdataVO cdataVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			cdataVO = (CdataVO) session.get(CdataVO.class, c_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return cdataVO;
	}
	//BY Benny
		public CdataVO getById(String c_id) {
		
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			CdataVO cdataVO =null;
			try {
				session.beginTransaction();
				cdataVO = (CdataVO) session.get(CdataVO.class, c_id);

				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return  cdataVO;
		}
	//BY Benny
	public List<CdataVO> getBySname(String s_name) {
		List<CdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from CdataVO where s_name=:s ");
			query.setString("s",s_name);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	//benny
	public int updatecustomerSname(String c_id, String s_name) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count=0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("update CdataVO set s_name=:s where c_id=:c");
			query.setString("s",s_name);
			query.setParameter("c",c_id);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}
	//benny
	public int updatecustomerSacnote(String c_id, String sa_cnote){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int count=0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("update CdataVO set sa_cnote =:snote where c_id=:c");
			query.setString("snote",sa_cnote);
			query.setParameter("c",c_id);
			count = query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
		
	}
	@Override
	public CdataVO getByM(Integer m_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		CdataVO cdataVO =null;
		try {
			session.beginTransaction();
			
			Query query = session.createQuery("from CdataVO where m_id=:m");
			query.setParameter("m", m_id);
			cdataVO = (CdataVO) query.list().get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return  cdataVO;
		
	}

	@Override   //訂單
	public Set<OrderVO> getOrderByC(String c_id) {		
		Set<OrderVO> set = login_in(c_id).getOrders();
		
		return set;
	}
	@Override   //訂單
	public Set<FavoriteVO> getFavoriteByC(String c_id) {		
		Set<FavoriteVO> set = login_in(c_id).getFavorites();
		return set;
	}
	@Override   //訂單
	public Set<BlacklistVO> getBlackByC(String c_id) {		
		Set<BlacklistVO> set = login_in(c_id).getBlacklists();
		return set;
	}
	
	@Override
	public void updateMid(Integer m_id, String c_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update CdataVO set m_id=:m where c_id=:c");
			query.setParameter("m",m_id);
			query.setParameter("c",c_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	public static void main(String args[]){		
		CdataDAO  dao = new CdataDAO();
		
//		dao.updateMid(1027, "bobobobobobo");
		
//		List<CdataVO> list= dao.getAll();
//		for(CdataVO cdataVO:list){
//			Timestamp c_jdatestamp = cdataVO.getC_jdate();
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String c_jdate = df.format(c_jdatestamp);
//			String c_name =	cdataVO.getC_name();
//			String c_id	= cdataVO.getC_id();
//			String c_addr = cdataVO.getC_addr();
//			String c_district = cdataVO.getC_district();
//			String c_city = cdataVO.getC_city();
//			String c_location = c_city + c_district + c_addr;					
//			String s_name = cdataVO.getS_name();
//			Integer c_averrating = cdataVO.getC_averrating();
//			String sa_cnote	=cdataVO.getSa_cnote();
//			System.out.println(c_id);
//			System.out.println( c_jdatestamp);
//			System.out.println( c_jdate);
//		}
		
		/*********************** 修改密碼  *****************************/
//		CdataService cs = new CdataService();
//		String c_pwd = null;
//		String c_email ="cccc@gmail.com";
//		CdataVO cdataVO =new CdataVO();		
//		int cdataVO1 = cs.updateMemberfwd(c_pwd, c_email);
//		
////		System.out.println("c_pwd = "+cdataVO1);
//		dao.update(cdataVO);
//		
		
		
		
		
		/*********************** 修改消費者會員資料  *****************************/
		
		
		
		
		
		/*********************** 查詢所有email *****************************/		

//		String c_email = null;
//		List<CdataVO> list = dao.geteMailAll(c_email);
//		for (CdataVO aEmp : list) {
//			System.out.print(aEmp.getC_email() + ",");
//			System.out.println();
//		}

		
//		/*********************** 查詢媒合  *****************************/
//		
//		CdataVO cdataVO = dao.cdata_des("PolarBear");
//		System.out.print(cdataVO.getC_id() + ",");
//		System.out.println(cdataVO.getC_name());
//		
//		Set<OrderVO> orders = cdataVO.getOrders();
//		for (OrderVO aOrder : orders) {
//			System.out.print(" 師傅 : "+ aOrder.getB_name()+" , ");
//			System.out.println(" 時間 : "+ aOrder.getO_edate());
//		}
//		
		/*********************** 查詢評價  *****************************/
		//評價
//		CdataVO cdataVO = dao.cdata_des("PolarBear");
//		System.out.print(cdataVO.getC_id() + ",");
//		System.out.println(cdataVO.getC_name());
//			
//		Set<OrderVO> orders = cdataVO.getOrders();
//		for (OrderVO aOrder : orders) {
//			System.out.println(" 師傅 :" + aOrder.getB_name());
//			System.out.println(" 時間 : " + aOrder.getO_edate());
//			System.out.println(" 留言 : " + aOrder.getMa_des());
//			System.out.println("---------------------------------");
//		}
		
		
		
		
		
		/*********************** 查詢登入帳號  *****************************/
		
//		CdataVO cdataVO = dao.login_in("Micky");
//		System.out.println("----------------------------------");
//		System.out.print("帳號 : " + cdataVO.getC_id() + ",");
//		System.out.println("密碼 : " + cdataVO.getC_pwd());
//		System.out.println("----------------------------------");
		
		/*********************** 新增註冊  *****************************/
		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_id("Bob");
//		cdataVO.setC_pwd("123456");
//		cdataVO.setC_name("泡芙阿姨");
//		cdataVO.setC_cel("0987252555");
//		cdataVO.setC_email("ffff@gmail.com");
//		cdataVO.setC_city("新北市");
//		cdataVO.setC_district("永和區");
//		cdataVO.setC_addr("中和路125號3樓");
//		cdataVO.setC_jdate(java.sql.Timestamp.valueOf("2017-02-08 01:01:01"));
//		cdataVO.setC_averrating(0);
//		cdataVO.setM_id(1001);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		dao.insert(cdataVO);	
		
		/*********************** 修改單筆資料  *****************************/
		
//		CdataVO cdataVO = new CdataVO();
//		cdataVO.setC_id("Micky");
//		cdataVO.setC_name("泡芙阿姨");
//		cdataVO.setC_pwd("123456");
//		cdataVO.setC_cel("0987252555");
//		cdataVO.setC_email("ffff@gmail.com");
//		cdataVO.setC_city("新北市");
//		cdataVO.setC_district("永和區");
//		cdataVO.setC_addr("中和路125號3樓");
//		cdataVO.setC_jdate(java.sql.Timestamp.valueOf("2017-02-08 01:01:01.000"));
//		cdataVO.setC_averrating(0);
//		cdataVO.setM_id(1004);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		dao.update(cdataVO);	
		
		/*********************** 刪除  *****************************/	
		
//		dao.delete("Snoopy");
	}


}
