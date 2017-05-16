package toolman.calendar.controller;

import java.io.IOException;
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


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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
		 CalendarVO calendarVO = new CalendarVO();
		 MdataVO mdataVO = (MdataVO) request.getAttribute("mdataVO");
		 System.out.println(calendarjson);
		 
		JSONArray jsonarray = new JSONArray(calendarjson);
		for (int i = 0; i < jsonarray.length(); i++) {
		    JSONObject jsonobject = jsonarray.getJSONObject(i);
		    String id = jsonobject.getString("id");
		    String title = jsonobject.getString("title");
		    
		    String start1 = jsonobject.getString("start");
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		    Boolean allDay = jsonobject.getBoolean("allDay");
		    Boolean overlap = jsonobject.getBoolean("overlap");

		    calendarVO.setStart(start);
		    calendarVO.setTitle(title);
		    calendarVO.setOverlap(overlap);
		    calendarVO.setEnd(end);
		    calendarVO.setStart(start);
		    calendarVO.setAllDay(allDay);
		    calendarVO.setClassName(className);
		    
		    
		    System.out.println(start);
		    System.out.println(id);
		    System.out.println(title);
		    System.out.println(end);
		    System.out.println(className);
		    System.out.println(allDay);
		    System.out.println(overlap);
		}
//		Gson gson = new Gson();
//		List list = new ArrayList();
//		String [] jsonarray = calendarjson.replaceAll("\\[", "").replaceAll("\\]", "").split("\\}\\,\\{");
//		System.out.println(jsonarray);
//		for(int i=0;i<jsonarray.length;i++){
//			System.out.println(jsonarray[i]);
//--------calendarjson consists of multiple json object and can't be put in the same map-----------
//			Map<String, Object> map = gson.fromJson(calendarjson, new TypeToken<Map<String, Object>>(){}.getType());
//			System.out.println(map.get("id"));
//			list.add(map);
//		}
//		
		//		Map<String,String> map = new HashMap<String,String>();
		
//		JSONParser parser = new JSONParser();
//		Integer arraylength = calendarjson.replaceAll("\\[", "").replaceAll("\\]", "").split(",").length;
//		JsonArray jsonarray = calendarjson.replaceAll("\\[", "").replaceAll("\\]", "").split(",");
//		//		Object obj = null;
////		try {
////			obj = parser.parse(calendarjson);
////		} catch (ParseException e) {
////	        System.out.println("position: " + e.getPosition());
////	         System.out.println(e);
////			e.printStackTrace();
////		}
//        JSONArray jsonarray = (JSONArray)obj;
//		
//		for(int i=0;i<arraylength;i++){
//			 JsonObject jsonobj = ((Object) jsonarray.getJsonObject(0);
//			System.out.println(jsonobj.start);
//		}
//		
				
//	    Iterator iter = menu.keys();
//	    while(iter.hasNext()){
//	        String key = (String)iter.next();
//	        String value = menu.getString(key);
//	        map.put(key,value);
	    }
		
	

}
