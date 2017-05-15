package toolman.mpro.model;

import java.util.Set;

import toolman.mdata.model.MdataVO;
import toolman.opro.model.OproVO;

public class MProVO implements java.io.Serializable{
	
	private Integer m_proid;
	private String m_pro;
	private MdataVO mdataVO;
//	private Set<OproVO> oproVO;
	
	
//	public Set<OproVO> getOproVO() {
//		return oproVO;
//	}
//	public void setOproVO(Set<OproVO> oproVO) {
//		this.oproVO = oproVO;
//	}
	
	public Integer getM_proid() {
		return m_proid;
	}

	public void setM_proid(Integer m_proid) {
		this.m_proid = m_proid;
	}
	public String getM_pro() {
		return m_pro;
	}
	public void setM_pro(String m_pro) {
		this.m_pro = m_pro;
	}
	public MdataVO getMdataVO() {
		return mdataVO;
	}
	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
	}
	
}
