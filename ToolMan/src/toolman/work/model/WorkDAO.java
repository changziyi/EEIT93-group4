package toolman.work.model;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import toolman.mdata.model.MdataVO;
import toolman.workim.model.WorkimService;
import toolman.workim.model.WorkimVO;

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
	public WorkVO findByPrimaryKey(Integer work_id) {
		WorkVO workVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			workVO = (WorkVO) session.get(WorkVO.class, work_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return workVO;
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
			WorkVO workVO = (WorkVO) session.get(WorkVO.class, work_id);
			session.clear();
			session.delete(workVO);

			
//			WorkVO workVO = (WorkVO) session.get(WorkVO.class, work_id);
//			workVO.getWorkims().remove(workVO);
//			workVO.setWorkims(null);
//			session.delete(workVO);
			
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
		mdataVO.setM_id(1004);
		
		//findByPrimaryKey
//		WorkVO workVO = workdao.findByPrimaryKey(5001);
//		System.out.print(workVO.getWork_name() + ",");
//		System.out.print(workVO.getWork_des() + ",");
//		System.out.print(workVO.getImg1() + ",");
//		System.out.print(workVO.getImg2() + ",");
//		System.out.println(workVO.getImg3());
//		Set<WorkimVO> workims = workVO.getWorkims();
//		for(WorkimVO aWorkim :workims) {
//			System.out.print(aWorkim.getIm_id() + ",");
//			System.out.println(aWorkim.getIm_show());
//		}
		
		// insert
//		WorkVO workVO1 = workdao.findByPrimaryKey(5001);
//		Set<WorkimVO> workims = workVO1.getWorkims();
//		workVO.setMdataVO(mdataVO);
//		workVO.setWork_name("106年度");
//		workVO.setWork_des("在頂樓加蓋違建工程");
//		workVO.setWorkims(workims);
//		workdao.insert(workVO);

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
		
//		WorkimService workimservice = new WorkimService();
//		workimservice.deleteByWork(workdao.findByPrimaryKey(5003));
//		workdao.delete(5058);
		 workdao.delete(5092);
	}

}
