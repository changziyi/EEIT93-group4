package toolman.cdata.model;


import java.sql.Date;
import java.sql.Timestamp;



public class CdataService {
	private CdataDAO_interface dao;
	
	public CdataService() {
		dao = new CdataDAO();
	}
	
	public CdataVO login_in(String c_id,String c_pwd){		
		CdataDAO cdata = new CdataDAO();	
		CdataVO cdataVO = cdata.login_in(c_id);
        // 如果cdata不等於 null 而且參數 c_pwd等於cdata內的c_pwd) 
         if (cdataVO != null && c_pwd.equals(cdataVO.getC_pwd())){
        //boolean equals(Object anObject):判斷字串是否與 Object相同
        	 return cdataVO ;
         }
        // 傳回null物件
		return null;
	}

	//註冊帳號
	public CdataVO addCdata(String c_id,String c_pwd,String c_name,String c_cel,String c_email, String c_city, 
			String c_district, String c_addr,Date c_birth, Integer c_rating, Integer c_finished, Timestamp c_jdate){

		CdataVO cdataVO = new CdataVO();
		cdataVO.setC_id(c_id);
		cdataVO.setC_pwd(c_pwd);
		cdataVO.setC_name(c_name);	
		cdataVO.setC_cel(c_cel);
		cdataVO.setC_email(c_email);
		cdataVO.setC_city(c_city);
		cdataVO.setC_district(c_district);
		cdataVO.setC_addr(c_addr);
		cdataVO.setC_birth(c_birth);
		cdataVO.setC_rating(c_rating);
		cdataVO.setC_finished(c_finished);
		cdataVO.setC_jdate(c_jdate);
		dao.insert(cdataVO);
		return cdataVO;
	}
	

}
