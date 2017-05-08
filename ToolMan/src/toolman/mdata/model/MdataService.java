package toolman.mdata.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONValue;

import toolman.mpro.model.MProVO;

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
	// Benny's recommendation function
	public List<MdataVO> getCityAndDistrictAndMPro(String m_city, String m_district, String m_pro){	
		List<MdataVO> mdatas = dao.getCityAndDistrictAndMPro(m_city, m_district, m_pro);
		return mdatas;
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
	
	//首頁搜尋
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

}
