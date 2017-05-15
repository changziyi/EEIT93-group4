package toolman.mpro.model;

import java.util.List;

public interface MProDAO_interface {
	public List<MProVO> getByMid(Integer m_id);
	public List<Object> getByMidSp(Integer m_id);
}
