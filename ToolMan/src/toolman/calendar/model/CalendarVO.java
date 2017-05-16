package toolman.calendar.model;

import java.sql.Timestamp;
import java.util.List;

public class CalendarVO {
	
	private Integer calen_id;
	private Integer event_id;
	private String event_title;
	private Timestamp event_start;
	private Timestamp event_end;
	private String event_class;
	private String event_overlap;
	private Integer m_id;
	
		public Integer getCalen_id() {
			return calen_id;
		}
		public void setCalen_id(Integer calen_id) {
			this.calen_id = calen_id;
		}
		public Integer getEvent_id() {
			return event_id;
		}
		public void setEvent_id(Integer event_id) {
			this.event_id = event_id;
		}
		public String getEvent_title() {
			return event_title;
		}
		public void setEvent_title(String event_title) {
			this.event_title = event_title;
		}
		public Timestamp getEvent_start() {
			return event_start;
		}
		public void setEvent_start(Timestamp event_start) {
			this.event_start = event_start;
		}
		public Timestamp getEvent_end() {
			return event_end;
		}
		public void setEvent_end(Timestamp event_end) {
			this.event_end = event_end;
		}
		public String getEvent_class() {
			return event_class;
		}
		public void setEvent_class(String event_class) {
			this.event_class = event_class;
		}
		public String getEvent_overlap() {
			return event_overlap;
		}
		public void setEvent_overlap(String event_overlap) {
			this.event_overlap = event_overlap;
		}
		public Integer getM_id() {
			return m_id;
		}
		public void setM_id(Integer m_id) {
			this.m_id = m_id;
		}
}
