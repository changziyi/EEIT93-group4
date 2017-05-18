package toolman.blacklist.model;

import org.hibernate.*;


import hibernate.util.HibernateUtil;
import toolman.order.model.OrderVO;

import java.util.*;


public class BlacklistDAO implements BlacklistDAO_interface {
	
	
	@Override
	public void insert(BlacklistVO BlacklistVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(BlacklistVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<BlacklistVO> getBlackSerch(String c_id ,Integer m_id) {
		List<BlacklistVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Integer count = 0;
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM OrderVO WHERE c_id = ? AND m_id = ?");
			query.setParameter(1, c_id);
			query.setParameter(2, m_id);
            querylist = query.list();	
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}
	
	
	@Override
	public void delete(Integer bk_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			BlacklistVO empVO = new BlacklistVO();
			empVO.setBk_id(bk_id);
			session.delete(empVO);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public BlacklistVO findByPrimaryKey(Integer bk_id) {
		BlacklistVO empVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			empVO = (BlacklistVO) session.get(BlacklistVO.class, bk_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return empVO;
	}

	@Override
	public List<BlacklistVO> getAllBlacklist() {
		List<BlacklistVO> querylist = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("from BlacklistVO");
			querylist = query.list();			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return querylist;
	}

	public static void main(String[] args) {

		BlacklistDAO dao = new BlacklistDAO();

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
		List<BlacklistVO> list = dao.getAllBlacklist();
		for (BlacklistVO aEmp : list) {
			System.out.print(aEmp.getBk_id() + ",");

			System.out.print(aEmp.getCdataVO().getC_id() + ",");
			System.out.print(aEmp.getMdataVO().getM_id() + ",");
			System.out.println();
		}
	}
}
