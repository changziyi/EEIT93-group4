package toolman.mdata.model;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;

import org.hibernate.criterion.Restrictions;

import hibernate.util.HibernateUtil;
import toolman.mpro.model.MProVO;
import toolman.order.model.OrderVO;
import toolman.work.model.WorkVO;


public class MdataDAO implements MdataDAO_interface {
	
	private static final String GET_ALL_STMT = "from MdataVO order by m_id";
	
	@Override
	public void insert(MdataVO mdataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(mdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(MdataVO mdataVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(mdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer m_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			MdataVO mdataVO = (MdataVO) session.get(MdataVO.class, m_id);
			session.delete(mdataVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	@Override   //訂單
	public Set<OrderVO> getOrderByM(Integer m_id) {		
		Set<OrderVO> set = findByPrimaryKey(m_id).getOrders();
		return set;
	}
	
	@Override
	public MdataVO findByPrimaryKey(Integer m_id) {
		MdataVO mdataVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			mdataVO = (MdataVO) session.get(MdataVO.class, m_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return mdataVO;
	}

	@Override
	public List<MdataVO> getAll() {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<MdataVO> getCity(String m_city) {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from MdataVO where m_city like ?");
			query.setParameter(0, "%" + m_city + "%");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public List<MdataVO> getDistrict(String m_district) {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from MdataVO where m_district like ?");
			query.setParameter(0, "%" + m_district + "%");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<MdataVO> getCityAndDistrict(String m_city, String m_district) {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from MdataVO where m_city like ? and m_district like ?");
			query.setParameter(0, "%" + m_city + "%");
			query.setParameter(1, "%" + m_district + "%");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<MdataVO> SeachByCityAndDistrictAndMpro(String m_city, String m_district, String m_pro) {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(MdataVO.class, "m");
			query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			query.createAlias("m.mpros","p");
			Criterion c1 = Restrictions.eq("m.m_city", m_city);
			Criterion c2 = Restrictions.like("m.m_district", "%" + m_district + "%");
			Criterion c3 = Restrictions.like("p.m_pro", "%" + m_pro + "%");
			query.add(Restrictions.and(Restrictions.and(c1,c2),c3));
//			query.add(Restrictions.sqlRestriction("1=1 order by rand()"));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<MdataVO> SearchByCityAndMpro(String m_city, String input) {
		List<MdataVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(MdataVO.class, "m");
			query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			query.createAlias("m.mpros","p");
			Criterion c1 = Restrictions.eq("m.m_city", m_city);
			Criterion c2 = Restrictions.like("m.b_name", "%" + input + "%");
			Criterion c3 = Restrictions.like("p.m_pro", "%" + input + "%");
			query.add(Restrictions.or(Restrictions.and(c1,c2),Restrictions.and(c1,c3)));
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	//BY BENNY-- Benny's recommendation function
		@Override
		public List<MdataVO> getCityAndDistrictAndMPro(String m_city, String m_district, String m_pro) {
			List<MdataVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Criteria query = session.createCriteria(MdataVO.class, "m");
				query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// transform the result to distinct
				query.createAlias("m.mpros","p");// set alias for variable mpros and it's table
				Criterion c1 = Restrictions.eq("m.m_city", m_city);
				Criterion c2 = Restrictions.eq("m.m_district", m_district);
				Criterion c3 = Restrictions.like("p.m_pro", "%" + m_pro + "%");//retrieve m_pro column from the 
//				query.add(Restrictions.and(c1,c2));//tested ok
//				query.add(Restrictions.and(c1,c3));//tested ok
				query.add(Restrictions.or(
						Restrictions.and(Restrictions.and(c1,c2),Restrictions.and(c2,c3)),
						Restrictions.and(c1,c3)
						)
					);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		//BY BENNY--for manager backstage
		public Integer updatemasterSname(Integer m_id,String s_name) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			Integer count=0;
			try {
				session.beginTransaction();
				Query query = session.createQuery("update MdataVO set s_name=:s where m_id=:m");
				query.setParameter("s",s_name);
				query.setParameter("m",m_id);
				count = query.executeUpdate();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return count;
		}
		//BY BENNY--for manager backstage
		public int updatecustomerSamnote(Integer m_id, String sa_mnote){//by Benny
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			int count=0;
			try {
				session.beginTransaction();
				Query query = session.createQuery("update MdataVO set sa_mnote=:snote where m_id=:m");
				query.setParameter("snote",sa_mnote);
				query.setParameter("m",m_id);
				count = query.executeUpdate();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return count;
		}
		//BY BENNY--for manager backstage
		@Override
		public List<MdataVO> getBySname(String s_name) {
			List<MdataVO> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery("from MdataVO where s_name=:s ");
				query.setString("s",s_name);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		//BY BENNY--for manager backstage
		public MdataVO getMasterByB(String b_name){
			
			MdataVO mdataVO = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createQuery("from MdataVO where b_name=:b ");
				query.setString("b",b_name);
				mdataVO = (MdataVO) query.list().get(0);
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return mdataVO;
			
		}//by Benny
		
		@Override
		public List<Object[]> search(String city, String district, String input) {
			List<Object[]> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("{call masterQuery(?,?,?)}");
				query.setParameter(0, city);
				query.setParameter(1, district);
				query.setParameter(2, input);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		
		@Override
		public byte[] getImg(Integer m_id) {
			byte[] img = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("SELECT b_image FROM mdata WHERE m_id = ?");
				query.setParameter(0, m_id);
				img = (byte[])(query.list().get(0));
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return img;
		}
		
		@Override
		public List<Object[]> searchByMpro (String pro, String city, String district, String bname) {
			List<Object[]> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("{call mproQuery(?,?,?,?)}");
				query.setParameter(0, pro);
				query.setParameter(1, city);
				query.setParameter(2, district);
				query.setParameter(3, bname);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		
		@Override
		public List<Object[]> searchAll() {
			List<Object[]> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("SELECT m_id, b_name, m_name, m_city, m_district, b_des, m_arating, o_finished, s_name FROM mdata WHERE s_name = '審核通過'");
//				query.setFirstResult(0);
//				query.setMaxResults(3);
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		
		@Override
		public List<Object[]> searchAllRandom() {
			List<Object[]> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("SELECT m_id, b_name, m_name, m_city, m_district, b_des, m_arating, o_finished, s_name FROM mdata ORDER BY NEWID()");
				list = query.list();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
			return list;
		}
		
		@Override
		public List<Object[]> searchOne(Integer m_id) {
			List<Object[]> list = null;
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("SELECT b_name, m_name, m_cel, m_email, m_city, m_district, m_addr, b_des, b_image, m_cer, s_name FROM mdata WHERE m_id=?");
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
		public void updateSql(MdataVO mdataVO) {
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try {
				session.beginTransaction();
				Query query = session.createSQLQuery("UPDATE mdata SET b_name=?, m_name=?, m_cel=?, m_email=?, m_city=?, m_district=?, m_addr=?, b_des=?, b_image=?, m_cer=? WHERE m_id = ?");
				query.setParameter(0, mdataVO.getB_name());
				query.setParameter(1, mdataVO.getM_name());
				query.setParameter(2, mdataVO.getM_cel());
				query.setParameter(3, mdataVO.getM_email());
				query.setParameter(4, mdataVO.getM_city());
				query.setParameter(5, mdataVO.getM_district());
				query.setParameter(6, mdataVO.getM_addr());
				query.setParameter(7, mdataVO.getB_des());
				query.setParameter(8, mdataVO.getB_image());
				query.setParameter(9, mdataVO.getM_cer());
				query.setParameter(10, mdataVO.getM_id());
				query.executeUpdate();
				session.getTransaction().commit();
			} catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		}
		
		
	public static void main(String[] args) throws IOException {
//		
		MdataDAO dao = new MdataDAO();
		
		MdataVO mdataVO = new MdataVO();
		
		mdataVO.setM_id(1005);
		mdataVO.setB_name("b_name");
		mdataVO.setM_name("m_name");
		mdataVO.setM_cel("cel");
		mdataVO.setM_email("email");
		mdataVO.setM_city("city");
		mdataVO.setM_district("district");
		mdataVO.setM_addr("addr");
		mdataVO.setB_des("des");
		mdataVO.setB_image(null);
		mdataVO.setM_cer(null);
		
		dao.updateSql(mdataVO);
		
		
//		List<Object[]> list = dao.searchAll();
//		for(Object[] alist : list) {
//			System.out.print(alist[0] + ",");
//			System.out.print(alist[1] + ",");
//			System.out.print(alist[2] + ",");
//			System.out.print(alist[3] + ",");
//			System.out.print(alist[4] + ",");
//			System.out.print(alist[5] + ",");
//			System.out.print(alist[6] + ",");
//			System.out.print(alist[7] + ",");
//			System.out.println(alist[8]);
//		}
		
//		List<Object[]> list = dao.searchByMpro("地板地磚", "臺北市", "", "樹");
//		for(Object[] alist : list) {
//			System.out.print(alist[0] + ",");
//			System.out.print(alist[1] + ",");
//			System.out.print(alist[2] + ",");
//			System.out.print(alist[3] + ",");
//			System.out.print(alist[4] + ",");
//			System.out.print(alist[5] + ",");
//			System.out.print(alist[6] + ",");
//			System.out.print(alist[7] + ",");
//			System.out.println(alist[8]);
//		}
		
//		List<Object[]> list = dao.search("臺北市","","");
//		for(Object[] alist :list) {
//			System.out.print(alist[0] + ",");
//			System.out.print(alist[1] + ",");
//			System.out.print(alist[2] + ",");
//			System.out.print(alist[3] + ",");
//			System.out.print(alist[4] + ",");
//			System.out.println(alist[5]);
//		}
		
		//C車讀圖片
//		byte[] img = dao.getImg(1001);
//		FileOutputStream out = new FileOutputStream("D:\\test333.jpg");
//		out.write(img);
//		out.close();
		
//		dao.updatemasterSname(1001);
		
		//測試作品集
//		MdataVO mdataVO = dao.findByPrimaryKey(1001);
//		Set<WorkVO> workVO =  mdataVO.getWorks();
//		for(WorkVO aWork : workVO) {
//			System.out.println(aWork.getWork_id());
//			System.out.println(aWork.getImg1());
//			System.out.println(aWork.getImg2());
//			System.out.println(aWork.getImg3());
//		}
		
		//測試orders
//		MdataVO mdataVO = dao.findByPrimaryKey(1001);
//		Set<OrderVO> orders = mdataVO.getOrders();
//		for(OrderVO aOrder : orders) {
//			System.out.print(aOrder.getC_id().getC_id());
//		}
		
		//依照縣市、地區、專業查詢 --> 查師父頁面進階搜尋:條件為1.縣市、2.地區、3.專業
//		List<MdataVO> list8 = dao.SeachByCityAndDistrictAndMpro("臺北市","","");
//		for (MdataVO list : list8) {
//			System.out.print(list.getM_city() + ",");
//			System.out.print(list.getM_district() + ",");
//			System.out.print(list.getM_id() + ",");
//			System.out.print(list.getM_name() + ",");
//			System.out.println(list.getB_name());
//			Set<MProVO> mpros = list.getMpros();
//			for (MProVO aMpro : mpros) {
//				System.out.println(aMpro.getM_pro());
//			}
//			System.out.println("-----------------");
//		}
		
		//by benny getByMidAndSname
//		List<MdataVO> list8 = dao.getBySname("審核通過");
//		for (MdataVO list : list8) {
//			System.out.print(list.getM_city() + ",");
//			System.out.print(list.getM_district() + ",");
//			System.out.print(list.getM_id() + ",");
//			System.out.print(list.getM_name() + ",");
//			System.out.println(list.getB_name());
//			Set<MProVO> mpros = list.getMpros();
//			for (MProVO aMpro : mpros) {
//				System.out.println(aMpro.getM_pro());
//			}
//			System.out.println("-----------------");
//		}
		
		//by benny getByMidAndSname
//		List<MdataVO> list8 = dao.getByAndSname("審核通過");
//		for (MdataVO list : list8) {
//			System.out.print(list.getM_city() + ",");
//			System.out.print(list.getM_district() + ",");
//			System.out.print(list.getM_id() + ",");
//			System.out.print(list.getM_name() + ",");
//			System.out.println(list.getB_name());
//			Set<MProVO> mpros = list.getMpros();
//			for (MProVO aMpro : mpros) {
//				System.out.println(aMpro.getM_pro());
//			}
//			System.out.println("-----------------");
//		}
		
//		//D車join　依照縣市 AND(專業 OR 店家名稱)查詢 --> 首頁搜尋:條件為1.縣市、2.專業or店家名稱
//		List<MdataVO> list7 = dao.SearchByCityAndMpro("臺北市","水");
//		for (MdataVO list : list7) {
//			System.out.print(list.getM_city() + ",");
//			System.out.print(list.getM_id() + ",");
//			System.out.print(list.getM_name() + ",");
//			System.out.println(list.getB_name());
//			Set<MProVO> mpros = list.getMpros();
//			for (MProVO aMpro : mpros) {
//				System.out.println(aMpro.getM_pro());
//			}
//			System.out.println("-----------------");
//		}

		
		//B車join
//		List<Object[]> list5 = dao.Search_B("水");
//		
//		for (Object[] ob : list5) {
//			System.out.println(ob[0]);
//			System.out.println(ob[1]);
//		}
		
		
		//新增-1 (同時新增師父和專業)(一方mdata.hbm.xml必須有cascade="save-update" 或cascade="all"的設定)
//		MdataVO mdataVO = new MdataVO();
//		Set<MProVO> set = new HashSet<MProVO>();
//		
//		MProVO mproVO1 = new MProVO();
//		mproVO1.setM_pro("防水抓漏");
//		mproVO1.setMdataVO(mdataVO);
//		set.add(mproVO1);
//		
//		MProVO mproVO2 = new MProVO();
//		mproVO2.setM_pro("地板地磚");
//		mproVO2.setMdataVO(mdataVO);
//		set.add(mproVO2);
//
//		MProVO mproVO3 = new MProVO();
//		mproVO3.setM_pro("油漆工程");
//		mproVO3.setMdataVO(mdataVO);
//		set.add(mproVO3);
//		
//		mdataVO.setM_name("阿部師_insert1");
//		mdataVO.setM_pros(set);
//		dao.insert(mdataVO);
		
		
		//新增-2 (只新增師父)(不需設定cascade="save-update" 或 cascade="all")(這是經常要用到的一般新增)
//		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_name("阿部師_insert2");
//		dao.insert(mdataVO);
		
		//------------------------------------------
		
		//修改-1 (同時修改師父和專業)(一方dept2.hbm.xml必須有cascade="save-update" 或cascade="all"的設定)
//		MdataVO mdataVO = new MdataVO();
//		Set<MProVO> set = new HashSet<MProVO>();
//		
//		MProVO mproVO1 = new MProVO();
//		mproVO1.setM_proid(10005);
//		mproVO1.setM_pro("防水抓漏_update");
//		mproVO1.setMdataVO(mdataVO);
//		set.add(mproVO1);
//
//		MProVO mproVO3 = new MProVO();
//		mproVO3.setM_proid(10006);
//		mproVO3.setM_pro("油漆工程_update");
//		mproVO3.setMdataVO(mdataVO);
//		set.add(mproVO3);
//		
//		mdataVO.setM_id(1000);
//		mdataVO.setM_name("阿部師_update");
//		mdataVO.setM_pros(set);
//		dao.insert(mdataVO);

		
		//修改-2 (只修改師父)(不需設定cascade="save-update" 或 cascade="all")(這是經常要用到的一般修改)
//		MdataVO mdataVO = new MdataVO();
//		mdataVO.setM_id(1000);
//		mdataVO.setM_name("阿部師_update2");
//		dao.insert(mdataVO);
		
		//------------------------------------------
		
		//刪除 (同時刪除師父和專業)(一方mdata.hbm.xml必須有cascade="delete" 或 cascade="all"的設定, 再加上inverse="true"設定)
//		dao.delete(1004);
		
		//------------------------------------------
		
		//查詢-findByPrimaryKey(一方mdata.hbm.xml必須設為lazy="false")
//		MdataVO mdataVO = dao.findByPrimaryKey(1000);
//		System.out.print(mdataVO.getM_id() + ",");
//		System.out.print(mdataVO.getM_name() + ",");
//		System.out.print(mdataVO.getB_name() + ",");
//		System.out.print(mdataVO.getM_cel() + ",");
//		System.out.print(mdataVO.getM_email() + ",");
//		System.out.print(mdataVO.getM_city() + ",");
//		System.out.print(mdataVO.getM_district() + ",");
//		System.out.print(mdataVO.getM_addr() + ",");
//		System.out.print(mdataVO.getM_jdate() + ",");
//		System.out.print(mdataVO.getM_arating() + ",");
//		System.out.print(mdataVO.getO_finished() + ",");
//		System.out.print(mdataVO.getO_current() + ",");
//		System.out.print(mdataVO.getS_name() + ",");
//		System.out.print(mdataVO.getB_image() + ",");
//		System.out.print(mdataVO.getB_des() + ",");
//		System.out.println(mdataVO.getSa_mnote());
//		System.out.println("----------------------------------");
//		Set<MProVO> set = mdataVO.getMpros();
//		for (MProVO aMPro : set) {
//			System.out.print(aMPro.getM_proid() + ",");
//			System.out.println(aMPro.getM_pro());
//		}
		
		//------------------------------------------
		
		//查詢-getAll-1(只查師父)(一方mdata.hbm.xml不用設為lazy="false",因為沒用到多方的物件)
//		List<MdataVO> list1 = dao.getAll();
//		for (MdataVO aMaster : list1) {
//			System.out.print(aMaster.getM_id() + ",");
//			System.out.print(aMaster.getM_name() + ",");
//			System.out.print(aMaster.getB_name() + ",");
//			System.out.print(aMaster.getM_cel() + ",");
//			System.out.print(aMaster.getM_email() + ",");
//			System.out.print(aMaster.getM_city() + ",");
//			System.out.print(aMaster.getM_district() + ",");
//			System.out.print(aMaster.getM_addr() + ",");
//			System.out.print(aMaster.getM_jdate() + ",");
//			System.out.print(aMaster.getM_arating() + ",");
//			System.out.print(aMaster.getO_finished() + ",");
//			System.out.print(aMaster.getO_current() + ",");
//			System.out.print(aMaster.getS_name() + ",");
//			System.out.print(aMaster.getB_image() + ",");
//			System.out.print(aMaster.getB_des() + ",");
//			System.out.println(aMaster.getSa_mnote());
//		}
		
		
		//查詢-getAll-2(同時查師父和專業)(一方mdata.hbm.xml必須設為lazy="false")
//		List<MdataVO> list2 = dao.getAll();
//		System.out.println("----------------------------------");
//		for (MdataVO aMaster : list2) {
//			System.out.print(aMaster.getM_id() + ",");
//			System.out.print(aMaster.getM_name() + ",");
//			System.out.print(aMaster.getB_name() + ",");
//			System.out.print(aMaster.getM_cel() + ",");
//			System.out.print(aMaster.getM_email() + ",");
//			System.out.print(aMaster.getM_city() + ",");
//			System.out.print(aMaster.getM_district() + ",");
//			System.out.print(aMaster.getM_addr() + ",");
//			System.out.print(aMaster.getM_jdate() + ",");
//			System.out.print(aMaster.getM_arating() + ",");
//			System.out.print(aMaster.getO_finished() + ",");
//			System.out.print(aMaster.getO_current() + ",");
//			System.out.print(aMaster.getS_name() + ",");
//			System.out.print(aMaster.getB_image() + ",");
//			System.out.print(aMaster.getB_des() + ",");
//			System.out.println(aMaster.getSa_mnote());
//			Set<MProVO> set2 = aMaster.getMpros();
//			for (MProVO aMPro : set2) {
//				System.out.print(aMPro.getM_proid() + ",");
//				System.out.println(aMPro.getM_pro());
//			}
//			System.out.println("----------------------------------");
//		}
		
//		List<MdataVO> list3 = dao.getCity("北");
//		for (MdataVO list : list3) {
//			System.out.print(list.getM_name() + ",");
//			System.out.print(list.getM_city() + ",");
//			System.out.println(list.getM_district());
//		}
		
//		List<MdataVO> list4 = dao.getCityAndDistrict("北","中");
//		for (MdataVO list : list4) {
//			System.out.print(list.getM_name() + ",");
//			System.out.print(list.getM_city() + ",");
//			System.out.println(list.getM_district());
//		}
		
		
		
//		List<MdataVO[]> list5 = dao.Search();
//		
//		for (MdataVO[] aArray : list5) {
//			for (MdataVO list : aArray) {
//				System.out.print(list.getM_id() + ",");
//				System.out.print(list.getM_name() + ",");
//				System.out.print(list.getM_city() + ",");
//				System.out.println(list.getM_district());
//			}
//		}
		
		//Benny test
//		MdataDAO dao =new MdataDAO();
//		 List<MdataVO> vo = dao.getCityAndDistrictAndMPro("臺北市", "中正區", "");
//		 for (MdataVO list : vo) {
//			 	System.out.print(list.getM_id() + ",");
//			 	System.out.print(list.getM_name() + ",");
//			 	System.out.print(list.getB_name() + ",");
//				System.out.print(list.getM_city() + ",");
//				System.out.println(list.getM_district());
//				Set<MProVO> mpros = list.getMpros();
//				for(MProVO mpro : mpros) {
//					System.out.println(mpro.getM_pro());
//				}
//				System.out.println("---------------------");
//		 }
		
	}//main()




}//MasterDAO
