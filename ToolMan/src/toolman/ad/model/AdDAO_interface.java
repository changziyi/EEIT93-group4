package toolman.ad.model;

import java.sql.Timestamp;
import java.util.*;

public interface AdDAO_interface {
         public void insert(AdVO adVO);
         public void update(AdVO adVO);
         public void delete(Integer ad_id);
         public AdVO findByPrimaryKey(Integer ad_id);
         public AdVO findBySname(String s_name);
         public List<AdVO> getAll();
		 public List<AdVO> getBySname(String s_name);
		 public List<AdVO> getAllBySname2(String s_name);
		 public void updateAsDeleted(Integer ad_id, String s_name);
		List<AdVO> getByDate(String s_name, Timestamp ad_bdate);
}
