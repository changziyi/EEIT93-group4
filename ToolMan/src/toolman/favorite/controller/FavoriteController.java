package toolman.favorite.controller;

import java.io.IOException;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import toolman.cdata.model.CdataVO;
import toolman.favorite.model.FavoriteService;
import toolman.favorite.model.FavoriteVO;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

@WebServlet("/order/Favorite.do")

public class FavoriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FavoriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		
		
	

		if ("addFavorite".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			
		//	String requestURL = request.getParameter("requestURL"); // 送出修改的來源網頁路徑		
			
			try {
				/***************************1.接收請求參數****************************************/
//				String c_id = request.getParameter("c_id").trim();	
				Integer m_id = new Integer(request.getParameter("m_id").trim());
				String c_id = request.getParameter("c_id").trim();	

				
				FavoriteVO favoriteVO = new FavoriteVO();
				
				CdataVO cdataVO = new CdataVO();
				cdataVO.setC_id(c_id);
				favoriteVO.setCdataVO(cdataVO);
				
				MdataVO mdataVO = new MdataVO();
				mdataVO.setM_id(m_id);
				favoriteVO.setMdataVO(mdataVO);

				/***************************2.開始查詢資料****************************************/
				FavoriteService favoriteSvc = new FavoriteService();
				favoriteVO = favoriteSvc.addFavorite(c_id, m_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				request.setAttribute("favoriteVO", favoriteVO); // 資料庫取出的empVO物件,存入req
			String url = "/order/like.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order/like.jsp");
				failureView.forward(request, response);
			}
		}
		
		if ("delete".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer f_id = new Integer(request.getParameter("f_id"));
				
				
				
				FavoriteService favoriteSvc = new FavoriteService();
				favoriteSvc.deleteFavorite(f_id);
				
				
				
				String url = "/order/like.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);

			
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/order/like.jsp");
				failureView.forward(request, response);
			}
		
		
		}

}

}
