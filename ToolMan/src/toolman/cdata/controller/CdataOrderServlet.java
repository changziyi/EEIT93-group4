package toolman.cdata.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import toolman.cdata.model.CdataService;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

@WebServlet("/cdata/CdataOrderServlet.do")

public class CdataOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");

		    // �Ӧ�select_page.jsp���ШD                                  // �Ӧ� dept/listAllDept.jsp���ШD
		
		if ("listOrder".equals(action) ) {

            List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String c_id = request.getParameter("c_id");	
				
				
				
				/*************************** 2.開始查詢資料 ****************************************/
				CdataService orderSvc = new CdataService();
				Set<OrderVO> set = orderSvc.getOrderByC(c_id);

				
				
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				request.setAttribute("listOrder", set);    // 資料庫取出的set物件,存入request

				String url = "/order/listAllEmp2.jsp"; 
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
	

	}
}
