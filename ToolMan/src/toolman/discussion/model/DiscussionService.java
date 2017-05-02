package toolman.discussion.model;

public class DiscussionService {
	
	DiscussionDAO_interface dao = null;
	
	public DiscussionService() {
		dao = new DiscussionDAO();
	}
	
	public void insert(DiscussionVO discussionVO) {
		dao.insert(discussionVO);
	}
	
	public void delete(Integer d_id) {
		dao.delete(d_id);
	}
	
}
