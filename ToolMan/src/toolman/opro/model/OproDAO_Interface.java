package toolman.opro.model;

import java.util.Collection;

import toolman.order.model.OrderVO;

public interface OproDAO_Interface {

	public Collection<OproVO> getOproByMproId(Collection<Integer> mpro_id);
	public OproVO getOproByOId(OrderVO o_id);
	public void insertOpro(Collection<OproVO> oproVOset);
	
}
