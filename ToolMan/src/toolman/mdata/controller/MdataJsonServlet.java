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

import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProVO;

@WebServlet("/master/MdataJsonServlet")
public class MdataJsonServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String m_district = request.getParameter("dis");
		String m_city = request.getParameter("city");
		String m_pro = request.getParameter("pro");
		String b_name = request.getParameter("name");
		String input = request.getParameter("input");
//		System.out.println("city: " + m_city);
//		System.out.println("district: " + m_district);
//		System.out.println("pro: " + m_pro);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Long s1 = System.currentTimeMillis();
		
		MdataService mdataSvc = new MdataService();
		
//		out.println(mdataSvc.getCityAndDistrict(m_city, m_district));
//		out.println(mdataSvc.getCityJson(m_city));
//		out.println(mdataSvc.getDistrictJson(m_district));
//		out.println(mdataSvc.SearchByCityAndMproJson(m_city, m_pro));
		out.println(mdataSvc.SearchByCityAndMproJson(m_city, input));
		
		
		Long s2 = System.currentTimeMillis();
		System.out.println(s2-s1);
	}

	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		doGet(requset, response);
	}

}
