package toolman.managerUI.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import toolman.cdata.model.CdataService;
import toolman.opro.model.OproVO;
import toolman.order.model.OrderService;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class managerUIservlet
 */
@WebServlet("/toolman.managerUI/managerUIservlet.do")
public class managerUIservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public managerUIservlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("c");
		
		//get m
		if("m".equals(action)){
			
			
			
		}
		//get c
		if("c".equals(action)){
			
		CdataService cdataservice = new CdataService();
		
		}
		//get o
//		if("o".equals(action)){
			List<OrderVO> orderlist = new ArrayList<OrderVO>();
			OrderService orderservice = new OrderService();
			orderlist = orderservice.getAllOrder();
			
			for(int i=0; i<orderlist.size();i++){
				
				OrderVO orderVO = orderlist.get(i);
				Timestamp o_tdate = orderVO.getO_tdate();
				String o_bname = orderVO.getB_name();
				Integer o_id = orderVO.getO_id();
				Set<OproVO> opros = orderVO.getOpros();
				String opro = null;
				
			for(OproVO oproVO : opros){
				opro = oproVO.getO_pro();
			
			}
			System.out.println(opro);
			String o_location = orderVO.getO_location();
			String s_name = orderVO.getS_name();
			Integer c_rating = orderVO.getC_rating();
			Integer m_rating = orderVO.getM_rating();
			String sa_onote = orderVO.getSa_onote();
			
			// test
//			System.out.println(o_tdate);
//			System.out.println(o_bname);
//			System.out.println(o_id);
//			
//			System.out.println(o_location);
//			System.out.println(s_name);
//			System.out.println(c_rating);
//			System.out.println(m_rating);
//			System.out.println(sa_onote);
				
			}
//		}
		//get r
		if("r".equals(action)){
			
			
			
		}
		//get a
		if("a".equals(action)){
			
			
			
		}
		//get ad
		if("ad".equals(action)){
			
			
			
		}
	}

}
