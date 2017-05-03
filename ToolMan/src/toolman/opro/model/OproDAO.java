package toolman.opro.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.order.model.OrderVO;
import toolman.work.model.WorkVO;

public class OproDAO implements OproDAO_Interface {

	@Override
	public Collection<OproVO> getOproByMproId(Collection<Integer> mpro_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<OproVO> oprolist = new LinkedList<OproVO>();
		try {
			session.beginTransaction();
			for(Integer getmproid:mpro_id){
			Query query = session.createQuery("from OproVO where mpro_id=?");			
			query.setParameter(1, getmproid);
			oprolist.add((OproVO)query.list().get(0));
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}
	
	@Override
	public OproVO getOproByOId(Integer o_id) {
		OproVO  oproVO  = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();	
		try {
			session.beginTransaction();
			Query query  = session.createQuery("from OproVO where o_id=?");
			query.setParameter(1, o_id);
			oproVO = (OproVO)query.list().get(0);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return oproVO;
	}
	
	

	@Override
	public void insertOpro(Collection<OproVO> oproVOset) {
		for(OproVO getoproVO:oproVOset){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(getoproVO);
			session.getTransaction().commit();
			
			} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
			}
		}
	}
	public static void main(String[] args) throws IOException {

		
		
//		//insert
		OproDAO dao = new OproDAO();
		Set<OproVO> oproVOset = new HashSet<OproVO>();
		OrderVO orderVO = new OrderVO();
		orderVO.setO_id(3001);
		
//		MproVO MproVO = new MproVO();//合併師傅專業後打開
//		MproVO.setM_proid(10000);//合併師傅專業後打開
		
		OproVO oproVO = new OproVO();
		oproVO.setO_pro("木工");
		oproVO.setM_proid(10001);//合併師傅專業後註解
		oproVO.setO_id(orderVO);
		oproVOset.add(oproVO);	
		dao.insertOpro(oproVOset);
		
//		//delete
//		Set<Integer> workimVOset2 = new HashSet<Integer>();
//		workimVOset2.add(4026);
//		workimVOset2.add(4027);
//		workimVOset2.add(4028);
//		dao.delete(workimVOset2);

//		//getByWorkid
//		Collection<WorkimVO> WorkimVOlist =dao.getByWorkid(5001);
//		for(WorkimVO WorkimVOlist2:WorkimVOlist){
//			System.out.println(WorkimVOlist2.getIm_id());		
//			System.out.println(WorkimVOlist2.getIm_show());
//		}
//		

		}

	
	
}
