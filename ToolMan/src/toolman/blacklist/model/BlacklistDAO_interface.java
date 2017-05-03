package toolman.blacklist.model;

import java.util.List;

public interface BlacklistDAO_interface {
	
    public void insert(BlacklistVO blacklistVO);
    public void delete(Integer Bk_id);
    public BlacklistVO findByPrimaryKey(Integer Bk_id);
    public List<BlacklistVO> getAll();

}
