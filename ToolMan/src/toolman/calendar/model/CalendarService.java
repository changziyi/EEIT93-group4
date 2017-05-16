package toolman.calendar.model;

import java.util.List;

public class CalendarService {
	CalendarDAO_Interface dao = new CalendarDAO();
	
	public void InsertByM(List list){
		dao.InsertByM(list);
	}
	public List<CalendarVO> getByM(Integer _id){
		return dao.getByM(_id);
		
	}
	public void deleteByM(Integer o_id){
		dao.deleteByM(o_id);
	}	
}
