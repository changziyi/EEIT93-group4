package toolman.calendar.model;

import java.util.List;

public interface CalendarDAO_Interface {
	public void InsertByM(CalendarVO calendarVO);
	public List<CalendarVO> getByM(Integer _id);
	public Integer deleteByM(Integer o_id);	
}
