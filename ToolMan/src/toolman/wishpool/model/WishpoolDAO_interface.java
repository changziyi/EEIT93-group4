package toolman.wishpool.model;

import java.util.*;

public interface WishpoolDAO_interface {
          public void insert(WishpoolVO wishpoolVO );
          public void update(WishpoolVO wishpoolVO);
          public void delete(Integer w_id);
          public WishpoolVO findByPrimaryKey(Integer w_id);
          public List<WishpoolVO> getAll();
		  public List<WishpoolVO> getAllByDate();
}
