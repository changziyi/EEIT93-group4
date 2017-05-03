package toolman.cdata.model;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernate.util.HibernateUtil;

public class CdataDAO implements CdataDAO_interface{
	
	private static final String GET_ALL_STMT = "from CdataVO order by c_id";

	//登入
	@Override
	public CdataVO login_in(String c_id) {
		// TODO Auto-generated method stub
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
	//註冊				
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

	public static void main(String args[]){		
		CdataDAO  dao = new CdataDAO();
		
		/*********************** 查詢登入帳號完成  *****************************/
		
//		CdataVO cdataVO = dao.login_in("micky");
//		System.out.println("----------------------------------");
//		System.out.print("帳號 : " + cdataVO.getC_id() + ",");
//		System.out.println("密碼 : " + cdataVO.getC_pwd());
//		System.out.println("----------------------------------");
		
		/*********************** 新增註冊完成  *****************************/
		
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
//		cdataVO.setC_rating(0);
//		cdataVO.setM_id(1001);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		dao.insert(cdataVO);	
		
		/*********************** 新增修改完成  *****************************/
		
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
//		cdataVO.setC_rating(0);
//		cdataVO.setM_id(1004);
//		cdataVO.setS_name("m_pass");
//		cdataVO.setC_fb(null);
//		cdataVO.setC_google(null);
//		cdataVO.setSa_cnote(null);
//		cdataVO.setC_birth(java.sql.Date.valueOf("1980-12-27"));
//		cdataVO.setC_finished(0);
//		dao.update(cdataVO);	
		
		/*********************** 新增刪除未完成  *****************************/	
		
//		dao.delete("Snoopy");
	}	
}
