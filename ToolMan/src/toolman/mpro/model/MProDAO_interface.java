package toolman.mpro.model;

import java.util.List;

import toolman.mdata.model.MdataVO;

public interface MProDAO_interface {
	public List<MProVO> getByMid(Integer m_id);
	public List<Object> getByMidSp(Integer m_id);
	public void deleteSql(Integer m_id);
	public void insertSql(Integer m_id, String m_pro);
}
