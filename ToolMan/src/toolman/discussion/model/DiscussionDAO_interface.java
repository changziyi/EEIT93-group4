package toolman.discussion.model;

import java.util.List;

import toolman.mdata.model.MdataVO;

public interface DiscussionDAO_interface {
	public void insert(DiscussionVO discussionVO);
	public void delete(Integer d_id);
	public List<DiscussionVO> getAll();
	public List<DiscussionVO> getByMid(Integer m_id);
	public List<Object[]> getByMidSql(Integer m_id);
	public void insertSql(DiscussionVO discussionVO);
	public void updateSql(Integer d_id, String d_reply);
}
