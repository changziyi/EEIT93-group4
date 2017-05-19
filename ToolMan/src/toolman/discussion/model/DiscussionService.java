package toolman.discussion.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

public class DiscussionService {
	
	DiscussionDAO_interface dao = null;
	
	public DiscussionService() {
		dao = new DiscussionDAO();
	}
	
	public void insert(DiscussionVO discussionVO) {
		dao.insert(discussionVO);
	}

	public void insertSql(DiscussionVO discussionVO) {
		dao.insertSql(discussionVO);
	}
	
	public void delete(Integer d_id) {
		dao.delete(d_id);
	}
	
	public List<DiscussionVO> getByMid(Integer m_id) {
		return dao.getByMid(m_id);
	}
	
	public void updateSql(Integer d_id, String d_reply) {
		dao.updateSql(d_id,d_reply);
	}
	
	public String getByMidJson(Integer m_id) {
		List<DiscussionVO> discussions = dao.getByMid(m_id);
		List<Map> jList = new LinkedList<Map>();
		for (DiscussionVO aDiscussions : discussions) {
			Map jContent = new HashMap();
			jContent.put("mid", aDiscussions.getMdataVO().getM_id());
			jContent.put("cid", aDiscussions.getC_id());
			jContent.put("des", aDiscussions.getD_des());
			jContent.put("reply", aDiscussions.getD_reply());
			jContent.put("date", aDiscussions.getD_date().toString());
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	public String getByMinSqlJson(Integer m_id) {
		List<Object[]> discussions = dao.getByMidSql(m_id);
		List<Map> jList = new LinkedList<Map>();
		for (Object[] aDiscussion : discussions) {
			Map jContent = new HashMap();
			jContent.put("did", aDiscussion[0]);
			jContent.put("mid", aDiscussion[1]);
			jContent.put("cid", aDiscussion[2]);
			jContent.put("date", (aDiscussion[3].toString()).substring(0, 19));
			jContent.put("des", aDiscussion[4]);
			jContent.put("reply", aDiscussion[5]);
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
}
