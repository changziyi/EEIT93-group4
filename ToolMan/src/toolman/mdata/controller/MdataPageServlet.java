package toolman.mdata.controller;

import java.io.IOException;
import java.sql.Timestamp;

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

@WebServlet("/master/masterPage.do")
public class MdataPageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer m_id = new Integer(request.getParameter("m_id"));
		
		MdataService mdataSvc = new MdataService();
		MdataVO mdataVO = mdataSvc.findByPrimaryKey(m_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("mdataVO", mdataVO);
		MdataVO m = (MdataVO)session.getAttribute("mdataVO");
		System.out.println("sessionM_id: " + m.getM_id());
		System.out.println("sessionM_city: " + m.getM_city());
		response.sendRedirect("MasterPage.jsp");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		HttpSession session = request.getSession();
		MdataVO mdataVO = (MdataVO)session.getAttribute("mdataVO");
		CdataVO cdataVO = (CdataVO)session.getAttribute("loginOK");
		System.out.println("post: " + mdataVO.getM_id());
		
		if ("MasterPage_Q".equals(action)) {
			
			String d_des = request.getParameter("d_des");
			System.out.println("d_des: " + d_des);
			Timestamp d_date = new Timestamp(System.currentTimeMillis());
			
			DiscussionVO discussionVO = new DiscussionVO();
			
			discussionVO.setD_des(d_des);
			discussionVO.setD_date(d_date);
			discussionVO.setMdataVO(mdataVO);
			
			DiscussionService discussionSvc = new DiscussionService();
			discussionSvc.insert(discussionVO);
			
//			response.sendRedirect("masterPage.do?m_id=" + mdataVO.getM_id());
//			RequestDispatcher successView = request.getRequestDispatcher("/master/MasterPage.jsp");
//			successView.forward(request, response);
//			return;
			
		}//MasterPage_Q
		
		if ("MasterPage_A".equals(action)) {
			
		}
		
//		Integer m_id = new Integer(request.getParameter("m_id"));
//		MdataService mdataSvc = new MdataService();
//		MdataVO mdataVO = mdataSvc.findByPrimaryKey(m_id);
//		
//		if ("MasterPage_Q".equals(action)) {
//			
//			String d_des = request.getParameter("d_des");
//			Timestamp d_date = new Timestamp(System.currentTimeMillis());
//			
//			DiscussionVO discussionVO = new DiscussionVO();
//			
//			discussionVO.setD_des(d_des);
//			discussionVO.setD_date(d_date);
//			discussionVO.setMdataVO(mdataVO);
//			
//			DiscussionService discussionSvc = new DiscussionService();
//			discussionSvc.insert(discussionVO);
//			
//			response.sendRedirect("masterPage.do?m_id=" + m_id);
//			RequestDispatcher successView = request.getRequestDispatcher("/master/MasterPage.jsp");
//			successView.forward(request, response);
//			return;
//			
//		}//MasterPage_Q
//		
//		request.setAttribute("mdataVO", mdataVO);
//		RequestDispatcher successView = request.getRequestDispatcher("/master/MasterPage.jsp");
//		successView.forward(request, response);
//		return;
	
	}//doPost

}
