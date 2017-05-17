package toolman.rdata.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import toolman.blacklist.model.BlacklistService;
import toolman.rdata.model.RdataService;
import toolman.rdata.model.RdataVO;

@WebServlet("/order/Rdata.do")

public class RdataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RdataController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
			

		if ("addRdata".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			
			request.setAttribute("errorMsgs", errorMsgs);
			
			
//			try {
				Timestamp r_date = new Timestamp(calobj.getTimeInMillis());
				String c_id = request.getParameter("c_id").trim();	
				Integer m_id = new Integer(request.getParameter("m_id"));
				String p_summary = request.getParameter("p_summary").trim();	
				String p_content = request.getParameter("p_content").trim();	
				String s_name = request.getParameter("s_name").trim();	
				String sa_rnote = request.getParameter("sa_rnote").trim();	
				Integer d_id = new Integer(request.getParameter("d_id"));
				Integer o_id = new Integer(request.getParameter("o_id"));
			
				RdataVO rdataVO = new RdataVO();
	
				rdataVO.setR_date(r_date);
				rdataVO.setC_id(c_id);
				rdataVO.setM_id(m_id);
				rdataVO.setP_summary(p_summary);
				rdataVO.setP_content(p_content);
				rdataVO.setS_name(s_name);
				rdataVO.setSa_rnote(sa_rnote);
				rdataVO.setD_id(d_id);
				rdataVO.setO_id(o_id);
				
				RdataService rdataSvc = new RdataService();
				rdataVO = rdataSvc.addRdata( r_date,  c_id, m_id,  p_summary,  p_content,
						 s_name,  sa_rnote ,d_id,  o_id);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
			String url = "/order/Rdata.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(request, response);

				/***************************其他可能的錯誤處理************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
//				RequestDispatcher failureView = request
//						.getRequestDispatcher("listAllEmp.jsp");
//				failureView.forward(request, response);
//			}
		}
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer r_id = new Integer(request.getParameter("r_id"));
				
				/***************************2.�}�l�R�����***************************************/
				BlacklistService blacklistSvc = new BlacklistService();
				blacklistSvc.deleteBlacklist(r_id);
				
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

}

}
