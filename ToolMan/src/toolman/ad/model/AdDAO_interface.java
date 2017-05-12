package toolman.ad.model;

import java.util.*;

public interface AdDAO_interface {
         public void insert(AdVO adVO);
         public void update(AdVO adVO);
         public void delete(Integer ad_id);
         public AdVO findByPrimaryKey(Integer ad_id);
         public AdVO findBySname(String s_name);
         public List<AdVO> getAll();
//		 public List<AdVO> getAllBySname();
		 public List<AdVO> getAllBySname(String s_name);
}
