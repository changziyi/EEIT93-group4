package toolman.email.model;
import java.sql.Timestamp;

public class EmailVO implements java.io.Serializable{
	private Integer ms_id;
	private String mss_id;
	private String msr_id;
	private Timestamp ms_date;
	private String ms_summary;
	private String ms_content;	
	private String s_name;
	
	public Integer getMs_id() {
		return ms_id;
	}
	public void setMs_id(Integer ms_id) {
		this.ms_id = ms_id;
	}
	public String getMss_id() {
		return mss_id;
	}
	public void setMss_id(String mss_id) {
		this.mss_id = mss_id;
	}
	public String getMsr_id() {
		return msr_id;
	}
	public void setMsr_id(String msr_id) {
		this.msr_id = msr_id;
	}
	public Timestamp getMs_date() {
		return ms_date;
	}
	public void setMs_date(Timestamp ms_date) {
		this.ms_date = ms_date;
	}
	public String getMs_summary() {
		return ms_summary;
	}
	public void setMs_summary(String ms_summary) {
		this.ms_summary = ms_summary;
	}
	public String getMs_content() {
		return ms_content;
	}
	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
		
	
}