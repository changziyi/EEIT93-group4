package toolman.mdata.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataVO;
import toolman.discussion.model.DiscussionService;
import toolman.discussion.model.DiscussionVO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;

@WebServlet("/master/masterPage.do")
public class MdataPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer m_id = new Integer(request.getParameter("m_id"));
		
		MdataService mdataSvc = new MdataService();
		MdataVO mdataVO = mdataSvc.findByPrimaryKey(m_id);
		HttpSession session = request.getSession();
		
		if ("審核通過".equals(mdataVO.getS_name())) {
			session.setAttribute("mdataVO", mdataVO);
			response.sendRedirect("MasterPage.jsp");
			return;
		} else {
			response.sendRedirect("MasterPageVerifying.jsp");
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		HttpSession session = request.getSession();
		MdataVO mdataVO = (MdataVO)session.getAttribute("mdataVO");
		CdataVO cdataVO = (CdataVO)session.getAttribute("LoginOK");
		
		if ("MasterPage_Q".equals(action)) {
			
			String d_des = request.getParameter("d_des");
			Timestamp d_date = new Timestamp(System.currentTimeMillis());
			
			DiscussionVO discussionVO = new DiscussionVO();
			
			discussionVO.setD_des(d_des);
			discussionVO.setD_date(d_date);
			discussionVO.setMdataVO(mdataVO);
			discussionVO.setC_id(cdataVO.getC_id());
			
			DiscussionService discussionSvc = new DiscussionService();
			discussionSvc.insert(discussionVO);
			
//			response.sendRedirect("masterPage.do?m_id=" + mdataVO.getM_id());
//			RequestDispatcher successView = request.getRequestDispatcher("/master/MasterPage.jsp");
//			successView.forward(request, response);
//			return;
			
		}//MasterPage_Q
		
		if ("MasterPage_A".equals(action)) {
			
			String d_reply = request.getParameter("reply");
			Integer d_id = new Integer(request.getParameter("did"));
			Timestamp d_date = new Timestamp(System.currentTimeMillis());
			
			DiscussionService discussionSvc = new DiscussionService();
			discussionSvc.updateSql(d_id,d_reply);
			
		}
	
	}//doPost

}
