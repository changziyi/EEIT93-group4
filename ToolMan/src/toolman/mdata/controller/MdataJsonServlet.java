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
		
		if("homepagejson".equals(action)) {
			String m_city = request.getParameter("city");
			String input = request.getParameter("input");
			
			PrintWriter out = response.getWriter();
			Long s1 = System.currentTimeMillis();
			
			MdataService mdataSvc = new MdataService();
			out.println(mdataSvc.SearchByCityAndMproJson(m_city, input));
			
			Long s2 = System.currentTimeMillis();
			System.out.println("首頁搜尋時間：" + (s2-s1));
		}
		
		if("advjson".equals(action)) {
			String m_city = request.getParameter("city");
			String m_district = request.getParameter("district");
			String input = request.getParameter("input");
			
			PrintWriter out = response.getWriter();
			Long s1 = System.currentTimeMillis();
			
			MdataService mdataSvc = new MdataService();
			out.println(mdataSvc.SeachByCityAndDistrictAndMpro(m_city, m_district, input));
			
			Long s2 = System.currentTimeMillis();
			System.out.println("進階搜尋時間：" + (s2-s1));
		}
		
		if("discussion".equals(action)) {
			Integer master = new Integer(request.getParameter("master"));
			System.out.println("master: " + master);
			
			PrintWriter out = response.getWriter();
			DiscussionService discussionSvc = new DiscussionService();
			
			out.print(discussionSvc.getByMidJson(master));
		}
		
	}

	protected void doPost(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(requset, response);
	}

}
