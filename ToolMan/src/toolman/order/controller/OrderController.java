package toolman.order.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

import toolman.building.model.BuildingVO;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProDAO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproDAO;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/toolman.order/OrderController.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Reservation button pressed 
//		HttpSession session = request.getSession();// placed in jsp instead
//		MdataVO mdataVO = session.getAttribute("mdataVO");
//		Collection<MproVO> mproVOset = session.getAttribute("mproVOset");
		
		//test
//		String action = request.getParameter("action");
//		String o_des = request.getParameter("o_des");
//		Long req_exp = new Long(request.getParameter("req_exp"));
//		Integer h_type = new Integer(request.getParameter("h_type"));
//		String o_location = request.getParameter("o_location");
//		String o_note = request.getParameter("o_note");
//		System.out.println(action+","+o_des+","+req_exp+","+h_type+","+o_location+","+o_note );
		System.out.println(request.getParameter("req_exp"));
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if("insert".equals(action)){
		OrderVO orderVO = null;
		//new Order and Insert Order
			Map<String,String> errormsg = new HashMap<String,String>();//error message
			
			
			
			//open while merge with mdata servlet
//			String b_name = request.getParameter("b_name");//automatically filled in			
			//MdataVO mdataVO = request.getAttribute("mdataVO");
			//Integer m_id = mdataVO.getM_id();//automatically filled in
			//CdataVO cdataVO = session.getAttribute("cdata");
			//String c_id = cdataVO.getC_id(); //automatically filled in
			
			Timestamp o_tdate = new Timestamp(System.currentTimeMillis());
			String b_name ="如意棒裝潢";
			Integer m_id = 1001;
			String c_id = "Micky";
			
			MProDAO mprodao = new MProDAO();
			List<MProVO> mproVOlist = mprodao.getByMid(m_id);
			OproDAO oprodao = new OproDAO();
			OproVO oproVO = new OproVO();
			List<OproVO> oproVOlist = new ArrayList<OproVO>();
			
			for(MProVO mproVO : mproVOlist){
					
				String mpro = mproVO.getM_pro();
				Integer mproid = mproVO.getM_proid();
				oproVO.setM_proid(mproid);
				oproVO.setO_pro(mpro);
				oproVOlist.add(oproVO);
				
			}
			oprodao.insertOpro(oproVOlist);
			
			Calendar calobj = Calendar.getInstance();
			Timestamp o_bdate = new Timestamp(calobj.getTimeInMillis());//automatically filled in
			
				String o_des = request.getParameter("o_des");
				if(o_des==null||o_des.trim().length() == 0){
					errormsg.put("erroro_des", "必須輸入項目描述");			
				}
				else if(o_des.trim().length()>50){
					errormsg.put("erroro_des", "不能超過50字");			
				}
				
				Long req_exp = new Long(request.getParameter("req_exp"));
				if(request.getParameter("req_exp")==null){
					errormsg.put("errorreq_exp", "必須選擇請求失效時間");
				}
				
				Integer h_type = new Integer(request.getParameter("h_type"));
				if(request.getParameter("h_type")==null){
					errormsg.put("erroroh_type", "必須選擇建築物型態");		
				}
				
				
				String o_location = request.getParameter("o_city")+request.getParameter("o_district")+request.getParameter("o_addr");
				if(o_location==null||o_location.trim().length() == 0){
					errormsg.put("erroro_location", "必須輸入地點");			
				}
				
				String o_note = request.getParameter("o_note");
				if(request.getParameter("o_note").trim().length() >50){
					errormsg.put("erroro_note", "長度超過限制");	
					o_note = request.getParameter("o_note");
				}
				
				//test
				System.out.println(action+","+o_des+","+req_exp+","+h_type+","+o_location+","+o_note );
				
				orderVO = new OrderVO();
				orderVO.setB_name(b_name);
				orderVO.setC_id(c_id);
				orderVO.setO_bdate(o_bdate);
				orderVO.setO_des(o_des);
				orderVO.setReq_exp(req_exp);
				orderVO.setH_type(h_type);
				orderVO.setO_location(o_location);
				orderVO.setS_name("o_notresponded");
				orderVO.setO_tdate(o_tdate);
				session.setAttribute("orderVO", orderVO);
				
				//when error exits, return to the previous page
			
				if(!errormsg.isEmpty()){					
					RequestDispatcher rd = request.getRequestDispatcher("NewOrder.jsp");
					rd.forward(request, response);
				}
				else{	//checked ok, forward to the confirmorder page
					RequestDispatcher rd = request.getRequestDispatcher("confirmorder.jsp");
					rd.forward(request, response);
					}
			}
			
			// order confirmed and insert the data
			if("confirmorder".equals(action)){
				OrderVO orderVO2 = (OrderVO) session.getAttribute("orderVO");
				OrderService orderservice = new OrderService();
				orderservice.insert(orderVO2);
			}
//			else if("alterorder".equals(action)){
//				
//				RequestDispatcher rd = request.getRequestDispatcher("NewOrder.jsp");
//				rd.forward(request, response);
//			}
			else{
				request.setAttribute("alertmsg", "訂單尚未確認，是否離開此頁面");
				RequestDispatcher rd = request.getRequestDispatcher("NewOrder.jsp");
				rd.forward(request, response);
			}
	}

}