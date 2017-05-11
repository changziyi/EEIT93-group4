package toolman.discussion.model;

import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;

public class DiscussionVO implements java.io.Serializable {
	private Integer d_id;
	private java.sql.Timestamp d_date;
	private String d_des;
	private String d_reply;
	private MdataVO mdataVO;
	private String c_id;
//	private CdataVO cdataVO;
	
	public Integer getD_id() {
		return d_id;
	}
	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}
	public java.sql.Timestamp getD_date() {
		return d_date;
	}
	public void setD_date(java.sql.Timestamp d_date) {
		this.d_date = d_date;
	}
	public String getD_des() {
		return d_des;
	}
	public void setD_des(String d_des) {
		this.d_des = d_des;
	}
	public String getD_reply() {
		return d_reply;
	}
	public void setD_reply(String d_reply) {
		this.d_reply = d_reply;
	}
	public MdataVO getMdataVO() {
		return mdataVO;
	}
	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
	}
//	public CdataVO getCdataVO() {
//		return cdataVO;
//	}
//	public void setCdataVO(CdataVO cdataVO) {
//		this.cdataVO = cdataVO;
//	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	
}
