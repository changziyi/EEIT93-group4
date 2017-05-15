package toolman.workim.model;

import java.util.Collection;
//中文字測試
public interface WorkimDAO_interface {
	public void insert(Collection<WorkimVO> workimset);
	public Integer delete(Collection<Integer> im_idlist);
	public Collection<WorkimVO> getByWorkid(Integer work_id);
	public WorkimVO findByPK(Integer im_id);
	public byte[] getImg(Integer im_id);
}
