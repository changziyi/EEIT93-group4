package toolman.calendar.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.order.model.OrderVO;

public class CalendarDAO implements CalendarDAO_Interface {

	@Override
	public void InsertByM(CalendarVO calendarVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();		
		try {
			session.beginTransaction();
			session.saveOrUpdate(calendarVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	}

	@Override
	public List<CalendarVO> getByM(Integer m_id) {
		List<CalendarVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from CalendarVO");
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}

	@Override
	public void deleteByM(Integer m_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from CalendarVO where m_id = ?");
			query.setParameter(1, m_id);
			count = query.executeUpdate();		
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return count;
	}

}
