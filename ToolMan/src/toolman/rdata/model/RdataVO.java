package toolman.rdata.model;

import java.sql.Date;

public class RdataVO implements java.io.Serializable{
	
	private Integer r_id;
	private Date r_date;
	private String c_id;
	private Integer m_id;
	private String p_summary;
	private String p_content;
	private String s_name;
	private String sa_rnote;
	private Integer d_id;
	
	
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
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
	public Integer getD_id() {
		return d_id;
	}
	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}
}
