package toolman.email.model;

import java.util.*;

public interface EmailDAO_interface {
          public void insert(EmailVO emailVO );
          public void update(EmailVO emailVO);
          public void delete(Integer Ms_id);
          public EmailVO findByPrimaryKey(Integer Ms_id);
          public List<EmailVO> getAll();
}
