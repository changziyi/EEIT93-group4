package toolman.cdata.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;


public interface CdataDAO_interface {
	
	public CdataVO login_in(String c_id);//登入
	public void insert(CdataVO cdataVO);//註冊表單
	public void update(CdataVO cdataVO);
	public void delete(String c_id);
	public List<CdataVO> getAll();
	public CdataVO cdata_des(String c_id);

	public Integer updatecustomerSname(Integer c_id, String s_name);
	
    public Set<OrderVO> getOrderByC(String c_id);//訂單

	public List<CdataVO> getBySname(String s_name);
	public Integer updatecustomerSname(String c_id, String s_name);
}
