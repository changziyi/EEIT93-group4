package toolman.wishpool.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Order;



public class WishpoolService {

	private WishpoolDAO_interface dao;

	public WishpoolService() {
		dao = new WishpoolDAO();
	}

	public void insert(WishpoolVO wishpoolVO) {
		dao.insert(wishpoolVO);
	}
	
	public List<WishpoolVO> getAll(String order, String city) {
		
		System.out.println(order);
		System.out.println(city);
		
		return dao.getAllByDate(order, city);
		
	}
		/*List<WishpoolVO> list = new ArrayList<WishpoolVO>();
		WishpoolVO wp1 = new WishpoolVO();
		wp1.setW_id(1);
		wp1.setC_id("1");
		wp1.setW_pro("電腦");
		wp1.setW_city("台北市");
		wp1.setW_district("北投區");
		//wp1.setW_image();
		wp1.setW_city("藍屏又一直當機");
		//wp1.setW_date(2017-12-08);
		list.add(wp1);
		
		
		WishpoolVO wp2 = new WishpoolVO();
		wp2.setW_id(2);
		wp2.setC_id("2");
		wp2.setW_pro("電腦");
		wp2.setW_city("台北市");
		wp2.setW_district("北投區");
		//wp1.setW_image();
		wp2.setW_city("藍屏又一直當機");
		//wp1.setW_date(2017-12-08);
		list.add(wp2);
		
		
		WishpoolVO wp3 = new WishpoolVO();
		wp3.setW_id(3);
		wp3.setC_id("3");
		wp3.setW_pro("電腦");
		wp3.setW_city("台北市");
		wp3.setW_district("北投區");
		//wp1.setW_image();
		wp3.setW_city("藍屏又一直當機");
		//wp1.setW_date(2017-12-08);
		list.add(wp3);
		
		WishpoolVO wp4 = new WishpoolVO();
		wp4.setW_id(4);
		wp4.setC_id("4");
		wp4.setW_pro("電腦");
		wp4.setW_city("台北市");
		wp4.setW_district("北投區");
		//wp1.setW_image();
		wp4.setW_city("藍屏又一直當機");
		//wp1.setW_date(2017-12-08);
		list.add(wp4);
		
		return list;*/
	
	
	
	public List<WishpoolVO> getAll() {
		return dao.getAll();
	}
	
	
	public WishpoolVO findByPrimaryKey(Integer w_id) {
		return dao.findByPrimaryKey(w_id);
	}
	
    //新增
	/*public WishpoolVO updateWishpool(Integer w_id, String c_id, String w_content, byte[] w_image,
			String w_pro, String s_name, String w_city,String w_district, Date w_date ) {

		WishpoolVO wishpoolVO = new WishpoolVO();

		wishpoolVO.setW_id(w_id);
		wishpoolVO.setC_id(c_id);
		wishpoolVO.setW_content(w_content);
		wishpoolVO.setW_image(w_image);
		wishpoolVO.setW_pro(w_pro);
		wishpoolVO.setS_name(s_name);
		wishpoolVO.setW_city(w_city);
		wishpoolVO.setW_district(w_district);
		wishpoolVO.setW_date(w_date);
		dao.update(wishpoolVO);

		return dao.findByPrimaryKey(w_id);
	}
	
	//�w�d�� Struts 2 �Ϊ�
	public void updateWishpool(WishpoolVO wishpoolVO) {
		dao.update(wishpoolVO);
	}

	public void deleteWishpool(Integer w_id) {
		dao.delete(w_id);
	}

	public WishpoolVO getOneWishpool(Integer w_id) {
		return dao.findByPrimaryKey(w_id);
	}

	public List<WishpoolVO> getAll() {
		return dao.getAll();
	}*/
}
