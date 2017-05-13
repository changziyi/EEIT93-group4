package toolman.cdata.model;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import toolman.blacklist.model.BlacklistVO;
import toolman.favorite.model.FavoriteVO;
import toolman.order.model.OrderVO;



public class CdataService {
	private CdataDAO_interface dao;
	
	public CdataService() {
		dao = new CdataDAO();
	}
	
	public CdataVO login_in(String c_id,String c_pwd){		
		CdataDAO cdata = new CdataDAO();	
		CdataVO cdataVO = cdata.login_in(c_id);
		return cdataVO;
	}

	//註冊
	public CdataVO addCdata(String c_id,String c_pwd,String c_name,String c_cel,String c_email, String c_city, 
			String c_district, String c_addr,Date c_birth, Integer c_averrating, Integer c_finished, Timestamp c_jdate){

		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		cdataVO.setC_pwd(c_pwd);
		cdataVO.setC_name(c_name);	
		cdataVO.setC_cel(c_cel);
		cdataVO.setC_email(c_email);
		cdataVO.setC_city(c_city);
		cdataVO.setC_district(c_district);
		cdataVO.setC_addr(c_addr);
		cdataVO.setC_birth(c_birth);
		cdataVO.setC_averrating(c_averrating);
		cdataVO.setC_finished(c_finished);
		cdataVO.setC_jdate(c_jdate);
		dao.insert(cdataVO);
		return cdataVO;
	}
	public CdataVO cdata_des(String c_id){
		return  dao.cdata_des(c_id); 
		
	}
	public List<CdataVO> getAll() {//benny	
		return dao.getAll();
	}
	public  int updatecustomerSname(String c_id, String s_name){	//benny	
		return dao.updatecustomerSname(c_id, s_name);
	}
	public int updatecustomerSacnote(String c_id, String sa_cnote){//benny	
		return dao.updatecustomerSname(c_id, sa_cnote);
	}
	public CdataVO getById(String c_id){//benny
		return dao.getById(c_id);
	}
	public Set<OrderVO> getOrderByC(String c_id) {//訂單
		return dao.getOrderByC(c_id);
	}
	public Set<FavoriteVO> getFavoriteByC(String c_id) {//訂單
		return dao.getFavoriteByC(c_id);
	}
	public Set<BlacklistVO> getBlackByC(String c_id) {//訂單
		return dao.getBlackByC(c_id);
	}
	
}
