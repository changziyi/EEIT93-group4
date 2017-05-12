package toolman.favorite.model;

import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataVO;

public class FavoriteVO {
	
	private Integer f_id;

	private CdataVO cdataVO;
	private MdataVO mdataVO;

	
	
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
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
