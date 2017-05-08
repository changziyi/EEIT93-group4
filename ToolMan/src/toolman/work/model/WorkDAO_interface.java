package toolman.work.model;

import java.util.List;

public interface WorkDAO_interface {
	public void insert(WorkVO workVO);
	public List<WorkVO> getWorkByMid(Integer m_id);
	public void update(WorkVO workVO);
	public void delete(Integer work_id);

}
