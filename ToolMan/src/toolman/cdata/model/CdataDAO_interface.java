package toolman.cdata.model;

import java.sql.SQLException;
import java.util.List;


public interface CdataDAO_interface {
	
	public CdataVO login_in(String c_id);//登入
	public void insert(CdataVO cdataVO);//註冊表單
	public void update(CdataVO cdataVO);
	public void delete(String c_id);
	public List<CdataVO> getAll();
	public CdataVO cdata_des(String c_id);
	public Integer updatecustomerSname(Integer c_id, String s_name);
}
