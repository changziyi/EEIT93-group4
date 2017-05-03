package toolman.order.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;
import toolman.opro.model.OproVO;

public class OrderVO {
	private Integer o_id;
	private String b_name;
//	private Integer m_id;
//	private String c_id;
	private Timestamp o_bdate;
	private Timestamp o_edate;
	private String o_des;
	private Long req_exp;
	private Integer h_type;
	private String o_location;
	private String s_name;
	private String m_onote;
	private String c_onote;
	private String sa_onote;
	private Integer m_rating;
	private Integer c_rating;
	private String ca_des;
	private String ma_des;
	private Set<OproVO> opros;
	private Timestamp o_tdate;
	private CdataVO c_id;
	private MdataVO m_id;
	
	public void setM_id(MdataVO m_id) {
		this.m_id = m_id;
	}
	public MdataVO getM_id() {
		return m_id;
	}
	
	public void setC_id(CdataVO c_id) {
		this.c_id = c_id;
	}	
	public CdataVO getC_id() {
			return c_id;
		}
	
//	public Integer getM_id() {
//	return m_id;
//}
//public void setM_id(Integer m_id) {
//	this.m_id = m_id;
//}
//		public String getC_id() {
//	return c_id;
//}
//public void setC_id(String c_id) {
//	this.c_id = c_id;
//}
	public Timestamp getO_tdate() {
		return o_tdate;
	}
	public void setO_tdate(Timestamp o_tdate) {
		this.o_tdate = o_tdate;
	}
	public Set<OproVO> getOpros() {
		return opros;
	}
	public void setOpros(Set<OproVO> opros) {
		this.opros = opros;
	}
	public Integer getO_id() {
		return o_id;
	}
	public void setO_id(Integer o_id) {
		this.o_id = o_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}


	public Timestamp getO_bdate() {
		return o_bdate;
	}
	public void setO_bdate(Timestamp o_bdate) {
		this.o_bdate = o_bdate;
	}
	public Timestamp getO_edate() {
		return o_edate;
	}
	public void setO_edate(Timestamp o_edate) {
		this.o_edate = o_edate;
	}
	public String getO_des() {
		return o_des;
	}
	public void setO_des(String o_des) {
		this.o_des = o_des;
	}
	public Long getReq_exp() {
		return req_exp;
	}
	public void setReq_exp(Long req_exp) {
		this.req_exp = req_exp;
	}
	public Integer getH_type() {
		return h_type;
	}
	public void setH_type(Integer h_type) {
		this.h_type = h_type;
	}
	public String getO_location() {
		return o_location;
	}
	public void setO_location(String o_location) {
		this.o_location = o_location;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getM_onote() {
		return m_onote;
	}
	public void setM_onote(String m_onote) {
		this.m_onote = m_onote;
	}
	public String getC_onote() {
		return c_onote;
	}
	public void setC_onote(String c_onote) {
		this.c_onote = c_onote;
	}
	public String getSa_onote() {
		return sa_onote;
	}
	public void setSa_onote(String sa_onote) {
		this.sa_onote = sa_onote;
	}
	public Integer getM_rating() {
		return m_rating;
	}
	public void setM_rating(Integer m_rating) {
		this.m_rating = m_rating;
	}
	public Integer getC_rating() {
		return c_rating;
	}
	public void setC_rating(Integer c_rating) {
		this.c_rating = c_rating;
	}
	public String getCa_des() {
		return ca_des;
	}
	public void setCa_des(String ca_des) {
		this.ca_des = ca_des;
	}
	public String getMa_des() {
		return ma_des;
	}
	public void setMa_des(String ma_des) {
		this.ma_des = ma_des;
	}
	

}
