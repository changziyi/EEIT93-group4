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
@WebServlet("/toolman.calendar/CalendarController.do")
public class CalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarController() {
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
		 
//		 MdataVO mdataVO2 = (MdataVO) request.getAttribute("mdataVO");
//		 Integer m_id = mdataVO2.getM_id();
		 Integer m_id = 1000;
		 System.out.println(calendarjson);
		 CalendarService calendarservice = new CalendarService();
		 List list = new ArrayList();
//--------------------------------insert---------------------------------------------		 
		 calendarservice.deleteByM(m_id);
		 JSONArray jsonarray = new JSONArray(calendarjson);
		for (int i = 0; i < jsonarray.length(); i++) {
			CalendarVO calendarVO = new CalendarVO();
		    JSONObject jsonobject = jsonarray.getJSONObject(i);
		    String id = jsonobject.getString("id");
		    String title = jsonobject.getString("title");		    
		    String start1 = jsonobject.getString("start");
		    DateFormat df=null;
		    if(start1.endsWith("Z")){
			     df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		    }else{ 
		    	df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		    }
			    Calendar calobj = Calendar.getInstance();
				try {
					calobj.setTime(df.parse(start1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				Timestamp start = new Timestamp(calobj.getTimeInMillis());		   
			    String end1 = jsonobject.getString("end");
				try {
					calobj.setTime(df.parse(end1));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				Timestamp end = new Timestamp(calobj.getTimeInMillis());
		   
		    	
		    	
		    	
		    	
		   
		    String className = jsonobject.getJSONArray("className").toString();
//		    Boolean allDay = jsonobject.getBoolean("allDay");
//		    Boolean overlap = jsonobject.getBoolean("overlap");
		    
		    calendarVO.setEvent_id(id);
		    calendarVO.setEvent_start(start);
		    calendarVO.setEvent_title(title);
		    
		    calendarVO.setEvent_end(end);
		    calendarVO.setEvent_start(start);
//		    calendarVO.setEvent_allDay(allDay);
		    calendarVO.setEvent_className(className);
		    calendarVO.setM_id(m_id);
		    list.add(calendarVO);
		    
		    System.out.println(start);
		    System.out.println(id);
		    System.out.println(title);
		    System.out.println(end);
		    System.out.println(className);
//		    System.out.println(allDay);
		}
		if(calendarservice.getByM(m_id)!=null){
			calendarservice.deleteByM(m_id);
		}
		calendarservice.InsertByM(list);
//---------------------------------end insert---------------------------------------------		
		
		//---------------------------------get calendar---------------------------------------------
		
		
//		//---------------------------------end calendar---------------------------------------------
//				
	    }
		
	

}
