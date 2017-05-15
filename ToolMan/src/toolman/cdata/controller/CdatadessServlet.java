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

import antlr.collections.List;
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

		request.setCharacterEncoding("UTF-8");
		ArrayList cdataVOlist =  new ArrayList();
		String c_id = null;
		HttpSession session = request.getSession();	
		CdataVO cdataVO = new CdataVO();
		CdataService cs = new CdataService();	
		cdataVO = cs.cdata_des("PolarBear");	
		cdataVOlist.add(cdataVO);
		session.setAttribute("cdataVOlist", cdataVOlist);
		session.setAttribute("cdataVO", cdataVO);	
		Set<OrderVO> orders = cdataVO.getOrders();
		
		
		for (OrderVO aOrder : orders) {
			System.out.print(" 師傅 : "+ aOrder.getB_name()+" , ");
			System.out.println(" 時間 : "+ aOrder.getO_edate());
		}
		session.setAttribute("orders", orders);
		System.out.print(c_id);
		
		RequestDispatcher failureView = request.getRequestDispatcher("test1.jsp");
		failureView.forward(request,response);	
	}
	
	
	

}

