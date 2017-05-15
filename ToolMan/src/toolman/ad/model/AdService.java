package toolman.ad.model;

import java.util.List;

import toolman.mdata.model.MdataVO;

public class AdService {

	private AdDAO_interface dao;
	
	public AdService() {
		dao = new AdDAO();
	
}
	
	public AdVO findByPrimaryKey(Integer ad_id) {
		return dao.findByPrimaryKey(ad_id);
	}
	
	public AdVO findBySname(String s_name) {
		return dao.findBySname(s_name);
	}

	public List<AdVO> getAll() {
		return dao.getAll();
	}

	public List<AdVO> getAllBySname(String s_name) {
		return dao.getAllBySname(s_name);
	}
	
	
	
}
