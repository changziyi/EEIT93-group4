package toolman.email.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;

import toolman.mdata.model.MdataVO;



public class EmailService {

	private EmailDAO_interface dao;

	public EmailService() {
		dao = new EmailDAO();
	}

	public void insert(EmailVO emailVO) {
		dao.insert(emailVO);
	}
	
	public List<EmailVO> getAll() {
		return dao.getAll();
		
	}
	
	public List<EmailVO> getMail(String mss_id) {
		return dao.getMail(mss_id);
	}
	
	public EmailVO getOneMail(Integer ms_id) {
		return dao.findByPrimaryKey1(ms_id);
	}
	
	public String getMailJson(String mss_id) {
		List<EmailVO> emailData = dao.getMail(mss_id);
		List<Map> MailList = new LinkedList<Map>();
		for (EmailVO aEmail : emailData) {
			Map EmailContent = new HashMap();
			EmailContent.put("Ms_id", aEmail.getMs_id());
			EmailContent.put("Mss_id", aEmail.getMss_id());
			EmailContent.put("Msr_id", aEmail.getMsr_id());
			EmailContent.put("Ms_date", aEmail.getMs_date());
			EmailContent.put("Ms_summary", aEmail.getMs_summary());
			EmailContent.put("Ms_content", aEmail.getMs_content());
			EmailContent.put("S_name", aEmail.getS_name());
			MailList.add(EmailContent);
		}
		return JSONValue.toJSONString(MailList);
	}
	public EmailVO findByPrimaryKey(Integer ms_id) {
		return dao.findByPrimaryKey(ms_id);
	}

 

public String getOneMailJson(Integer ms_id) {
	List<EmailVO> OneEmailData = dao.getOneMail(ms_id);
	List<Map> OneMailList = new LinkedList<Map>();
	for (EmailVO aEmail : OneEmailData) {
		Map EmailContent = new HashMap();
		EmailContent.put("Ms_id", aEmail.getMs_id());
		EmailContent.put("Mss_id", aEmail.getMss_id());
		EmailContent.put("Msr_id", aEmail.getMsr_id());
		EmailContent.put("Ms_date", aEmail.getMs_date());
		EmailContent.put("Ms_summary", aEmail.getMs_summary());
		EmailContent.put("Ms_content", aEmail.getMs_content());
		EmailContent.put("S_name", aEmail.getS_name());
		OneMailList.add(EmailContent);
	}
	return JSONValue.toJSONString(OneMailList);
}
public EmailVO findByPrimaryKey1(Integer ms_id) {
	return dao.findByPrimaryKey1(ms_id);
}
}
