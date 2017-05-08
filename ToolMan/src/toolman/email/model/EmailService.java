package toolman.email.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;



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
	
	public EmailVO findByPrimaryKey(Integer ms_id) {
		return dao.findByPrimaryKey(ms_id);
	}
}
 