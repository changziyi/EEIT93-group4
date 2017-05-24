package toolman.rdata.model;

import java.util.List;
import java.util.Set;

public interface RdataDAO_interface {
	
    public void insert(RdataVO rdataVO);
    public void update(RdataVO rdataVO);
    public void delete(Integer R_id);
    public RdataVO findByPrimaryKey(Integer R_id);
    public List<RdataVO> getAll();
    public List<RdataVO> getBySname(String s_name);//by benny
    public int updateReportSarnote(Integer r_id, String sa_rname);//by Benny
    public void updateSname(Integer r_id, String s_name);
}