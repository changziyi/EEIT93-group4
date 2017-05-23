package toolman.mdata.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import toolman.mdata.model.MdataService;
import toolman.order.model.OrderVO;

@WebServlet("/mdata/MdataOrderServlet.do")

public class MdataOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");

		
		if ("listOrder".equals(action) ) {

            List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer m_id = Integer.parseInt(request.getParameter("m_id"));
				/*************************** 2.開始查詢資料 ****************************************/
				MdataService orderSvc = new MdataService();
				Set<OrderVO> set = orderSvc.getOrderByM(m_id);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				request.setAttribute("listOrder", set);    // 資料庫取出的set物件,存入request

				String url = "/order/listMOrder.jsp"; 
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
	

	}
}
