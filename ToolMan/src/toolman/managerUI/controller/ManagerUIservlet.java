package toolman.managerUI.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
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
import toolman.mdata.model.MdataService;
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
		
		//get m
		if("m".equals(action)){
			MdataService mdataService = new MdataService();
			String mjasonstring = mdataService.getAllJson();			
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
				String opro = null;
				
			for(OproVO oproVO : opros){
				opro = oproVO.getO_pro();			
			}
//			System.out.println(opro);
			String o_location = orderVO.getO_location();
			String s_name = orderVO.getS_name();
			Integer c_rating = orderVO.getC_rating();
			Integer m_rating = orderVO.getM_rating();
			String sa_onote = orderVO.getSa_onote();
			
			Map map = new HashMap();
			map.put("o_tdate", o_tdate);
			map.put("o_bname", o_bname);
			map.put("o_id", o_id);
			map.put("opros", opros);
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
