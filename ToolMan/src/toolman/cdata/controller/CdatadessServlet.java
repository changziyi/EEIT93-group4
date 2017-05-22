package toolman.cdata.controller;

import java.io.IOException;
import java.sql.Date;
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
		
		HttpSession session = request.getSession();
		CdataVO cdata =(CdataVO)session.getAttribute("LoginOK");
		String action = request.getParameter("action");
		String c_id = cdata.getC_id(); 
		System.out.println(c_id);
		if("submitdialog".equals(action)){
		 String c_name = request.getParameter("c_name");
		 System.out.println(c_name);
		 String c_pwd = request.getParameter("c_pswd");
		 Date c_birth = java.sql.Date.valueOf(request.getParameter("c_birth").trim());
		 System.out.println(c_birth);
		 String c_cel = request.getParameter("c_cel"); 
		 String c_email = request.getParameter("c_email");
		 String c_addr = request.getParameter("c_addr");
		 CdataService cs = new CdataService();
		  cs.updateMember(c_name, c_pwd ,c_birth, c_cel, c_email, c_addr, c_id);
    	System.out.println("all = " + c_name + c_pwd + c_birth + c_cel + c_email + c_addr + c_id);
		
		}
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();	
		CdataVO cdataVO = new CdataVO();	
		String c_id = null;
		
			CdataVO cdata =(CdataVO)session.getAttribute("LoginOK");
			c_id=cdata.getC_id(); 
			System.out.println("c_id = "+c_id);
			c_id = request.getParameter("c_id");
			
			
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

