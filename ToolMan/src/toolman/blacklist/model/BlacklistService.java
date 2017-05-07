package toolman.blacklist.model;

public class BlacklistService {
	private BlacklistDAO_interface dao;

	public BlacklistService() {
		dao = new BlacklistJDBCDAO();
	}

	
	
	
	public BlacklistVO addBlacklist(String c_id, Integer m_id) {

		BlacklistVO blacklistVO = new BlacklistVO();

		
		blacklistVO.setC_id(c_id);
		blacklistVO.setM_id(m_id);
		
		dao.insert(blacklistVO);

		return blacklistVO;
	}

}
