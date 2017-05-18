package toolman.discussion.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.mdata.model.MdataVO;

public class DiscussionDAO implements DiscussionDAO_interface {

	@Override
	public void insert(DiscussionVO discussionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer d_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from DiscussionVO where d_id = ?");
			query.setParameter(0, d_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override
	public List<DiscussionVO> getByMid(Integer m_id) {
		List<DiscussionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from DiscussionVO where m_id = ?");
			query.setParameter(0, m_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<DiscussionVO> getAll() {
		List<DiscussionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from DiscussionVO order by d_id");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public void insertSql(DiscussionVO discussionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createSQLQuery("INSERT INTO discussion(m_id,c_id,d_date,d_des) VALUES(?,?,?,?,)");
			query.setParameter(0, discussionVO.getMdataVO().getM_id());
			query.setParameter(1, discussionVO.getC_id());
			query.setParameter(2, discussionVO.getD_date());
			query.setParameter(3, discussionVO.getD_des());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override
	public void updateSql(Integer d_id, String d_reply) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createSQLQuery("UPDATE discussion SET d_reply = ? WHERE d_id = ?");
			query.setParameter(0, d_reply);
			query.setParameter(1, d_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override
	public List<Object[]> getByMidSql(Integer m_id) {
		List<Object[]> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createSQLQuery("SELECT d_id, m_id, c_id, d_date, d_des, d_reply FROM discussion WHERE m_id = ? ORDER BY d_id");
			query.setParameter(0, m_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
//	public List
	
	public static void main(String[] args) {
		
		DiscussionDAO dao = new DiscussionDAO();
		
//		dao.updateSql(6006,"testupdate");
		
//		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_id(1001);
//		
//		DiscussionVO discussionVO = new DiscussionVO();
//		discussionVO.setC_id("Micky");
//		discussionVO.setD_des("QQQQQQ");
//		discussionVO.setD_reply("AAAAAA");
//		discussionVO.setD_date(new java.sql.Timestamp(System.currentTimeMillis()));
//		discussionVO.setMdataVO(mdataVO);
//		
//		dao.insertSql(discussionVO);
		
//		List<Object[]> list = dao.getByMidSql(1002);
//		for(Object[] alist : list) {
//			System.out.print(alist[0] + ",");
//			System.out.print(alist[1] + ",");
//			System.out.print(alist[2] + ",");
//			System.out.print((alist[3].toString()).substring(0, 19) + ",");
//			System.out.print(alist[4] + ",");
//			System.out.println(alist[5]);
//		}
		
//		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_id(1001);
//		
//		//insert
//		DiscussionVO discussionVO1 = new DiscussionVO();
//		discussionVO1.setC_id("Micky");
//		discussionVO1.setD_des("QQQQQQ");
//		discussionVO1.setD_reply("AAAAAA");
//		discussionVO1.setD_date(new java.sql.Timestamp(System.currentTimeMillis()));
//		discussionVO1.setMdataVO(mdataVO);
//		dao.insert(discussionVO1);

		
		//delete
//		dao.delete(6003);
		
		
		//getAll
//		List<DiscussionVO> list1 = dao.getAll();
//		for (DiscussionVO list : list1) {
//			System.out.print(list.getD_id() + ",");
//			System.out.print(list.getCdataVO().getC_id() + ",");
//			System.out.println(list.getD_des());
//			System.out.println("-------------------------");
//		}
		
		
		//getByMid
//		List<DiscussionVO> list2 = dao.getByMid(1001);
//		for (DiscussionVO list : list2) {
//			System.out.print(list.getMdataVO().getM_id() + ",");
//			System.out.print(list.getD_id() + ",");
//			System.out.print(list.getCdataVO().getC_id() + ",");
//			System.out.println(list.getD_des());
//		}
		
	}

}
