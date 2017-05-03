package toolman.work.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import toolman.mdata.model.MdataVO;

public class WorkDAO implements WorkDAO_interface {

	@Override
	public void insert(WorkVO workVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(workVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override
	public List<WorkVO> getWorkByMid(Integer m_id) {
		List<WorkVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from WorkVO where m_id = ?");
			query.setParameter(0, m_id); //點一次作品即來資料庫撈不知是否會大幅降低速度
			querylist = query.list();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}

	@Override
	public void update(WorkVO workVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(workVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer work_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from WorkVO where work_id = ?");
			query.setParameter(0, work_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	public static void main(String[] args) {
		WorkVO workVO = new WorkVO();
		WorkDAO workdao = new WorkDAO();
		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_id(1004);
		
		// insert
//		workVO.setMdataVO(mdataVO);
//		workVO.setWork_name("106年度");
//		workVO.setWork_des("在頂樓加蓋違建工程");
//		workdao.Insert(workVO);

		 //getWorkByM
//		 Collection<WorkVO> list = workdao.getWorkByMid(1001);
//		 
//		 for (WorkVO list1 : list) {
//			 System.out.println(list1.getWork_name());
//			 System.out.println(list1.getWork_des());
//		 }
		
		 //update
//		 workVO.setWork_name("106年度");
//		 workVO.setWork_des("在頂樓加蓋違建工程") ;
//		 workdao.update(workVO);
		
		
		//deleteByWork
//		 workdao.delete(5001);
	}

}
