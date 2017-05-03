package toolman.cdata.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import toolman.order.model.OrderVO;

//import com.order.model.OrderVO;

public class CdataVO implements java.io.Serializable{
	
	private String c_id;
	private String c_pwd;
	private String c_name;	
	private String c_cel;
	private String c_email;
	private String c_city;
	private String c_district;
	private String c_addr;
	private Timestamp c_jdate;
	private Integer c_rating;
	private Integer m_id;
	private String s_name;	
	private String c_fb;
	private String c_google;	
	private String sa_cnote;
	private Date c_birth;
	private Integer c_finished;
	
	private Set<OrderVO> orders = new  HashSet<OrderVO>();//評價
	
	 

	public Set<OrderVO> getOrders() {
		return orders;
	}
	public void setOrders(Set<OrderVO> orders) {
		this.orders = orders;
	}

	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_cel() {
		return c_cel;
	}
	public void setC_cel(String c_cel) {
		this.c_cel = c_cel;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_city() {
		return c_city;
	}
	public void setC_city(String c_city) {
		this.c_city = c_city;
	}
	public String getC_district() {
		return c_district;
	}
	public void setC_district(String c_district) {
		this.c_district = c_district;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public Timestamp getC_jdate() {
		return c_jdate;
	}
	public void setC_jdate(Timestamp c_jdate) {
		this.c_jdate = c_jdate;
	}
	public Integer getC_rating() {
		return c_rating;
	}
	public void setC_rating(Integer c_rating) {
		this.c_rating = c_rating;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getC_fb() {
		return c_fb;
	}
	public void setC_fb(String c_fb) {
		this.c_fb = c_fb;
	}
	public String getC_google() {
		return c_google;
	}
	public void setC_google(String c_google) {
		this.c_google = c_google;
	}
	public String getSa_cnote() {
		return sa_cnote;
	}
	public void setSa_cnote(String sa_cnote) {
		this.sa_cnote = sa_cnote;
	}
	public Date getC_birth() {
		return c_birth;
	}
	public void setC_birth(Date c_birth) {
		this.c_birth = c_birth;
	}
	public Integer getC_finished() {
		return c_finished;
	}
	public void setC_finished(Integer c_finished) {
		this.c_finished = c_finished;
	}

	
}
