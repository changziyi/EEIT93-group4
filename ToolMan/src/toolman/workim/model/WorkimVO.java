package toolman.workim.model;

import toolman.work.model.WorkVO;

//中文字測試
public class WorkimVO {
	
	private int im_id;
	private byte[] im_show;
	private WorkVO workVO;
	
	public WorkVO getWorkVO() {
		return workVO;
	}
	public void setWorkVO(WorkVO workVO) {
		this.workVO = workVO;
	}
	public int getIm_id() {
		return im_id;
	}
	public void setIm_id(int im_id) {
		this.im_id = im_id;
	}
	public byte[] getIm_show() {
		return im_show;
	}
	public void setIm_show(byte[] im_show) {
		this.im_show = im_show;
	}

}
