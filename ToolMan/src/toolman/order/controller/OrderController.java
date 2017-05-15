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
import java.util.LinkedList;
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
import toolman.cdata.model.CdataVO;
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
		
		
		String action = request.getParameter("action");
		
		//Reservation button pressed 
		HttpSession session = request.getSession();// placed in jsp instead
		MdataVO mdataVO = (MdataVO) session.getAttribute("mdataVO");
		Collection<MProVO> mproVOset = (Collection<MProVO>) session.getAttribute("mproVOset");
		CdataVO cdataVO = (CdataVO) session.getAttribute("cdata");
		
		//test
//		String action = request.getParameter("action");
//		String o_des = request.getParameter("o_des");
//		Long req_exp = new Long(request.getParameter("req_exp"));
//		Integer h_type = new Integer(request.getParameter("h_type"));
//		String o_location = request.getParameter("o_location");
//		String o_note = request.getParameter("o_note");
//		System.out.println(action+","+o_des+","+req_exp+","+h_type+","+o_location+","+o_note );
//		System.out.println(request.getParameter("req_exp"));
		

		if("insert".equals(action)){
		OrderVO orderVO = null;
		//new Order and Insert Order
			Map<String,String> errormsg = new HashMap<String,String>();//error message						
			
			//open while merge with mdata servlet			
			String b_name = mdataVO.getB_name();//automatically filled in			
//			String c_id = cdataVO.getC_id(); //automatically filled in, but I don't need c_id, I just need cdataVO
			

			
			//test data
//			String b_name ="如意棒裝潢";
//			Integer m_id = 1001;
//			String c_id = "Micky";
			

			
					
//				Integer mproid = mproVO.getM_proid();
//				oproVO.setM_proid(mproVO);//hibernate will find it's m_proid specified in the mapping for me

			
			
			//time to deal with main content
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
				
				String o_city = request.getParameter("o_city");
				String o_district = request.getParameter("o_district");
				String o_addr = request.getParameter("o_addr");
				String o_location = o_city+ o_district+o_addr;
				if(o_location==null||o_location.trim().length() == 0){
					errormsg.put("erroro_location", "必須輸入地點");			
				}
				
				String o_note = request.getParameter("o_note");
				if(request.getParameter("o_note").trim().length() >50){
					errormsg.put("erroro_note", "長度超過限制");	
					o_note = request.getParameter("o_note");
				}
				// deal with mpro and opro tables first
				MProDAO mprodao = new MProDAO();
				OproDAO oprodao = new OproDAO();
				OproVO oproVO = new OproVO();
				
				//mpro and opro have no service file
				Integer m_id = mdataVO.getM_id();// only for pro use
				List<MProVO> mproVOlist = mprodao.getByMid(m_id);
				List<OproVO> oproVOlist = new ArrayList<OproVO>();
				
				String[] o_pro = request.getParameterValues("o_pro");
//				String[] o_pro = {"a","b","c"};
				if(o_pro==null||o_pro.length == 0){
					errormsg.put("erroro_pro", "必須選擇工程類別");			
				}
				Timestamp o_tdate = new Timestamp(System.currentTimeMillis());
				//test
				System.out.println(action+","+o_des+","+req_exp+","+h_type+","+o_location+","+o_note );
				
				orderVO = new OrderVO();
				orderVO.setB_name(b_name);// sent from the top
				orderVO.setM_id(mdataVO);// sent from the top
				orderVO.setC_id(cdataVO);// sent from the top
				orderVO.setO_bdate(o_bdate);
				orderVO.setO_des(o_des);
				orderVO.setReq_exp(req_exp);
				orderVO.setH_type(h_type);
				orderVO.setO_location(o_location);
				orderVO.setS_name("o_notresponded");
				orderVO.setO_tdate(o_tdate);
				
				for(int i=0;i<o_pro.length;i++){
					oproVO.setO_id(orderVO);	
					oproVO.setO_pro(o_pro[i]);
					oproVOlist.add(oproVO);
					System.out.println(o_pro[i]);

			}
				List addrlist = new ArrayList();
				addrlist.add(o_city);
				addrlist.add(o_district);
				addrlist.add(o_addr);
				request.setAttribute("oproVOlist",oproVOlist);
				request.setAttribute("addrlist",addrlist);
				request.setAttribute("orderVO", orderVO);
				request.setAttribute("errormsg", errormsg);
				//when error exits, return to the previous page
			
				if(!errormsg.isEmpty()){					
					RequestDispatcher rd = request.getRequestDispatcher("NewOrder.jsp?#step-2");
					rd.forward(request, response);
				}
				else{	//checked ok, forward to the confirmorder page
					OrderVO orderVO2 = (OrderVO) request.getAttribute("orderVO");
					OrderService orderservice = new OrderService();					
					oprodao.insertOpro(oproVOlist);// opro done
					
					//test
					System.out.println(orderVO2.getB_name());
					orderservice.insert(orderVO2);
					RequestDispatcher rd = request.getRequestDispatcher("confirmorder.jsp");
					rd.forward(request, response);
					}
			}
			
			// order confirmed and insert the data
			if("confirmorder".equals(action)){

				RequestDispatcher rd = request.getRequestDispatcher("/toolman.order/OrderRecommendation.do");
				rd.forward(request, response);
			}
//			else if("alterorder".equals(action)){
//				
//				RequestDispatcher rd = request.getRequestDispatcher("NewOrder.jsp");
//				rd.forward(request, response);
//			}

	
			
			
			
			
	
	}

}