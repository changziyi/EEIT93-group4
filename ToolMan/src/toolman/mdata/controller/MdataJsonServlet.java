package toolman.mdata.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import toolman.discussion.model.DiscussionService;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;

@WebServlet("/master/MdataJsonServlet")
public class MdataJsonServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if("searchjson".equals(action)) {
			
			String m_city = request.getParameter("city");
			String m_district = request.getParameter("district");
			String b_name = request.getParameter("input");
			String m_pro = request.getParameter("pro");
			
			Long s1 = System.currentTimeMillis();
			
			MdataService mdataSvc = new MdataService();
			
//			if ("all".equals(m_city)) {
//				out.println(mdataSvc.getAllBySP());
//			} else {
//				if ((m_pro.trim()).length() == 0 || m_pro == null){
//					out.println(mdataSvc.getMasterBySP(m_city, m_district, b_name));
//				} else {
//					out.println(mdataSvc.getMproBySP(m_pro, m_city, m_district, b_name));
//				}
//			}

			
			if ((m_city.trim()).length() == 0 || m_city == null) {
				if ((m_pro.trim()).length() == 0 || m_pro == null) {
					out.println(mdataSvc.getAllBySP());
				} else {
					out.println(mdataSvc.getMproBySP(m_pro, m_city, m_district, b_name));
					}
			} else {
				if ((m_pro.trim()).length() == 0 || m_pro == null){
					out.println(mdataSvc.getMasterBySP(m_city, m_district, b_name));
				} else {
					out.println(mdataSvc.getMproBySP(m_pro, m_city, m_district, b_name));
				}
			}
			Long s2 = System.currentTimeMillis();
			System.out.println("searchspjson：" + (s2-s1));
			
		}
		
		if("alljson".equals(action)) {
			Long s1 = System.currentTimeMillis();
			
			MdataService mdataSvc = new MdataService();
			out.println(mdataSvc.getAllBySP());
			
			Long s2 = System.currentTimeMillis();
			System.out.println("alljson：" + (s2-s1));
		}
		
		if("discussion".equals(action)) {
			Integer master = new Integer(request.getParameter("master"));
			System.out.println("master: " + master);
			
			DiscussionService discussionSvc = new DiscussionService();
			
			out.print(discussionSvc.getByMidJson(master));
		}
		
//		if("homepagejson".equals(action)) {
//			String m_city = request.getParameter("city");
//			String input = request.getParameter("input");
//			
//			Long s1 = System.currentTimeMillis();
//			
//			MdataService mdataSvc = new MdataService();
//			out.println(mdataSvc.SearchByCityAndMproJson(m_city, input));
//			
//			Long s2 = System.currentTimeMillis();
//			System.out.println("homepagejson：" + (s2-s1));
//		}
//		
//		if("advjson".equals(action)) {
//			String m_city = request.getParameter("city");
//			String m_district = request.getParameter("district");
//			String input = request.getParameter("input");
//			
//			Long s1 = System.currentTimeMillis();
//			
//			MdataService mdataSvc = new MdataService();
//			out.println(mdataSvc.SeachByCityAndDistrictAndMpro(m_city, m_district, input));
//			
//			Long s2 = System.currentTimeMillis();
//			System.out.println("advjson：" + (s2-s1));
//		}
		
	}

	protected void doPost(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(requset, response);
	}

}
