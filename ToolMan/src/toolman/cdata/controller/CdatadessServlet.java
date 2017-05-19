package toolman.cdata.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataService;
import toolman.cdata.model.CdataVO;
import toolman.order.model.OrderVO;

@WebServlet("/cdata/CdatadessServlet.do")
public class CdatadessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
			doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();	
		CdataVO cdataVO = new CdataVO();	
		String c_id = null;
		
			CdataVO cdata =(CdataVO)session.getAttribute("LoginOK");
//			c_id=cdata.getC_id(); 
			c_id = request.getParameter("c_id");
			System.out.println("c_id = "+c_id);
			
			
			request.setCharacterEncoding("UTF-8");
			ArrayList<CdataVO> cdataVOlist =  new ArrayList<CdataVO>();
		 
		 
		 
		
//		String action = request.getParameter("action");
//		if ("chamge_img".equals(action)) {
//			
//		}
		
		
		CdataService cs = new CdataService();
		cdataVO = cs.cdata_des(c_id);
		CdataVO cdataVO1 = cs.cdata_des(c_id);
		session.setAttribute("cdataVO", cdataVO1);
		
		cdataVOlist.add(cdataVO);
		session.setAttribute("cdataVOlist", cdataVOlist);
		Set<OrderVO> orders = cdataVO.getOrders();
				
//		for (OrderVO aOrder : orders) {
//			System.out.print(" 師傅 : "+ aOrder.getB_name()+" , ");
//			System.out.println(" 時間 : "+ aOrder.getO_edate());
//		}
		request.setAttribute("orders", orders);
		
		RequestDispatcher failureView = request.getRequestDispatcher("/cdata/test1.jsp");
		failureView.forward(request,response);	
	}
	
	
	

}

