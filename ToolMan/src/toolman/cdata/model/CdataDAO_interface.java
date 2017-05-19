package toolman.cdata.model;

import java.sql.SQLException;
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
	public int updateMemberfwd(String c_pwd, String c_email);//	forgetpassword
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
