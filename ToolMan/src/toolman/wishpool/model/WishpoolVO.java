package toolman.wishpool.model;

import java.sql.Timestamp;

public class WishpoolVO implements java.io.Serializable {
	private Integer w_id;
	private String c_id;
	private String w_content;
	private byte[] w_image;
	private String w_pro;
	private String s_name;
	private String w_city;
	private String w_district;
	private Timestamp w_date;

	public Integer getW_id() {
		return w_id;
	}

	public void setW_id(Integer w_id) {
		this.w_id = w_id;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getW_content() {
		return w_content;
	}

	public void setW_content(String w_content) {
		this.w_content = w_content;
	}

	public String getW_pro() {
		return w_pro;
	}

	public void setW_pro(String w_pro) {
		this.w_pro = w_pro;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getW_city() {
		return w_city;
	}

	public void setW_city(String w_city) {
		this.w_city = w_city;
	}

	public String getW_district() {
		return w_district;
	}

	public void setW_district(String w_district) {
		this.w_district = w_district;
	}

	public Timestamp getW_date() {
		return w_date;
	}

	public void setW_date(Timestamp w_date) {
		this.w_date = w_date;
	}

	public byte[] getW_image() {
		return w_image;
	}

	public void setW_image(byte[] w_image) {
		this.w_image = w_image;
	}
}
