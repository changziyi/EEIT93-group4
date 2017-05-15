package toolman.building.model;

import java.util.List;

import toolman.order.model.OrderVO;

public class BuildingVO {
	
	private String h_type;
	private String h_des;
	private List<OrderVO> orderVOs;

	
	public List<OrderVO> getOrderVOs() {
		return orderVOs;
	}
	public void setOrderVOs(List<OrderVO> orderVOs) {
		this.orderVOs = orderVOs;
	}
	public String getH_type() {
		return h_type;
	}
	public void setH_type(String h_type) {
		this.h_type = h_type;
	}
	public String getH_des() {
		return h_des;
	}
	public void setH_des(String h_des) {
		this.h_des = h_des;
	}

}
