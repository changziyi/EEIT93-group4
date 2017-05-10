package toolman.discussion.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

public class DiscussionService {
	
	DiscussionDAO dao = null;
	
	public DiscussionService() {
		dao = new DiscussionDAO();
	}
	
	public void insert(DiscussionVO discussionVO) {
		dao.insert(discussionVO);
	}
	
	public void delete(Integer d_id) {
		dao.delete(d_id);
	}
	
	public List<DiscussionVO> getByMid(Integer m_id) {
		return dao.getByMid(m_id);
	}
	
	public String getByMidJson(Integer m_id) {
		List<DiscussionVO> discussions = dao.getByMid(m_id);
		List<Map> jList = new LinkedList<Map>();
		for (DiscussionVO aDiscussions : discussions) {
			Map jContent = new HashMap();
			jContent.put("mid", aDiscussions.getMdataVO().getM_id());
			jContent.put("cid", aDiscussions.getCdataVO().getC_id());
			jContent.put("des", aDiscussions.getD_des());
			jContent.put("reply", aDiscussions.getD_reply());
			jContent.put("date", aDiscussions.getD_date().toString());
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
}
