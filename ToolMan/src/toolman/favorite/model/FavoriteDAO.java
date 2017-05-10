package toolman.favorite.model;

import org.hibernate.*;


import hibernate.util.HibernateUtil;
import toolman.order.model.OrderVO;

import java.util.*;


public class FavoriteDAO implements FavoriteDAO_interface {
	
	
	@Override
	public void insert(FavoriteVO FavoriteVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(FavoriteVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer f_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			FavoriteVO empvo = (FavoriteVO) session.get(FavoriteVO.class, f_id);
			session.delete(empvo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public FavoriteVO findByPrimaryKey(Integer f_id) {
		FavoriteVO empVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			empVO = (FavoriteVO) session.get(FavoriteVO.class, f_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return empVO;
	}

	@Override
	public List<FavoriteVO> getAllFavorite() {
		List<FavoriteVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from FavoriteVO");
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}

	public static void main(String[] args) {

		FavoriteDAO dao = new FavoriteDAO();

//		EmpVO empVO1 = new EmpVO();
//		empVO1.setEname("�d�ç�1");
//		empVO1.setJob("MANAGER");
//		empVO1.setHiredate(java.sql.Date.valueOf("2005-01-01"));
//		empVO1.setSal(new Double(50000));
//		empVO1.setComm(new Double(500));
//		empVO1.setDeptno(10);
//		dao.insert(empVO1);

		// �ק�
//		EmpVO empVO2 = new EmpVO();
//		empVO2.setEmpno(7001);
//		empVO2.setEname("�d�ç�2");
//		empVO2.setJob("MANAGER2");
//		empVO2.setHiredate(java.sql.Date.valueOf("2002-01-01"));
//		empVO2.setSal(new Double(20000));
//		empVO2.setComm(new Double(200));
//		empVO2.setDeptno(20);
//		dao.update(empVO2);

		// �R��
//		dao.delete(7014);

//		// �d��
//		EmpVO empVO3 = dao.findByPrimaryKey(7001);
//		System.out.print(empVO3.getEmpno() + ",");
//		System.out.print(empVO3.getEname() + ",");
//		System.out.print(empVO3.getJob() + ",");
//		System.out.print(empVO3.getHiredate() + ",");
//		System.out.print(empVO3.getSal() + ",");
//		System.out.print(empVO3.getComm() + ",");
//		System.out.println(empVO3.getDeptno());
//		System.out.println("---------------------");

		// �d��
		List<FavoriteVO> list = dao.getAllFavorite();
		for (FavoriteVO aEmp : list) {
			System.out.print(aEmp.getF_id() + ",");

			System.out.print(aEmp.getCdataVO().getC_id() + ",");
			System.out.print(aEmp.getMdataVO().getM_id() + ",");
			System.out.println();
		}
	}
}
