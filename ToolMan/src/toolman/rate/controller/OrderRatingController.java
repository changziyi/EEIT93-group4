package toolman.rate.controller;

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
import java.util.Set;

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
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;
import toolman.mpro.model.MProDAO;
import toolman.mpro.model.MProVO;
import toolman.opro.model.OproDAO;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

@WebServlet("/order/OrderController.do")

public class OrderRatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderRatingController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		HttpSession session =request.getSession();


		if ("getOne_For_Update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer o_id = new Integer(request.getParameter("o_id").trim());

				/***************************2.開始查詢資料****************************************/
				OrderService orderSvc = new OrderService();
				OrderVO orderVO = orderSvc.getRate(o_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("odata", orderVO); // 資料庫取出的empVO物件,存入req
			String url = "/order/thanks.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("listAllEmp.jsp");
				failureView.forward(request, response);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			OrderVO orderVO2 = new OrderVO();
			//String requestURL = request.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
		
//			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		//		Integer empno = new Integer(req.getParameter("empno").trim());
		//		String ename = req.getParameter("ename").trim();
		//		String job = req.getParameter("job").trim();	
				
				Integer o_id = new Integer(request.getParameter("o_id"));
				
				
				Integer m_rating = new Integer(request.getParameter("m_rating"));
				Integer c_rating = new Integer(request.getParameter("c_rating"));
				String ca_des = request.getParameter("ca_des").trim();	
				String ma_des = request.getParameter("ma_des").trim();	
				
				orderVO2.setO_id(o_id);
				orderVO2.setM_rating(m_rating);
				orderVO2.setC_rating(c_rating);
				orderVO2.setCa_des(ca_des);
				orderVO2.setMa_des(ma_des);
			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("orderVO", orderVO2); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = request
							.getRequestDispatcher("/order/update_emp_input.jsp");
					failureView.forward(request, response);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				OrderService orderSvc = new OrderService();
				Integer  count =  orderSvc.updateOrderRate(  m_rating,c_rating, ca_des, ma_des,o_id );
//				System.out.println( m_rating+c_rating+ ca_des+ ma_des+o_id);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
		//		DeptService deptSvc = new DeptService();
		//		if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
		//			req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(deptno)); // 資料庫取出的list物件,存入request
				
			request.setAttribute("orderVO", orderVO2);
                String url =  "listAllEmp.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
//			
				
				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				Integer m_rating = orderVO2.getM_rating();
//				System.out.println( m_rating);
//				System.out.println("wrong");
////				errorMsgs.add("修改資料失敗:"+e.getMessage());
////				RequestDispatcher failureView = request
////						.getRequestDispatcher("/order/update_emp_input.jsp");
////				failureView.forward(request, response);
			}
		//-------------------------------消費者區----------------------------------------------
if ("updateByC".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			OrderVO orderVO2 = new OrderVO();
			//String requestURL = request.getParameter("requestURL"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
		
//			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
		//		Integer empno = new Integer(req.getParameter("empno").trim());
		//		String ename = req.getParameter("ename").trim();
		//		String job = req.getParameter("job").trim();	
				
				Integer o_id = new Integer(request.getParameter("o_id"));
				
				
				Integer m_rating = new Integer(request.getParameter("m_rating"));
				String ca_des = request.getParameter("ca_des").trim();	
				
				orderVO2.setO_id(o_id);
				orderVO2.setM_rating(m_rating);
				orderVO2.setCa_des(ca_des);
			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("orderVO", orderVO2); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = request
							.getRequestDispatcher("/order/update_emp_input.jsp");
					failureView.forward(request, response);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				OrderService orderSvc = new OrderService();
				Integer  count =  orderSvc.updateOrderRateByC(  m_rating, ca_des,o_id );
//				System.out.println( m_rating+c_rating+ ca_des+ ma_des+o_id);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
		//		DeptService deptSvc = new DeptService();
		//		if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
		//			req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(deptno)); // 資料庫取出的list物件,存入request
				
			request.setAttribute("orderVO", orderVO2);
                String url =  "/order/thanks.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
//			
				
				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				Integer m_rating = orderVO2.getM_rating();
//				System.out.println( m_rating);
//				System.out.println("wrong");
////				errorMsgs.add("修改資料失敗:"+e.getMessage());
////				RequestDispatcher failureView = request
////						.getRequestDispatcher("/order/update_emp_input.jsp");
////				failureView.forward(request, response);
			}
//--------------------------------------------------師傅區-------------------------------------------------------------------
if ("updateByM".equals(action)) { // 來自update_emp_input.jsp的請求
	
	List<String> errorMsgs = new LinkedList<String>();
	// Store this set in the request scope, in case we need to
	// send the ErrorPage view.
	request.setAttribute("errorMsgs", errorMsgs);
	OrderVO orderVO2 = new OrderVO();

//	try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//		Integer empno = new Integer(req.getParameter("empno").trim());
//		String ename = req.getParameter("ename").trim();
//		String job = req.getParameter("job").trim();	
		
		Integer o_id = new Integer(request.getParameter("o_id"));
		
		
		Integer c_rating = new Integer(request.getParameter("c_rating"));
		String ma_des = request.getParameter("ma_des").trim();	
		
		orderVO2.setO_id(o_id);
		orderVO2.setC_rating(c_rating);
		orderVO2.setMa_des(ma_des);
	

		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			request.setAttribute("orderVO", orderVO2); // 含有輸入格式錯誤的empVO物件,也存入req
			RequestDispatcher failureView = request
					.getRequestDispatcher("/order/update_emp_input.jsp");
			failureView.forward(request, response);
			return; //程式中斷
		}
		
		/***************************2.開始修改資料*****************************************/
		OrderService orderSvc = new OrderService();
		Integer  count =  orderSvc.updateOrderRateByM(  c_rating, ma_des,o_id );
//		System.out.println( m_rating+c_rating+ ca_des+ ma_des+o_id);
		/***************************3.修改完成,準備轉交(Send the Success view)*************/				
//		DeptService deptSvc = new DeptService();
		
	request.setAttribute("orderVO", orderVO2);
    String url =  "/order/thanks1.jsp";
		RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
		successView.forward(request, response);
//	
		
		/***************************其他可能的錯誤處理*************************************/
//	} catch (Exception e) {
//		Integer m_rating = orderVO2.getM_rating();
//		System.out.println( m_rating);
//		System.out.println("wrong");
////		errorMsgs.add("修改資料失敗:"+e.getMessage());
////		RequestDispatcher failureView = request
////				.getRequestDispatcher("/order/update_emp_input.jsp");
////		failureView.forward(request, response);
	}
		
		}

}

//}