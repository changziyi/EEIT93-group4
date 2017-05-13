package toolman.mdata.model;

import java.util.List;
import java.util.Set;

import toolman.order.model.OrderVO;

public interface MdataDAO_interface {
	
	public void insert(MdataVO masterVO);
	public void update(MdataVO masterVO);
	public void delete(Integer m_id);
	public MdataVO findByPrimaryKey(Integer m_id);
	public List<MdataVO> SearchByCityAndMpro(String m_city, String m_pro);
	public List<MdataVO> SeachByCityAndDistrictAndMpro(String m_city, String m_district, String m_pro);
	public List<MdataVO> getCity(String m_city);
	public List<MdataVO> getDistrict(String m_district);
	public List<MdataVO> getCityAndDistrict(String m_city, String m_district);
	// Benny's recommendation function
	public List<MdataVO> getCityAndDistrictAndMPro(String m_city, String m_district, String m_pro);
	public List<MdataVO> getAll();
	public int updatemasterSname(Integer m_id,String s_name);//by Benny
	public List<MdataVO> getBySname(String s_name);//by Benny
	public int updatecustomerSamnote(Integer m_id, String s_name);//by Benny
    public Set<OrderVO> getOrderByM(Integer m_id);//訂單

	
}
