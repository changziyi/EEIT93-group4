package toolman.rdata.model;

import java.util.List;

import toolman.rdata.model.RdataVO;

public class RdataService {
	private RdataDAO_interface dao;

	public RdataService() {
		dao = new RdataJDBCDAO();
	}

	
	
	
	public RdataVO addRdata(java.sql.Date r_date, String c_id, Integer m_id, String p_summary, String p_content,
			String s_name, String sa_rnote, Integer d_id ) {

		RdataVO rdataVO = new RdataVO();

		rdataVO.setR_date(r_date);
		rdataVO.setC_id(c_id);
		rdataVO.setM_id(m_id);
		rdataVO.setP_summary(p_summary);
		rdataVO.setP_content(p_content);
		rdataVO.setS_name(s_name);
		rdataVO.setSa_rnote(sa_rnote);
		rdataVO.setD_id(d_id);
		dao.insert(rdataVO);

		return rdataVO;
	}

	public RdataVO updateRdata(Integer r_id,java.sql.Date r_date, String c_id, Integer m_id, String p_summary, String p_content,
			String s_name, String sa_rnote, Integer d_id ) {

		RdataVO rdataVO = new RdataVO();

		rdataVO.setR_id(r_id);
		rdataVO.setR_date(r_date);
		rdataVO.setC_id(c_id);
		rdataVO.setM_id(m_id);
		rdataVO.setP_summary(p_summary);
		rdataVO.setP_content(p_content);
		rdataVO.setS_name(s_name);
		rdataVO.setSa_rnote(sa_rnote);
		rdataVO.setD_id(d_id);

		return dao.findByPrimaryKey(r_id);
	}
	public List<RdataVO> getAll() {
		return dao.getAll();
	}
}
