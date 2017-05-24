package toolman.mpro.model;

import java.util.List;

public class MProService {
	
	private MProDAO_interface dao;

	public MProService() {
		dao = new MProDAO();
	}
	
	public List<Object> getByMidSp(Integer m_id) {
		return dao.getByMidSp(m_id);
	}
	
	public void insertSql(Integer m_id, String m_pro) {
		dao.insertSql(m_id, m_pro);
	}
	
	public void deleteSql(Integer m_id) {
		dao.deleteSql(m_id);
	}
	
}
