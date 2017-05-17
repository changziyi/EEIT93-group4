package toolman.rdata.model;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import hibernate.util.HibernateUtil;
import org.hibernate.*;
import toolman.blacklist.model.BlacklistVO;


public class RdataDAO implements RdataDAO_interface {


	
	@Override
	public void insert(RdataVO rdataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(rdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	

	@Override
	public void update(RdataVO rdataVO) {
		
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Integer count = 0;
			
			try {
				session.beginTransaction();
				
				session.saveOrUpdate(rdataVO);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}	
	}

	
	@Override
	public void delete(Integer r_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			BlacklistVO empVO = new BlacklistVO();
			empVO.setBk_id(r_id);
			session.delete(empVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	
	

	@Override
	public RdataVO findByPrimaryKey(Integer r_id) {
		RdataVO empVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			empVO = (RdataVO) session.get(RdataVO.class, r_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return empVO;
	}

	@Override
	public List<RdataVO> getAll() {
		List<RdataVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from RdataVO");
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	
	@Override
	public List<RdataVO> getBySname(String s_name) {
		List<RdataVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE s_name = ?");
			query.setParameter(1, s_name);
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}

	public static void main(String args[])  {

		RdataDAO dao = new RdataDAO();

		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		Timestamp r_date = new Timestamp(calobj.getTimeInMillis());
		
		/************************** 測試新增 ****************************/
//		RdataVO rdataVO = new RdataVO();
//		
//		rdataVO.setR_date(r_date);
//		rdataVO.setCdataVO("1001");
//		rdataVO.setMdataVO(1001);
//		rdataVO.setP_summary("態度不佳");
//		rdataVO.setP_content("這個人會亂吐檳榔渣，還會罵髒話");
//		rdataVO.setS_name("m_pass");
//		rdataVO.setSa_rnote(null);
//		rdataVO.setDiscussionVO(6000);
//		rdataVO.setOrderVO(3007);
//
//		dao.insert(rdataVO);

		/************************** 測試修改 ****************************/

		// 寫入資料庫


//		RdataVO rdataVO2 = new RdataVO();
//		
//		
//		rdataVO2.setR_date(java.sql.Date.valueOf("2017-02-08"));
//		rdataVO2.setC_id("1002");
//		rdataVO2.setM_id(1005);
//		rdataVO2.setP_summary("猥褻下流");
//		rdataVO2.setP_content("這個人猥褻下流，還會罵髒話");
//		rdataVO2.setS_name("m_pass");
//		rdataVO2.setSa_rnote(null);
//		rdataVO2.setD_id(6002);
//		dao.update(rdataVO2);

		
		/************************** 測試刪除 ****************************/
//		 dao.delete(7001);

		/************************** 測試單筆查詢 ****************************/
//		RdataVO rdataVO3 = dao.findByPrimaryKey(7002);
//		System.out.print(rdataVO3.getR_id() + ",");
//		System.out.print(rdataVO3.getR_date() + ",");
//		System.out.print(rdataVO3.getC_id() + ",");
//	System.out.print(rdataVO3.getM_id() + ",");
//		System.out.print(rdataVO3.getP_summary() + ",");
//		System.out.print(rdataVO3.getP_content() + ",");
//		System.out.print(rdataVO3.getS_name() + ",");
//		System.out.print(rdataVO3.getSa_rnote() + ",");
//		System.out.print(rdataVO3.getD_id());
		
//		System.out.println("---------------------------------------------------------"
//				+ "---------------------------------------------------------");

		/************************** 測試多筆查詢 ****************************/
//		 List<RdataVO> list =dao.getAll();
//		 for(RdataVO mda : list){
//		System.out.print(mda.getR_id() + ",");
//		System.out.print(mda.getR_date() + ",");
//		System.out.print(mda.getC_id() + ",");
//		System.out.print(mda.getM_id() + ",");
//		System.out.print(mda.getP_summary() + ",");
//		System.out.print(mda.getP_content() + ",");
//		System.out.print(mda.getS_name() + ",");
//		System.out.print(mda.getSa_rnote() + ",");
//		System.out.print(mda.getD_id());
//		
//		 System.out.println("---------------------------------------------------------"
//		 + "---------------------------------------------------------");
//		 }

	}
}