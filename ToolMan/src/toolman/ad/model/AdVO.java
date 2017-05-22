package toolman.ad.model;

import java.sql.Timestamp;

import toolman.mdata.model.MdataVO;

public class AdVO implements java.io.Serializable {
	private Integer ad_id;
	private Integer m_id;
	private Timestamp ad_bdate;
	private Timestamp ad_enddate;
	private String s_name;
	private MdataVO mdataVO;

	public Integer getAd_id() {
		return ad_id;
	}

	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}

	public Integer getM_id() {
		return m_id;
	}

	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}

	public Timestamp getAd_bdate() {
		return ad_bdate;
	}

	public void setAd_bdate(Timestamp ad_bdate) {
		this.ad_bdate = ad_bdate;
	}

	public Timestamp getAd_enddate() {
		return ad_enddate;
	}

	public void setAd_enddate(Timestamp ad_enddate) {
		this.ad_enddate = ad_enddate;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public MdataVO getMdataVO() {
		return mdataVO;
	}

	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
	}
	
}
