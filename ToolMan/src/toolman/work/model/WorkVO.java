package toolman.work.model;

import toolman.mdata.model.MdataVO;

public class WorkVO {
	
	private Integer work_id;
	private String work_name;
	private String work_des;
	private byte[] img1;
	private byte[] img2;
	private byte[] img3;
	private MdataVO mdataVO;
	
	public MdataVO getMdataVO() {
		return mdataVO;
	}
	public void setMdataVO(MdataVO mdataVO) {
		this.mdataVO = mdataVO;
	}
	public Integer getWork_id() {
		return work_id;
	}
	public void setWork_id(Integer work_id) {
		this.work_id = work_id;
	}
	public String getWork_name() {
		return work_name;
	}
	public void setWork_name(String work_name) {
		this.work_name = work_name;
	}
	public String getWork_des() {
		return work_des;
	}
	public void setWork_des(String work_des) {
		this.work_des = work_des;
	}
	public byte[] getImg1() {
		return img1;
	}
	public void setImg1(byte[] img1) {
		this.img1 = img1;
	}
	public byte[] getImg2() {
		return img2;
	}
	public void setImg2(byte[] img2) {
		this.img2 = img2;
	}
	public byte[] getImg3() {
		return img3;
	}
	public void setImg3(byte[] img3) {
		this.img3 = img3;
	}

}
