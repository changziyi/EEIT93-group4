package toolman.mdata.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import toolman.mpro.model.MProService;
import toolman.mpro.model.MProVO;
import toolman.order.model.OrderVO;

public class MdataService {

	private MdataDAO_interface dao;

	public MdataService() {
		dao = new MdataDAO();
	}

	public MdataVO insert(String m_name, String b_name, String m_cel, String m_email, String m_city, String m_district,
			String m_addr, java.sql.Timestamp m_jdate, String s_name, byte[] b_image, String b_des) {

		MdataVO mdataVO = new MdataVO();

		mdataVO.setM_name(m_name);
		mdataVO.setB_name(b_name);
		mdataVO.setM_cel(m_cel);
		mdataVO.setM_email(m_email);
		mdataVO.setM_city(m_city);
		mdataVO.setM_district(m_district);
		mdataVO.setM_addr(m_addr);
		mdataVO.setM_jdate(m_jdate);
		mdataVO.setS_name(s_name);
		mdataVO.setB_image(b_image);
		mdataVO.setB_des(b_des);

		dao.insert(mdataVO);

		return mdataVO;
	}

	public void insert(MdataVO mdataVO) {
		if (mdataVO.getMpros() != null) {
			Set<MProVO> m_proVO = mdataVO.getMpros();
			for (MProVO pros : m_proVO) {
				pros.setM_pro(pros.getM_pro());
			}
		}
		dao.insert(mdataVO);
	}

	public MdataVO update(Integer m_id, String m_name, String b_name, String m_cel, String m_email, String m_city,
			String m_district, String m_addr, String s_name, byte[] b_image, String b_des) {

		MdataVO mdataVO = new MdataVO();

		mdataVO.setM_id(m_id);
		mdataVO.setM_name(m_name);
		mdataVO.setB_name(b_name);
		mdataVO.setM_cel(m_cel);
		mdataVO.setM_email(m_email);
		mdataVO.setM_city(m_city);
		mdataVO.setM_district(m_district);
		mdataVO.setM_addr(m_addr);
		mdataVO.setS_name(s_name);
		mdataVO.setB_image(b_image);
		mdataVO.setB_des(b_des);

		dao.update(mdataVO);

		return dao.findByPrimaryKey(m_id);
	}
	public Set<OrderVO> getOrderByM(Integer m_id) {//訂單
		return dao.getOrderByM(m_id);
	}
	public void update(MdataVO mdataVO) {
		dao.update(mdataVO);
	}

	public void delete(Integer m_id) {
		dao.delete(m_id);
	}

	public MdataVO findByPrimaryKey(Integer m_id) {
		return dao.findByPrimaryKey(m_id);
	}

	public List<MdataVO> getAll() {
		return dao.getAll();
	}

	
	public List<MdataVO> getCity(String m_city) {
		return dao.getCity(m_city);
	}
	
	public List<MdataVO> SearchByCityAndMpro(String m_city, String m_pro) {
		return dao.SearchByCityAndMpro(m_city, m_pro);
	}
	
	public byte[] getImg(Integer m_id) {
		return dao.getImg(m_id);
	}
	
