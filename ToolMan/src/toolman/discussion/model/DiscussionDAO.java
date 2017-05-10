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
	
	public static void main(String[] args) {
		
		DiscussionDAO dao = new DiscussionDAO();

//		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_id(1001);
		
		//insert
//		DiscussionVO discussionVO1 = new DiscussionVO();
//		discussionVO1.setC_id("海綿寶寶");
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
