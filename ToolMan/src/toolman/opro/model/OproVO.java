package toolman.opro.model;

import toolman.order.model.OrderVO;
//import toolman.mpro.model.MproVO;//合併師傅專業後打開
public class OproVO {
	
	Integer o_proid;
	OrderVO o_id;
	String o_pro;
	Integer m_proid;//合併師傅專業後註解
//	MproVO m_proid;//合併師傅專業後打開
	
//	public MproVO getM_proid() { //合併師傅專業後打開
//		return m_proid;
//	}
//	public void setM_proid(MproVO m_proid) {//合併師傅專業後打開
//		this.m_proid = m_proid;
//	}

	
	public Integer getM_proid() {//合併師傅專業後註解
		return m_proid;
	}
	public void setM_proid(Integer m_proid) {//合併師傅專業後註解
		this.m_proid = m_proid;
	}
	public Integer getO_proid() {
		return o_proid;
	}
	public void setO_proid(Integer opro_id) {
		this.o_proid = opro_id;
	}
	public OrderVO getO_id() {
		return o_id;
	}
	public void setO_id(OrderVO o_id) {
		this.o_id = o_id;
	}
	public String getO_pro() {
		return o_pro;
	}
	public void setO_pro(String o_pro) {
		this.o_pro = o_pro;
	}

	
	
}
