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
	
}
