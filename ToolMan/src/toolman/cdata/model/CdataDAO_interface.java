package toolman.cdata.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import toolman.blacklist.model.BlacklistVO;
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;


public interface CdataDAO_interface {
	
	public CdataVO login_in(String c_id);//login in
	public void insert(CdataVO cdataVO);//login out
	List<CdataVO> geteMailAll(String c_email);//send mail
	public int updateMemberfwd(String c_pwd, String c_email);//	update forget password
	public int updateMemberpwd(String c_id, String c_pwd);//Member update password
	public int updateMember(String c_name,String c_pwd, Date c_birth, String c_cel, 
			String c_email, String c_addr, String c_id);//update member
	
	
	
	
	public void update(CdataVO cdataVO);
	public void delete(String c_id);
	public List<CdataVO> getAll();
	public CdataVO cdata_des(String c_id);
	
	
    public Set<OrderVO> getOrderByC(String c_id);//訂單
    public Set<FavoriteVO> getFavoriteByC(String c_id);//訂單
    public Set<BlacklistVO> getBlackByC(String c_id);//訂單

    public CdataVO getById(String c_id);//benny
	public List<CdataVO> getBySname(String s_name);//benny
	public int updatecustomerSname(String c_id, String s_name);//benny
	public int updatecustomerSacnote(String c_id, String sa_cnote);//benny
}
