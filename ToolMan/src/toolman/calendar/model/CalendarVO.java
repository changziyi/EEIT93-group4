package toolman.calendar.model;

import java.sql.Timestamp;
import java.util.List;

import toolman.mdata.model.MdataVO;

public class CalendarVO {
	
	private Integer calen_id;
	private Integer id;
	private String title;
	private Timestamp start;
	private Timestamp end;
	private String className;
	private Boolean overlap;
	private Boolean allDay;
	private MdataVO m_id;
	
	public Integer getCalen_id() {
		return calen_id;
	}
	public void setCalen_id(Integer calen_id) {
		this.calen_id = calen_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getStart() {
		return start;
	}
	public void setStart(Timestamp start) {
		this.start = start;
	}
	public Timestamp getEnd() {
		return end;
	}
	public void setEnd(Timestamp end) {
		this.end = end;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Boolean getOverlap() {
		return overlap;
	}
	public void setOverlap(Boolean overlap) {
		this.overlap = overlap;
	}
	public Boolean getAllDay() {
		return allDay;
	}
	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
	}
	public MdataVO getM_id() {
		return m_id;
	}
	public void setM_id(MdataVO m_id) {
		this.m_id = m_id;
	}
	
	
	
	
}
