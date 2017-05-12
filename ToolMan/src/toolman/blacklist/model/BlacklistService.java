package toolman.blacklist.model;

import java.util.List;

import toolman.cdata.model.CdataVO;
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;

public class BlacklistService {
	private BlacklistDAO_interface dao;

	public BlacklistService() {
		dao = new BlacklistDAO();
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


		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		blacklistVO.setCdataVO(cdataVO);

		MdataVO mdataVO = new MdataVO();
		mdataVO.setM_id(m_id);
		blacklistVO.setMdataVO(mdataVO);
		
		dao.insert(blacklistVO);

		return blacklistVO;
	}

}
