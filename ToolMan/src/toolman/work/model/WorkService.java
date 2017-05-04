package toolman.work.model;


public class WorkService {
	
	private WorkDAO_interface dao;

	public WorkService() {
		dao = new WorkDAO();
	}
	
	public void insert(WorkVO workVO) {
		dao.insert(workVO);
	}
	
}
