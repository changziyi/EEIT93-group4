package toolman.workim.model;

import org.hibernate.*;

import toolman.work.model.WorkVO;

import hibernate.util.HibernateUtil;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class WorkimDAO implements WorkimDAO_interface {

	@Override
	public void insert(Collection<WorkimVO> workimset) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			for (WorkimVO workimsets : workimset) {
				session.save(workimsets);
			}
//			for (int i = 0; i < workimset.size(); i++) {
//				for (WorkimVO workimsets : workimset) {
//					session.save(workimsets);
//				}
//			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public Integer delete(Collection<Integer> im_idlist) {
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete from WorkimVO where im_id = ?");
			for (Integer deletecount : im_idlist) {
				query.setParameter(0, deletecount);
				count = query.executeUpdate();
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
//		Integer count = 0;
//		for (Integer deleteid : im_idlist) {
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery("delete from WorkimVO where im_id=?");
//				for (Integer deletecount : im_idlist) {
//					query.setParameter(0, deletecount);
//					count = query.executeUpdate();
//				}
//				session.getTransaction().commit();
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//		}
		return count;
	}

	@Override
	public Collection<WorkimVO> getByWorkid(Integer work_id) {
		List<WorkimVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			Query query = session.createQuery("from WorkimVO where work_id = ?");
			query.setParameter(0, work_id);// 點一次作品即來資料庫撈不知是否會大幅降低速度
			querylist = query.list();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	
	@Override
	public WorkimVO findByPK(Integer im_id) {
		WorkimVO workimVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			workimVO = (WorkimVO) session.get(WorkimVO.class, im_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return workimVO;
	}
	
	public static void main(String[] args) throws IOException {

		WorkimDAO dao = new WorkimDAO();

		//tested ok
//		Set<WorkimVO> workimVOset = new HashSet<WorkimVO>();
//
//		WorkVO workVO = new WorkVO();
//		workVO.setWork_id(5003);
//
//		String[] string = new String[] { "WebContent/image/jake.gif", "WebContent/image/jake.gif",
//				"WebContent/image/jake.gif"};
//		for (int i = 0; i < string.length; i++) {
//			WorkimVO workimVO = new WorkimVO();
//			FileInputStream fis = new FileInputStream(new File(string[i]));
//			ByteArrayOutputStream bs = new ByteArrayOutputStream();
//			byte[] buffer = new byte[fis.available()];
//			int length = 0;
//			while ((length = fis.read(buffer)) != -1) {
//				bs.write(buffer, 0, length);
//			}
//			byte[] b_image = bs.toByteArray();
//			workimVO.setIm_show(b_image);
//			workimVO.setWorkVO(workVO);
//			workimVOset.add(workimVO);
//		}
//		dao.insert(workimVOset);

		//delete tested ok
//		 Set<Integer> workimVOset2 = new HashSet<Integer>();
//		 workimVOset2.add(4022);
//		 workimVOset2.add(4023);
//		 System.out.println(dao.delete(workimVOset2));

		// //getByWorkid tested ok
//		 Collection<WorkimVO> WorkimVOlist =dao.getByWorkid(5002);
//		 for(WorkimVO WorkimVOlist2:WorkimVOlist){
//			 System.out.println(WorkimVOlist2.getIm_id());
//			 System.out.println(WorkimVOlist2.getIm_show());
//		 }

	}
}
