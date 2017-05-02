package toolman.work.model;

import java.util.Collection;

public interface WorkDAO_Interface {
	public void Insert(WorkVO workVO);
	public Collection<WorkVO> getWorkByMid(Integer m_id);
	public void update(WorkVO workVO);
	public void delete(Integer work_id);

}
