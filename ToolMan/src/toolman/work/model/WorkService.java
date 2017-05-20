package toolman.work.model;

import toolman.workim.model.WorkimDAO;
import toolman.workim.model.WorkimService;

public class WorkService {
	
	private WorkDAO_interface dao;

	public WorkService() {
		dao = new WorkDAO();
	}
	public void insert(WorkVO workVO) {
		dao.insert(workVO);
	}
	public void delete(Integer work_id) {
		WorkimService workimservice = new WorkimService();
		workimservice.deleteByWork(dao.findByPrimaryKey(work_id));
		dao.delete(work_id);
	}
	public WorkVO findByPrimaryKey(Integer work_id) {
		return dao.findByPrimaryKey(work_id);
	}
}
