package toolman.workim.model;

import java.util.Collection;

public class WorkimService {
	
	private WorkimDAO_interface dao;
	
	public WorkimService() {
		dao = new WorkimDAO();
	}
	
	public void insert(Collection<WorkimVO> workimset) {
		dao.insert(workimset);
	}
	
	public Collection<WorkimVO> getByWorkid(Integer work_id) {
		return dao.getByWorkid(work_id);
	}
	
	public byte[] getImg(Integer im_id) {
		return dao.getImg(im_id);
	}

}
