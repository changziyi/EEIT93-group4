package toolman.building.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import toolman.work.model.WorkVO;

public class BuildingDAO implements BuildingDAO_Interface{

	@Override
	public BuildingVO getBuildingByType(Integer h_type) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();	
		BuildingVO buildingVO = new BuildingVO();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from BuildingVO where h_type=?");
			query.setParameter(1, h_type);//點一次作品即來資料庫撈不知是否會大幅降低速度
			buildingVO = (BuildingVO) query.list().get(0);		
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return buildingVO;
	}

}
