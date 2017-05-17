package toolman.rdata.model;

import java.sql.Timestamp;
import java.util.List;

import java.sql.Timestamp;

import toolman.cdata.model.CdataVO;
import toolman.discussion.model.DiscussionVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;
import toolman.rdata.model.RdataVO;

public class RdataService {
	private RdataDAO_interface dao;

	public RdataService() {
		dao = new RdataDAO();
	}

	
	
	
	public RdataVO addRdata(Timestamp r_date, String c_id, Integer m_id, String p_summary, String p_content,
			String s_name, String sa_rnote, Integer d_id , Integer o_id) {

		RdataVO rdataVO = new RdataVO();

		rdataVO.setR_date(r_date);
		
		

		rdataVO.setP_summary(p_summary);
		rdataVO.setP_content(p_content);
		rdataVO.setS_name(s_name);
		rdataVO.setSa_rnote(sa_rnote);
		
		
		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		rdataVO.setCdataVO(cdataVO);
		
		MdataVO mdataVO = new MdataVO();
		mdataVO.setM_id(m_id);
		rdataVO.setMdataVO(mdataVO);
				
		DiscussionVO discussionVO = new DiscussionVO();
		discussionVO.setD_id(d_id);
		rdataVO.setDiscussionVO(discussionVO);
		
		OrderVO orderVO = new OrderVO();
		orderVO.setO_id(o_id);
		rdataVO.setOrderVO(orderVO);

		dao.insert(rdataVO);

		return rdataVO;
	}

	public RdataVO updateRdata(Integer r_id,java.sql.Timestamp r_date, String c_id, Integer m_id, String p_summary, String p_content,
			String s_name, String sa_rnote, Integer d_id, Integer o_id  ) {

		RdataVO rdataVO = new RdataVO();

		rdataVO.setR_id(r_id);
		rdataVO.setR_date(r_date);
		DiscussionVO discussionVO = new DiscussionVO();
		discussionVO.setD_id(d_id);
		rdataVO.setDiscussionVO(discussionVO);
		
		
		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		rdataVO.setCdataVO(cdataVO);
		
		MdataVO mdataVO = new MdataVO();
		mdataVO.setM_id(m_id);
		rdataVO.setMdataVO(mdataVO);
		
		rdataVO.setP_summary(p_summary);
		rdataVO.setP_content(p_content);
		rdataVO.setS_name(s_name);
		rdataVO.setSa_rnote(sa_rnote);
	
		
		OrderVO orderVO = new OrderVO();
		orderVO.setO_id(o_id);
		rdataVO.setOrderVO(orderVO);
		return dao.findByPrimaryKey(r_id);
	}
	public List<RdataVO> getAll() {
		return dao.getAll();
	}
	public List<RdataVO> getBySname(String s_name) {		
		return dao.getBySname(s_name);
	}
}
