package toolman.rdata.model;

import java.sql.Date;
import java.sql.Timestamp;

import toolman.cdata.model.CdataVO;
import toolman.discussion.model.DiscussionVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;

import java.sql.Timestamp;

public class RdataVO implements java.io.Serializable{
	
	private Integer r_id;
	private Timestamp r_date;
	
	private String p_summary;
	private String p_content;
	private String s_name;
	private String sa_rnote;
	

	private CdataVO cdataVO;
	private MdataVO mdataVO;
	private DiscussionVO discussionVO;
	private OrderVO orderVO;
	
	
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public CdataVO getCdataVO() {
		return cdataVO;
	}
	public void setCdataVO(CdataVO cdataVO) {
		this.cdataVO = cdataVO;

	}
	public MdataVO getMdataVO() {
		return mdataVO;
	}
	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
		
	}
	public String getP_summary() {
		return p_summary;
	}
	public void setP_summary(String p_summary) {
		this.p_summary = p_summary;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getSa_rnote() {
		return sa_rnote;
	}
	public void setSa_rnote(String sa_rnote) {
		this.sa_rnote = sa_rnote;
	}
	public DiscussionVO getDiscussionVO() {
		return discussionVO;
	}
	public void setDiscussionVO(DiscussionVO discussionVO) {
		this.discussionVO = discussionVO;

	}
	public OrderVO  getOrderVO() {
		return orderVO;
	}
	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
		
	}
}
