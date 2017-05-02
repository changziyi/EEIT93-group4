package toolman.wishpool.model;

import java.sql.Date;
import java.sql.Timestamp;


public class WishpoolService {

	private WishpoolDAO_interface dao;

	public WishpoolService() {
		dao = new WishpoolDAO();
	}

	public WishpoolVO insert(String w_pro, String w_city,String w_district, byte[] w_image,
			String w_content) {

		WishpoolVO wishpoolVO = new WishpoolVO();

		wishpoolVO.setW_pro(w_pro);
		wishpoolVO.setW_city(w_city);
		wishpoolVO.setW_district(w_district);
		wishpoolVO.setW_image(w_image);
		wishpoolVO.setW_city(w_content);
		dao.insert(wishpoolVO);

		return wishpoolVO;
	}
	
	
	public void insert(WishpoolVO wishpoolVO) {
		dao.insert(wishpoolVO);
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
