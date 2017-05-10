package toolman.mdata.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import toolman.blacklist.model.BlacklistVO;
import toolman.discussion.model.DiscussionVO;
import toolman.favorite.model.FavoriteVO;
import toolman.mpro.model.MProVO;
import toolman.order.model.OrderVO;
import toolman.work.model.WorkVO;

public class MdataVO implements java.io.Serializable {
	
	private Integer m_id;
	private String m_name;
	private String b_name;
	private String m_cel;
	private String m_email;
	private String m_city;
	private String m_district;
	private String m_addr;
	private Timestamp m_jdate;
	private Integer m_arating;
	private Integer o_finished;
	private Integer o_current;
	private String s_name;
	private byte[] b_image;
	private String b_des;
	private String sa_mnote;
	private byte[] m_cer;
	private Set<MProVO> mpros = new HashSet<MProVO>();
	private Set<WorkVO> works = new HashSet<WorkVO>();
	private Set<DiscussionVO> discussions = new HashSet<DiscussionVO>();
	private Set<OrderVO> orders = new HashSet<OrderVO>();// added by benny
	private Set<FavoriteVO> favorites = new HashSet<FavoriteVO>();//
	private Set<BlacklistVO> blacklists = new HashSet<BlacklistVO>();//


	public Set<OrderVO> getOrders() {// added by benny
		return orders;
	}

	public void setOrders(Set<OrderVO> orders) {// added by benny
		this.orders = orders;
	}

	public Integer getM_id() {
		return m_id;
	}
	
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	
	public byte[] getM_cer() {
		return m_cer;
	}

	public void setM_cer(byte[] m_cer) {
		this.m_cer = m_cer;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getM_cel() {
		return m_cel;
	}

	public void setM_cel(String m_cel) {
		this.m_cel = m_cel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_city() {
		return m_city;
	}

	public void setM_city(String m_city) {
		this.m_city = m_city;
	}

	public String getM_district() {
		return m_district;
	}

	public void setM_district(String m_district) {
		this.m_district = m_district;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public Timestamp getM_jdate() {
		return m_jdate;
	}

	public void setM_jdate(Timestamp m_jdate) {
		this.m_jdate = m_jdate;
	}

	public Integer getM_arating() {
		return m_arating;
	}

	public void setM_arating(Integer m_arating) {
		this.m_arating = m_arating;
	}

	public Integer getO_finished() {
		return o_finished;
	}

	public void setO_finished(Integer o_finished) {
		this.o_finished = o_finished;
	}

	public Integer getO_current() {
		return o_current;
	}

	public void setO_current(Integer o_current) {
		this.o_current = o_current;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public byte[] getB_image() {
		return b_image;
	}

	public void setB_image(byte[] b_image) {
		this.b_image = b_image;
	}

	public String getB_des() {
		return b_des;
	}

	public void setB_des(String b_des) {
		this.b_des = b_des;
	}

	public String getSa_mnote() {
		return sa_mnote;
	}

	public void setSa_mnote(String sa_mnote) {
		this.sa_mnote = sa_mnote;
	}

	public Set<MProVO> getMpros() {
		return mpros;
	}

	public void setMpros(Set<MProVO> mpros) {
		this.mpros = mpros;
	}
	
	public Set<DiscussionVO> getDiscussions() {
		return discussions;
	}

	public void setDiscussions(Set<DiscussionVO> discussions) {
		this.discussions = discussions;
	}

	public Set<WorkVO> getWorks() {
		return works;
	}

	public void setWorks(Set<WorkVO> works) {
		this.works = works;
	}
	
	public Set<FavoriteVO> getFavorites() {
		return favorites;
	}

	public void setFavorites(Set<FavoriteVO> favorites) {
		this.favorites = favorites;
	}

	public Set<BlacklistVO> getBlacklists() {
		return blacklists;
	}

	public void setBlacklists(Set<BlacklistVO> blacklists) {
		this.blacklists = blacklists;
	}
}
