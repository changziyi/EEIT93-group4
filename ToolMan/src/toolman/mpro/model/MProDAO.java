package toolman.mpro.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;

public class MProDAO implements MProDAO_interface {

	@Override
	public List<MProVO> getByMid(Integer m_id) {
		List<MProVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			Query query = session.createQuery("from MProVO where m_id = ?");
			query.setParameter(0, m_id);
			querylist = query.list();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	
	public List<Object> getByMidSp(Integer m_id) {
		List<Object> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createSQLQuery("SELECT m_pro FROM mpro WHERE m_id = ?");
			query.setParameter(0, m_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String[] args) {
		
		MProDAO dao = new MProDAO();
//		List<MProVO> list = dao.getByMid(1004);
//		for (MProVO aPro : list) {
//			System.out.println(aPro.getM_proid());
//			System.out.println(aPro.getM_pro());
//		}
		
		List<Object> list = dao.getByMidSp(1001);
		for (Object aList : list) {
			System.out.println(aList);
		}
		
	}//main
	
}//MProDAO
