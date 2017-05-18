package toolman.blacklist.controller;

import java.io.IOException;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.blacklist.model.BlacklistService;
import toolman.blacklist.model.BlacklistVO;
import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.favorite.model.FavoriteService;
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

@WebServlet("/order/Dislike.do")

public class BlacklistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlacklistController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		
		
	

		if ("addDislike".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			
		//	String requestURL = request.getParameter("requestURL"); // 送出修改的來源網頁路徑		
			
			try {
				/***************************1.接收請求參數****************************************/
				String c_id = request.getParameter("c_id").trim();	
				Integer m_id = new Integer(request.getParameter("m_id").trim());

				BlacklistVO blacklistVO = new BlacklistVO();
				
				CdataVO cdataVO = new CdataVO();
				cdataVO.setC_id(c_id);
				blacklistVO.setCdataVO(cdataVO);
				
				MdataVO mdataVO = new MdataVO();
				mdataVO.setM_id(m_id);
				blacklistVO.setMdataVO(mdataVO);
				

				/***************************2.開始查詢資料****************************************/
				BlacklistService blacklistSvc = new BlacklistService();
				blacklistVO = blacklistSvc.addBlacklist(c_id, m_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				request.setAttribute("blacklistVO", blacklistVO); // 資料庫取出的empVO物件,存入req
			String url = "/order/thanks3.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order/dislike.jsp");
				failureView.forward(request, response);
			}
		}
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer bk_id = new Integer(request.getParameter("bk_id"));
				
				/***************************2.�}�l�R�����***************************************/
				BlacklistService blacklistSvc = new BlacklistService();
				blacklistSvc.deleteBlacklist(bk_id);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/order/thanks4.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order/dislike.jsp");
				failureView.forward(request, response);
			}
		
		
		}
		if ("serchBlack".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String c_id = request.getParameter("c_id");	
				Integer m_id = new Integer(request.getParameter("m_id").trim());

				/*************************** 2.開始查詢資料 ****************************************/
				BlacklistService orderSvc = new BlacklistService();
				List<BlacklistVO> set = orderSvc.getBlackSerch(c_id , m_id);
	

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				request.setAttribute("Black", set);    // 資料庫取出的set物件,存入request
				String url = "/master/MasterPage.jsp"; 
				RequestDispatcher successView = request.getRequestDispatcher(url);   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(request, response);
				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				RequestDispatcher rd = request.getRequestDispatcher("/cdata/login-in.jsp");
				rd.forward(request, response);
				return;//中斷
			}
		}
		
		
		
		
		
		

}

}
