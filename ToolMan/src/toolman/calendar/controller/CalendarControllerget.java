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
		
	     String calendarjson = request.getParameter("calendarjson");
		 CalendarVO calendarVO = new CalendarVO();
//		 MdataVO mdataVO2 = (MdataVO) request.getAttribute("mdataVO");
//		 Integer m_id = mdataVO2.getM_id();
		 Integer m_id = 1000;
		 System.out.println(calendarjson);
		 CalendarService calendarservice = new CalendarService();
		 List list = new ArrayList();
//--------------------------------insert---------------------------------------------		 
		
//---------------------------------end insert---------------------------------------------		
		
		//---------------------------------get calendar---------------------------------------------
		
		List<CalendarVO> getlist = calendarservice.getByM(m_id);
		
		for(CalendarVO calendarVo:getlist){
			Map map = new HashMap();
			map.put("id", calendarVO.getEvent_id());
			map.put("start", calendarVO.getEvent_start());
			map.put("title", calendarVO.getEvent_title());
			map.put("end", calendarVO.getEvent_end());
			map.put("allDay", calendarVO.getEvent_allDay());
			map.put("overlap", calendarVO.getEvent_overlap());
			map.put("className", calendarVO.getEvent_className());
			list.add(map);
		}			
			PrintWriter out = response.getWriter();
			out.write(JSONValue.toJSONString(list));
//		//---------------------------------end calendar---------------------------------------------
//				
	    }
		
	

}