	public String getAllJson() {
		List<MdataVO> mdatas = dao.getAll();
		List<Map> jList = new LinkedList<Map>();
		for (MdataVO aMdata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("M_id", aMdata.getM_id());
			jContent.put("B_name", aMdata.getB_name());
			jContent.put("M_name", aMdata.getM_name());
			jContent.put("M_city", aMdata.getM_city());
			jContent.put("M_district", aMdata.getM_district());
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	public String SearchByCityAndMproJson(String m_city, String input) {
		List<MdataVO> mdatas = dao.SearchByCityAndMpro(m_city, input);
		List<Map> jList = new LinkedList<Map>();
		for (MdataVO aMdata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("id", aMdata.getM_id());
			jContent.put("bname", aMdata.getB_name());
			jContent.put("mname", aMdata.getM_name());
			jContent.put("rating", aMdata.getM_arating());
			jContent.put("city", aMdata.getM_city());
			jContent.put("district", aMdata.getM_district());
			jContent.put("finish", aMdata.getO_finished());
			Set<MProVO> mpros = aMdata.getMpros();
			List<String> pList = new LinkedList<String>();
			for (MProVO aMpro : mpros) {
				pList.add(aMpro.getM_pro());
				jContent.put("pro", pList);
			}
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	//首頁搜尋改用stored procedure搜尋
	public String getMasterBySP(String city, String district, String input) {
		List<Object[]> mdatas = dao.search(city, district, input);
		MProService mproSvc = new MProService();
		List<Object> mpros;
		
		List<Map> jList = new LinkedList<Map>();
		for (Object[] aMata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("id",aMata[0]);
			jContent.put("bname",aMata[1]);
			jContent.put("mname",aMata[2]);
			jContent.put("city",aMata[3]);
			jContent.put("district",aMata[4]);
			jContent.put("bdes",aMata[5]);
			jContent.put("rating",aMata[6]);
			jContent.put("finish",aMata[7]);
			jContent.put("sta",aMata[8]);
			List<String> pList = new LinkedList<String>();
			mpros = mproSvc.getByMidSp(new Integer((int) aMata[0]));
			for (Object aMpro : mpros) {
				pList.add(aMpro.toString());
				jContent.put("pro", pList);
			}
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	public String getMproBySP(String pro, String city, String district, String bname) {
		List<Object[]> mdatas = dao.searchByMpro(pro, city, district, bname);
		MProService mproSvc = new MProService();
		List<Object> mpros;
		List<Map> jList = new LinkedList<Map>();
		for (Object[] aMata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("id",aMata[1]);
			jContent.put("bname",aMata[2]);
			jContent.put("mname",aMata[3]);
			jContent.put("city",aMata[4]);
			jContent.put("district",aMata[5]);
			jContent.put("bdes",aMata[6]);
			jContent.put("rating",aMata[7]);
			jContent.put("finish",aMata[8]);
			List<String> pList = new LinkedList<String>();
			mpros = mproSvc.getByMidSp(new Integer((int) aMata[1]));
			for (Object aMpro : mpros) {
				pList.add(aMpro.toString());
				jContent.put("pro", pList);
			}
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	public List getAllMidForAd() {
		List<Object[]> mids = dao.searchAllRandom();
		List masterList = new LinkedList();
		for (Object[] aMid : mids) {
			Map mid = new HashMap();
			mid.put("id",aMid[0]);
			mid.put("bname",aMid[1]);
			mid.put("city",aMid[3]);
			mid.put("district",aMid[4]);
			mid.put("finish",aMid[7]);
			masterList.add(mid);
		}
		return masterList;
	}
	
	public String getAllBySP() {
		List<Object[]> mdatas = dao.searchAll();
		MProService mproSvc = new MProService();
		List<Object> mpros;
		List<Map> jList = new LinkedList<Map>();
		for (Object[] aMata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("id",aMata[0]);
			jContent.put("bname",aMata[1]);
			jContent.put("mname",aMata[2]);
			jContent.put("city",aMata[3]);
			jContent.put("district",aMata[4]);
			jContent.put("rating",aMata[6]);
			jContent.put("finish",aMata[7]);
			List<String> pList = new LinkedList<String>();
			mpros = mproSvc.getByMidSp(new Integer((int) aMata[0]));
			for (Object aMpro : mpros) {
				pList.add(aMpro.toString());
				jContent.put("pro", pList);
			}
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	public String SeachByCityAndDistrictAndMpro(String m_city, String m_district, String m_pro) {
		List<MdataVO> mdatas = dao.SeachByCityAndDistrictAndMpro(m_city, m_district, m_pro);
		List<Map> jList = new LinkedList<Map>();
		for (MdataVO aMdata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("id", aMdata.getM_id());
			jContent.put("bname", aMdata.getB_name());
			jContent.put("mname", aMdata.getM_name());
			jContent.put("rating", aMdata.getM_arating());
			jContent.put("city", aMdata.getM_city());
			jContent.put("district", aMdata.getM_district());
			jContent.put("finish", aMdata.getO_finished());
			jContent.put("sta", aMdata.getS_name());
			Set<MProVO> mpros = aMdata.getMpros();
			List<String> pList = new LinkedList<String>();
			for (MProVO aMpro : mpros) {
				pList.add(aMpro.getM_pro());
				jContent.put("pro", pList);
			}
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}

	public String getCityJson(String m_city) {
		List<MdataVO> mdatas = dao.getCity(m_city);
		List<Map> jList = new LinkedList<Map>();
		for (MdataVO aMdata : mdatas) {
			Map jContent = new HashMap();
			jContent.put("M_id", aMdata.getM_id());
			jContent.put("B_name", aMdata.getB_name());
			jContent.put("M_name", aMdata.getM_name());
			jContent.put("M_city", aMdata.getM_city());
			jContent.put("M_district", aMdata.getM_district());
			jList.add(jContent);
		}
		return JSONValue.toJSONString(jList);
	}
	
	//By Benny, Benny's recommendation function
	public List<MdataVO> getCityAndDistrictAndMPro(String m_city, String m_district, String m_pro){	
		List<MdataVO> mdatas = dao.getCityAndDistrictAndMPro(m_city, m_district, m_pro);
		return mdatas;
	}
	public Integer updatemasterSname(Integer m_id, String s_name){		
		return dao.updatemasterSname(m_id,s_name);
	} 
	public int updatecustomerSamnote(Integer m_id, String sa_mnote){//by Benny
		return dao.updatecustomerSamnote(m_id,sa_mnote);
	}
}
