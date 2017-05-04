package toolman.order.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
	Boolean imgexist = false;
    public OrderRecommendation() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		imgexist=true;
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
		System.out.println("test start");
		List<MdataVO> mdadaVOlist2 =(List<MdataVO>) session.getAttribute("recommendmaster");
		for(MdataVO mdataVO : mdadaVOlist2){
		System.out.println(mdataVO.getB_name());
		}
		System.out.println("start the loop");
		
		//tested ok
//		for(MdataVO mdataVO : mdadaVOlist){
//			System.out.println("in the loop");
//			System.out.println(mdataVO.getB_name());
//			System.out.println(mdataVO.getM_id());
//		}
		
		RequestDispatcher rd = request.getRequestDispatcher("OrderRecommendation.jsp");
		rd.forward(request, response);
		System.out.println("after dispatched");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// benny intend to control the priority of do method
		if(imgexist==false){
		doPost(request, response);
		}
		response.setContentType("image/jpeg");
		MdataService mdataSvc = new MdataService();
		Integer m_id = Integer.parseInt(request.getParameter("m_id"));
		//test
		System.out.println(m_id);//tested ok
		MdataVO mdataVO = mdataSvc.findByPrimaryKey(m_id);
		OutputStream out = response.getOutputStream();//overlay with getWriter()
		byte[] b_image = mdataVO.getB_image();
		out.write(b_image);
		out.close();
		
	}
}
