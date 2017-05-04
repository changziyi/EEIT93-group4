package toolman.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import toolman.cdata.model.CdataVO;
import toolman.mdata.model.MdataService;
import toolman.mdata.model.MdataVO;
import toolman.order.model.OrderVO;

/**
 * Servlet implementation class OrderRecommendation
 */
@WebServlet("/toolman.order/OrderRecommendation.do")
public class OrderRecommendation extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderRecommendation() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderVO orderVO = new OrderVO();
		orderVO.setO_location("台北市中正區杭州北路紅磚六合院 C棟");
		String o_location = orderVO.getO_location();
		String city = o_location.substring(0, 3);
		String district = o_location.substring(3, 6);
		String addr = o_location.substring(6);
		String mpro = "地板地磚";
		System.out.println("city="+city+"district="+district+"addr="+addr);
		
		List<MdataVO> mdadaVOlist = new ArrayList<MdataVO>();
		MdataService mdataservice = new MdataService();
		mdadaVOlist = mdataservice.getCityAndDistrictAndMPro(city, district, mpro);
		HttpSession session = request.getSession();
		session.setAttribute("recommendmaster", mdadaVOlist);
		
		
		
		//tested ok
//		System.out.println("test start");
//		List<MdataVO> mdadaVOlist2 =(List<MdataVO>) session.getAttribute("recommendmaster");
//		for(MdataVO mdataVO : mdadaVOlist){
//		System.out.println(mdataVO.getB_name());
//		}
//		System.out.println("start the loop");
		
		//tested ok
//		for(MdataVO mdataVO : mdadaVOlist){
//			System.out.println("in the loop");
//			System.out.println(mdataVO.getB_name());
//			System.out.println(mdataVO.getM_id());
////			response.setContentType("image/jpeg");
////			response.getOutputStream().write(mdataVO.getB_image());
//		}
		
		RequestDispatcher rd = request.getRequestDispatcher("OrderRecommendation.jsp");
		rd.forward(request, response);
		System.out.println("after dispatched");
	}

}
