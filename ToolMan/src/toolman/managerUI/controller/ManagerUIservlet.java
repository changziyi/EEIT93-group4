package toolman.managerUI.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataDAO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class managerUIservlet
 */
@WebServlet("/toolman.managerUI.controller/ManagerUIservlet.do")
public class ManagerUIservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerUIservlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		//test ok
//		MdataDAO dao = new MdataDAO();
//		List<MdataVO> mdatas = dao.getAll();
//		List<Map> jList = new LinkedList<Map>();
//		for (MdataVO aMdata : mdatas) {
//			Map jContent = new HashMap();
//			jContent.put("M_id", aMdata.getM_id());
//			jContent.put("B_name", aMdata.getB_name());
//			jContent.put("M_name", aMdata.getM_name());
//			jContent.put("M_city", aMdata.getM_city());
//			jContent.put("M_district", aMdata.getM_district());
//			jList.add(jContent);
//		}			
//		String mjasonstring = JSONValue.toJSONString(jList);
//		PrintWriter out = response.getWriter();
//		out.write( mjasonstring);
//		out.flush();
//		System.out.println(mjasonstring);
		
		//get m
		if("m".equals(action)){
							
			MdataDAO dao = new MdataDAO();
			List<MdataVO> mdatas = dao.getAll();
			List<Map> jList = new LinkedList<Map>();
			for (MdataVO aMdata : mdatas) {
				Map jContent = new HashMap();
				jContent.put("M_id", aMdata.getM_id());
				jContent.put("B_name", aMdata.getB_name());
				jContent.put("M_name", aMdata.getM_name());
				jContent.put("M_city", aMdata.getM_city());
				jContent.put("M_addr", aMdata.getM_addr());
				jContent.put("M_district", aMdata.getM_district());
				jContent.put("M_arating", aMdata.getM_arating());
				jContent.put("S_name", aMdata.getS_name());
				jContent.put("Sa_mnote", aMdata.getSa_mnote());
				Set<MProVO> mpros = aMdata.getMpros();
				for(MProVO getmpros:mpros){
				jContent.put("Mpros", getmpros.getM_pro());
				}
				jList.add(jContent);
			}			
			String mjasonstring = JSONValue.toJSONString(jList);
			PrintWriter out = response.getWriter();
			out.write(mjasonstring);
			out.flush();
			System.out.println(mjasonstring);
		}
		
		//get c
		if("c".equals(action)){
			
			List<CdataVO> list = new ArrayList<CdataVO>();
			CdataService cdataservice = new CdataService();
			list = cdataservice.getAll();
			List list2 = new ArrayList();
			Map map = new HashMap();
				for(int i=0;i<list.size();i++){
					CdataVO cdataVO = list.get(i);
					Timestamp c_jdate =	cdataVO.getC_jdate();
					String c_name =	cdataVO.getC_name();
					String c_id	= cdataVO.getC_id();
					String c_addr = cdataVO.getC_addr();
					String c_district = cdataVO.getC_district();
					String c_city = cdataVO.getC_city();
					String c_location = c_city + c_district + c_addr;					
					String s_name = cdataVO.getS_name();
					Integer c_averrating = cdataVO.getC_averrating();
					String sa_cnote	=cdataVO.getSa_cnote();
					map.put("c_jdate","c_jdate");
					map.put("c_name","c_name");
					map.put("c_id","c_id");
					map.put("c_city","c_city");
					map.put("c_district","c_district");
					map.put("c_addr","c_addr");
					map.put("s_name","s_name");
					map.put("c_averrating","c_averrating");
					map.put("sa_cnote","sa_cnote");	
					list2.add(map);
				}
				JSONValue.toJSONString(list2);
		}
		
		//get o
//		if("o".equals(action)){
			List list = new ArrayList();
			List<OrderVO> orderlist = new ArrayList<OrderVO>();
			OrderService orderservice = new OrderService();
			orderlist = orderservice.getAllOrder();
			
			for(int i=0; i<orderlist.size();i++){
				
				OrderVO orderVO = orderlist.get(i);
				Timestamp o_tdate = orderVO.getO_tdate();
				String o_bname = orderVO.getB_name();
				Integer o_id = orderVO.getO_id();
				Set<OproVO> opros = orderVO.getOpros();
				
				String o_location = orderVO.getO_location();
				String s_name = orderVO.getS_name();
				Integer c_rating = orderVO.getC_rating();
				Integer m_rating = orderVO.getM_rating();
				String sa_onote = orderVO.getSa_onote();
			
				Map map = new HashMap();
				map.put("o_tdate", o_tdate);
				map.put("o_bname", o_bname);
				map.put("o_id", o_id);
				for(OproVO oproVO : opros){
					String	opro = oproVO.getO_pro();	
					map.put("opros", opros);
	//				System.out.println(opro);
				}
				map.put("o_location", o_location);
				map.put("s_name", s_name);
				map.put("c_rating", c_rating);
				map.put("m_rating", m_rating);
				map.put("sa_onote", sa_onote);
				list.add(map);
			
			// test
//			System.out.println(o_tdate);
//			System.out.println(o_bname);
//			System.out.println(o_id);
//			
//			System.out.println(o_location);
//			System.out.println(s_name);
//			System.out.println(c_rating);
//			System.out.println(m_rating);
//			System.out.println(sa_onote);
				
			}
			JSONValue.toJSONString(list);
//		}
		//get report
		if("r".equals(action)){
			
			
			
		}
		//get analysis
		if("a".equals(action)){
			
			
			
		}
		//get ad
		if("ad".equals(action)){
			
			
			
		}

	}
		protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
			doGet(requset, response);
		}
	

}
