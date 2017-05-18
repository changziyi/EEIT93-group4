package toolman.ad.model;

import java.util.List;

import toolman.mdata.model.MdataVO;
import toolman.wishpool.model.WishpoolVO;

public class AdService {

	private AdDAO_interface dao;
	
	public AdService() {
		dao = new AdDAO();
	
}
	public void insert(AdVO adVO) {
		dao.insert(adVO);
	}
	
	
	
	public AdVO findByPrimaryKey(Integer ad_id) {
		return dao.findByPrimaryKey(ad_id);
	}
	
	public List<AdVO> findBySname(String s_name) {
		return dao.findBySname(s_name);
	}

	public List<AdVO> getAll() {
		return dao.getAll();
	}

	public List<AdVO> getAllBySname(String s_name) {
		return dao.getAllBySname(s_name);
	}
	
	
	
}
