package toolman.email.model;

import java.util.*;

import toolman.mdata.model.MdataVO;

public interface EmailDAO_interface {
          public void insert(EmailVO emailVO );
          public void update(EmailVO emailVO);
          public void delete(Integer Ms_id);
          public List<EmailVO> getMail(String msr_id);
          public List<EmailVO> getOneMail(Integer ms_id);
          public List<EmailVO> getMailByM(Integer m_id);//By Benny tested ok
          public List<EmailVO> deleteMail(Integer ms_id);
          public EmailVO findByPrimaryKey(Integer Ms_id);
          public EmailVO findByPrimaryKey1(Integer Ms_id);
          public List<EmailVO> getAll();
          public void updateisRead(Integer ms_id);
		

}
