package toolman.blacklist.model;

import java.util.List;

import toolman.favorite.model.FavoriteVO;

public class BlacklistService {
	private BlacklistDAO_interface dao;

	public BlacklistService() {
		dao = new BlacklistJDBCDAO();
	}
	public List<BlacklistVO>  getAllBlacklist(){
    	List<BlacklistVO> blacklistlist = dao.getAllBlacklist();
    	return blacklistlist;
    }
	public void deleteBlacklist(Integer bk_id) {
		dao.delete(bk_id);
	}
	
	
	public BlacklistVO addBlacklist(String c_id, Integer m_id) {

		BlacklistVO blacklistVO = new BlacklistVO();

		
		blacklistVO.setC_id(c_id);
		blacklistVO.setM_id(m_id);
		
		dao.insert(blacklistVO);

		return blacklistVO;
	}

}
