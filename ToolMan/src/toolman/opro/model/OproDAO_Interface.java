package toolman.opro.model;

import java.util.Collection;

public interface OproDAO_Interface {

	public Collection<OproVO> getOproByMproId(Collection<Integer> mpro_id);
	public OproVO getOproByOId(Integer o_id);
	public void insertOpro(Collection<OproVO> oproVOset);
	
}
