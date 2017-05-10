package toolman.blacklist.model;

import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;

public class BlacklistVO {
	
	private Integer bk_id;
	private CdataVO cdataVO;
	private MdataVO mdataVO;
	
	
	public Integer getBk_id() {
		return bk_id;
	}
	public void setBk_id(Integer bk_id) {
		this.bk_id = bk_id;
	}


	
	public CdataVO getCdataVO() {
		return cdataVO;
	}
	public void setCdataVO(CdataVO cdataVO) {
		this.cdataVO = cdataVO;

	}
	public MdataVO getMdataVO() {
		return mdataVO;
	}
	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
		
	}
	
}
