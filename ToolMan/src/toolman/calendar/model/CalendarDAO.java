package toolman.calendar.model;

import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderVO;

public class CalendarDAO implements CalendarDAO_Interface {

	@Override
	public void InsertByM(Collection<CalendarVO> list) {
				
		for(CalendarVO calendarVO:list){
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(calendarVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	   }
	}

	@Override
	public List<CalendarVO> getByM(Integer m_id) {
		List<CalendarVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from CalendarVO where m_id=:m");
			query.setParameter("m", m_id);
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
			Query query = session.createQuery("delete from CalendarVO where m_id = :m");
			query.setParameter("m", m_id);
			count = query.executeUpdate();		
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	
	}
//	public static void main(String[] args) { 
//		CalendarDAO dao = new CalendarDAO();
//		List<CalendarVO> getlist=dao.getByM(1000);
//		for(CalendarVO calendarVo:getlist){
//			System.out.print(calendarVo.getEvent_id());
//			System.out.print(calendarVo.getEvent_title());
//		}
//		
//		}
//	
}
