package toolman.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.JSONValue;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import toolman.calendar.model.CalendarService;
import toolman.calendar.model.CalendarVO;
import toolman.mdata.model.MdataVO;

/**
 * Servlet implementation class CalendarController
 */
@WebServlet("/toolman.calendar/CalendarControllerget.do")
public class CalendarControllerget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarControllerget() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
	     String calendarjson = request.getParameter("calendarjson");
	     HttpSession session = request.getSession();
		 MdataVO mdataVO2 = (MdataVO) session.getAttribute("mdataVO");
		 System.out.println("mtest:"+mdataVO2.getM_id());
		 Integer m_id = mdataVO2.getM_id();
//		 Integer m_id = 1000;
		 System.out.println(calendarjson);
		 CalendarService calendarservice = new CalendarService();
		 List list = new ArrayList();
//--------------------------------insert---------------------------------------------		 
		
//---------------------------------end insert---------------------------------------------		
		
		//---------------------------------get calendar---------------------------------------------
		
		List<CalendarVO> getlist = calendarservice.getByM(m_id);
		System.out.print(getlist);
		JSONArray jsonarray = new JSONArray();
		
		for(CalendarVO calendarVO1:getlist){
			Map map = new HashMap();
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("id", calendarVO1.getEvent_id());
			System.out.print(calendarVO1.getEvent_id());
			jsonobj.put("start", calendarVO1.getEvent_start().toString());
			String color = null;
			if(calendarVO1.getEvent_title().equals("早上")){
				color="#76CFF5";
			}else if(calendarVO1.getEvent_title().equals("下午")){
				color="#EBBA35";
			}else if(calendarVO1.getEvent_title().equals("晚上")){
				color="#354EEB";
			}
			
			jsonobj.put("title", calendarVO1.getEvent_title());
			jsonobj.put("end", calendarVO1.getEvent_end().toString());
			jsonobj.put("allDay", false);
			jsonobj.put("overlap", false);
			jsonobj.put("editable",false);
			jsonobj.put("color",color);
//			map.put("className", calendarVO1.getEvent_className());
			jsonarray.put(jsonobj);
		}			
			PrintWriter out = response.getWriter();
			out.println(jsonarray);
			System.out.println(JSONValue.toJSONString(list));
//		//---------------------------------end calendar---------------------------------------------
//				
	    }
		
	

}
