package toolman.work.model;


public class WorkService {
	
	private WorkDAO_interface dao;

	public WorkService() {
		dao = new WorkDAO();
	}
	public void insert(WorkVO workVO) {
		dao.insert(workVO);
	}
	public WorkVO findByPrimaryKey(Integer work_id) {
		return dao.findByPrimaryKey(work_id);
	}
	
}
